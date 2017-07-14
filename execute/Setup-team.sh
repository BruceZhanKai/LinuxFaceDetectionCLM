sudo dpkg -i teamviewer_12.0.76279_i386.deb

sudo teamviewer --daemon start

sudo /opt/teamviewer/tv_bin/teamviewerd -d

sudo ln -s /opt/teamviewer/tv_bin/script/teamviewerd.service /etc/systemd/system/teamviewerd.service
