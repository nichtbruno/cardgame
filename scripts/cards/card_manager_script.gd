extends Marker2D

@onready var card_preset = preload("res://presets/card_preset.tscn")
@onready var deck = load(IndexMap.deck)
@onready var points_label  = $"../../number/Label"
@onready var points_bg = $"../../number"

@export var hand_curve = Curve.new()
@export var hand_height_curve = Curve.new()
@export var hand_rotation_curve = Curve.new()

@export var handHeight:float = 0
@export var handSize:float = 0
@export var rotation_multiplier:float = 0

var num_of_cards:int = randi_range(0, 4)
var points = 0

func _ready():
	if num_of_cards > 0:
		create_cards()
		setup_cards()
		points_label.text = str(points)
	else:
		points_bg.visible = false

func create_cards():
	for i in num_of_cards:
		var card = card_preset.instantiate()
		self.add_child(card)
		self.move_child(card, 0)
		var coords = self.get_child(0).make_card(deck)
		points += coords.x+1 if coords.y != 4 else 0
		print(IndexMap.card_numeration_map[coords.y][coords.x])

func setup_cards():
	for card in self.get_children():
		var hand_ratio:float = 0.5

		if num_of_cards > 1:
			hand_ratio = float(card.get_index())/float(self.get_child_count()-1)
		
		card.position.x += hand_curve.sample(hand_ratio)*handSize
		card.position.y -= hand_height_curve.sample(hand_ratio)*handHeight
		card.rotation = hand_rotation_curve.sample(hand_ratio)*rotation_multiplier#-144.5