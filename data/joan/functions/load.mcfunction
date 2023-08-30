

# プレイヤーのジョブを番号で覚えておく用のスコア
# 1:as 2:fa 3:na 4:wo
scoreboard objectives add joan.job dummy
scoreboard players reset @a joan.job

# スキル使用アイテム warped_fungus_on_a_stick の設定
scoreboard objectives add joan.use minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard players reset @a joan.use


# 1,000,000
# 1/1M = 0.000001

# クールタイムチェック用変数
scoreboard objectives add joan.ct1 dummy
scoreboard objectives add joan.ct2 dummy
scoreboard objectives add joan.ct3 dummy

# クールタイムチェック用デルタ変数
scoreboard objectives add joan.ctd1 dummy
scoreboard objectives add joan.ctd2 dummy
scoreboard objectives add joan.ctd3 dummy


# とりあえず仮代入（あとでけす）
scoreboard players set @s joan.ctd1 12500
scoreboard players set @s joan.ctd2 10000
scoreboard players set @s joan.ctd3 2777


# UIアイテムを消去
execute as @a run function joan:ui/clear

# 死亡カウント
scoreboard objectives add joan.death deathCount

# ログアウトカウント
scoreboard objectives add joan.logout minecraft.custom:minecraft.leave_game




##################
# ゲーム全体処理用
##################

# 変数用スコア
scoreboard objectives add joan.v dummy

# ゲームの進行状態 (0:ゲームしてない 1:参加者募集中 5:プレイ中 など)
scoreboard players set #progress joan.v 0

# 残り時間タイマー
scoreboard players set #timer joan.v 72000

# 残り時間ボスバー
bossbar add joan:timer "残り時間"
bossbar set joan:timer max 72000
bossbar set joan:timer style notched_20
bossbar set joan:timer visible false


# 対象のワールドを自動リスポーンにする
execute in overworld run gamerule doImmediateRespawn true

# アイテムをばらまかないようにする(いらないかも？)
execute in overworld run gamerule keepInventory true

