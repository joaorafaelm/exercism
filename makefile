.ONESHELL:

-include .env
export

export LANGUAGE=$(shell [[ "$$LANGUAGE" ]] && echo $$LANGUAGE || echo awk)
export EXT=$(shell [[ "$$EXT" ]] && echo $$EXT || echo awk)


download:
	@python exercises.py

new:
	@set -e; \
	DIR=$(shell git ls-files --others --exclude-standard --directory -x makefile -x solutions.py -x exercises.py); \
	FILE=$(shell git ls-files --others --exclude-standard | grep -v test | awk '$$1 ~ /$(EXT)$$/ {print}'); \
	README=$(shell git ls-files --others --exclude-standard | awk '$$1 ~ /README/ {print}'); \
	TEST_FILE=$(shell git ls-files --others --exclude-standard | awk '$$1 ~ /test/ {print}'); \
	nvr --remote-silent -cc only --servername $$NVIM && \
	nvr --remote-silent -O $$FILE $$README $$TEST_FILE --servername $$NVIM && \
	if [ "$(LANGUAGE)" == 'awk' ]; then cd $$DIR && find . -name '*.$(LANGUAGE)' | BATS_RUN_SKIPPED=true entr -c bats test*; fi && \
	if [ "$(LANGUAGE)" == 'python' ]; then cd $$DIR && find . -name '*.$(EXT)' | entr -c pytest; fi


submit:
	@set -e; \
	FILE=$(shell git ls-files --others --exclude-standard | grep -v test | awk '$$1 ~ /$(EXT)$$/ {print}'); \
	exercism submit $$FILE
	git add . && git commit -m 'add new exercise' && git push

solutions:
	@python -u solutions.py | fzf --preview "bat --color=always -p {}" | xargs nvr --remote --servername $$NVIM -o
