# README(プッシュとその内容を書き込んで行く)

## 初期状態(プッシュし忘れ)
  
```
$ rails new second_task -d mysql --skip-active-storage --skip-action-mailer --skip-action-mailbox
```
↑データベースをmysqlに、使わない(予定)機能をインストールしないオプション  

ここからconfig/database.yml の中のrootのpasswordのみ変更  

  
  

## userとgroupの多対多の実装まで
  
```
$ rails db:create
```

https://qiita.com/kazukimatsumoto/items/14bdff681ec5ddac26d1  
上記を参考にGemfileに gem 'devise'を追記  

```
$ bundle install
$ rails g devise:install
$ rails g devise User
$ rails g migration add_username_to_users username:string
```

https://qiita.com/hz1_d/items/77e440b09a1ddbe56263  
上記を参考にファイルに書き込み  

```
$ rails g controller users index show
$ rails g model Group tilte:string color:string
$ rails g controller groups index show new 
$ rails g model User_group user_id:integer group_id:integer
$ rails g controller user_groups
```

ここからroutes.rbや、modelの中身を依存関係に応じて書き換えていく  

  
  

## cssを任意のviewにのみ充てられるように実装
  
cssを充てる前の1番最初のベースとしてpushした
  
  

## groups/index.html.erbのレイアウト面実装
  
cssをあてて体裁をある程度整えた  
ここからlist,taskの実装に移る  
  
  

## listモデルの実装かつ微調整
  
```
$ rails g model List title:string color:string group_id:integer
$ rails g controller lists index show create
```
  
その他、modelやrouteの設定を行ってから実装した
  
  

## modalウィンドウの実装

https://qiita.com/masahisa/items/eaacb0c3b82f4a11fc13  
上記を参考にjqueryを導入  
  

https://webdesignday.jp/inspiration/pickup/4680/  
上記を参考にモーダルウィンドウを実装  
  
  
## とりあえずの完成
  
```
$ rails g model Task ~
$ rails g controller tasks ~
```
タスクの実装
チェックマーク等の実装
ここからは全員で細かいミスを直していく


