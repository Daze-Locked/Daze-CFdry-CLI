#!/bin/sh -l

cf api "$INPUT_CF_API"
cf auth "$INPUT_CF_USERNAME" "$INPUT_CF_PASSWORD"

if [ -n "$INPUT_CF_ORG" ] && [ -n "$INPUT_CF_SPACE" ]; then
  cf target -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"
fi

if [ -n "$INPUT_DOCKER_PASSWRD" ]; then
  sh -c "CF_DOCKER_PASSWORD="$INPUT_DOCKER_PASSWRD" cf7 $*"
else
  sh -c "cf7 $*"
fi
