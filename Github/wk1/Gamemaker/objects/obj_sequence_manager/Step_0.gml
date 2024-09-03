/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 3E1DE116
/// @DnDComment : // Checks if the object has an owner set
/// @DnDArgument : "expr" "owner != noone"
if(owner != noone)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2D52E381
	/// @DnDComment : // Adjusts the coordinates to follow its owner
	/// @DnDInput : 2
	/// @DnDParent : 3E1DE116
	/// @DnDArgument : "expr" "owner.x"
	/// @DnDArgument : "expr_1" "owner.y"
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "var_1" "y"
	x = owner.x;
	y = owner.y;
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 0A8A7404
/// @DnDComment : // Checks if a sequence has been set
/// @DnDArgument : "expr" "set_sequence != -1"
if(set_sequence != -1)
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 3FE8CC59
	/// @DnDComment : // Checks if the sequnece has finished
	/// @DnDParent : 0A8A7404
	/// @DnDArgument : "expr" "layer_sequence_is_finished(set_sequence)"
	if(layer_sequence_is_finished(set_sequence))
	{
		/// @DnDAction : YoYo Games.Sequences.Sequence_Destroy
		/// @DnDVersion : 1
		/// @DnDHash : 7D6D3709
		/// @DnDComment : // Destroys the sequence
		/// @DnDParent : 3FE8CC59
		/// @DnDArgument : "var" "set_sequence"
		layer_sequence_destroy(set_sequence);
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 3BC80101
		/// @DnDComment : // Checks if the sequence has a death call
		/// @DnDParent : 3FE8CC59
		/// @DnDArgument : "expr" "has_death"
		if(has_death)
		{
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 00BF4F52
			/// @DnDComment : // Runs the death call
			/// @DnDParent : 3BC80101
			/// @DnDArgument : "function" "stored_function"
			stored_function();
		}
	
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 63C38046
		/// @DnDComment : // Destroys this sequences manager object
		/// @DnDParent : 3FE8CC59
		instance_destroy();
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 39CAC847
	/// @DnDParent : 0A8A7404
	else
	{
		/// @DnDAction : YoYo Games.Sequences.Sequence_Set_Position
		/// @DnDVersion : 1
		/// @DnDHash : 0DB3E9A1
		/// @DnDComment : // Updates the sequence position to the objects
		/// @DnDParent : 39CAC847
		/// @DnDArgument : "xpos" "x"
		/// @DnDArgument : "ypos" "y"
		/// @DnDArgument : "sequenceelmid" "set_sequence"
		layer_sequence_x(set_sequence, x);
		layer_sequence_y(set_sequence, y);
	}
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 37905602
/// @DnDComment : // Checks if the game is paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
if(obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	/// @DnDAction : YoYo Games.Sequences.Sequence_Pause
	/// @DnDVersion : 1
	/// @DnDHash : 418A00C6
	/// @DnDComment : // Pauses the sequence
	/// @DnDParent : 37905602
	/// @DnDArgument : "var" "set_sequence"
	layer_sequence_pause(set_sequence);
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 0D88A113
else
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 1529F251
	/// @DnDComment : // Checks if the sequence is paused
	/// @DnDParent : 0D88A113
	/// @DnDArgument : "expr" "layer_sequence_is_paused(set_sequence)"
	if(layer_sequence_is_paused(set_sequence))
	{
		/// @DnDAction : YoYo Games.Sequences.Sequence_Play
		/// @DnDVersion : 1
		/// @DnDHash : 52BE2003
		/// @DnDComment : // Resumes the sequenece
		/// @DnDParent : 1529F251
		/// @DnDArgument : "var" "set_sequence"
		layer_sequence_play(set_sequence);
	}
}