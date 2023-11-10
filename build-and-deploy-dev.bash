#!/bin/bash

npm run build
serverless deploy
aws s3 sync .output/public s3://nuxt-example-01 --delete --acl private
aws cloudfront create-invalidation --distribution-id EK0Y81YAK0TW8 --paths "/*"