dev_token = ${LOCAL_TOKEN}
production_token = ${PRODUCTION_TOKEN}
staging_token = ${STAGING_TOKEN}

test:
	rm coverage.xml || true
	rm .coverage || true
	python -m pytest --cov=./ tests/test_sample.py --cov-report=xml:flagtwo.coverage.xml

test.flagone:
	rm coverage.xml || true
	rm .coverage || true
	python -m pytest --cov=./ tests/test_number_two.py --cov-report=xml:flagone.coverage.xml

dev.report:
	./dev.sh -t ${dev_token} -F unit -f flagtwo.coverage.xml

staging.report:
	./production.sh -t ${staging_token} -F pt -f flagtwo.coverage.xml -u https://stage-web.codecov.dev

direct.report:
	./direct.sh -t ${dev_token} -F pt -f flagtwo.coverage.xml

dev.report.flagone:
	./dev.sh -t ${dev_token} -F integration -f flagone.coverage.xml

production.report:
	./production.sh -t ${production_token} -F pt  -f flagtwo.coverage.xml -b 123

production.report.flagone:
	./production.sh -t ${production_token} -F psdb  -f flagone.coverage.xml -b 654

staging.report.flagone:
	./production.sh -t ${staging_token} -F psdb  -f flagone.coverage.xml -u https://codecov.io

dev.full:
	${MAKE} dev.download
	${MAKE} test
	${MAKE} dev.report
	${MAKE} test.flagone
	${MAKE} dev.report.flagone

dev.partial:
	${MAKE} dev.download
	${MAKE} test
	${MAKE} dev.report

dev.flagone:
	${MAKE} dev.download
	${MAKE} test.flagone
	${MAKE} dev.report.flagone

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

staging.full:
	${MAKE} production.download
	${MAKE} test.flagone
	${MAKE} staging.report.flagone
	${MAKE} test
	${MAKE} staging.report

dev.download:
	curl -s http://localhost/bash > dev.sh
	chmod +x ./dev.sh

production.download:
	curl -s https://codecov.io/bash > production.sh
	chmod +x ./production.sh

staging.download:
	curl -s https://codecov.io/bash > staging.sh
	chmod +x ./staging.sh
