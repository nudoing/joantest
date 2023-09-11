# クールタイムカウンタを0にリセット
scoreboard players set @s joan.ct2 0

# job 毎のスキル使用ファンクションに進む
execute if score @s joan.job matches 1 run function joan:job/1as/skill2
execute if score @s joan.job matches 2 run function joan:job/2fa/skill2
execute if score @s joan.job matches 3 run function joan:job/3na/skill2
execute if score @s joan.job matches 4 run function joan:job/4wo/skill2


