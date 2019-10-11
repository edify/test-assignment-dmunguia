#!/bin/sh

/share/wait-for-it.sh db:3306

echo "Generating database schema diagram"

/opt/schemacrawler/schemacrawler.sh \
--server=mysql --host=db \
--user=root --password=root \
--database=lms \
--info-level=standard --command=schema \
--output-format=png \
--output-file=/share/report/diagram.png

echo "Linting schema"

/opt/schemacrawler/schemacrawler.sh \
--server=mysql --host=db \
--user=root --password=root \
--database=lms \
--info-level=standard --command=lint \
--output-format=html \
--output-file=/share/report/lint.html
