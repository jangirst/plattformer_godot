extends Node

# Path to the file we're saving in
const SAVE_PATH = "res://savegame.bin"

func newGame():
	Game.PlayerHP = 10
	Game.Gold = 0

func saveGame():
	# Create a temp file to store
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	
	# Store everything inside the new JSON
	var data: Dictionary = {
		"playerHP": Game.PlayerHP,
		"gold": Game.Gold,
	}
	
	# Create a String from the JSON file
	var jstr = JSON.stringify(data)
	
	# Write to file
	file.store_line(jstr)

func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	
	# Check if the file exists
	if FileAccess.file_exists(SAVE_PATH):
		
		# Check if there is a next line in the file
		if not file.eof_reached():
			
			# Parse String to JSON
			var current_line = JSON.parse_string(file.get_line())
			
			# Write the loaded values to the game variables
			Game.PlayerHP = current_line["playerHP"]
			Game.Gold = current_line["gold"]



