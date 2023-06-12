extends Node
# maybe preformance issues, could recommend using preload
var hand_index_map = ["res://assets/hands/hand.png", "res://assets/hands/dealer_hand.png"];
var thumb_index_map = ["res://assets/hands/thumb.png", "res://assets/hands/dealer_thumb.png"];

var wallet_index_map = ["res://assets/wallets/default_wallet.png", "res://assets/wallets/brown_wallet.png"];
var credit_card_index_map = ["res://assets/credit_cards/default_credit_card.png", "res://assets/credit_cards/sparkasse_credit_card.png"];

var table_index_map = ["res://assets/tables/normal_table.png", "res://assets/tables/black_table.png"];

var card_deck_index_map = [
	"res://assets/cards/default_red_card.png",
	"res://assets/cards/default_blue_card.png",
	"res://assets/cards/dark_gold_card.png",
	"res://assets/cards/ligth_gold_card.png"
];
var deck = card_deck_index_map[randi_range(0, card_deck_index_map.size()-1)]
var card_numeration_map = [
	["Hearts Ace", "Hearts 2", "Hearts 3", "Hearts 4", "Hearts 5", "Hearts 6", "Hearts 7", "Hearts 8", "Hearts 9", "Hearts 10", "Hearts j","Hearts q","Hearts k"],
	["Spada Ace", "Spada 2", "Spada 3", "Spada 4", "Spada 5", "Spada 6", "Spada 7", "Spada 8", "Spada 9", "Spada 10", "Spada j","Spada q","Spada k"],
	["diamond Ace", "diamond 2", "diamond 3", "diamond 4", "diamond 5", "diamond 6", "diamond 7", "diamond 8", "diamond 9", "diamond 10", "diamond j","diamond q","diamond k"],
	["luck Ace", "luck 2", "luck 3", "luck 4", "luck 5", "luck 6", "luck 7", "luck 8", "luck 9", "luck 10", "luck j","luck q","luck k"],
	["back"]
]

var chip_val = [
	"1€", "5€", "10€", "50€", "100€", "500€", "1k", "5k", "10k", "50k", "100k", "500k", "1m", "10m", "100m", "1B", "10B"
]