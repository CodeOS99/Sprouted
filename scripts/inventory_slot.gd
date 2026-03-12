extends Panel

@onready var texture_rect: TextureRect = $TextureRect
@onready var amt_label: Label = $Label

var slot_data: SlotData

func _ready() -> void:
	if slot_data:
		texture_rect.texture = slot_data.item.texture
		amt_label.text = "x%s" % slot_data.amount
	else:
		texture_rect.texture = null
		amt_label.text = ""
