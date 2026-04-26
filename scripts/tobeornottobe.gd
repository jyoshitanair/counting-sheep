extends Node

var serial: GdSerial
var buffer := ""

func _ready():
	serial = GdSerial.new()
	serial.set_port("COM3")
	serial.set_baud_rate(9600)
	if serial.open():
		print("Connected to COM3")
	else:
		print("FAILED to open COM3")

func _process(_delta):
	if not serial:
		return
	var chunk = serial.read_string(16)  # smaller = safer
	if chunk == null:
		return
	buffer += chunk
	if buffer.length() > 5000:
		buffer = buffer.right(2000)
	while buffer.find("\n") != -1:
		var pos = buffer.find("\n")
		var line = buffer.substr(0, pos)
		buffer = buffer.substr(pos + 1)
		process_serial_data(line.strip_edges())

func process_serial_data(data: String):
	var parts = data.split(",")
	if parts.size() != 3:
		return
	var x = parts[1].to_int()
	var y = parts[0].to_int()
	var b = parts[2].to_int()
	#x movment 
	if x< 400: 
		Input.action_press("right") 
		Input.action_release("left")
	elif x > 800: 
		Input.action_press("left") 
		Input.action_release("right")
	else:
		Input.action_release("right")
		Input.action_release("left")
	# y movement 
	if y< 400: 
		Input.action_press("up") 
		Input.action_release("down")
	elif y > 800: 
		Input.action_press("down") 
		Input.action_release("up")
	else:
		Input.action_release("up")
		Input.action_release("down")
	#button 
	if b == 0: 
		Input.action_press("clicker") 
	else:
		Input.action_release("clicker") 
