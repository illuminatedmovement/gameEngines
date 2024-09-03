/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 113A59F5
/// @DnDComment : // Checks for shift and tab button combo
/// @DnDArgument : "expr" "keyboard_check_direct(vk_shift) && keyboard_check_pressed(vk_tab)"
if(keyboard_check_direct(vk_shift) && keyboard_check_pressed(vk_tab))
{
	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 04DF3A92
	/// @DnDComment : // Toggles debug menu
	/// @DnDParent : 113A59F5
	/// @DnDArgument : "value" "!global.active_debug_menu"
	/// @DnDArgument : "var" "global.active_debug_menu"
	global.active_debug_menu = !global.active_debug_menu;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 403FF407
	/// @DnDParent : 113A59F5
	/// @DnDArgument : "function" "show_debug_log"
	/// @DnDArgument : "arg" "global.active_debug_menu"
	show_debug_log(global.active_debug_menu);
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 498DD058
/// @DnDComment : // Checks if the menu is active
/// @DnDArgument : "expr" "global.active_debug_menu"
if(global.active_debug_menu)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5C4BFDB5
	/// @DnDComment : // Calls custom function to set string information about the states to object variables
	/// @DnDInput : 2
	/// @DnDParent : 498DD058
	/// @DnDArgument : "expr" "get_gamestate()"
	/// @DnDArgument : "expr_1" "get_interiorstate()"
	/// @DnDArgument : "var" "game_state"
	/// @DnDArgument : "var_1" "interior_state"
	game_state = get_gamestate();
	interior_state = get_interiorstate();
}