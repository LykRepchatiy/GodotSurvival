extends CharacterBody2D


const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
const SPEED = 300.0
var health = 3
@onready var player = get_node("/root/Game/Player")

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()

func take_damage():
	health -= 1
	%Slime.play_hurt()
	if health == 0:
		queue_free()
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
