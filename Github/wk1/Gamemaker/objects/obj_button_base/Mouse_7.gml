/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 5EDE3358
/// @DnDComment : // Checks hovered and pushed
/// @DnDArgument : "expr" "is_hovered && is_pushed"
if(is_hovered && is_pushed)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2CA427FD
	/// @DnDComment : // Unsets hovered and pushed states
	/// @DnDInput : 2
	/// @DnDParent : 5EDE3358
	/// @DnDArgument : "expr" "false"
	/// @DnDArgument : "expr_1" "false"
	/// @DnDArgument : "var" "is_hovered"
	/// @DnDArgument : "var_1" "is_pushed"
	is_hovered = false;
	is_pushed = false;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 48D6561E
	/// @DnDComment : // Sets the target scale back to default value
	/// @DnDParent : 5EDE3358
	/// @DnDArgument : "expr" "scale_default"
	/// @DnDArgument : "var" "target_scale"
	target_scale = scale_default;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 2D613FF9
	/// @DnDComment : // Calls the target function
	/// @DnDParent : 5EDE3358
	/// @DnDArgument : "function" "target_function"
	target_function();
}