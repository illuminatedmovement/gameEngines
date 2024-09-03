/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 679DCDBE
/// @DnDComment : // Checks if the game has been paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state != GAME_STATE.PAUSED"
if(obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 597413CA
	/// @DnDComment : // Moves the flowers x position along at the games current speed
	/// @DnDParent : 679DCDBE
	/// @DnDArgument : "expr" "-(obj_game_manager.current_speed * 1.0)"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "x"
	x += -(obj_game_manager.current_speed * 1.0);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 226F0BD3
	/// @DnDComment : // Checks if the coordinate moves beyond the left offscreen threshold
	/// @DnDParent : 679DCDBE
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "-59"
	if(x < -59)
	{
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 51BF4870
		/// @DnDComment : // Destroys the flower
		/// @DnDParent : 226F0BD3
		instance_destroy();
	}
}