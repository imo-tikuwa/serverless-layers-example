# serverless-layers-example

## このリポジトリについて

- Serverless Framework の[serverless-layers](https://github.com/agutoli/serverless-layers)というプラグインを活用したサンプルリポジトリ
  - 2 つの関数を 1 つの serverless.yml の構成でまとめてデプロイ
  - 開発環境(WSL2+Docker)と運用環境(AWS Lambda)で同じコードが実行できるような構成を作成
  - それぞれの関数内で使用したいライブラリ(axios,moment)についてレイヤー化
  - レイヤー化された node_modules から axios,moment をインポートして簡単なコードを実行

のようなことをやっています

## 開発環境の構築手順

1. 以下のコマンドでローカルにクローン＆.env コピー

```
$ git clone https://github.com/imo-tikuwa/serverless-layers-example.git
$ cd serverless-layers-example
$ cp .env.example .env
```

2. `.env`を開き`AWS_ACCESS_KEY_ID`,`AWS_SECRET_ACCESS_KEY`に serverless でデプロイを実施することができるユーザーのアクセスキー/シークレットアクセスキーを設定
3. 以下のコマンドで Docker コンテナ起動＆npm install など実施

```
$ make init
```

## 開発環境での動作確認

```
$ make test-function1
$ make test-function2
```

### デプロイ作業手順

1. (初回のみ) serverless-layers プラグインでレイヤー化したい node_modules をアップロードする S3 バケットを手動で作成する必要があった

- バケットのアクセスは「パブリックアクセスをブロック」をオフに設定
- バケットのポリシーに以下を設定(serverless.ymlのcustom/serverless-layers/layersDeploymentBucketに設定してるバケット名とARNは合わせる)

```
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::serverless-layers-example-layers-[awsアカウントID]/*",
                "arn:aws:s3:::serverless-layers-example-layers-[awsアカウントID]"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        }
    ]
}
```

2. デプロイコマンド実行

```
$ make deploy
```
