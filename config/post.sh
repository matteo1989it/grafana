#!/bin/sh
curl -u admin:admin -X POST -H "Content-Type:application/json" --data-binary "@/etc/config/datasources/datasource.json" http://localhost:3000/api/datasources
curl -u admin:admin -X POST -H "Content-Type:application/json" --data-binary "@/etc/config/dashboards/metrics_kpi.json" http://localhost:3000/api/dashboards/db
curl -u admin:admin -X POST -H "Content-Type:application/json" --data-binary "@/etc/config/dashboards/m3trics_intent.json" http://localhost:3000/api/dashboards/db
printf "dashboards created"