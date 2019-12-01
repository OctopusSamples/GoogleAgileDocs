#!/bin/bash

/usr/lib/jvm/java-13-openjdk-amd64/bin/java \
  "--enable-preview" \
  "-Xmx2g" \
  "-Dwebdriver.gecko.driver=/usr/bin/geckodriver" \
  "-DmoveCursorToElement=$MOVE_TO_MOUSE_CURSOR" \
  "-DdisableHighlights=$DISABLE_HIGHLIGHTS" \
  "-DdisableScreenshots=$DISABLE_SCREENSHOTS" \
  "-DmouseMoveVerticalOffset=$MOUSE_VERTICAL_OFFSET" \
  "-DdisableVideoRecording=$DISABLE_VIDEO" \
  -jar /opt/webdrivertraining.1.0-SNAPSHOT.jar \
  --plugin progress \
  --monochrome \
  google.feature