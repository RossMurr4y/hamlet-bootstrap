#!/usr/bin/env bash

HAMLET_REPO_CFG_DEFAULT="https://raw.githubusercontent.com/hamlet-io/hamlet-bootstrap/master/config.json"
HAMLET_CGF_ENV_PROFILE_DEFAULT="default"
export HAMLET_REPO_CFG="${HAMLET_REPO_CFG:-$HAMLET_REPO_CFG_DEFAULT}"
export HAMLET_CFG_ENV_PROFILE="${HAMLET_CFG_ENV_PROFILE:-$HAMLET_CGF_ENV_PROFILE_DEFAULT}"

if [[ -n "${HAMLET_REPO_CFG}" ]]; then
    curl -L "${HAMLET_REPO_CFG}" | jq -r '.EnvProfiles[] | select(.Name == "\(env.HAMLET_CFG_ENV_PROFILE)").Environment | to_entries[] | "export \(.key)=\"" + "\(env.HAMLET_CLONE_ROOT)/\(.value)\"" | gsub(";"; "\\;"; "")' | cat
else
    echo "Hamlet configuration file could not be found at path: ${HAMLET_REPO_CFG}"
fi