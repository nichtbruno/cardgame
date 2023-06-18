extends Control

@onready var wallet_sprite = $walletSprite
@onready var card_sprite = $walletSprite/cardSprite
@onready var money = $money
@onready var moneyLabel = $money/Label
@onready var wallet_texture = load(IndexMap.wallet_index_map[randi_range(0, IndexMap.wallet_index_map.size()-1)])
@onready var card_texture = load(IndexMap.credit_card_index_map[randi_range(0, IndexMap.credit_card_index_map.size()-1)])

@onready var original_pos = wallet_sprite.position.x
@onready var original_money = money.position.x

func _ready():
	money.get_child(0).text = " "+get_improved_money_string(str(PlayerData.playerMoney))+"€ "
	money.size.x = moneyLabel.get_theme_font("font").get_string_size(moneyLabel.text, HORIZONTAL_ALIGNMENT_LEFT, -1, moneyLabel.get_theme_font_size("font_size")).x
	# money.size.x = money.get_child(0).theme.get_font("Silkscreen (Regular)", "font").get_string_size(" "+str(PlayerData.playerMoney)+"€ ").x*1.85
	money.position.x -= money.size.x - 50

	wallet_sprite.texture = wallet_texture
	card_sprite.texture = card_texture

func hide_wallet():
	var tween = create_tween()
	tween.tween_property(wallet_sprite, "position", Vector2(original_pos-30, wallet_sprite.position.y), 0.1).set_ease(Tween.EASE_OUT)
	tween.tween_property(money, "position", Vector2(original_money-40, money.position.y), 0.1).set_ease(Tween.EASE_OUT)
	tween.tween_property(wallet_sprite, "position", Vector2(original_pos+384, wallet_sprite.position.y), 0.2).set_ease(Tween.EASE_OUT_IN)
	tween.tween_property(money, "position", Vector2(original_money+384, money.position.y), 0.2).set_ease(Tween.EASE_OUT_IN)

func show_wallet():
	var tween = create_tween()
	tween.tween_property(wallet_sprite, "position", Vector2(original_pos-30, wallet_sprite.position.y), 0.1).set_ease(Tween.EASE_IN)
	tween.tween_property(money, "position", Vector2(original_money-40, money.position.y), 0.1).set_ease(Tween.EASE_IN)
	tween.tween_property(wallet_sprite, "position", Vector2(original_pos, wallet_sprite.position.y), 0.2).set_ease(Tween.EASE_OUT)
	tween.tween_property(money, "position", Vector2(original_money, money.position.y), 0.2).set_ease(Tween.EASE_OUT)

func get_improved_money_string(moneys:String):
	var strLen = len(moneys)-1
	var newString = ""
	var x = 0
	for i in range(strLen, -1, -1):
		newString += moneys[i]
		x += 1
		if x % 3 == 0: newString += "."
	return reverse_string(newString)

func reverse_string(s:String) -> String:
	var r := "" 
	for i in range(s.length()-1, -1, -1):
		r += s[i]
	return r
