
# joanをまとめて構造を変えたもの

## ファイルツリー
```
data
  ├─joan
  │  ├─advancements
  │  │      inv_change.json インベントリ変更時に変更時処理を呼び出す
  │  │
  │  ├─functions
  │  │  │  gameend.mcfunction ゲーム終了時処理
  │  │  │  gamestart.mcfunction ゲーム開始時処理
  │  │  │  inv_change.mcfunction インベントリ変更時処理(UIのチェック)
  │  │  │  joinstart.mcfunction 参加者募集開始処理
  │  │  │  load.mcfunction 初期設定処理(スコアの定義等)
  │  │  │
  │  │  ├─job 各ジョブ毎の処理をまとめたフォルダ ※ジョブ追加時、要変更
  │  │  │  │  skill1.mcfunction スキル1を使用する(各ジョブへ処理を渡す) *要変更
  │  │  │  │  skill2.mcfunction スキル2を使用する(各ジョブへ処理を渡す) *要変更
  │  │  │  │  skill3.mcfunction スキル3を使用する(各ジョブへ処理を渡す) *要変更
  │  │  │  │
  │  │  │  ├─1as フォルダ名はジョブID+ジョブ名(順番に並べたいからIDを含めてる)
  │  │  │  │      join.mcfunction このジョブに参加する処理(joiningから呼び出される)
  │  │  │  │      skill1.mcfunction スキル1処理
  │  │  │  │      skill2.mcfunction スキル2処理
  │  │  │  │      skill3.mcfunction スキル3処理
  │  │  │  │
  │  │  │  ├─2fa
  │  │  │  │      join.mcfunction
  │  │  │  │      skill1.mcfunction
  │  │  │  │      skill2.mcfunction
  │  │  │  │      skill3.mcfunction
  │  │  │  │
  │  │  │  ├─3na
  │  │  │  │      join.mcfunction
  │  │  │  │      skill1.mcfunction
  │  │  │  │      skill2.mcfunction
  │  │  │  │      skill3.mcfunction
  │  │  │  │
  │  │  │  └─4wo
  │  │  │          join.mcfunction
  │  │  │          skill1.mcfunction
  │  │  │          skill2.mcfunction
  │  │  │          skill3.mcfunction
  │  │  │
  │  │  ├─player プレイヤー毎の処理 (プレイヤーによって呼び出される)
  │  │  │      ct1.mcfunction スキル1のクールタイムを1tick分進める
  │  │  │      ct2.mcfunction スキル2のクールタイムを1tick分進める
  │  │  │      ct3.mcfunction スキル3のクールタイムを1tick分進める
  │  │  │      death.mcfunction 死亡時の処理
  │  │  │      logout.mcfunction ログアウト時の処理
  │  │  │      reward.mcfunction 報酬を受取る
  │  │  │      useskill.mcfunction スキル用アイテムが使用された時の処理
  │  │  │      
  │  │  ├─tick
  │  │  │      .mcfunction ティック毎の処理(状況に応じて↓のfuncを呼び出す)
  │  │  │      gaming.mcfunction ゲーム中の1tick処理(システム用)
  │  │  │      joining.mcfunction 参加者募集中の1tick処理(システム用) *要変更
  │  │  │      player.mcfunction ゲーム中の1tick処理(プレイヤー1人分の処理)
  │  │  │
  │  │  └─ui 呼び出したプレイヤーのUIを設定する処理群
  │  │          .mcfunction インベントリのUIを作る
  │  │          clear.mcfunction UI用アイテムをインベントリから消す
  │  │          skill1.mcfunction スキル1のUIを設定・修正
  │  │          skill2.mcfunction スキル2のUIを設定・修正
  │  │          skill3.mcfunction スキル3のUIを設定・修正
  │  │
  │  ├─item_modifiers アイテム加工処理 ※ジョブ追加時、要変更
  │  │      ct1.json スキル1のクールタイムのグラフ表示を行う
  │  │      ct2.json スキル2のクールタイムのグラフ表示を行う
  │  │      ct3.json スキル3のクールタイムのグラフ表示を行う
  │  │      skill1.json スキル1用アイテムの名前・説明他を設定する *要変更
  │  │      skill2.json スキル2用アイテムの名前・説明他を設定する *要変更
  │  │      skill3.json スキル3用アイテムの名前・説明他を設定する *要変更
  │  │
  │  └─predicates 高速boolean関数の定義
  │      │  player.json プレイヤーかどうかをチェックする
  │      │
  │      ├─item
  │      │      skill1.json そのEntityがスキル1のUI用アイテムかチェックする
  │      │      skill2.json そのEntityがスキル2のUI用アイテムかチェックする
  │      │      skill3.json そのEntityがスキル3のUI用アイテムかチェックする
  │      │
  │      └─ui
  │              all_ok.json インベントリUIが正しく設定されているかのチェック
  │              skill1_ok.json インベントリUI(スキル1)が正しいか
  │              skill2_ok.json インベントリUI(スキル2)が正しいか
  │              skill3_ok.json インベントリUI(スキル3)が正しいか
  │
  └─minecraft
      └─tags
          └─functions
                  load.json
                  tick.json
```

### 大まかな処理の流れ
```
load.mcfunction 各種変数/定数の定義
joinstart.mcfunction 募集開始

参加募集中の繰り返し(タイマー終了まで)
{
  joining.mcfunction 募集中tick処理(各job の join.mcfunction を呼び出す)
}

gamestart.mcfunction ゲーム開始時処理

ゲーム中の繰り返し(タイマー終了 or 残り１人まで)
{
  gaming.mcfunction ゲーム中tick処理(システム用)
  player.mcfunction 全プレイヤーに以下を実行
  {
    スキルアイテム使用時 function/player/useskill 実行
    クールタイム中ならクールタイムの更新と表示を行う tick/player/ct1
    死んでたら player/death 実行(+報酬配り)
    ログアウトしてたら player/logout 実行
  }
}

gameend.mcfunction ゲーム終了処理(+生き残りへ報酬配り)

```

## 主な要件
- プレイヤー同士が戦うPVPゲーム
  - プレイヤーは複数あるジョブから一つを選んでゲームに参加する
    - 制限時間内に特定の場所に移動することでジョブを選択
- インベントリにUIアイテムを配置
  - 使用することでスキルが発動する
  - ジョブ毎に別の表示になる
- スキルを使用すると効果が得られる
  - ジョブ毎に別の効果を得る
  - 使用後、一定時間スキル使用不可に。
  - スキルのクールタイムはジョブ毎に異なる可能性がある？
- ゲームには終了条件がある
  - 一定時間経つとゲーム終了
    - ボスバーに残り時間のタイマーが出る
  - 生存人数が1になるとゲーム終了
- ゲームの順位によって報酬が得られる
  - 死亡時の残り人数によって順位・報酬が決まる
  - 上位三名にアイテムを付与
- その他雑多要件
  - 途中退室でゲームから敗退
  - ゲーム終了時UI削除
  - 範囲収縮（未実装）

### 要件を解決するためにどうしたか
- 非ゲーム状態/募集中状態/ゲーム中状態 とゲームの状態が遷移する
  - ゲーム状態のフラグをスコア(グローバル)で保持する。

- プレイヤーはジョブを択一で選択し、ゲーム中はジョブによって処理を変える。
  - 各ジョブに整数でIDを割り振る
  - プレイヤーは選択ジョブIDをスコアで持つ。

- インベントリにUI用アイテムを表示。内容はジョブによって異なる。
  - ジョブID等の条件によってアイテム名などを変更できるように item_modifiers を使用する

- UIのスキルアイテムを使用するとスキルが発動する
  - UIスキルアイテムは、使用感知が容易な 人参棒orきのこ棒とする
    - 豚が寄ってこないようにきのこ棒であるべき

- スキルの使用にはクールタイムの制限がある
  - プレイヤーはクールタイム用のスコアを持つ必要がある
  - ジョブによってクールタイムが違う可能性があるかもしれない
  - きのこ棒を使用しているため、アイテムの耐久値が最大100
    - クールタイムの % 表示をUI上にグラフとして表示することができそう
      - でも%の計算なんてやりたくない
  - クールタイムの数値は全てのジョブで同じにしたら便利そう
    - それだとジョブによってクールタイムが違うという条件から外れてしまう
      - 1ティック当たりの変化量を１ではなくすれば解決しそう
        - プレイヤー毎にCT変化量をスコアで持たせることにする
    - CT最大値が100だと変化量が少数になって非常に不便
      - 100の倍数でおっきい数字、1000000あたりをCT最大値にする
  - クールタイムの仕様が決定
  1. スキルを使用すると、スコアCTに0が入る
  1. CTが1000000以上のプレイヤーはスキルが使用できる
  1. プレイヤーのジョブ参加時、CT変化量用スコアCTDを設定する (ジョブ毎に別の値を設定)
  1. 毎ティック、全てのプレイヤーは CT に CTD を加算する
  1. 毎ティック、スキルUIアイテムの耐久値を CT * 0.000001 に変更する

以上を踏まえて実装。
