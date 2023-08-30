# skill2のアイテムを正しく設定するfunction
clear @s warped_fungus_on_a_stick{joan:{type:skill,skill:2}}
kill @e[predicate=joan:item/skill2]

execute if data entity @s Inventory[{Slot:7b}] run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["joan_drop"]}
data modify entity @e[type=item,distance=..1,tag=joan_drop,limit=1] Item set from entity @s Inventory[{Slot:7b}]

item replace entity @s hotbar.7 with warped_fungus_on_a_stick{joan:{type:skill,skill:2}}
item modify entity @s hotbar.7 joan:skill2
item modify entity @s hotbar.7 joan:ct2
