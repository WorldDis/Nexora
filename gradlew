#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a symlink
app_path="$0"
while [ -h "$app_path" ] ; do
    ls=$( ls -ld "$app_path" )
    link=$( expr "$ls" : '.*-> \(.*\)$' )
    if expr "$link" : '/.*' > /dev/null; then
        app_path="$link"
    else
        app_path=$( cd "$( dirname "$app_path" )" && pwd -P )
        app_path="$app_path/$(basename "$0")"
    fi
done

APP_HOME=$( cd "$( dirname "$app_path" )" && pwd -P )
APP_NAME="Gradle"
APP_BASE_NAME=$(basename "$0")

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

# Use the maximum available, or set MAX_FD != "unlimited" if you know the system default is too high for your needs.
MAX_FD=unlimited

warn () {
    echo "$*"
}

die () {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
case "$( uname )" in                #(
  CYGWIN* )         cygwin=true  ;; #(
  Darwin* )         darwin=true  ;; #(
  MSYS* | MINGW* )  msys=true    ;; #(
  NOTO* )           noto=true    ;; #(
  * )               false       ;;
esac

if [ "$cygwin" = true ] || [ "$msys" = true ] ; then
    APP_HOME=$( cygpath --path --mixed "$APP_HOME" )
    CP=$(
        cygpath --path --mixed "$CLASSPATH"
    )
    CLASSPATH=$CP
    JAVA_HOME=$( cygpath --mixed "$JAVA_HOME" )
    base_dir=$( cygpath --mixed / )
    APP_HOME=$( cygpath --absolute "$APP_HOME" )
    APP_BASE_NAME=$( basename "$0" )
fi

# Escape application args
save () {
    for var in "$@"
    do
        case "$var" in #(
          *\\* ) var=$( printf '%s\n' "$var" | sed "s/\\\\/\\\\\\\\/g" ) ;; #(
          *\" * ) var=$( printf '%s\n' "$var" | sed "s/\"/\\\\\"/g" ) ;; #(
          * ) var=$( printf '%s\n' "$var" | sed "s/'/'\\\\''/g" ) ;;
        esac
        varargs1="$varargs1 '$var'"
    done
    case "$varargs1" in
        *\\* ) varargs1=$( printf '%s\n' "$varargs1" | sed "s/\\\\/\\\\\\\\/g" ) ;;
    esac
    eval "set -- $varargs1"
}

# Escape application args
save "$@"

# Collect all arguments for the java command; in some cases ec returns empty string and that needs to be handled
for arg in "$@"
do
    case $arg in #(
      -*)   false ;; # don't mess with options #(
      /?*)  t=${arg#/} t=/${t%%/*}              # looks like a POSIX filepath
            [ -e "$t" ] ;;                      #(
      *)    false ;;
    esac
done
as_nl='
'
expr "X$as_nl" : X >/dev/null 2>&1 || exit 1

# Proper quoting and blackslash escaping is performed by xargs.
xargs_escape() { :; }
if [ -z "$1" ] ; then
    xargs_escape() { cat; }
elif [ "$1" != '-0' ] ; then
    xargs_escape() { sed "s/'\''/'\''\\\\\'\''/g"; }
fi
CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar


# This is normally unused; but when using "cygpath -w", it converts Windows paths to Unix paths.
cygwin=false
msys=false
# For Cygwin and MinGw, switch paths to Windows-native before running java:
if $cygwin; then
    APP_HOME=$( cygpath --path --absolute "$APP_HOME" )
    CLASSPATH=$( cygpath --path --absolute "$CLASSPATH" )

    JAVACMD=$( cygpath --unix "$JAVACMD" )

    # Now convert the arguments - kludge to limit ourselves to /bin/sh
    for arg do
        if
            case $arg in                                #(
              -*)   false;;                            # don't mess with options #(
              /?*)  t=${arg#/} t=/${t%%/*}             # looks like a POSIX filepath
                    [ -e "$t" ];;                      #(
              *)    false;;
            esac
        then
            arg=$( cygpath --path --absolute "$arg" )
        fi
        case $arg in
            *\\*) arg=$( printf '%s\n' "$arg" | sed 's/\\/\\\\/g' ) ;;
        esac
        appargs=$appargs' '"'"'$arg'"'"
    done
    for i in $JAVA_OPTS; do
        arg=$i
        case $arg in
            -*)   arg=$( printf '%s\n' "$arg" | sed 's/\\/\\\\/g' ) ;;
        esac
        appargs=$appargs' '"'"'$arg'"'"
    done
    set -- "$@" java -classpath "$CLASSPATH" "$JAVACMD" $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
elif $msys; then
    CLASSPATH=$( printf '%s\n' "$CLASSPATH" | sed 's|\\|/|g' )

    # Now convert the arguments - kludge to limit ourselves to /bin/sh
    for arg do
        if
            case $arg in                                #(
              -*)   false;;                            # don't mess with options #(
              /?*)  t=${arg#/} t=/${t%%/*}             # looks like a POSIX filepath
                    [ -e "$t" ];;                      #(
              *)    false;;
            esac
        then
            arg=$( cygpath --path --mixed "$arg" )
        fi
        case $arg in
            *\\*) arg=$( printf '%s\n' "$arg" | sed 's/\\/\\\\/g' ) ;;
        esac
        appargs=$appargs' '"'"'$arg'"'"
    done
    set -- "$@" java -classpath "$CLASSPATH" $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
else
    set -- "$@" java -classpath "$CLASSPATH" $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
fi

exec "$@"
