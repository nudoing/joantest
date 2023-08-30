
# ゲームの進行状態をチェックして、参加者募集中ならば募集中のtick処理を呼び出します。
execute if score #progress joan.v matches 1 run function joan:tick/joining

# ゲームプレイ中ならば、ゲーム中のtick処理を呼び出します。
execute if score #progress joan.v matches 5 run function joan:tick/gaming

