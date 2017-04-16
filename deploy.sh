if [ "$TRAVIS_PULL_REQUEST" = "false" ]; then
  echo "Merge happend and starting deployment"
  docker build -t="scriptnull/mm-filter:$BRANCH.$BUILD_NUMBER" .
  docker push scriptnull/mm-filter:$BRANCH.$BUILD_NUMBER
  ssh ubuntu@34.209.45.202 echo "hello world"
  ssh ubuntu@34.209.45.202 docker rm -f mm-filter-app || true
  ssh ubuntu@34.209.45.202 docker run --name mm-filter-app -d -p 80:3000 scriptnull/mm-filter:$BRANCH.$BUILD_NUMBER
fi
