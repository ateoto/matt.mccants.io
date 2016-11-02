#!/bin/bash

pushd site
  hugo
  $(aws-env --profile mccantsio)
  aws s3 sync public/ s3://matt.mccants.io/ --acl public-read --delete
popd
