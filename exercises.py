import requests
import re
import os

import subprocess

from joblib import Memory

cache_path = "/tmp/exercism_cache"
os.makedirs(os.path.dirname(cache_path), exist_ok=True)
memory = Memory(cache_path, verbose=0)

LANGUAGE = os.environ.get("LANGUAGE", "awk")

@memory.cache
def download_exercises(LANGUAGE):
    pageURL = "https://exercism.org/tracks/" + LANGUAGE + "/exercises"
    page_html = requests.get(pageURL).content.decode("utf-8")
    regex_string = r"tracks/" + LANGUAGE + "/exercises/(.*?)&"
    all_matches = re.findall(regex_string, page_html)
    for exercise in all_matches:
        if os.path.isdir(f"{LANGUAGE}/{exercise}"):
            continue
        download_command = f"exercism download --exercise={exercise} --track={LANGUAGE}"
        command = subprocess.run(download_command.split(" "), capture_output=True)
        if "already exists" in str(command.stderr):
            continue
        elif "not unlocked" in str(command.stderr):
            print (f"{exercise} exercise locked")
            os._exit(0)
        print (f"{exercise} downloaded")
        os._exit(0)



if __name__ == "__main__":
    download_exercises(LANGUAGE)
