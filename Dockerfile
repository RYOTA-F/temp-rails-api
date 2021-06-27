# 使用するイメージとバーション
FROM ruby:2.5
# バージョンを最にしてnode.jsをインストール
# -qq = エラー以外出力しない
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev node.js

# コンテナの中でディレクトリを作成
RUN mkdir /myapp
# 作業ディレクトリを指定
WORKDIR /myapp

# Gemfileをホストからコンテナの中にコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# インストール
RUN bundle install
# ホスト側のファイル群をコンテナの中にコピー
COPY . /myapp/