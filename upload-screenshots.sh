#!/bin/bash

aws s3 sync "/tmp/screenshots" s3://i.octopus.com/guides --acl public-read