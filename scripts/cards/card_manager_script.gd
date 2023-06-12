extends Marker2D

@onready var card_preset = preload("res://presets/card_preset.tscn")
@onready var deck = load(IndexMap.deck)
@onready var points_label  = $"../../number/Label"

@export var parableHeight:float = 0;
@export var parableSize:float = 0;
@export var rotation_multiplier:float = 0;
# @export var num_of_cards:int = 3;

var num_of_cards:int = randi_range(1, 4)
var one_side = floor(num_of_cards/2)

@onready var section_length = (parableSize*2)/(num_of_cards+1)

func _ready():
	var points:int = 0;

	var repo: Vector2 = self.position
	var p = 0-parableSize;
	var rot = rotation_multiplier*one_side*-1
	for i in num_of_cards:
		var card_lol = card_preset.instantiate()
		self.add_child(card_lol)
		self.move_child(card_lol, 0)
		var card_p = p+section_length
		var card_h = -pp_function(card_p)
		self.get_child(0).position = Vector2(card_p+repo.x, card_h+repo.y)
		self.get_child(0).rotation = rot
		rot += rotation_multiplier
		# if rot == 0 && num_of_cards%2==0: rot += rotation_multiplier
		var coords = self.get_child(0).make_card(deck)
		points += coords.x+1 if coords.y != 4 else 0
		# print(card_p)
		# print(get_angle(card_p, card_h))
		# print(IndexMap.card_numeration_map[coords.y][coords.x])
		# print()
		p = card_p
	points_label.text = str(points)

func pp_function(x):
	if x >= parableSize: x -= parableSize;
	if x < 0: x *= -1
	if num_of_cards%2 == 0: x += 5;
	# f(x) = (0-pH / pS)*x + pH-(0-pH / pS)*0
	return (((0-parableHeight)/(parableSize))*x + (parableHeight)) # if doesnt work look here

# parable size, parable height x
# parable full length / num of cards+1 = section lengths x
# 0p = (parable pos - parable size) x
# 1p = 0p + section length
# 2p = 1p + section length
# 3p = 2p + section length
# 1p' = f(1p.x) 
# 2p' = f(2p.x) (if ~p.x >= pS: ~p.x - pS) (if numofcards%2==0: ~p.x+5)
# 3p' = f(3p.x) (if ~p.x >= pS: ~p.x - pS)
