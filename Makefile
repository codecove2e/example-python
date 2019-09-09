local_token = ${LOCAL_TOKEN}
production_token = ${PRODUCTION_TOKEN}

test:
	rm coverage.xml || true
	rm .coverage || true
	python -m pytest --cov=./

report.local:
	./local.sh -t ${local_token} -F flagsecond

report.production:
	./production.sh -t ${production_token} -F flagproduction

show_vars:
	echo ${local_token}
	echo ${production_token}

full.local:
	${MAKE} download_local
	${MAKE} test
	${MAKE} report.local

full.production:
	${MAKE} download_production
	${MAKE} test
	${MAKE} report.production

download_local:
	curl -s http://localhost/bash > local.sh
	chmod +x ./local.sh

download_production:
	curl -s https://codecov.io/bash > production.sh
	chmod +x ./production.sh