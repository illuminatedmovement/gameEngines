/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 7E8DA265
/// @DnDComment : // Checks game is in play mode
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PLAYING"
if(obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 07273B22
	/// @DnDComment : // Set delta time for movements that are time based.
	/// @DnDParent : 7E8DA265
	/// @DnDArgument : "var" "_delta_time"
	/// @DnDArgument : "value" "delta_time * 0.000001"
	var _delta_time = delta_time * 0.000001;

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 28451A0D
	/// @DnDComment : // Calculate the change in distance
	/// @DnDParent : 7E8DA265
	/// @DnDArgument : "var" "_delta_distance"
	/// @DnDArgument : "value" "obj_game_manager.current_speed * _delta_time"
	var _delta_distance = obj_game_manager.current_speed * _delta_time;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7C146230
	/// @DnDComment : // Apply values to cooldowns
	/// @DnDInput : 3
	/// @DnDParent : 7E8DA265
	/// @DnDArgument : "expr" "-_delta_distance"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "expr_1" "-_delta_distance"
	/// @DnDArgument : "expr_relative_1" "1"
	/// @DnDArgument : "expr_2" "-_delta_distance"
	/// @DnDArgument : "expr_relative_2" "1"
	/// @DnDArgument : "var" "powerup_cooldown"
	/// @DnDArgument : "var_1" "spawn_cooldown"
	/// @DnDArgument : "var_2" "enemy_cooldown"
	powerup_cooldown += -_delta_distance;
	spawn_cooldown += -_delta_distance;
	enemy_cooldown += -_delta_distance;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0C7EF5C9
	/// @DnDComment : // Check is spawn cooldown is finished
	/// @DnDParent : 7E8DA265
	/// @DnDArgument : "var" "spawn_cooldown"
	/// @DnDArgument : "op" "3"
	if(spawn_cooldown <= 0)
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 21CE2325
		/// @DnDComment : // Check if enemy can spawn (prioirty)
		/// @DnDParent : 0C7EF5C9
		/// @DnDArgument : "var" "enemy_cooldown"
		/// @DnDArgument : "op" "3"
		if(enemy_cooldown <= 0)
		{
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 37B4580C
			/// @DnDComment : // Calls the spawn enemy function
			/// @DnDParent : 21CE2325
			/// @DnDArgument : "function" "spawn_enemy"
			spawn_enemy();
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 62CAB121
		/// @DnDParent : 0C7EF5C9
		else
		{
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 77A77481
			/// @DnDComment : // Checks if powerup can be called
			/// @DnDParent : 62CAB121
			/// @DnDArgument : "var" "powerup_cooldown"
			/// @DnDArgument : "op" "3"
			if(powerup_cooldown <= 0)
			{
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 6F04D61C
				/// @DnDComment : // Checks if powerup can be called
				/// @DnDParent : 77A77481
				/// @DnDArgument : "function" "spawn_powerup"
				spawn_powerup();
			}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 561F2E8D
			/// @DnDParent : 62CAB121
			else
			{
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 3216E55F
				/// @DnDComment : // Spawns a random reward with the chance changing depending on how many times it is uses in this function
				/// @DnDParent : 561F2E8D
				/// @DnDArgument : "function" "spawn_reward"
				/// @DnDArgument : "arg" "choose(0,1,1,1,1,2,2,2,3,3,4,4,5,4,6,7)"
				spawn_reward(choose(0,1,1,1,1,2,2,2,3,3,4,4,5,4,6,7));
			}
		}
	}
}