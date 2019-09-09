local_token = ${LOCAL_TOKEN}
production_token = ${PRODUCTION_TOKEN}

test:
	rm coverage.xml || true
	rm .coverage || true
	python -m pytest --cov=./

report.local:
	./local.sh -t ${local_token} -F flagsecond

show_vars:
	echo ${local_token}
	echo ${production_token}

full.local:
	${MAKE} download_local
	${MAKE} test
	${MAKE} report.local

download_local:
	curl -s http://localhost/bash > local.sh
	chmod +x ./local.sh