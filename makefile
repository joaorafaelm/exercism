.ONESHELL:

export LANGUAGE=$(shell [[ "$$LANGUAGE" ]] && echo $$LANGUAGE || echo awk)
export EXT=$(shell [[ "$$EXT" ]] && echo $$EXT || echo awk)

-include .env
export


download:
	@python exercises.py

new:
	@set -e; \
	DIR=$(shell git ls-files --others --exclude-standard --directory -x makefile -x solutions.py -x exercises.py -x .gitignore -x .pytest_cache); \
	FILE=$(shell git ls-files --others --exclude-standard | grep -v test | grep -v _spec | awk '$$1 ~ /$(EXT)$$/ {print}'); \
	README=$(shell git ls-files --others --exclude-standard | awk '$$1 ~ /README/ {print}'); \
	nvr --remote-silent -cc only --servername $$NVIM && \
	nvr --remote-silent -O $$FILE $$README --servername $$NVIM && \
	if [ "$(LANGUAGE)" == 'awk' ]; then cd $$DIR && find . -name '*.$(LANGUAGE)' | BATS_RUN_SKIPPED=true entr -c bats test*; fi && \
	if [ "$(LANGUAGE)" == 'python' ]; then cd $$DIR && find . -name '*.$(EXT)' | entr -c pytest; fi && \
	if [ "$(LANGUAGE)" == 'lua' ]; then cd $$DIR && find . -name '*.$(EXT)' | entr -c busted; fi && \
	if [ "$(LANGUAGE)" == 'rust' ]; then cd $$DIR && echo $$DIR && find . -name '*.$(EXT)' | entr -c cargo test; fi && \
	if [ "$(LANGUAGE)" == 'haskell' ]; then cd $$DIR && echo $$DIR && find . -name '*.$(EXT)' | entr -c stack test; fi


submit:
	@set -e; \
	FILE=$(shell git ls-files --others --exclude-standard | grep -v test | grep -v _spec | grep -v autogen | awk '$$1 ~ /$(EXT)$$/ {print}'); \
	exercism submit $$FILE
	git add . && git commit -m 'add new exercise' && git push

solutions:
	@python -u solutions.py | fzf --preview "bat --color=always -p {}" | xargs nvr --remote --servername $$NVIM -o
