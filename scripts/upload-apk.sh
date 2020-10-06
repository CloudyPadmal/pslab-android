#!/bin/sh
set -e

git config --global user.email $EMAIL_ADDRESS
git config --global user.name "CloudyPadmal"

git clone --quiet --branch=apk https://CloudyPadmal:$GITHUB_KEY_PADMAL@github.com/CloudyPadmal/pslab-android apk > /dev/null

cd apk

cp -r ../app/build/outputs/apk/* .

echo ":::::::::::::::::::::::::::::::::::"
echo "Pull request APK is being generated"
echo ":::::::::::::::::::::::::::::::::::"

# Push generated apk files to apk branch
git add .
git branch -u origin/apk
git commit -am "Updated with latest APK"
git push origin apk --force --quiet> /dev/null

echo ":::::::::::::::::::::::::::::::::::"
echo "     Process is now completed      "
echo ":::::::::::::::::::::::::::::::::::"
