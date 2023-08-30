# 既にジョブに参加済みの場合何もしないで終わる
execute if score @s joan.job matches 4 run return 0

# 参加アナウンス
tellraw @s "JOB WO"

# job番号を設定
scoreboard players set @s joan.job 4

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

# 使用不可
scoreboard players set @s joan.ctd3 0
scoreboard players set @s joan.ct3 0


# UIを設定
function joan:ui/clear
function joan:ui/
