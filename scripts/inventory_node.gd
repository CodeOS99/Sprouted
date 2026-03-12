extends Control

@export var inventory_data: InventoryData

const INVENTORY_SLOT := preload("uid://b4v6j80gj158n")

func _ready() -> void:
	$GridContainer.columns = inventory_data.dims[0]
	
	for data in inventory_data.slot_datas:
		var slot = INVENTORY_SLOT.instantiate()
		slot.slot_data = data
		$GridContainer.add_child(slot)
