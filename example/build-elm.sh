#  this standard preamble doens't work in nixos.
#  #!/bin/bash

# pass in --optimize for a production build!

# clear the terminal window for a fresh compile.
clear

# GITHUB DEPENDENCIES
# if you uncomment these, have git-at-revision installed.
# then add the relevant src dirs from gitdeps/ to your elm.json.

: '
# allow dirty repos, but not in production mode.
if [ "$1" = "--optimize" ]; then
  DIRTY=""
else
  DIRTY="--dirtyok"
fi
  
# get git dependencies.  Or if we have them already, do nothing.
mkdir gitdeps -p
dl=("git-at-revision cbbb2ee3ab7cdf41b95b9e5d41bb305021fb071d git@github.com:bburdette/dial-a-log.git gitdeps/dial-a-log $DIRTY")
ec=("git-at-revision af8fb663ab4c668f5102b2a4f036ed4444f3a654 git@github.com:bburdette/elm-common.git gitdeps/elm-common $DIRTY")

# everything ok?
if !($dl && $ec)
then
  echo "git dependency problems! exiting build."
  exit 1
fi
'

# BUILD THE ELM PROJECT

 
# this seems to help clear the screen before the build.
# 'clear' alone sometimes doesn't happen until the build is almost done.
echo "starting elm make... wait for 'build complete'!"

# do the build!
time elm make src/Main.elm --output static/main.js $1 2> >(tee build-elm-out.txt)

grep -q "elm: not enough bytes" build-elm-out.txt
if [ $? -eq 0 ] 
then
  echo "deleting elm-stuff and retrying compile!"
  rm -rf elm-stuff
  time elm make src/Main.elm --output static/main.js $1 2> >(tee build-elm-out.txt)
fi 

rm -f build-elm-out.txt 

# print this when the link step is finally done.
echo build complete! 
