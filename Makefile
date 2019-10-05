local_token = ${LOCAL_TOKEN}
production_token = ${PRODUCTION_TOKEN}

test:
	rm coverage.xml || true
	rm .coverage || true
	python -m pytest --cov=./

local.report:
	./local.sh -t ${local_token} -F flagsecond

production.report:
	./production.sh -t ${production_token} -F flagproduction

show_vars:
	echo ${local_token}
	echo ${production_token}

local.full:
	${MAKE} local.download
	${MAKE} test
	${MAKE} local.report

production.full:
	${MAKE} production.download
	${MAKE} test
	${MAKE} production.report

local.download:
	curl -s http://localhost/bash > local.sh
	chmod +x ./local.sh

production.download:
	curl -s https://codecov.io/bash > production.sh
	chmod +x ./production.sh