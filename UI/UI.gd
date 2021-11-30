extends CanvasLayer

var healing = .001

func _ready():
	pass


func _on_Timer_timeout():
	if Global.timer > 0:
		Global.timer -= 1
		Global.update_time()
		
func _physics_process(delta):
	if $damage.color.a > 0:
		$damage.color.a -= healing
		
func add_damage(d):
	$damage.color.a = clamp($damage.color.a + d, 0 ,1)
