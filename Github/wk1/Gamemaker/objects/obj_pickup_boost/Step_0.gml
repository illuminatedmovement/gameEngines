/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 4578BC9E
/// @DnDComment : // Checks the game is not currently paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state != GAME_STATE.PAUSED"
if(obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7AE50FC3
	/// @DnDComment : // Moves the pickup at the games current speed
	/// @DnDParent : 4578BC9E
	/// @DnDArgument : "expr" "- (obj_game_manager.current_speed * 1.0)"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "x"
	x += - (obj_game_manager.current_speed * 1.0);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3BC79631
	/// @DnDComment : // Checks if pickup has gone off screen to the left
	/// @DnDParent : 4578BC9E
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "-169"
	if(x < -169)
	{
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 403B2C5C
		/// @DnDComment : // Destroys the pickup object
		/// @DnDParent : 3BC79631
		instance_destroy();
	}

	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 1D37208C
	/// @DnDComment : // Sets the animation speed to playing when not paused
	/// @DnDParent : 4578BC9E
	image_speed = 1;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 1D3DD3A2
else
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 675E1F62
	/// @DnDComment : // Sets the animation speed to stop when game is paused
	/// @DnDParent : 1D3DD3A2
	/// @DnDArgument : "speed" "0"
	image_speed = 0;
}