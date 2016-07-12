

curl 'https://nodejs.org/dist/v4.4.7/node-v4.4.7-sunos-x64.tar.xz'
mkdir 4.4.7
gtar --directory=/tmp/node/4.4.7 --strip-components=1 -xvf /tmp/node/node-v4.4.7-sunos-x64.tar.xz
gtar -xzvf /tmp/node/node-v4.4.7-sunos-x64.tar.xz