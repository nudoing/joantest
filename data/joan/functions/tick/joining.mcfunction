# 参加者募集中用の tick

execute in overworld as @a at @s if block ~ ~-0.1 ~ iron_block run function joan:job/1as/join
execute in overworld as @a at @s if block ~ ~-0.1 ~ oak_planks run function joan:job/2fa/join
execute in overworld as @a at @s if block ~ ~-0.1 ~ smooth_stone run function joan:job/3na/join
execute in overworld as @a at @s if block ~ ~-0.1 ~ emerald_block run function joan:job/4wo/join

execute in overworld as @a at @s if block ~ ~-0.1 ~ netherite_block run scoreboard players set @s joan.job 0





# 募集残り時間の表示対象者を更新
execute in overworld positioned 4 -60 1 run bossbar set joan:timer players @a[distance=..10]

# タイマーの減少と表示
scoreboard players remove #timer joan.v 1
execute store result bossbar joan:timer value run scoreboard players get #timer joan.v

#タイマーがなくなってたらゲーム開始
execute if score #timer joan.v matches ..0 run function joan:gamestart

