# プレイヤーがやられたときに実行するファンクション

# 以下死んだ時の処理
tellraw @s "しにました"

# ゲームを抜ける前に報酬を取得しておく
function joan:player/reward

# ゲームから抜ける
function joan:ui/clear
scoreboard players set @s joan.job 0

