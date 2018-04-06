echo "openmrs-mysql-db:"
sudo docker inspect --format '{{ .NetworkSettings.Networks.demoenvironment_default.IPAddress }}' openmrs-mysql-db
echo "fr-db_demo:"
sudo docker inspect --format '{{ .NetworkSettings.Networks.demoenvironment_default.IPAddress }}' fr-db_demo
echo "ohie-fr-demo:"
sudo docker inspect --format '{{ .NetworkSettings.Networks.demoenvironment_default.IPAddress }}' ohie-fr-demo

