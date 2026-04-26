extends Node

var udp := PacketPeerUDP.new()
var x := 512
var y := 512
var b := 1

func _ready():
	var err = udp.bind(4242)
	if err == OK:
		print("UDP listening on 4242")
	else:
		print("UDP bind FAILED: ", err)

func _process(_delta):
	while udp.get_available_packet_count() > 0:
		var data = udp.get_packet().get_string_from_ascii().strip_edges()
		if data.begins_with("X:"):
			x = data.substr(2).to_int()
		elif data.begins_with("Y:"):
			y = data.substr(2).to_int()
		elif data.begins_with("B:"):
			b = data.substr(2).to_int()

	# X movement
	if x < 400:
		Input.action_press("left")
		Input.action_release("right")
	elif x > 800:
		Input.action_press("right")
		Input.action_release("left")
	else:
		Input.action_release("left")
		Input.action_release("right")

	# Y movement
	if y < 400:
		Input.action_press("up")
		Input.action_release("down")
	elif y > 800:
		Input.action_press("down")
		Input.action_release("up")
	else:
		Input.action_release("up")
		Input.action_release("down")

	# Button
	if b == 0:
		Input.action_press("clicker")
	else:
		Input.action_release("clicker")
		
