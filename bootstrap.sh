#!/usr/bin/env bash

cd /vagrant
if [ ! -f /initdone ];
then
  #fix bug in this ubuntu image
  echo "127.0.1.1 ubuntu-xenial" | tee -a /etc/hosts

  apt-get update
  apt-get install -y python-software-properties virtualbox-guest-utils

  apt-get --no-install-recommends install -y postgresql-9.5-postgis-2.2 postgresql-contrib-9.5 \
          libmapnik-dev nodejs npm osm2pgsql osmosis vim gdal-bin python-gdal node-carto

  #some of our npm installed packages need node as a command
  ln -s /usr/bin/nodejs /usr/bin/node

  sudo -u postgres createuser gisuser
  sudo -u postgres createdb -O gisuser gis
  sudo -u postgres psql -c "CREATE EXTENSION hstore; CREATE EXTENSION postgis;" -d gis
  sudo -u postgres psql -c "ALTER TABLE geometry_columns OWNER TO gis; ALTER TABLE spatial_ref_sys OWNER TO gis;" -d gis

  #setup trusting auth so no errors with osm2pgsql
  sed -i 's/peer/trust/g' /etc/postgresql/9.5/main/pg_hba.conf
  service postgresql restart

  if [ ! -f portland.osm ];
  then
    su ubuntu << EOF
cd ~
wget --quiet http://osm-extracted-metros.s3.amazonaws.com/portland.osm.bz2
bunzip2 portland.osm.bz2
EOF
  fi
  sudo -u postgres osm2pgsql --slim -d gis -U gisuser -C 512 --hstore --multi-geometry portland.osm

  #can't run npm as root
  su ubuntu << EOF
cd ~
git clone https://github.com/mapbox/tilemill.git
cd tilemill
npm install
EOF

  tee /etc/tilemill.config <<FOF
{
	"server": true,
	"listenHost": "0.0.0.0"
}
FOF

  echo 'cd /vagrant' > /home/ubuntu/.bashrc
  touch /initdone
else
  echo "blah blah blah"
fi

#not sure why, but on initial provision linking /vagrant doesn't work
for dir in /vagrant/styles/*; do
	if [ -d "$dir" ]; then
		if [ ! -f "/home/ubuntu/Documents/MapBox/project/$(basename "$dir")" ]; then
			ln -s $dir /home/ubuntu/Documents/MapBox/project/
		fi
	fi
done

su ubuntu << EOF
cd ~/tilemill
./index.js --config=/etc/tilemill.config &
EOF
