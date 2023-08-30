###############################
# プレイヤー全員に それぞれのtickをやらせる
###############################
execute as @a if predicate joan:player at @s run function joan:tick/player/


###############################
# ゲームシステムの tick処理
###############################


# タイマー減少と表示
scoreboard players remove #timer joan.v 1
execute store result bossbar joan:timer value run scoreboard players get #timer joan.v

#タイマーがなくなってたらゲーム終了
execute if score #timer joan.v matches ..0 run function joan:gameend

