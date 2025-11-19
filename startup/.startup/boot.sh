#!/usr/bin/env nu

brew services start syncthing
colima start

zellij -l local-servers attach --create-background auto-start-local-servers
