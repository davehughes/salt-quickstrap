Motivation:
-----------
I want a quick way to bootstrap a basic salt environment that I can use to do
basic config management for side projects.  If I can set up salt really quickly,
it makes me much more likely to store the details of my project resources
in state files that I can just apply even after being away from a project for
a while.

Quickstart:
-----------
This repo provides an opinionated and (probably) oversimplified configuration
that sets up a single node to be both master and minion so it can apply
changes to itself via standard salt CLI commands.

```
git clone git://github.com/davehughes/salt-quickstrap
cd salt-quickstrap
# Edit properties at the top of `Makefile` to point to your target box
make bootstrap
make highstate
```

You should now be able to develop salt states locally on you dev machine and
run `make highstate` to sync and apply them.
