#!/usr/bin/env bash

cd /vagrant
if [ ! -f /initdone ];
then
  apt-get update
  apt-get install -y python-software-properties

  cat > /etc/apt/sources.list.d/pgdg.list <<EOF
deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main
#deb-src http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main
EOF
  wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
  apt-add-repository -y ppa:developmentseed/mapbox
  apt-add-repository -y ppa:kakrueger/openstreetmap

  apt-get update
  apt-get --no-install-recommends install -y postgresql-9.3-postgis-2.2 postgresql-contrib-9.3 \
	  tilemill libmapnik nodejs osm2pgsql osmosis mapnik-input-plugin-postgis\
	  vim

  tee /etc/tilemill/tilemill.config <<FOF
{
	"files": "/usr/share/mapbox",
	"server": true,
	"listenHost": "0.0.0.0"
}
FOF

  sudo -u postgres createuser gis
  sudo -u postgres createdb -O gis gis
  sudo -u postgres psql -c "CREATE EXTENSION hstore; CREATE EXTENSION postgis;" -d gis
  sudo -u postgres psql -c "ALTER TABLE geometry_columns OWNER TO gis; ALTER TABLE spatial_ref_sys OWNER TO gis;" -d gis

  #setup trusting auth so no errors with osm2pgsql
  sudo sed -i 's/peer/trust/g' /etc/postgresql/9.3/main/pg_hba.conf
  sudo service postgresql restart

  if [ ! -f portland.osm ];
  then
    wget --quiet http://osm-extracted-metros.s3.amazonaws.com/portland.osm.bz2
    bunzip2 portland.osm.bz2
  fi
  sudo -u postgres osm2pgsql --slim -d gis -U gis -C 512 --hstore --multi-geometry portland.osm

  echo 'cd /vagrant' > /home/vagrant/.bashrc
  touch /initdone
else
  echo "blah blah blah"
fi

#not sure why, but on initial provision linking /vagrant doesn't work
for dir in /vagrant/styles/*; do
	if [ -d "$dir" ]; then
		if [ ! -f "/usr/share/mapbox/project/$(basename "$dir")" ]; then
			sudo ln -s $dir /usr/share/mapbox/project/
		fi
	fi
done

start tilemill
