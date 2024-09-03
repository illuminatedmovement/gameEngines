/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7B0207D2
/// @DnDComment : // Sets the hovered state to true
/// @DnDArgument : "expr" "true"
/// @DnDArgument : "var" "is_hovered"
is_hovered = true;

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 0D0E2DA1
/// @DnDComment : // Checks button is not pushed
/// @DnDArgument : "expr" "is_pushed"
/// @DnDArgument : "not" "1"
if(!(is_pushed))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 61D574CC
	/// @DnDComment : // Sets the target scale to highlighted
	/// @DnDParent : 0D0E2DA1
	/// @DnDArgument : "expr" "scale_highlighted"
	/// @DnDArgument : "var" "target_scale"
	target_scale = scale_highlighted;
}