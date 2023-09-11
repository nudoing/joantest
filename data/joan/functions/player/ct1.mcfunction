# CTカウントを進める
# joan.ctX はカウント変数。 1000000 でクールタイム終了
# joan.stdX は１ティックあたりのCT回復量（job初期化時に設定します）
scoreboard players operation @s joan.ct1 += @s joan.ctd1

# クールタイムのゲージをアイテムに表示
item modify entity @s hotbar.6 joan:ct1
# クールタイム中は攻撃スピードゼロ
item modify entity @s hotbar.6 joan:stopat

# クールタイム終了時になんかするなら。
# execute if score @s joan.ct1 matches 1000000.. run function joan:skill/ready1
