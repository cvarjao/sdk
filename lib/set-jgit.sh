#!/bin/bash -e
#set -x
_THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_SDK_HOME=$(cd "${_THIS_SCRIPT_DIR}" && cd .. && pwd)

JGIT_VERSION="$(cat "${_SDK_HOME}/etc/defaults/jgit.version.txt")"
JGIT_HOME="${_SDK_HOME}/usr/lib/jgit/${JGIT_VERSION}"
JGIT_MAIN_CLASS="org.eclipse.jgit.pgm.Main"
JGIT_CLASSPATH="${JGIT_HOME}/jgit-sh.jar"

if [ ! -e "${JGIT_HOME}" ]; then
  "${_THIS_SCRIPT_DIR}/sdk-pkg-install.sh" "jgit" "${JGIT_VERSION}" "${JGIT_HOME}"
fi
