extends Control

@onready var menu_button: MenuButton = $Panel/MarginContainer/BoxContainerOne/MenuButton
@onready var tree: Tree = $Panel/MarginContainerThree/BoxContainerThree/VBoxContainer/Tree
@onready var tab_container: TabContainer = $Panel/MarginContainerThree/BoxContainerThree/VBoxContainer/TabContainer

func _ready():
	# Submenu 
	var popup = menu_button.get_popup()
	var submenu = PopupMenu.new()
	
	submenu.add_item("Subitem 1")
	submenu.add_item("Subitem 2")
	popup.add_child(submenu)
	popup.add_submenu_node_item("Submenu", submenu)
	
	# Disable Tab 3 
	tab_container.set_tab_disabled(2, true)
	
	# --- Tree ---
	
	# Root Item
	var root = tree.create_item()
	root.set_text(0, "Tree")

	# First Child: Item
	var item = tree.create_item(root)
	item.set_text(0, "Item")

	# Second Child: Editable Item
	var editable_item = tree.create_item(root)
	editable_item.set_text(0, "Editable Item")
	editable_item.set_editable(0, true)

	# Subtree with multiple children
	var subtree = tree.create_item(root)
	subtree.set_text(0, "Subtree")

	# Subtree: Check Item
	var check_item = tree.create_item(subtree)
	check_item.set_cell_mode(0, TreeItem.CELL_MODE_CHECK)
	check_item.set_text(0, "Check Item")
	check_item.set_checked(0, true)
	check_item.set_editable(0, true)

	# SpinBox: Create and add to the tree
	var spin_box_item = tree.create_item(subtree)
	spin_box_item.set_cell_mode(0, TreeItem.CELL_MODE_RANGE)
	spin_box_item.set_range_config(0, 0.0, 10.0, 1.0)
	spin_box_item.set_range(0, 2)
	spin_box_item.set_editable(0, true)

	# Options Button in Subtree
	var options_item = tree.create_item(subtree)
	options_item.set_cell_mode(0, TreeItem.CELL_MODE_RANGE)
	options_item.set_text(0, " Has, Many, Options")
	options_item.set_editable(0, true)
