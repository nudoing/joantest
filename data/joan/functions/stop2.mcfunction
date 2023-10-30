
execute as @e[type=!player] run data merge entity @s {NoAI:false,NoGravity:false}
execute as @e[type=!player] run function joan:motionload

tag @e[type=!player] remove stopping

