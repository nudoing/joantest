# スキルアイテムが使用された時の処理

# joan.use に選択中スロット番号を代入
execute store result score @s joan.use run data get entity @s SelectedItemSlot

# 選択スキルがクールタイム中ではなかった場合、スキルの使用ファンクションに進む
execute if score @s joan.use matches 6 if score @s joan.ct1 matches 1000000.. run function joan:job/skill1
execute if score @s joan.use matches 7 if score @s joan.ct2 matches 1000000.. run function joan:job/skill2
execute if score @s joan.use matches 8 if score @s joan.ct3 matches 1000000.. run function joan:job/skill3


# 使用フラグ削除
scoreboard players reset @s joan.use
