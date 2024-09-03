/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 267E902B
/// @DnDComment : // Owner object of shadow
/// @DnDArgument : "expr" "noone"
/// @DnDArgument : "var" "owner"
owner = noone;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6625F759
/// @DnDComment : // Y offset applied to position
/// @DnDArgument : "var" "y_offset"
y_offset = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 233BCEA6
/// @DnDComment : // Transition variables
/// @DnDInput : 3
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "expr_2" "1.0"
/// @DnDArgument : "var" "can_fade"
/// @DnDArgument : "var_1" "fade_time"
/// @DnDArgument : "var_2" "fade_level	"
can_fade = false;
fade_time = 0;
fade_level	 = 1.0;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 4D96A6AA
/// @DnDComment : // Sets shadows y offset
/// @DnDArgument : "funcName" "set_y_offset"
/// @DnDArgument : "arg" "_y_offset"
function set_y_offset(_y_offset) 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0CB74C81
	/// @DnDComment : // Stores offset
	/// @DnDParent : 4D96A6AA
	/// @DnDArgument : "expr" "_y_offset"
	/// @DnDArgument : "var" "y_offset"
	y_offset = _y_offset;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2D0F8FDC
	/// @DnDComment : // Applies offset
	/// @DnDParent : 4D96A6AA
	/// @DnDArgument : "expr" "y_offset"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "y"
	y += y_offset;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 25156881
/// @DnDComment : // Sets shadow to fade out over time
/// @DnDArgument : "funcName" "fade_out"
/// @DnDArgument : "arg" "_time"
function fade_out(_time) 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4FA0FD52
	/// @DnDComment : // Sets fade state to true
	/// @DnDParent : 25156881
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "can_fade"
	can_fade = true;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5887C0C1
	/// @DnDComment : // Sets fade out time
	/// @DnDParent : 25156881
	/// @DnDArgument : "expr" "_time"
	/// @DnDArgument : "var" "fade_time"
	fade_time = _time;
}