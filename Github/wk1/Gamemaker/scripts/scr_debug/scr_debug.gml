/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 1027388C
/// @DnDComment : // Debug Scripts
/// @DnDArgument : "funcName" "bug_restart"
function bug_restart() 
{
	/// @DnDAction : YoYo Games.Game.Restart_Game
	/// @DnDVersion : 1
	/// @DnDHash : 66144E78
	/// @DnDParent : 1027388C
	game_restart();

	/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
	/// @DnDVersion : 1
	/// @DnDHash : 7A6FFD47
	/// @DnDParent : 1027388C
	/// @DnDArgument : "msg" ""Room restarted""
	show_debug_message(string("Room restarted"));
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 1979632D
/// @DnDComment : // Debug Scripts
/// @DnDArgument : "funcName" "bug_set_state"
/// @DnDArgument : "arg" "_new_state"
function bug_set_state(_new_state) 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4CFE55FE
	/// @DnDParent : 1979632D
	/// @DnDArgument : "expr" "_new_state"
	/// @DnDArgument : "var" "obj_game_manager.current_game_state"
	obj_game_manager.current_game_state = _new_state;

	/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
	/// @DnDVersion : 1
	/// @DnDHash : 3815A947
	/// @DnDParent : 1979632D
	/// @DnDArgument : "msg" ""Game state changed to: " + get_gamestate()"
	show_debug_message(string("Game state changed to: " + get_gamestate()));
}