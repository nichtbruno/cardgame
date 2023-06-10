extends Control

@onready var wallet_sprite = $walletSprite
@onready var card_sprite = $walletSprite/cardSprite

var rng = RandomNumberGenerator.new()

func _ready():
	wallet_sprite.texture = IndexMap.wallet_index_map[randi_range(0, IndexMap.wallet_index_map.size()-1)];
	card_sprite.texture = IndexMap.credit_card_index_map[randi_range(0, IndexMap.credit_card_index_map.size()-1)];
