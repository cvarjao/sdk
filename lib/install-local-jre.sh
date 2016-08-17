#!/bin/bash -e
_THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_SDK_HOME=$(cd "${_THIS_SCRIPT_DIR}" && cd .. && pwd)
_JAVA_VERSION="$1"
_JAVA_HOME="$2"
_TMP_DIR="${_SDK_HOME}/var/tmp"
_JAVA_DOWNLOAD_URL=$(echo "${_JAVA_VERSION}" | sed -e 's|\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)\_\([0-9]*\)\-\(.*\)|http://download.oracle.com/otn-pub/java/jdk/\2u\4-\5/server-jre-\2u\4-linux-x64.tar.gz|')
_JAVA_CACHE_FILE=$(echo "${_JAVA_VERSION}" | sed -e "s|\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)\_\([0-9]*\)\-\(.*\)|${_TMP_DIR}/server-jre-\2u\4-linux-x64.tar.gz|")
_CURL_PROXY_REQUIRED=0
_CURL_ARGS='--insecure --location'

if ! curl --output /dev/null --silent --head --fail --connect-timeout 5 "http://www.google.com"; then
  if [[ "${CURL_HTTP_PROXY:?_NOT_SET_}" = "_NOT_SET_" ]]; then
    echo 'It looks like you are running behind a firewall with no access to the Internet. Please set "CURL_HTTP_PROXY" environment variable'
    exit 999
  fi
fi

if [ ! -e "$_JAVA_CACHE_FILE" ]; then
  echo "Downloading '${_JAVA_DOWNLOAD_URL}'"
  mkdir -p "${_TMP_DIR}"
  curl ${_CURL_ARGS} -H "Cookie: oraclelicense=accept-securebackup-cookie" -o "$_JAVA_CACHE_FILE" "$_JAVA_DOWNLOAD_URL" 1>/dev/null 2>&1
fi
if [ ! -e "$_JAVA_HOME" ]; then
  echo "Installing '${_JAVA_VERSION}' at '${_JAVA_HOME}'"
  mkdir -p "${_JAVA_HOME}"
  tar -C "$_JAVA_HOME" -xzvf "$_JAVA_CACHE_FILE" --strip-components=1
fi
