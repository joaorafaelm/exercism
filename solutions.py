import requests
import re
import os
import html
import json
from joblib import Memory

cache_path = "/tmp/exercism_cache"
os.makedirs(os.path.dirname(cache_path), exist_ok=True)
memory = Memory(cache_path, verbose=0)


LANGUAGE = os.environ.get("LANGUAGE", "awk")
EXERCISE = os.environ.get("EXERCISE", "two-fer")

@memory.cache
def get_page_data(url):
    data_filter = r'data-react-data=(.*)data-react-hydrate'
    page_html = html.unescape(requests.get(url).content.decode("utf-8"))
    all_matches = re.findall(data_filter, page_html)
    for exercise in all_matches:
        if "snippet" in exercise or "files" in exercise:
            exercise = json.loads(exercise.rstrip().rstrip('"').lstrip().lstrip('"'))
            return exercise



def solutions():
    page_url = f"https://exercism.org/tracks/{LANGUAGE}/exercises/{EXERCISE}/solutions/?passed_tests=true&up_to_date=true"
    exercises = get_page_data(page_url)
    solutions = exercises["request"]["options"]["initial_data"]["results"]
    solutions = sorted(solutions, key=lambda s: -s["num_stars"])

    for solution in solutions:
        author = solution["author"]["handle"]
        filename = f"/tmp/{LANGUAGE}/{EXERCISE}/{author}.awk"
        os.makedirs(os.path.dirname(filename), exist_ok=True)
        if os.path.isfile(filename):
            print(filename)
            continue
        with open(filename, "w") as f:
            solution_url = solution["links"]["public_url"]
            files = get_page_data(solution_url)["iterations"][-1]["links"]["files"]
            content = json.loads(requests.get(files).content.decode("utf-8"))["files"][0]["content"].rstrip("\n").rstrip()
            f.write(content)
        print(filename)




if __name__ == "__main__":
    solutions()
