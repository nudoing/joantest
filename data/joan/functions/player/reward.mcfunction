# 自分を含めたゲームの残り人数によって報酬を取得するファンクション

# ゲーム参加中の人（自分も含める）を数える
scoreboard players set #ninzu joan.v 0
execute as @a[scores={joan.job=1..}] run scoreboard players add #ninzu joan.v 1

# アイテムを配布する
execute if score #ninzu joan.v matches 1 run give @s paper{display:{Name:'{"text":"エメラルドチケット","color":"green","bold":true,"italic":true}'},HideFlags:1,CustomModelData:50701,Enchantments:[{id:"minecraft:unbreaking",lvl:1s}]} 3
execute if score #ninzu joan.v matches 2 run give @s paper{display:{Name:'{"text":"エメラルドチケット","color":"green","bold":true,"italic":true}'},HideFlags:1,CustomModelData:50701,Enchantments:[{id:"minecraft:unbreaking",lvl:1s}]} 2
execute if score #ninzu joan.v matches 3 run give @s paper{display:{Name:'{"text":"エメラルドチケット","color":"green","bold":true,"italic":true}'},HideFlags:1,CustomModelData:50701,Enchantments:[{id:"minecraft:unbreaking",lvl:1s}]} 1

tellraw @s [{"text":"順位は"},{ "score":{ "name":"#ninzu", "objective":"joan.v" } }, {"text":"位でした"}]
