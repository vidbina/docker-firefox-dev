# Firefox Developer Edition

[Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/)

# Usage

 - `source func.sh`
 - run `firefox-dev`

> NOTE: The container will need access to your X server.
The simplest way to grant access to local connections is by adding
`local` to the X server ACL (access control list) `xhost +local` :wink:.

# Image

The image `vidbina/firefox-dev` is retrieved unless otherwise specified.
Feel free to use the image at your discretion.
You can alway rebuild the image locallythrough by running
`docker build` as demonstrated in the Makefile.
Note how the `FIREFOX_TAR` contains the URI to the tarball to be installed.
