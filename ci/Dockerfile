## ベースイメージ
FROM debian:9.1

## タイムゾーン設定
RUN /bin/cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

## 共通パッケージのインストール
RUN apt-get update && apt-get -y install git
## AWS CLI のインストール
RUN apt-get update && apt-get -y install wget python
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
RUN python get-pip.py
RUN pip install --upgrade awscli

### 各種ソフトウェアのインストール
#### Redis のインストール
RUN apt-get update && apt-get -y install redis-server

#### MySQL のインストール
RUN apt-get update && apt-get -y install mysql-server

#### DynamoDB local のインストール
RUN wget https://s3-ap-northeast-1.amazonaws.com/dynamodb-local-tokyo/dynamodb_local_latest.tar.gz \
 && tar zxfv dynamodb_local_latest.tar.gz

#### td-agent のインストール
RUN apt-get update && apt-get -y install sudo curl \
 && curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent2.sh | sh

### 言語系のバージョンマネージャ asdf のインストール
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf \
 && (cd ~/.asdf && git checkout "$(git describe --abbrev=0 --tags)") \ 
 && bash -c "echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc" \
 && bash -c "echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc" \
 && chmod +x $HOME/.asdf/asdf.sh \
 && chmod +x $HOME/.asdf/completions/asdf.bash \
 && bash -c ". ~/.bashrc" \
 && apt-get update && apt-get -y install automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev

### Erlang のインストール
RUN apt-get update && apt-get -y install make
RUN ~/.asdf/bin/asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git \
 && ~/.asdf/bin/asdf install erlang 20.2 \
 && ~/.asdf/bin/asdf global erlang 20.2

### Elixir のインストール
RUN apt-get update && apt-get -y install unzip \
 && ~/.asdf/bin/asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git \
 && ~/.asdf/bin/asdf install elixir 1.6.6 \
 && ~/.asdf/bin/asdf global elixir 1.6.6

### Ruby のインストール
RUN apt-get update && apt-get -y install ruby \
 && gem update --system

### NodeJS/npm のインストール
RUN apt-get update && apt-get -y install gnupg && libdigest-sha-perl
RUN ~/.asdf/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git \
 && ~/.asdf/bin/asdf install nodejs 6.10.3 \
 && ~/.asdf/bin/asdf global nodejs 6.10.3 \
 && ~/.asdf/bin/asdf reshim nodejs 6.10.3

### NodeJS/npm のバージョンアップ
RUN ~/.asdf/bin/asdf install nodejs 10.24.1 \
 && ~/.asdf/bin/asdf global nodejs 10.24.1 \
 && ~/.asdf/bin/asdf reshim nodejs 10.24.1

## Erlang ビルドのために rebar をインストールする
RUN apt-get update && apt-get install -y rebar

### SSH接続で22番ポートを使用することを明示
EXPOSE 22

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

