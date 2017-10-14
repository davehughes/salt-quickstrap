# Add saltstack repository
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
cat > /etc/apt/sources.list.d/saltstack.list <<END
deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main
END

# Set up salt as master and minion on the main box
apt update && apt install -y salt-minion salt-master

cat > /etc/salt/master <<END
hash_type: sha512
auto_accept: True

fileserver_backend:
  - roots

file_roots:
  base:
  - /srv/salt/base/states

pillar_roots:
  base:
  - /srv/salt/base/pillar
END

cat > /etc/salt/minion <<END
master: localhost
END

cat > /etc/salt/minion_id <<END
saltmaster
END

mkdir -p /srv/salt/base
chown -R ubuntu:root /srv/salt

service salt-master restart
service salt-minion restart
