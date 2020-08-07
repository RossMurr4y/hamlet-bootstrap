#!/usr/bin/env bash
[[ ! -d ./hamlet ]] && jq  -r '.Repositories[] | "git clone --depth 1 --branch master \(.Repository) \(.Directory)" ' <config.json | bash