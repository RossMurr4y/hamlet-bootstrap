## Hamlet Deploy - Bootstrap 

This repository contains a number of bash scripts used for fast installation and configuration of the parts of Hamlet Deploy.

See https://docs.hamlet.io for more info on Hamlet Deploy

### Installation

The scripts in Bootstrap are typically invoked directly from their hosted location in GitHub, and such use does not require any installation.

### Configuration

Bootstrap comes with a standard configuration found in `./config.json`. This will install Hamlet Deploy as it is found within the official Docker container.

An alternative `config.json` can be provided by setting the following Environment Variable:

```bash
export HAMLET_REPO_CFG="<path-to-custom-configuration-file>"
```

The structure of the config file is as follows:

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

### Update

To manually perform an update of Bootstrap, simply pull down the latest changes with git.

```bash
cd /path/to/bootstrap
git pull
```

> **Note:** this updates Bootstrap only, not the repositories within the config file.

### Usage

Bootstrap contains two primary scripts - `install` and `setenv`. Both are configured together as outlined above.

#### Requirements

Both scripts require `curl` and `jq`

* [curl](https://curl.haxx.se/)
* [jq](https://stedolan.github.io/jq/)

Prerequisites are already met in the [official Hamlet container](https://hub.docker.com/r/hamletio/hamlet).

#### **install.sh**

Bootstrap a series of repositories into a specific structure.
Intended for use within [Hamlet](https://hamlet.io).

##### Usage

Bootstrap Hamlet with the following command from a bash terminal. 

> Warning: the following command will download and install files from GitHub. Only run scripts you trust.

```bash
curl -L https://raw.githubusercontent.com/hamlet-io/hamlet-bootstrap/master/install.sh | bash
```

##### Custom Arguments

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

#### **setenv.sh**

Inject environment variables into the current shell from an existing config definition.

##### Usage 

> Warning: the following command will download and install files from GitHub. Only run scripts you trust.

```bash
# set path to an alternate configuration
export HAMLET_REPO_CFG="<path-to-custom-configuration-file>"

# use alternate EnvProfile
export HAMLET_CFG_ENV_PROFILE="<alternate-envprofile-name>"

# inject HAMLET_CFG_ENV_PROFILE into current shell
eval $(curl -L https://raw.githubusercontent.com/hamlet-io/hamlet-bootstrap/master/setenv.sh | bash)
```