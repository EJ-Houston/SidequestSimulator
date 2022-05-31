extends KinematicBody2D

const ACCELERATION = 1100
const MAX_SPEED = 100
const FRICTION = 1100

enum {
	MOVE,
	ATTACK,
	GUN,
	POCKET
	
}

var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.LEFT

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swipeHitbox = $SwipeHitboxPivot/SwipeHitbox

func _ready():
	animationTree.active = true
	swipeHitbox.knockback_vector = roll_vector

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
			
		ATTACK:
			attack_state(delta)
			
		GUN:
			pass
		
		POCKET:
			pocket_state(delta)
	
	
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		swipeHitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Walk/blend_position", input_vector)
		animationTree.set("parameters/Swipe/blend_position", input_vector)
		animationTree.set("parameters/Pocket/blend_position", input_vector)
		animationState.travel("Walk")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		
	if Input.is_action_just_pressed("pocket"):
		state = POCKET
	
func attack_state(_delta):
	animationState.travel("Swipe")
	
func attack_animation_finished():
	state = MOVE
	
func pocket_state(delta):
	animationState.travel("Pocket")
	
func pocket_animation_finished():
	state = MOVE

