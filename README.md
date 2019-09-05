# elm-build-scripts
Some bash scripts I use for building elm projects.

build-elm.sh 
  - downloads github dependencies
  - rebuilds the current project
  - checks for an elm compiler error and if present, 
    - deletes elm-stuff
    - tries compile again. 


watch-elm.sh
  - watches the elm code directory.
  - when there's a code change, starts build-elm.sh

each script depends on a executable:
  watch-elm.sh
    reflex - for watching the code directory for changes.  Hopefully available in your distro. 
  build-elm.sh
    [git-at-revision](https://github.com/bburdette/git-at-revision) - for downloading git repos as of a particular commit.

