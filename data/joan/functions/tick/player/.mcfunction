# 参加者が毎tick呼び出すやつ


# スキル用アイテムが使用されたら、スキルアイテム使用ファンクションへ進む
execute if score @s joan.use matches 1.. run function joan:skill/use


# スキルがクールタイム中なら クールタイム中の処理を行う
execute if score @s joan.ct1 matches 0..999999 run function joan:tick/player/ct1
execute if score @s joan.ct2 matches 0..999999 run function joan:tick/player/ct2
execute if score @s joan.ct3 matches 0..999999 run function joan:tick/player/ct3


# 死んでたら死亡処理をする
execute if score @s joan.death matches 1.. run function joan:player/death

# ログアウトして戻ってきた人だったらログアウト処理を行う
execute if score @s joan.logout matches 1.. run function joan:player/logout
