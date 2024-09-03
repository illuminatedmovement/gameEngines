/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 3D890F4C
/// @DnDComment : // Checks if the game is currently paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
/// @DnDArgument : "not" "1"
if(!(obj_game_manager.current_game_state == GAME_STATE.PAUSED))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3EE20A99
	/// @DnDComment : // Moves the coin objects left at the games current move speed
	/// @DnDParent : 3D890F4C
	/// @DnDArgument : "expr" "-(obj_game_manager.current_speed * 1.0)"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "x"
	x += -(obj_game_manager.current_speed * 1.0);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 49CE24C1
	/// @DnDComment : // Checks if the coins have gone offscreen
	/// @DnDParent : 3D890F4C
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "-169"
	if(x < -169)
	{
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 5A9DABAB
		/// @DnDComment : // Destroys the coins
		/// @DnDParent : 49CE24C1
		instance_destroy();
	}

	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 2598840B
	/// @DnDComment : // Sets the animation speed to playing
	/// @DnDParent : 3D890F4C
	image_speed = 1;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 5BAF26D3
else
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 3E7F4DBA
	/// @DnDComment : // Pauses the animation speed
	/// @DnDParent : 5BAF26D3
	/// @DnDArgument : "speed" "0"
	image_speed = 0;
}