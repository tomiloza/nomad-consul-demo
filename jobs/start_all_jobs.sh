#!/bin/bash

echo "Starting hashi-ui"
nomad run /vagrant/jobs/hashi-ui.hcl
echo "Starting docker-app"
nomad run /vagrant/jobs/docker-app.hcl
echo "Starting java-app"
nomad run /vagrant/jobs/java-app.hcl
echo "Starting python-app"
nomad run /vagrant/jobs/python-app.hcl