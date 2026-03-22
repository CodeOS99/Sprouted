class_name CraftingRecipe extends Resource

@export var n: int = 1
@export var items: Array[ItemData] # items, eg [Log, Log]
@export var pos: Array[Vector2i] # the positions, assumed to be top left to bottom right
@export var amounts: Array[int]
# eg [(0,0), (0, -1)] ---------- normal cartesian convention
# the given example would result in the recipe
# log
# log
# like stick in minecraft
@export var result: ItemData
@export var result_amount: int
