extends Node

var serial: GdSerial
var buffer: String = ""
func _ready():
	serial = GdSerial.new()
	serial.set_port("COM3")
	serial.set_baud_rate(9600)
	if serial.open():
		print("Connected to COM3")
		await get_tree().create_timer(2.0).timeout
	else:
		print("FAILED to open COM3")

func _process(_delta):
	if serial and serial.is_open() and serial.bytes_available() > 0:
		var chunk = serial.read_string(serial.bytes_available())
		buffer += chunk
		if "\n" in buffer:
			var lines = buffer.split("\n")
			buffer = lines[-1]
			var data = lines[0].strip_edges()
			if data != "":
				process_serial_data(data)

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
	if y > 800: 
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
	print(x) 
	print(y) 
	print(b)
		
