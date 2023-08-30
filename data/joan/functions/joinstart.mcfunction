# 参加者募集の開始になるトリガーのファンクション

tellraw @a "参加者募集開始"


# 募集残り時間(22秒) 441
scoreboard players set #timer joan.v 200
bossbar set joan:timer max 200
bossbar set joan:timer visible true



# ゲームの進行状態フラグを募集中に変更
scoreboard players set #progress joan.v 1

