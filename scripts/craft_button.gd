extends Button

func _on_pressed() -> void:
	# no need to add any check since if it is enabled, a valid recipe is present
	var recipe: CraftingRecipe = $"../../..".curr_valid_recipe
	for slot in $"../GridContainer".get_children():
		#slot.remove_item(recipe.)
		pass
