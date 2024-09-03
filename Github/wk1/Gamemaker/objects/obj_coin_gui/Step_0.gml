/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 23688C57
/// @DnDComment : // Checks the game is not curently paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state != GAME_STATE.PAUSED"
if(obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 19FD8339
	/// @DnDComment : // Calculates the target direction of where the coin symbol is on the score GUI
	/// @DnDParent : 23688C57
	/// @DnDArgument : "var" "_target_direction"
	/// @DnDArgument : "value" "point_direction(x, y, obj_gui.x - 5, obj_gui.y + 50)"
	var _target_direction = point_direction(x, y, obj_gui.x - 5, obj_gui.y + 50);

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3300FB99
	/// @DnDComment : // Calculates the difference in directions between the direction headed and the target
	/// @DnDParent : 23688C57
	/// @DnDArgument : "var" "_dir_difference"
	/// @DnDArgument : "value" "angle_difference(_target_direction, direction)"
	var _dir_difference = angle_difference(_target_direction, direction);

	/// @DnDAction : YoYo Games.Movement.Set_Direction_Free
	/// @DnDVersion : 1
	/// @DnDHash : 0BFA7219
	/// @DnDComment : // Adjusts the direction slowly at a rate of the directional difference
	/// @DnDParent : 23688C57
	/// @DnDArgument : "direction" "_dir_difference * 0.1"
	/// @DnDArgument : "direction_relative" "1"
	direction += _dir_difference * 0.1;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5F9CCCE8
	/// @DnDComment : // Adjust the current speed variable to slower value at a slow rate
	/// @DnDParent : 23688C57
	/// @DnDArgument : "expr" "lerp(current_speed, 10, 0.05)"
	/// @DnDArgument : "var" "current_speed"
	current_speed = lerp(current_speed, 10, 0.05);

	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 5AB0EB9D
	/// @DnDComment : // Applies the adjusted speed the the speed variable for movement
	/// @DnDParent : 23688C57
	/// @DnDArgument : "speed" "current_speed"
	speed = current_speed;

	/// @DnDAction : YoYo Games.Instances.Sprite_Rotate
	/// @DnDVersion : 1
	/// @DnDHash : 7BDF4D70
	/// @DnDComment : // Sets the sprite image angle to the new direction with the adjusted angles added
	/// @DnDParent : 23688C57
	/// @DnDArgument : "angle" "direction - image_adjust + 180"
	image_angle = direction - image_adjust + 180;

	/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
	/// @DnDVersion : 1
	/// @DnDHash : 23CBE2C8
	/// @DnDComment : // Lerps the sprite variables to fade out and scale down
	/// @DnDParent : 23688C57
	/// @DnDArgument : "alpha" "lerp(image_alpha, 0, 0.005)"
	image_alpha = lerp(image_alpha, 0, 0.005);

	/// @DnDAction : YoYo Games.Instances.Sprite_Scale
	/// @DnDVersion : 1
	/// @DnDHash : 1BFA5F02
	/// @DnDParent : 23688C57
	/// @DnDArgument : "xscale" "lerp(image_xscale, 0, 0.01)"
	/// @DnDArgument : "yscale" "lerp(image_yscale, 0, 0.01)"
	image_xscale = lerp(image_xscale, 0, 0.01);
	image_yscale = lerp(image_yscale, 0, 0.01);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2C1DA632
	/// @DnDComment : // Checks if the image is no longer visible
	/// @DnDParent : 23688C57
	/// @DnDArgument : "var" "image_alpha"
	/// @DnDArgument : "op" "3"
	/// @DnDArgument : "value" "0.1"
	if(image_alpha <= 0.1)
	{
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 1E5D6597
		/// @DnDComment : // Destroys the image
		/// @DnDParent : 2C1DA632
		instance_destroy();
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 12E24BC7
else
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 22C7D898
	/// @DnDComment : // Sets the speed to zero if paused to stop movement
	/// @DnDParent : 12E24BC7
	speed = 0;
}