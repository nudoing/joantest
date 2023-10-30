# ゲーム終了ファンクション

tellraw @a "＼(^o^)／オワタ"

# 生き残りに報酬を与える
execute as @a[predicate=joan:player] run function joan:player/reward

# UIをクリアする
execute as @a[predicate=joan:player] run function joan:ui/clear

# 全員ジョブから外す
scoreboard players reset @a joan.job 


# ゲームの状態フラグを ゲームしてない状態にする
scoreboard players set #progress joan.v 0

