extends Node
var e=1
var r=1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if e==1:
		e=0
		$AudioStreamPlayer.play()
		await get_tree().create_timer(7).timeout
		r=0
	if r==0:
		await get_tree().create_timer(0.4).timeout
		r=1
		e=1
