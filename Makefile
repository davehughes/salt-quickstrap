HOST=dave@example.com

bootstrap:
	scp bootstrap.sh $(HOST):/tmp/bootstrap.sh
	ssh $(HOST) "sudo sh /tmp/bootstrap.sh"

sync:
	scp -r salt/* $(HOST):/srv/salt/base

highstate: sync
	ssh $(HOST) "sudo salt '*' state.highstate"
