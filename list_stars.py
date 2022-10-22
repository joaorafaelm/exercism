import requests
import re
import os
import html
import json


LANGUAGE = os.environ.get("LANGUAGE", "awk")
EXERCISE = os.environ.get("EXERCISE", "two-fer")

def list_stars():
    page_url = f"https://exercism.org/tracks/{LANGUAGE}/exercises/{EXERCISE}/solutions/?passed_tests=true&up_to_date=true"
    page_html = html.unescape(requests.get(page_url).content.decode("utf-8"))
    all_matches = re.findall(r'data-react-data=(.*)data-react-hydrate', page_html)
    for exercise in all_matches:
        if "snippet" in exercise:
            exercise = json.loads(exercise.rstrip().rstrip('"').lstrip().lstrip('"'))
            solutions = exercise["request"]["options"]["initial_data"]["results"]
            solutions = sorted(solutions, key=lambda s: -s["num_stars"])
            file = open(f"{LANGUAGE}/{EXERCISE}/solutions.awk", "a")
            for solution in solutions:
                file.write("# " + solution["author"]["handle"] + "\n")
                file.write(solution["snippet"].rstrip("\n") + "\n" * 3)
            file.close()

            os._exit(0)



if __name__ == "__main__":
    list_stars()
