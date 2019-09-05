# elm-build-scripts
Some bash scripts I use for building elm projects.

watch-elm.sh
  - watches the elm code directory.
  - when there's a code change, starts build-elm.sh
  - run this in a window while you edit code.  

build-elm.sh 
  - downloads github dependencies
  - rebuilds the current project
  - checks for an elm compiler error and if present, 
    - deletes elm-stuff
    - tries compile again. 



# programs the scripts need

watch-elm.sh depends on the command line tool *reflex*, for watching the code directory for changes.  Hopefully available in your distro. 
    
build-elm.sh *optionally* depends on [git-at-revision](https://github.com/bburdette/git-at-revision), for downloading git repos as of a particular commit.  This allows you to depend on elm projects that aren't in the elm package repository.

# try it out

both scripts are in the example folder.  You'll probably modify them to suit your needs.  

Clone this repo, then CD over to the example folder and run ./watch-elm.sh.  In another window run ./server.sh. 
In a third window edit some code, and in your browser head to localhost:8000.  
