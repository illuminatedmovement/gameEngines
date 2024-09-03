/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 444D843F
/// @DnDComment : // Set sequence used
/// @DnDArgument : "expr" "-1"
/// @DnDArgument : "var" "set_sequence"
set_sequence = -1;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5A081661
/// @DnDComment : // Variable used for if follows owner
/// @DnDArgument : "expr" "noone"
/// @DnDArgument : "var" "owner"
owner = noone;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0F831351
/// @DnDComment : // Sets up inital after sequence functionality
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "has_death"
has_death = false;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 017A2155
/// @DnDArgument : "funcName" "stored_function_empty"
function stored_function_empty() 
{
	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 0157542B
	/// @DnDParent : 017A2155
	return;
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7FD907D4
/// @DnDArgument : "expr" "stored_function_empty"
/// @DnDArgument : "var" "stored_function"
stored_function = stored_function_empty;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 11BC2B47
/// @DnDComment : // Function called when death set
/// @DnDArgument : "funcName" "set_death"
/// @DnDArgument : "arg" "_new_function"
function set_death(_new_function) 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2296FBE4
	/// @DnDComment : // Sets death flag to true
	/// @DnDParent : 11BC2B47
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "has_death"
	has_death = true;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3F13A8F6
	/// @DnDComment : // Stores the stored function as a new one
	/// @DnDParent : 11BC2B47
	/// @DnDArgument : "expr" "_new_function"
	/// @DnDArgument : "var" "stored_function"
	stored_function = _new_function;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 21ACD5F9
/// @DnDComment : // Functione called when creating new sequences
/// @DnDInput : 2
/// @DnDArgument : "funcName" "create_seq"
/// @DnDArgument : "arg" "_new_seq"
/// @DnDArgument : "arg_1" "_new_layer"
function create_seq(_new_seq, _new_layer) 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 595CFBE0
	/// @DnDComment : // Sets the variable to the set sequence on a specified layer
	/// @DnDParent : 21ACD5F9
	/// @DnDArgument : "expr" "layer_sequence_create(_new_layer, x, y, _new_seq)"
	/// @DnDArgument : "var" "set_sequence"
	set_sequence = layer_sequence_create(_new_layer, x, y, _new_seq);
}