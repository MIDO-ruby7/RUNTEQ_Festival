#!/bin/sh
set -e

# 自分のアプリに合わせて必要なコマンドを修正してください
bin/rails db:create
bundle exec ridgepole --config config/database.yml --env development --file db/Schemafile --apply
#bin/rails db:seed　←必要なければコメントアウト

rm -f tmp/pids/server.pid && bin/rails s