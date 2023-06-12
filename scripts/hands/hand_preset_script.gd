extends Control

@onready var hand_sprite = $handSprite
@onready var thumb_sprite = $handSprite/thumbSprite
@onready var number_display = $number
@onready var dealer_hand_texture = load(IndexMap.hand_index_map[1])
@onready var dealer_thumb_texture = load(IndexMap.thumb_index_map[1])
@onready var hand_texture = load(IndexMap.hand_index_map[0])
@onready var thumb_texture = load(IndexMap.thumb_index_map[0])

@export var is_dealer: bool = false;

func _ready():
	if is_dealer:
		hand_sprite.texture = dealer_hand_texture
		thumb_sprite.texture = dealer_thumb_texture
		self.scale = Vector2(-1, -1);
		number_display.scale = Vector2(-1, -1);
		number_display.position = Vector2(number_display.position.x+number_display.size.x, number_display.position.y+number_display.size.y);
	else:
		hand_sprite.texture = hand_texture
		thumb_sprite.texture = thumb_texture
