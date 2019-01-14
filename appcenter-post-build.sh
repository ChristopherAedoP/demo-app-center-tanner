#!/usr/bin/env bash

# Publish the changes using CodePush 

# ENVIRONMENT=Development
# APP_NAME=OrganizationName/MyApp-iOS
# APP_PATH=myAppDebug.ipa
# APP_CENTER_TOKEN=""



# Get the message of the last commit using Git
COMMIT_MESSAGE=$(git log -1 HEAD --pretty=format:%s)


echo "**************** PUBLISH CHANGES WITH CODEPUSH ******************"
echo "APP NAME                => $APP_NAME"
echo "CURRENT ENVIRONMENT     => $ENVIRONMENT"
echo "SELECTED RN PACKAGE     => $APPCENTER_REACTNATIVE_PACKAGE"
#echo "OUTPUT DIRECTORY        => $APPCENTER_OUTPUT_DIRECTORY"

if [[ -z "$APPCENTER_XCODE_PROJECT" ]]; then

    echo "SELECTED ANDROID MODULE  => $APPCENTER_ANDROID_MODULE"
    echo "SELECTED ANDROID VARIANT => $APPCENTER_ANDROID_VARIANT"

else
    echo "SELECTED XCODE PROJECT   => $APPCENTER_XCODE_PROJECT"
    echo "SELECTED XCODE SCHEME    => $APPCENTER_XCODE_SCHEME"


    appcenter codepush release-react -a "$APP_NAME" -m --description "$COMMIT_MESSAGE" -d "$ENVIRONMENT" --token "$APP_CENTER_TOKEN" -t "$APP_CENTER_TARGET"  -m --disable-duplicate-release-error
fi

