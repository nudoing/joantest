# skill3のアイテムを正しく設定するfunction
clear @s warped_fungus_on_a_stick{joan:{type:skill,skill:3}}
kill @e[predicate=joan:item/skill3]

execute if data entity @s Inventory[{Slot:8b}] run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["joan_drop"]}
data modify entity @e[type=item,distance=..1,tag=joan_drop,limit=1] Item set from entity @s Inventory[{Slot:8b}]

item replace entity @s hotbar.8 with warped_fungus_on_a_stick{joan:{type:skill,skill:3}}
item modify entity @s hotbar.8 joan:skill3
item modify entity @s hotbar.8 joan:ct3
