extends Control

@onready var card_sprite = $cardSprite

var is_back: bool = true if randi_range(0, 10) == 5 else false

var coords: Vector2 = Vector2(randi_range(0, 12), randi_range(0, 3));

func make_card(txture):
	card_sprite.texture = txture;
	if is_back: coords = Vector2(0, 4)
	card_sprite.frame_coords = coords
	return coords