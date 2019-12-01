#!/bin/bash

aws s3 sync "/tmp/screenshots/google" s3://i.octopus.com/guides --acl public-read