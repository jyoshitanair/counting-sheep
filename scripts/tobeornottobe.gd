extends Node

var serial: GdSerial

func _ready():
	serial = GdSerial.new()

	serial.set_port("COM3")
	serial.set_baud_rate(9600)

	if serial.open():
		print("Connected to COM3")

		# Give Arduino time to reset
		await get_tree().create_timer(2.0).timeout

	else:
		print("FAILED to open COM3")

func _process(delta):
	if serial and serial.bytes_available() > 0:
		var data = serial.read_string(100)
		print("Received:", data)
