/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 07FF2A50
/// @DnDComment : // Sets the variables for flag placement and behaviours
/// @DnDInput : 3
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "expr_1" "false"
/// @DnDArgument : "expr_2" "false"
/// @DnDArgument : "var" "has_dropped"
/// @DnDArgument : "var_1" "has_passed"
/// @DnDArgument : "var_2" "has_cooldown_adjusted"
has_dropped = false;
has_passed = false;
has_cooldown_adjusted = false;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 44AE21EC
/// @DnDComment : // Inital fall speed variable
/// @DnDArgument : "var" "fall_speed"
fall_speed = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 67C8B751
/// @DnDComment : // Used when warping effect is applied to flag on bounce
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "is_warping"
is_warping = false;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0D6258D2
/// @DnDComment : // Sets the animation curve
/// @DnDArgument : "expr" "animcurve_get_channel(ac_flag_warp, "warp")"
/// @DnDArgument : "var" "warp_curve"
warp_curve = animcurve_get_channel(ac_flag_warp, "warp");

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 21225BFF
/// @DnDComment : // Variable used to track curve
/// @DnDArgument : "var" "warp_curve_percent"
warp_curve_percent = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4DCC1857
/// @DnDComment : // Used to store requests within later
/// @DnDArgument : "expr" "-1"
/// @DnDArgument : "var" "handle_request"
handle_request = -1;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 23AD8CB2
/// @DnDComment : // Variable used to store and display the flag distance
/// @DnDArgument : "var" "flag_distance"
flag_distance = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3EC17927
/// @DnDComment : // Text alpha value
/// @DnDArgument : "expr" "1.0"
/// @DnDArgument : "var" "text_alpha"
text_alpha = 1.0;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 71CDB561
/// @DnDComment : // Function used to create firework
/// @DnDArgument : "funcName" "create_firework"
function create_firework() 
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 2123FC75
	/// @DnDComment : // Checks flag still exisits
	/// @DnDParent : 71CDB561
	/// @DnDArgument : "expr" "instance_exists(self)"
	if(instance_exists(self))
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 22D1E87A
		/// @DnDComment : // Creates firework object at position setting its delay, fuse timer and speed
		/// @DnDParent : 2123FC75
		/// @DnDArgument : "var" "_firework"
		/// @DnDArgument : "value" "instance_create_layer(x, y - 100, "Stage", obj_firework)"
		var _firework = instance_create_layer(x, y - 100, "Stage", obj_firework);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2D7E5E17
		/// @DnDInput : 3
		/// @DnDParent : 2123FC75
		/// @DnDArgument : "expr" "0.02"
		/// @DnDArgument : "expr_1" "0.55"
		/// @DnDArgument : "expr_2" "15"
		/// @DnDArgument : "var" "_firework.delay"
		/// @DnDArgument : "var_1" "_firework.death"
		/// @DnDArgument : "var_2" "_firework.fire_speed"
		_firework.delay = 0.02;
		_firework.death = 0.55;
		_firework.fire_speed = 15;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 14214BDE
	/// @DnDParent : 71CDB561
	else
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 1541B253
		/// @DnDComment : // Stops the repeating handle call since no longer exists
		/// @DnDParent : 14214BDE
		/// @DnDArgument : "function" "call_cancel"
		/// @DnDArgument : "arg" "handle_request"
		call_cancel(handle_request);
	}
}