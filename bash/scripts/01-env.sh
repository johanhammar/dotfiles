#!/bin/bash

# Setting PATH for JRuby 1.6.5
# The orginal version is saved in .bash_profile.jrubysave
PATH="${PATH}:/Library/Frameworks/JRuby.framework/Versions/Current/bin"
export PATH

PATH="${PATH}:/Users/johanhammar/.bin"
export PATH

PATH="${PATH}:/usr/local/bin"
export PATH

NODE_PATH=/usr/local/lib/node_modules
export NODE_PATH

export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar

export CLOJURE_HOME=/usr/local/Cellar/clojure/1.3.0 
export CLASSPATH=$CLASSPATH:$CLOJURE_HOME/clojure-1.3.0.jar:

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
