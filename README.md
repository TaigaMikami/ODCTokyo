# ODCTokyo

## 使い方
1.リポジトリをクローン
```
git clone <this repository>
cd ODCTokyo
bundle install
```

2. migration
```
bundle exec rake db:migrate
bundle exec rake db:seed
```
もしseedファイルの重複が発生しそうな場合には
```
bundle exec rake db:migrate:reset
bundle exec rake db:seed
```

3.railsサーバー起動
```
rails s
```


## 環境構築

以下のversionで環境構築を行う

| tech_name  | version  |
|:-----------:|:------------:|
| Ruby        | 2.4.0         |
| RoR         | 5.1.4       |

### APIキーについて

direnvで環境変数をセットするようにする

https://qiita.com/kompiro/items/5fc46089247a56243a62

#### direnvインストール
```
brew install direnv
```
#### shellにhookを追加する
```~/.zshrc
export EDITOR=vim
eval "$(direnv hook zsh)"
```

#### direnv設定
環境変数を設定したいディレクトリに移動

```
direnv edit .
```
するとカレントディレクトリに.envrcが作成される。

```
export ACL_CONSUMERKEY=アクセストークン
```

#### 確認
一応,列車情報のデータをエンドポイントに指定

```
curl -X GET https://api-tokyochallenge.odpt.org/api/v4/odpt:Train\?acl:consumerKey\=${ACL_CONSUMERKEY}
```


## API仕様ページ
https://developer-tokyochallenge.odpt.org/documents
