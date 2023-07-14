extends Node

var root : Node2D
var minimap : SubViewport 
var player : Node2D

var minimap_mode = true

var pegavel = []
var impegavel = []
var limite = 7

var contagem = 0

func _ready():
	randomize()
	impegavel.shuffle()

func _physics_process(delta):
	if len(pegavel) < limite:
		randomize()
		var entrega = impegavel.pick_random()
		if not entrega: return
		impegavel.erase(entrega)
		entrega.pegavel = true
		pegavel.append(entrega)

func setPlayer(node):
	player = node

func setRoot(node):
	root = node

func setMinimap(node):
	minimap = node
