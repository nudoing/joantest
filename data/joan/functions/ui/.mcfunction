# これを呼び出したプレイヤー(@s)の UIを作る処理を行うファンクションです
# 前提として @s は sys job 参加済みとします
# inv_changeなどから呼び出されます

# 各スキルの UI をチェックして、正しくない場合 UIアイテムを設定するファンクションに進む
execute unless predicate joan:ui/skill1_ok run function joan:ui/skill1
execute unless predicate joan:ui/skill2_ok run function joan:ui/skill2
execute unless predicate joan:ui/skill3_ok run function joan:ui/skill3


