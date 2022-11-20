.ONESHELL:

download:
	@python exercises.py

new:
	@set -e; \
	DIR=$(shell git ls-files --others --exclude-standard --directory -x makefile -x solutions.py -x exercises.py); \
	FILE=$(shell git ls-files --others --exclude-standard | awk '$$1 ~ /awk$$/ {print}'); \
	README=$(shell git ls-files --others --exclude-standard | awk '$$1 ~ /README/ {print}'); \
	TEST_FILE=$(shell git ls-files --others --exclude-standard | awk '$$1 ~ /test/ {print}'); \
	nvr --remote-silent -cc only --servername $$NVIM && \
	nvr --remote-silent -O $$FILE $$README $$TEST_FILE --servername $$NVIM && \
	cd $$DIR && find . -name '*.awk' | BATS_RUN_SKIPPED=true entr -c bats test*

submit:
	@set -e; \
	FILE=$(shell git ls-files --others --exclude-standard | awk '$$1 ~ /awk$$/ {print}'); \
	exercism submit $$FILE
	git add . && git commit -m 'add new exercise' && git push

solutions:
	@python -u solutions.py | fzf --preview "bat --color=always -p {}" | xargs nvr --remote -o
