# Hamlet Devcontainer

This is an example configuration a VS Code devcontainer for use in Hamlet development. See [hamlet.io](https://hamlet.io) for more information.

# Prerequisites

* [VS Code](https://code.visualstudio.com/download)
    * [Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack): `ms-vscode-remote.vscode-remote-extensionpack`
* [Docker](https://docs.docker.com/get-docker/)


# Usage

Either clone down or copy/paste the example files into a clean directory.

```bash
.
└── .devcontainer
    ├── config.json
    └── devcontainer.json
```

Open VS Code into the directory containing your `devcontainer.json` - it it doesn't prompt to re-open VS Code in the devcontainer, open the VS Code Command Palette (`F1`) and select `Remote-Containers: Add Development Container Configuration Files...` - selecting the file here should restart the VS Code window, download and create your container, and establish the configuration of the `devcontainer.json`.

## devcontainer.json

The `devcontainer` will perform the following:

* create a new docker volume-mount which will be used to hold all of your code. This content will not be available outside of the container, however it will persist through container builds and machine/docker restarts.

* Run the bootstrap scripts `setenv.sh` and `install.sh` with the default configuration. This will set you up with a working Hamlet installation with the standard development repositories. Additional repositories - personal or otherwise, should be incorporated by customising the `config.json` file.