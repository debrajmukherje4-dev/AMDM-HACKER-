#!/bin/sh
set -e
GRADLE_VERSION="8.7"
GRADLE_DIR="${HOME}/.gradle/wrapper/dists/gradle-${GRADLE_VERSION}-bin"
GRADLE_HOME="${GRADLE_DIR}/gradle-${GRADLE_VERSION}"
GRADLE_ZIP="${GRADLE_DIR}/gradle-${GRADLE_VERSION}-bin.zip"
if command -v gradle >/dev/null 2>&1; then
  exec gradle "$@"
fi
if [ ! -x "${GRADLE_HOME}/bin/gradle" ]; then
  mkdir -p "${GRADLE_DIR}"
  if [ ! -f "${GRADLE_ZIP}" ]; then
    echo "Downloading Gradle ${GRADLE_VERSION}..."
    if command -v curl >/dev/null 2>&1; then
      curl -fsSL -o "${GRADLE_ZIP}" "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
    else
      wget -q -O "${GRADLE_ZIP}" "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
    fi
  fi
  unzip -q -o "${GRADLE_ZIP}" -d "${GRADLE_DIR}"
fi
exec "${GRADLE_HOME}/bin/gradle" "$@"
