extends Control

@onready var hand_sprite = $handSprite
@onready var card_manager = $handSprite/card_manager
@onready var thumb_sprite = $handSprite/thumbSprite
@onready var number_display = $number
@onready var dealer_hand_texture = load(IndexMap.hand_index_map[1])
@onready var dealer_thumb_texture = load(IndexMap.thumb_index_map[1])

@onready var original_pos = hand_sprite.position.y
var is_hidden = false

func _ready():
	self.scale = Vector2(-1, -1);
	number_display.scale = Vector2(-1, -1);
	number_display.position = Vector2(number_display.position.x+number_display.size.x, number_display.position.y+number_display.size.y);

func hide_hand():
	var tween = create_tween()
	tween.tween_property(hand_sprite, "position", Vector2(0, original_pos-30), 0.2).set_ease(Tween.EASE_OUT)
	tween.tween_property(hand_sprite, "position", Vector2(0, original_pos+384), 0.2).set_ease(Tween.EASE_OUT_IN)

func show_hand():
	var tween = create_tween()
	tween.tween_property(hand_sprite, "position", Vector2(0, original_pos-30), 0.2).set_ease(Tween.EASE_IN)
	tween.tween_property(hand_sprite, "position", Vector2(0, original_pos), 0.2).set_ease(Tween.EASE_OUT)
