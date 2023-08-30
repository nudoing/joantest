# ゲーム中にログアウトして戻ってきた人用のファンクション

tellraw @s "ログアウトしました"

function joan:ui/clear
scoreboard players set @s joan.job 0
