extends Control

@onready var chip_label = $Label;
@onready var chip_sprite = $Sprite2D;

@export var is_all_in: bool = false;
@export var is_empty: bool = false;
@export var empty_label_color: Color;
@export var label: String = "";

func _ready():
	chip_sprite.frame = 0;
	if is_all_in:
		chip_label.text = "ALL IN";
	elif is_empty:
		chip_label.text = "EMPTY";
		chip_label.add_theme_color_override("font_color", empty_label_color);
		chip_sprite.frame = 1;
	else: chip_label.text = label;
