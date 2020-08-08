# Bootstrap

This repository contains two scripts - `install` and `setenv`

# Requirements

Both scripts require `curl` and `jq`

* [curl](https://curl.haxx.se/)
* [jq](https://stedolan.github.io/jq/)

Prerequisites are already met in the [official Hamlet container](https://hub.docker.com/r/hamletio/hamlet).

# Configuration

Both scripts use a common JSON configuration structure. The default configuration is stored alongside the scripts, but a path to an alternative configuration file can be provided.

`export HAMLET_REPO_CFG="<path-to-custom-configuration-file>"`

```json
{
    "Repositories" :[
        {
            "Id" : "<identifier>",
            "Repository" : "<url>",
            "Directory" : "<path-from-clone-root>",
            "Clone" : true
        }
    ],
    "EnvProfiles" : [
        {
            "Name" : "default",
            "Environment" : {
                "ENV_VAR" : "<value>"
            }
        }
    ]
}
```

# install.sh

Bootstrap a series of repositories into a specific structure.
Intended for use within [Hamlet](https://hamlet.io).

### Usage

Bootstrap Hamlet with the following command from a bash terminal. 

> Warning: the following command will download and install files from GitHub. Only run scripts you trust.

```bash
curl -L https://raw.githubusercontent.com/hamlet-io/hamlet-bootstrap/master/install.sh | bash
```

### Custom Arguments

Set the following environment variables prior to to executing the above command to modify behaviour.

```bash
# define custom configuration file
# default: https://raw.githubusercontent.com/hamlet-io/hamlet-bootstrap/master/config.json
export HAMLET_REPO_CFG="<path-to-file>"

# define alternate branch per repository
# accepts branch name or hash
# configuration id's are specified in the config file
# default: master
export HAMLET_REPO_<config-id>_BRANCH="<branch>"

# define specific clone depth
# default: 1
export HAMLET_REPO_DEPTH="<depth>"

# define alternate clone root dir
# default: /opt/hamlet
export HAMLET_CLONE_ROOT="<path-to-dir>"
```

# setenv.sh

Inject environment variables into the current shell from an existing config definition.

### Usage 

> Warning: the following command will download and install files from GitHub. Only run scripts you trust.

```bash
# set path to an alternate configuration
export HAMLET_REPO_CFG="<path-to-custom-configuration-file>"

# use alternate EnvProfile
export HAMLET_CFG_ENV_PROFILE="<alternate-envprofile-name>"

# inject HAMLET_CFG_ENV_PROFILE into current shell
eval $(curl -L https://raw.githubusercontent.com/hamlet-io/hamlet-bootstrap/master/setenv.sh | bash)
```