#!/bin/bash

# Convert the AVI files into MP4
VIDEO_FILES="/tmp/videos/*.avi"
for f in $VIDEO_FILES
do
  echo "Processing $f"
  vlc -I dummy \
    "$f" \
    "--sout=#transcode{vcodec=h264,vb=1024,acodec=mp4a,ab=192,channels=2,deinterlace}:standard{access=file,mux=mp4,dst=\"${f%.*}.mp4\"}" \
    vlc://quit
done

# Merge all the videos into one single file
VIDEO_FILE_LIST=(/tmp/videos/*.mp4)
echo "${VIDEO_FILE_LIST[@]}"
vlc -I dummy \
   "${VIDEO_FILE_LIST[@]}" \
   --no-sout-all \
   --sout-keep \
   --sout \
   "#gather:std{access=file,mux=mp4,dst=\"$MEDIA_PATH/video.mp4\"}" \
   vlc://quit

# Speed the video up slightly
ffmpeg -i /tmp/videos/video.mp4 "-filter:v" "setpts=0.75*PTS" "/tmp/videos/processed.mp4"