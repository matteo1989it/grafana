#!/bin/sh
curl -u admin:admin -X PUT -H "Content-Type:application/json" --data-binary "@/etc/config/datasources/datasource.json" http://localhost:3000/api/datasources/1
printf "dashboards created"