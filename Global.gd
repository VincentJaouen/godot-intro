extends Node

signal score_update

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var lols = []

func add_lol(lol):
	print("add lol")
	lols.append(lol)
	lol.connect("dead", self, "_on_lol_dead")
	self.emit_signal("score_update", lols.size())

func _on_lol_dead(lol):
	lols.erase(lol)
	print("dead")
	print(lol)
	print(lols.size())
	self.emit_signal("score_update", lols.size())

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
