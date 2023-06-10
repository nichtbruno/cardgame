extends Control

@onready var hand_sprite = $handSprite
@onready var thumb_sprite = $handSprite/thumbSprite
@onready var number_display = $number

@export var is_dealer: bool = false;

func _ready():
	if is_dealer:
		hand_sprite.texture = IndexMap.hand_index_map[1];
		thumb_sprite.texture = IndexMap.thumb_index_map[1];
		self.scale = Vector2(-1, -1);
		number_display.scale = Vector2(-1, -1);
		number_display.position = Vector2(number_display.position.x+number_display.size.x, number_display.position.y+number_display.size.y);
	else:
		hand_sprite.texture = IndexMap.hand_index_map[0];
		thumb_sprite.texture = IndexMap.thumb_index_map[0];
