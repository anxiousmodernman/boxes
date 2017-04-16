#!/bin/bash

set -e

# Run packer build.
packer build rkt-base.json

# Add the box so we can use 'rkt-box' in our local Vagrantfiles. --force is 
# required because this box probably exists.
vagrant box add output/rkt-box.box --force --name rkt-box

