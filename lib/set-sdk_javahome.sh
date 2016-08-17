#!/bin/bash -e
_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_SDK_HOME=$(cd "${_SCRIPT_DIR}" && cd .. && pwd)
_JAVA_VERSION=$(cat "${_SDK_HOME}/etc/defaults/private-jre.version.txt")
_SDK_JAVA_HOME="${_SDK_HOME}/var/.jre-linux"
