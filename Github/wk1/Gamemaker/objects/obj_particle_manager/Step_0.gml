/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 2956EA24
/// @DnDComment : // Checks if the owner currently exists
/// @DnDArgument : "expr" "owner == noone"
if(owner == noone)
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 765E5B4E
	/// @DnDComment : // Checks if the move rate is not equal to the current move rate (Drag)
	/// @DnDParent : 2956EA24
	/// @DnDArgument : "expr" "move_rate != move_rate_target"
	if(move_rate != move_rate_target)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 79A2E091
		/// @DnDComment : // Adjusts the move rate by lerping to the target at the set drag rate
		/// @DnDParent : 765E5B4E
		/// @DnDArgument : "expr" "lerp(move_rate, move_rate_target, drag_rate)"
		/// @DnDArgument : "var" "move_rate"
		move_rate = lerp(move_rate, move_rate_target, drag_rate);
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 293B4B82
	/// @DnDComment : // Checks the game is not currently paused
	/// @DnDParent : 2956EA24
	/// @DnDArgument : "expr" "obj_game_manager.current_game_state != GAME_STATE.PAUSED"
	if(obj_game_manager.current_game_state != GAME_STATE.PAUSED)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 037F073A
		/// @DnDComment : // Adjusts the x position by the current speed and move rate
		/// @DnDParent : 293B4B82
		/// @DnDArgument : "expr" "-(obj_game_manager.current_speed * move_rate)"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "x"
		x += -(obj_game_manager.current_speed * move_rate);
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 68C37799
else
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0449CBE1
	/// @DnDComment : // Sets the x and y positions by the offsets and the owners position
	/// @DnDInput : 2
	/// @DnDParent : 68C37799
	/// @DnDArgument : "expr" "owner.x + x_offset"
	/// @DnDArgument : "expr_1" "owner.y + y_offset"
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "var_1" "y"
	x = owner.x + x_offset;
	y = owner.y + y_offset;
}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 730F873F
/// @DnDComment : // Updates the particle system to the objects position
/// @DnDInput : 3
/// @DnDArgument : "function" "part_system_position"
/// @DnDArgument : "arg" "particle_sys"
/// @DnDArgument : "arg_1" "x"
/// @DnDArgument : "arg_2" "y"
part_system_position(particle_sys, x, y);

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 52808B75
/// @DnDComment : // Checks if the game state is paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
if(obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 69E9FBEA
	/// @DnDComment : // Stops updating the particle systems
	/// @DnDInput : 2
	/// @DnDParent : 52808B75
	/// @DnDArgument : "function" "part_system_automatic_update"
	/// @DnDArgument : "arg" "particle_sys"
	/// @DnDArgument : "arg_1" "false"
	part_system_automatic_update(particle_sys, false);
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 364C3F78
else
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 64E06882
	/// @DnDComment : // Resumes updating the particle systems
	/// @DnDInput : 2
	/// @DnDParent : 364C3F78
	/// @DnDArgument : "function" "part_system_automatic_update"
	/// @DnDArgument : "arg" "particle_sys"
	/// @DnDArgument : "arg_1" "true"
	part_system_automatic_update(particle_sys, true);
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 782E7771
/// @DnDComment : // Checks if the particle system has finished
/// @DnDArgument : "var" "part_particles_count(particle_sys)"
if(part_particles_count(particle_sys) == 0)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 5A32E402
	/// @DnDComment : // Destroys the object
	/// @DnDParent : 782E7771
	instance_destroy();
}