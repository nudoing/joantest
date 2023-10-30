
execute as @e[type=!player,tag=!stopping] run function joan:motionsave
execute as @e[type=!player,tag=!stopping] run data merge entity @s {NoAI:true,NoGravity:true}
execute as @e[type=!player,tag=!stopping] run data merge entity @s {Motion:[0.0,0.0,0.0]}

tag @e[type=!player,tag=!stopping] add stopping
