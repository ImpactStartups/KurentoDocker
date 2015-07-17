# KurentoDocker plugin

The script `create-plugin-image` create a Docker image from the image `impactstartups/kurento`. It takes all the `*.deb` files from the directory where it is run and installs them in the new image. It doesn't change the command run when the container is run. 

## Usage

In order to run it, you have to:
* run is as root
* run it in the same directory where the `*.deb` files of the plugins are located
* run it with the name of the repository name for the image as parameter

For instance, if you want to create an image called `impactstartups/kurento-extended`, run:

```
sudo ./create-plugin-image.sh impactstartups/kurento-extended
```
