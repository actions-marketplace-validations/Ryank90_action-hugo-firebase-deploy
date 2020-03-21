#!bin/sh -x

# Output versions.
hugo version

# Build the Hugo site.
hugo

# Retrieve the input arguments/parameters.
FIREBASE_DEPLOY_TOKEN=$1
ALIAS=${2:-alias}

# Publish to Google Firebase.
firebase use --token $FIREBASE_DEPLOY_TOKEN $ALIAS
firebase deploy -m "Trigger: $GITHUB_EVENT_NAME, commit SHA: $GITHUB_SHA" --non-interactive --token $FIREBASE_DEPLOY_TOKEN