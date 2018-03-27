#!/bin/bash

HOST=$1

if [ -z "$HOST" ]; then
    echo "Specify hostname and port"
    return
else
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY categoryoptioncombo TO STDOUT DELIMITER ';' CSV" > categoryoptioncombo.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY categorycombo TO STDOUT DELIMITER ';' CSV" > categorycombo.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY dataelementcategoryoption TO STDOUT DELIMITER ';' CSV" > dataelementcategoryoption.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY dataelementcategory TO STDOUT DELIMITER ';' CSV" > dataelementcategory.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY categories_categoryoptions TO STDOUT DELIMITER ';' CSV" > categories_categoryoptions.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY categorycombos_categories TO STDOUT DELIMITER ';' CSV" > categorycombos_categories.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY categorycombos_optioncombos TO STDOUT DELIMITER ';' CSV" > categorycombos_optioncombos.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY categoryoptioncombos_categoryoptions TO STDOUT DELIMITER ';' CSV" > categoryoptioncombos_categoryoptions.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY dataelement TO STDOUT DELIMITER ';' CSV" > dataelement.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY dataset TO STDOUT DELIMITER ';' CSV" > dataset.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY datasetelement TO STDOUT DELIMITER ';' CSV" > datasetelement.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY datasetsource TO STDOUT DELIMITER ';' CSV" > datasetsource.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY program TO STDOUT DELIMITER ';' CSV" > program.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY program_attributes TO STDOUT DELIMITER ';' CSV" > program_attributes.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY program_organisationunits TO STDOUT DELIMITER ';' CSV" > program_organisationunits.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY programstage TO STDOUT DELIMITER ';' CSV" > programstage.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY programstagedataelement TO STDOUT DELIMITER ';' CSV" > programstagedataelement.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY trackedentityattribute TO STDOUT DELIMITER ';' CSV" > trackedentityattribute.csv
    sudo docker exec $HOST psql -d dhis2 -U postgres -c "COPY trackedentity TO STDOUT DELIMITER ';' CSV" > trackedentity.csv
    rm dhis-data.tar.gz
    tar -zcvf dhis-data.tar.gz *
    echo "Export completed"
fi