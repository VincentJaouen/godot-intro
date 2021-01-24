extends Node2D

export (PackedScene) var lol

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$ScoreLabel.text = String(0)
	Global.connect("score_update", self, "_on_score_update")

func _on_score_update(score):
	$ScoreLabel.text = String(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var new_lol = lol.instance()
		add_child(new_lol);
		new_lol.position = $StartPosition.position
