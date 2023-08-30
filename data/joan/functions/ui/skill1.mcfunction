# skill1のアイテムを正しく設定するfunction

# 他のスロットに入ったかもしれないから、UIアイテムを消す
clear @s warped_fungus_on_a_stick{joan:{type:skill,skill:1}}

# 投げたかもしれないから、UIアイテムをkillする
kill @e[predicate=joan:item/skill1]

# 何かをスロットに入れたかもしれないから、スロットに入っているアイテムをドロップさせる
execute if data entity @s Inventory[{Slot:6b}] run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["joan_drop"]}
data modify entity @e[type=item,distance=..1,tag=joan_drop,limit=1] Item set from entity @s Inventory[{Slot:6b}]


# スキルUI用アイテムをスロットに上書き
item replace entity @s hotbar.6 with warped_fungus_on_a_stick{joan:{type:skill,skill:1}}

# UI用アイテムに 名前やModelDataなどを適用
item modify entity @s hotbar.6 joan:skill1

# UI用アイテムに CT表示を適用
item modify entity @s hotbar.6 joan:ct1
