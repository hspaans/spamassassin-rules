#!/bin/bash
set -e

command_string="spamassassin --lint"

# Copy rules to the right location

if [ -d "${GITHUB_WORKSPACE}" ]; then
  find "${GITHUB_WORKSPACE}" -name "*.cf" -exec cp {} /etc/spamassassin/ \;
else
  echo "No ${GITHUB_WORKSPACE} directory found"
fi

echo "Command: $command_string"
eval "$command_string"