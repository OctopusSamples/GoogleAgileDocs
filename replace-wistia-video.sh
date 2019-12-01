#!/bin/bash

if [ -n "$WISTIA_MEDIA_ID" ]; then
  /usr/lib/jvm/java-13-openjdk-amd64/bin/java \
    "--enable-preview" \
    "-Xmx2g" \
    "-Dwebdriver.gecko.driver=/usr/bin/geckodriver" \
    "-DmoveCursorToElement=false" \
    "-DdisableHighlights=true" \
    "-DdisableScreenshots=true" \
    "-DdisableVideoRecording=true" \
    "-DCucumberAlias-ExternalWistiaUsername=$WISTIA_USERNAME" \
    "-DCucumberAlias-ExternalWistiaPassword=$WISTIA_PASSWORD" \
    "-DCucumberAlias-ExternalMediaID=$WISTIA_MEDIA_ID" \
    "-DCucumberAlias-ExternalBrowserType=FirefoxNoImplicitWait" \
    -jar /opt/webdrivertraining.1.0-SNAPSHOT.jar \
    --plugin progress \
    --monochrome \
    replace-video.feature
fi