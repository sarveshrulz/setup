#!/bin/sh

# Variables
FILE=~/.zshrc

# Oh-my-zsh Theme
if grep -q 'robbyrussell' $FILE ; then
  sudo sed -i 's/robbyrussell/minimal/' $FILE
fi

# Aliases & Exports
if ! grep -q '# Personal Aliases' $FILE ; then
  echo -e "\n# Personal Aliases\nalias bl='cd ~/Workdir/Bootleg'\nalias benv='virtualenv2 venv && source venv/bin/activate'\nalias resync='repo sync --current-branch --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j10'\nalias mvbuild='mv ~/Workdir/Bootleg/out/target/product/phoenix/bootleg_phoenix-ota-eng.sarvesh.zip ~/Builds && mv ~/Workdir/Bootleg/out/target/product/phoenix/Boo* ~/Builds'\n\n# Exports\nexport BOOTLEGGERS\_BUILD\_TYPE=Shishufied\nexport DEVICE\_MAINTAINERS='Sarveshrulz'\nexport BOOTLEGGERS_NOTCHED=true\nexport _JAVA_OPTIONS='-Xmx4g'\nexport USE_CCACHE=1\nexport CCACHE_EXEC=/usr/bin/ccache" >> $FILE
fi

# Local Manifests
if [ ! -f ~/Workdir/Bootleg/.repo/local_manifests/silver.xml ] ; then
  cp silver.xml ~/Workdir/Bootleg/.repo/local_manifests/silver.xml
fi

# Reload
exec zsh
