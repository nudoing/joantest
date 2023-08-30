# 既にジョブに参加済みの場合何もしないで終わる
execute if score @s joan.job matches 2 run return 0

# 参加アナウンス
tellraw @s "JOB FA"

# job番号を設定
scoreboard players set @s joan.job 2

# CT設定など
# 1,000,000
# 1/1M = 0.000001

# 例)
# 4秒 = 4*20T = 80 T
# 1,000,000 でリチャージ -> 1Tあたりのデルタは 1,000,000 / 80 = 
scoreboard players set @s joan.ctd1 12500
scoreboard players set @s joan.ct1 1000000

# 5s = 100T
# 1000000/100 = 1000
scoreboard players set @s joan.ctd2 10000
scoreboard players set @s joan.ct2 1000000

# 18s
# 1000000 / (18*20) = 2777
scoreboard players set @s joan.ctd3 2777
scoreboard players set @s joan.ct3 1000000


# UIを設定
function joan:ui/clear
function joan:ui/
