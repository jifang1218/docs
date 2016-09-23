# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Generic Config
PATH=/usr/local/bin:$PATH
LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Editor Config
GIT_EDITOR=vi
SVN_EDITOR=vi
EDITOR=vi

# Java Config
JAVA_HOME=$HOME/apps/jdk
JRE_HOME=$JAVA_HOME/jre
CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:${CLASSPATH}
JAVA_PATH=$JAVA_HOME/bin
PATH=${JAVA_PATH}:${PATH}

# Tomcat Config
TOMCAT_HOME=${HOME}/apps/tomcat
CATALINA_HOME=${TOMCAT_HOME}
CLASSPATH=${TOMCAT_HOME}/lib/servlet-api.jar:${CLASSPATH}
TOMCAT_PATH=${TOMCAT_HOME}/bin
PATH=${TOMCAT_PATH}:${PATH}

# Ant Config
ANT_HOME=$HOME/apps/ant
ANT_PATH=$ANT_HOME/bin
PATH=${ANT_PATH}:${PATH}

# CLang Config
CLANG_ROOT=/usr/local/clang
CLANG_PATH=$CLANG_ROOT/bin
CLANG_LIB=$CLANG_ROOT/lib
PATH=$CLANG_PATH:$PATH
LD_LIBRARY_PATH=$CLANG_LIB:$LD_LIBRARY_PATH

# Raspi Config
RASPI_HOME=${HOME}/apps/raspi
RASPI_PATH=${RASPI_HOME}/bin
PATH=${RASPI_PATH}:${PATH}

export PATH LD_LIBRARY_PATH GIT_EDITOR SVN_EDITOR EDITOR
export JAVA_HOME CLASSPATH TOMCAT_HOME CATALINA_HOME
