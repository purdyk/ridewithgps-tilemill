This is a Vagrant/VirtualBox powered VM for creating/editing map styles based on OSM data.
Ensure you have VirtualBox and the latest version of Vagrant installed.

download layers to your local directory:

	wget http://ridewithgps.com/layers.tar.gz .
	tar zxf layers.tar.gz

make a symbolic link to the rwgps style directory (TODO: make this automatic)

	ln -s layers/ styles/rwgps/
