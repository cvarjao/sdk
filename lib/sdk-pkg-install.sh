#!/bin/bash -e

_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_SDK_HOME=$(cd "${_SCRIPT_DIR}" && cd .. && pwd)
_JAVA_VERSION=$(cat "${_SDK_HOME}/etc/defaults/private-jre.version.txt")
_SDK_JAVA_HOME="${_SDK_HOME}/var/.jre-linux"
_INSTALL_ROOT="${_SDK_HOME}/usr/lib"
_INSTALL_PKG_NAME="$1"
_INSTALL_PKG_VERSION="$2"

if [ ! -e "${_SDK_JAVA_HOME}" ]; then
  "${_SCRIPT_DIR}/install-local-jre.sh" "${_JAVA_VERSION}" "${_SDK_JAVA_HOME}"
fi

if [[ "${_INSTALL_PKG_NAME}" != '-' ]]; then
  _INSTALL_PKG_HOME="${_INSTALL_ROOT}/${_INSTALL_PKG_NAME}/${_INSTALL_PKG_VERSION}"
  if [ ! -e "${_INSTALL_PKG_HOME}" ]; then
    "${_SDK_JAVA_HOME}/bin/sdk-jjs" -scripting "${_SDK_HOME}/lib/install-${_INSTALL_PKG_NAME}.js" -- "${_INSTALL_PKG_VERSION}" "${_INSTALL_PKG_HOME}"
  fi
fi
