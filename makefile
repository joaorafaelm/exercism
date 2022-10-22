.ONESHELL:

download:
	LANGUAGE=awk python download_exercises.py

new: download
	@set -e; \
	DIR=$(shell git ls-files --others --exclude-standard --directory --exclude makefile); \
	FILE=$(shell git ls-files --others --exclude-standard | awk '$$1 ~ /awk$$/ {print}'); \
	README=$(shell git ls-files --others --exclude-standard | awk '$$1 ~ /README/ {print}'); \
	TEST_FILE=$(shell git ls-files --others --exclude-standard | awk '$$1 ~ /test/ {print}'); \
	nvr --remote-silent -O $$FILE & \
	nvr --remote-silent -o $$TEST_FILE $$README & \
	cd $$DIR && find . -name '*.awk' | BATS_RUN_SKIPPED=true entr -c bats test*


submit:
	@set -e; \
	FILE=$(shell git ls-files --others --exclude-standard | awk '$$1 ~ /awk$$/ {print}'); \
	exercism submit $$FILE
	git add . && git commit -m 'add new exercise' && git push
