
# アナウンスとか
tellraw @a[predicate=joan:player] "ゲーム開始ですぶっころせ"


# 残り時間の設定
scoreboard players set #timer joan.v 720

# ボスバーの設定
bossbar set joan:timer visible true
bossbar set joan:timer max 720
bossbar set joan:timer players @a[predicate=joan:player]

# 死亡カウントをリセット
scoreboard players reset @a[predicate=joan:player] joan.death

# ログアウトカウントをリセット
scoreboard players reset @a joan.logout

# ゲーム中フラグを立てます
scoreboard players set #progress joan.v 5

