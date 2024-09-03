/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 2696877A
/// @DnDComment : // Checks if button can scale at rate
/// @DnDArgument : "expr" "can_scale_at_rate"
if(can_scale_at_rate)
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 11334E94
	/// @DnDComment : // When image scale is less than target
	/// @DnDParent : 2696877A
	/// @DnDArgument : "var" "image_xscale"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "target_scale"
	if(image_xscale < target_scale)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 74160B1E
		/// @DnDComment : // Use up rate to lerp scale up towards target
		/// @DnDInput : 2
		/// @DnDParent : 11334E94
		/// @DnDArgument : "expr" "lerp(image_xscale, target_scale, scale_up_rate)"
		/// @DnDArgument : "expr_1" "lerp(image_yscale, target_scale, scale_up_rate)"
		/// @DnDArgument : "var" "image_xscale"
		/// @DnDArgument : "var_1" "image_yscale"
		image_xscale = lerp(image_xscale, target_scale, scale_up_rate);
		image_yscale = lerp(image_yscale, target_scale, scale_up_rate);
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 561E8432
	/// @DnDParent : 2696877A
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2A5E7A83
		/// @DnDComment : // Use down rate to lerp value down towards target
		/// @DnDInput : 2
		/// @DnDParent : 561E8432
		/// @DnDArgument : "expr" "lerp(image_xscale, target_scale, scale_down_rate)"
		/// @DnDArgument : "expr_1" "lerp(image_yscale, target_scale, scale_down_rate)"
		/// @DnDArgument : "var" "image_xscale"
		/// @DnDArgument : "var_1" "image_yscale"
		image_xscale = lerp(image_xscale, target_scale, scale_down_rate);
		image_yscale = lerp(image_yscale, target_scale, scale_down_rate);
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 4555E81F
else
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7BEC5302
	/// @DnDComment : // Set the image scales right to the target scales
	/// @DnDInput : 2
	/// @DnDParent : 4555E81F
	/// @DnDArgument : "expr" "target_scale"
	/// @DnDArgument : "expr_1" "target_scale"
	/// @DnDArgument : "var" "image_xscale"
	/// @DnDArgument : "var_1" "image_yscale"
	image_xscale = target_scale;
	image_yscale = target_scale;
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 24CC1BCA
/// @DnDComment : // Check if mouse is over the current button
/// @DnDArgument : "expr" "position_meeting(mouse_x, mouse_y, self)"
if(position_meeting(mouse_x, mouse_y, self))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 02BAE332
	/// @DnDComment : // Sets hover state to true
	/// @DnDParent : 24CC1BCA
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "is_hovered"
	is_hovered = true;

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 5977CE02
	/// @DnDComment : // Checks button has not been pushed
	/// @DnDParent : 24CC1BCA
	/// @DnDArgument : "expr" "is_pushed"
	/// @DnDArgument : "not" "1"
	if(!(is_pushed))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1D31F0F5
		/// @DnDComment : // Sets the target scale to highlighted value
		/// @DnDParent : 5977CE02
		/// @DnDArgument : "expr" "scale_highlighted"
		/// @DnDArgument : "var" "target_scale"
		target_scale = scale_highlighted;
	}
}