/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 50F7BF4F
/// @DnDComment : // Checks if debug menu variable exists
/// @DnDArgument : "expr" "variable_global_exists("active_debug_menu")"
/// @DnDArgument : "not" "1"
if(!(variable_global_exists("active_debug_menu")))
{
	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 06F0C941
	/// @DnDComment : // Sets to false
	/// @DnDParent : 50F7BF4F
	/// @DnDArgument : "value" "false"
	/// @DnDArgument : "var" "global.active_debug_menu"
	global.active_debug_menu = false;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 2EFA3766
else
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 5A70E9A8
	/// @DnDComment : // Deletes the debug window
	/// @DnDParent : 2EFA3766
	/// @DnDArgument : "function" "dbg_view_delete"
	/// @DnDArgument : "arg" "global.debug_window"
	dbg_view_delete(global.debug_window);
}

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 374119AA
/// @DnDComment : // Sets up a new debug window called game info and stores it as a global variable
/// @DnDArgument : "value" "dbg_view("Game Info", global.active_debug_menu)"
/// @DnDArgument : "var" "global.debug_window"
global.debug_window = dbg_view("Game Info", global.active_debug_menu);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 3BCC3897
/// @DnDComment : // Creates a section called game manager
/// @DnDArgument : "function" "dbg_section"
/// @DnDArgument : "arg" ""Game Manager""
dbg_section("Game Manager");

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 400B5241
/// @DnDComment : // Object variable for gamestate
/// @DnDArgument : "expr" """"
/// @DnDArgument : "var" "game_state"
game_state = "";

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 70D52635
/// @DnDComment : // Watch references for game state and distance travelled
/// @DnDInput : 2
/// @DnDArgument : "function" "dbg_watch"
/// @DnDArgument : "arg" "ref_create(self, "game_state")"
/// @DnDArgument : "arg_1" ""Game State""
dbg_watch(ref_create(self, "game_state"), "Game State");

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 414E996A
/// @DnDComment : // Watch references for game state and distance travelled
/// @DnDInput : 2
/// @DnDArgument : "function" "dbg_watch"
/// @DnDArgument : "arg" "ref_create(obj_game_manager, "current_distance")"
/// @DnDArgument : "arg_1" ""Distance Travelled""
dbg_watch(ref_create(obj_game_manager, "current_distance"), "Distance Travelled");

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 07C27958
/// @DnDComment : // Creates a section called interior mode
/// @DnDArgument : "function" "dbg_section"
/// @DnDArgument : "arg" ""Interior Mode""
dbg_section("Interior Mode");

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0107BD3B
/// @DnDComment : // Object variable for interior state
/// @DnDArgument : "expr" """"
/// @DnDArgument : "var" "interior_state"
interior_state = "";

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 402D4BC9
/// @DnDComment : // Watch references for interior state
/// @DnDInput : 2
/// @DnDArgument : "function" "dbg_watch"
/// @DnDArgument : "arg" "ref_create(self, "interior_state")"
/// @DnDArgument : "arg_1" ""Interior State""
dbg_watch(ref_create(self, "interior_state"), "Interior State");

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 158F192C
/// @DnDComment : // Function for button that swaps the interior state
/// @DnDArgument : "funcName" "button_interior"
function button_interior() 
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 4CFE7E96
	/// @DnDComment : // Calls function from object
	/// @DnDParent : 158F192C
	/// @DnDArgument : "function" "obj_interior_background.change_interior_state"
	obj_interior_background.change_interior_state();
}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 197E8709
/// @DnDComment : // Sets up button refernece
/// @DnDInput : 4
/// @DnDArgument : "function" "dbg_button"
/// @DnDArgument : "arg" ""Change Interior""
/// @DnDArgument : "arg_1" "ref_create(self, "button_interior")"
/// @DnDArgument : "arg_2" "240"
/// @DnDArgument : "arg_3" "30"
dbg_button("Change Interior", ref_create(self, "button_interior"), 240, 30);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 5E27D7AF
/// @DnDComment : // Creates a section called player variables
/// @DnDArgument : "function" "dbg_section"
/// @DnDArgument : "arg" ""Player Variables""
dbg_section("Player Variables");

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 225D1118
/// @DnDComment : // Set up all the referneces for speed and distance
/// @DnDInput : 2
/// @DnDArgument : "function" "dbg_watch"
/// @DnDArgument : "arg" "ref_create(obj_game_manager, "current_speed")"
/// @DnDArgument : "arg_1" ""Speed""
dbg_watch(ref_create(obj_game_manager, "current_speed"), "Speed");

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 6B51979B
/// @DnDInput : 2
/// @DnDArgument : "function" "dbg_watch"
/// @DnDArgument : "arg" "ref_create(obj_game_manager, "current_speed_percentage")"
/// @DnDArgument : "arg_1" ""Speed Percent""
dbg_watch(ref_create(obj_game_manager, "current_speed_percentage"), "Speed Percent");

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 61746FE5
/// @DnDInput : 4
/// @DnDArgument : "function" "dbg_slider"
/// @DnDArgument : "arg" "ref_create(obj_game_manager, "target_speed_percentage")"
/// @DnDArgument : "arg_1" "0.0"
/// @DnDArgument : "arg_2" "1.0"
/// @DnDArgument : "arg_3" ""Speed Target""
dbg_slider(ref_create(obj_game_manager, "target_speed_percentage"), 0.0, 1.0, "Speed Target");

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 7D0B301D
/// @DnDInput : 2
/// @DnDArgument : "function" "dbg_text_input"
/// @DnDArgument : "arg" "ref_create(obj_game_manager, "new_max_speed")"
/// @DnDArgument : "arg_1" ""Max Speed""
dbg_text_input(ref_create(obj_game_manager, "new_max_speed"), "Max Speed");

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 4FED7D68
/// @DnDInput : 2
/// @DnDArgument : "function" "dbg_text_input"
/// @DnDArgument : "arg" "ref_create(obj_game_manager, "current_distance")"
/// @DnDArgument : "arg_1" ""Current Distance""
dbg_text_input(ref_create(obj_game_manager, "current_distance"), "Current Distance");

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 7A7C1B6B
/// @DnDComment : // Calls show overlay
/// @DnDArgument : "function" "show_debug_overlay"
/// @DnDArgument : "arg" "global.active_debug_menu"
show_debug_overlay(global.active_debug_menu);