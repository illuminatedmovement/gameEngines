/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 0B193FC0
/// @DnDComment : // Checks game isnt paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
/// @DnDArgument : "not" "1"
if(!(obj_game_manager.current_game_state == GAME_STATE.PAUSED))
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 38257449
	/// @DnDComment : // Checks owner has been set
	/// @DnDParent : 0B193FC0
	/// @DnDArgument : "expr" "owner == noone"
	/// @DnDArgument : "not" "1"
	if(!(owner == noone))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4005E75A
		/// @DnDComment : // Set x position to follow owner
		/// @DnDParent : 38257449
		/// @DnDArgument : "expr" "owner.x"
		/// @DnDArgument : "var" "x"
		x = owner.x;
	
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3AE76F7B
		/// @DnDComment : // Temp variables for scaling the shadows size based on how high the owner is to the ground where it exists
		/// @DnDInput : 3
		/// @DnDParent : 38257449
		/// @DnDArgument : "var" "_delta_y"
		/// @DnDArgument : "value" "abs(y - owner.y) - y_offset"
		/// @DnDArgument : "var_1" "_scale"
		/// @DnDArgument : "value_1" "1"
		/// @DnDArgument : "var_2" "_shadow_height"
		/// @DnDArgument : "value_2" "400"
		var _delta_y = abs(y - owner.y) - y_offset;
		var _scale = 1;
		var _shadow_height = 400;
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0FEC3FF2
		/// @DnDComment : // Checks the scale has changed from the original height
		/// @DnDParent : 38257449
		/// @DnDArgument : "var" "_delta_y"
		/// @DnDArgument : "op" "2"
		if(_delta_y > 0)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 5D241173
			/// @DnDComment : // Recalculate the scale based on the height of the owner compared to the shadow
			/// @DnDParent : 0FEC3FF2
			/// @DnDArgument : "expr" "(_shadow_height - clamp(_delta_y, 0, _shadow_height)) * (1 / _shadow_height)"
			/// @DnDArgument : "var" "_scale"
			_scale = (_shadow_height - clamp(_delta_y, 0, _shadow_height)) * (1 / _shadow_height);
		}
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
		/// @DnDVersion : 1
		/// @DnDHash : 584351EA
		/// @DnDComment : // Sets the image alpha to the scale
		/// @DnDParent : 38257449
		/// @DnDArgument : "alpha" "_scale"
		image_alpha = _scale;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1AAE8B90
		/// @DnDComment : // Clamp the scale so its a value betwen 0.6 and 1
		/// @DnDParent : 38257449
		/// @DnDArgument : "expr" "clamp(_scale, 0.6, 1.00)"
		/// @DnDArgument : "var" "_scale"
		_scale = clamp(_scale, 0.6, 1.00);
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Scale
		/// @DnDVersion : 1
		/// @DnDHash : 79ADFDC4
		/// @DnDComment : // Set the actual image scales to 1 devided by the new scale variable
		/// @DnDParent : 38257449
		/// @DnDArgument : "xscale" "1 / _scale"
		/// @DnDArgument : "yscale" "1 / _scale"
		image_xscale = 1 / _scale;
		image_yscale = 1 / _scale;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 590B8DD2
	/// @DnDParent : 0B193FC0
	else
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 577F763C
		/// @DnDComment : // Sets shadow to fade out after 0.1 seconds
		/// @DnDParent : 590B8DD2
		/// @DnDArgument : "function" "fade_out"
		/// @DnDArgument : "arg" "0.1"
		fade_out(0.1);
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 3D5FB45F
	/// @DnDComment : // Checks if shadow can fade out
	/// @DnDParent : 0B193FC0
	/// @DnDArgument : "expr" "can_fade"
	if(can_fade)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6AB2838E
		/// @DnDComment : // Sets the shadows fade level to decrease slowly over time set
		/// @DnDParent : 3D5FB45F
		/// @DnDArgument : "expr" "-((1 / fade_time) * delta_time * 0.000001)"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "fade_level"
		fade_level += -((1 / fade_time) * delta_time * 0.000001);
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6E885E7D
		/// @DnDComment : // Checks if the shadow should no longer be visible
		/// @DnDParent : 3D5FB45F
		/// @DnDArgument : "var" "fade_level"
		/// @DnDArgument : "op" "1"
		if(fade_level < 0)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 048A53CC
			/// @DnDComment : // Sets value back to zero
			/// @DnDParent : 6E885E7D
			/// @DnDArgument : "var" "fade_level"
			fade_level = 0;
		}
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
		/// @DnDVersion : 1
		/// @DnDHash : 036F0E5B
		/// @DnDComment : // Sets the images alpha to the fade level
		/// @DnDParent : 3D5FB45F
		/// @DnDArgument : "alpha" "image_alpha * fade_level"
		image_alpha = image_alpha * fade_level;
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3AE9B157
		/// @DnDComment : // Checks if the alpha is equal to 0 (invisible)
		/// @DnDParent : 3D5FB45F
		/// @DnDArgument : "var" "image_alpha"
		if(image_alpha == 0)
		{
			/// @DnDAction : YoYo Games.Instances.Destroy_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 56B06772
			/// @DnDComment : // Destroys the shadow object
			/// @DnDParent : 3AE9B157
			instance_destroy();
		}
	}
}