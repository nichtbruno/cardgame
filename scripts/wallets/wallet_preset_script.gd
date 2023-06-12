extends Control

@onready var wallet_sprite = $walletSprite
@onready var card_sprite = $walletSprite/cardSprite
@onready var wallet_texture = load(IndexMap.wallet_index_map[randi_range(0, IndexMap.wallet_index_map.size()-1)])
@onready var card_texture = load(IndexMap.credit_card_index_map[randi_range(0, IndexMap.credit_card_index_map.size()-1)])

func _ready():
	wallet_sprite.texture = wallet_texture
	card_sprite.texture = card_texture
