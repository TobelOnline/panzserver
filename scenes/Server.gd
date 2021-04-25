extends Node

var network = NetworkedMultiplayerENet.new()
var port = 1990
var max_players = 2
var current_players = 0

func _ready():
	StartServer()
	
func StartServer():
	network.create_server(port, max_players)
	get_tree().set_network_peer(network)
	print("Server started")

	network.connect("peer_connected", self, "_Peer_Conected")
	network.connect("peer_disconnected", self, "_Peer_Disconnected")
	
func _Peer_Conected(player_id):
	#rpc_id(player_id, "SetPlayer")
	print("User " + str(player_id) + " connected")
	current_players = current_players + 1
	print("Current players on game: " + str(current_players) + "")
	
func _Peer_Disconnected(player_id):
	print("User " + str(player_id) + " disconnected")
	current_players = current_players - 1
	print("Current players on game: " + str(current_players) + "")
