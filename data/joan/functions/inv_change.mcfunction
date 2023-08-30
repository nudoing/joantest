# インベントリに変更があった場合、
# スキルUI が正しく設定されているかチェックして
# 正しくなかった場合 UI を設定するファンクションに進む
execute unless predicate joan:ui/all_ok run function joan:ui/
advancement revoke @s only joan:inv_change
