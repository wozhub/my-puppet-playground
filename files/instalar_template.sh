#!/bin/bash 

if [ -z $(which psql) ]; then echo "No encuentro a 'pgsql'"; exit 1; fi 

if [ -z $(psql -l | grep template_postgis) ]; then
    echo "No encuentro a la base 'template_postgis'"

    createdb template_postgis
    psql -d template_postgis -f /usr/share/postgresql/9.3/contrib/postgis-2.1/postgis.sql
    psql -d template_postgis -f /usr/share/postgresql/9.3/contrib/postgis-2.1/spatial_ref_sys.sql
    psql -d template_postgis -f /usr/share/postgresql/9.3/contrib/postgis-2.1/postgis_comments.sql
    psql -d template_postgis -f /usr/share/postgresql/9.3/contrib/postgis-2.1/rtpostgis.sql
    psql -d template_postgis -f /usr/share/postgresql/9.3/contrib/postgis-2.1/topology.sql

fi
