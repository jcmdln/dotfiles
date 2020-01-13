#!/usr/bin/env sh
#
# This file makes activating Python virtualenvs a bit easier, though
# it is a bit tedious to explicitly define them all.  I tried doing
# something a bit fancier without success, but since I only need a
# handful of things this is good enough.
#
##

if [ -d ~/.local/virtualenv ]; then
    if [ -d ~/.local/virtualenv/ansible ]; then
        alias virtualenv_ansible=". ~/.local/virtualenv/ansible/bin/activate"
    fi

    if [ -d ~/.local/virtualenv/ceph-ansible ]; then
        alias virtualenv_ceph_ansible=". ~/.local/virtualenv/ceph-ansible/bin/activate"
    fi

    if [ -d ~/.local/virtualenv/ceph-deploy ]; then
        alias virtualenv_ceph_deploy=". ~/.local/virtualenv/ceph-deploy/bin/activate"
    fi

    if [ -d ~/.local/virtualenv/redfishtool ]; then
        alias virtualenv_redfishtool=". ~/.local/virtualenv/redfishtool/bin/activate"
    fi
fi
