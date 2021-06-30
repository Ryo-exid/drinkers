# DRINKER × DRINKER

## サイト概要
お酒についての写真とコメントの投稿が出来るお酒専門のコミュニティサイトです。
お酒の写真と、伝えたい気持ちや感想などを文字に置き換え投稿することで、同じお酒好きや共感する人々と繋がることができます。
また、お酒の良さはまだ分からないがお酒に興味があるという人や、美味しいお酒を求めているという人も、たくさんの投稿をもとに参考にすることができます。

## サイトテーマ
お酒の輪を広げるSNSサイト

### テーマを選んだ理由
自身が飲んだ（知っている）お酒を紹介したい人と、どんなお酒が美味しいのかを知りたい人を繋ぐサービスです。
お酒の感想などの発信によって、フォロー機能やいいね機能、コメント機能などでお酒好き同士が広く繋がることが出来るので『お酒の輪』というテーマにしています。

## ターゲットユーザ
- お酒が好きな人
- 美味しいお酒を知りたい人

## 主な利用シーン
- お酒を呑んだ時に感想を他ユーザに伝える
- お酒を買いたい時に参考にできる
- お酒を呑みに行く前のお酒の情報チェック

## 実装機能
- ユーザ認証機能
  - 新規ユーザ登録
  - ログイン、ログアウト
  - ユーザ情報の詳細
  - ユーザ情報の編集、更新
- お問い合わせ機能
  - 作成、確認、完了
- 住所自動入力機能
- メール送信機能
  - 新規登録完了メール
  - お問い合わせ完了メール
- 退会機能
- CRUD処理
  - 投稿の作成・詳細・編集・更新・削除
- 画像アップロード機能
- 投稿一覧機能
  - 投稿の一覧
- ページング機能
- レビュー評価機能
- ランキング機能
- いいね機能
  - いいね、いいね解除
- コメント機能
  - 作成・削除
- ダイレクトメッセージ機能
  - 作成
- 非同期通信化
  - いいね、コメント、ダイレクトメッセージ
- フォロー、フォロワー機能
- 通知機能
  - フォロー、コメント、ダイレクトメッセージ
- 検索機能
  - ユーザ検索、投稿検索
- 管理者権限
  - 投稿の削除、ユーザの退会、お問い合わせ一覧、お問い合わせ内容の削除

### 補足
- Bootstrap
- 環境変数化
- コードフォーマット
  - Rubocop(-airbnb)
- テスト
  - RSpec
- デバッグ
  - pry-rails
- デプロイ
  - EC2、RDS
- README

### 工夫・苦労した点
- 工夫点
  - フォロー、コメント、ダイレクトメッセージは相手のユーザから送られても気づけないことが多いので、その防止として通知機能を導入しました。
  - 投稿やメッセージの新規作成・編集時に改行をさせたまま表示が出来るようにしました。
  - お酒専門の投稿サイトなので、お酒以外の不適切な画像や投稿内容が上がることへの対処を考え、お問い合わせ機能の導入と
  　管理者にて不適切な投稿の強制削除、あるいは強制退会が出来るよう機能を加えました。
  - メールに不具合が生じ、万が一お問い合わせメールが届かなくなることまで想定し、管理者のみが閲覧することのできるお問い合わせ内容一覧ページを作成しました。
  - 退会を論理削除にした上、退会しているユーザかどうかをユーザ詳細画面から判別できるようにしました。
  - エラーメッセージを日本語化しました。
- 苦労点
  - 非同期通信化と改行の投稿に伴う表示のレスポンシブ対応に苦労しました。
  - 利用ユーザがリンクやボタンを押さずにMacの二本指スワイプの戻る・進むを行うと、
    レビュー機能のJavaScriptで表示されている画像がターボリンクスにより重複して表示されてしまう問題に気づき、解決することにも苦労しました。
    また、お問い合わせ機能でもMacの二本指スワイプの戻る・進むを行った場合の不具合を発見したので、そちらの解決にも力を入れました。

## 設計書
- 画面設計  https://1drv.ms/p/s!AuPjAT-_TWH8gXeImjJVV03lSatg?e=nJZlkU
- ER図  https://drive.google.com/file/d/1qMWeRi6bQxDKTb1YifnoiCVWZPqKeiv6/view?usp=sharing
- テーブル定義書  https://drive.google.com/file/d/148UaxD7d0Is7YntHpMl1AmsPkZDvj45K/view?usp=sharing
- アプリケーション詳細設計書  https://drive.google.com/file/d/1nuJebN9GH1uHknIfAmkBJGg578zq_fOA/view?usp=sharing

## チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/1dDpZU4NK0qt1MgZil7bucazN73GHUyT0HS39sT7Vmmw/edit?usp=sharing

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby(2.6.3),SQL
- フレームワーク：Ruby on Rails (5.2.5)
- JSライブラリ：jQuery
- IDE：Cloud9

## 本番環境
- AWS(EC2,Nginx,Puma)