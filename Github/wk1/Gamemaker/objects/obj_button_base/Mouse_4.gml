/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 0735DA9B
/// @DnDComment : // Checks if button is in hovered state
/// @DnDArgument : "expr" "is_hovered"
if(is_hovered)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7F273011
	/// @DnDComment : // Sets pushed to true
	/// @DnDParent : 0735DA9B
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "is_pushed"
	is_pushed = true;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 30FF0BFF
	/// @DnDComment : // Sets target scale to pressed
	/// @DnDParent : 0735DA9B
	/// @DnDArgument : "expr" "scale_pressed"
	/// @DnDArgument : "var" "target_scale"
	target_scale = scale_pressed;
}