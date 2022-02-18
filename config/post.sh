#!/bin/sh
echo creating datasource
curl -u admin:admin -X POST -H "Content-Type:application/json" --data-binary "@/etc/config/datasource.json" http://localhost:3000/api/datasources
echo "\ndatasource created"
echo creating dashboard
curl -u admin:admin -X POST -H "Content-Type:application/json" --data-binary "@/etc/config/metrics_kpi.json" http://localhost:3000/api/dashboards/db
echo "\ndashboard created"
echo "Press any key to continue"
while [ true ] ; do
if [ $? = 0 ] ; then
exit ;
else
echo "waiting for the keypress"
fi
done