local_token = ${LOCAL_TOKEN}
production_token = ${PRODUCTION_TOKEN}

test:
	rm coverage.xml || true
	rm .coverage || true
	python -m pytest --cov=./

test.flagone:
	rm coverage.xml || true
	rm .coverage || true
	python -m pytest --cov=./ tests/test_number_two.py

local.report:
	./local.sh -t ${local_token} -F flagsecond

local.report.flagone:
	./local.sh -t ${local_token} -F flagone

production.report:
	./production.sh -t ${production_token} -F flagone

production.report.flagone:
	./production.sh -t ${production_token} -F flagone

local.full:
	${MAKE} local.download
	${MAKE} test
	${MAKE} local.report
	${MAKE} test.flagone
	${MAKE} local.report.flagone

production.full:
	${MAKE} production.download
	${MAKE} test.flagone
	${MAKE} production.report.flagone
	${MAKE} test
	${MAKE} production.report

production.partial:
	${MAKE} production.download
	${MAKE} test
	${MAKE} production.report

local.download:
	curl -s http://localhost/bash > local.sh
	chmod +x ./local.sh

production.download:
	curl -s https://codecov.io/bash > production.sh
	chmod +x ./production.sh
