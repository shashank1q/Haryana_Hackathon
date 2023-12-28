extends Node

var curr : String = "world"
var stack : Array = ["world"]
var entryBtnVisible : bool = false

var path : Dictionary = {
	"home" : "res://scenes/home_scene.tscn",
	"vegi" : "res://scenes/vegi_shop.tscn",
	"world" : "res://scenes/world.tscn",
	"office" : "res://scenes/office.tscn",
	"Liquor_shop" : "res://scenes/liquor_shop.tscn",
	"drawingroom" :"res://scenes/drawing_room.tscn",
	"kitchen" : "res://scenes/kitchen.tscn",
	"Bedroom" : "res://scenes/bedroom.tscn",
	"wiring": "res://scenes/wiring.tscn",
	"assembly" : "res://scenes/assembly.tscn",
	"packing" : "res://scenes/packing.tscn",
	"boss" : "res://scenes/boss.tscn"
}
