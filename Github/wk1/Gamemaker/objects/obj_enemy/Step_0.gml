/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 4FF129B6
/// @DnDComment : // Checks if the game is not currently paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
/// @DnDArgument : "not" "1"
if(!(obj_game_manager.current_game_state == GAME_STATE.PAUSED))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3D142982
	/// @DnDComment : // Moves x position by current speed
	/// @DnDParent : 4FF129B6
	/// @DnDArgument : "expr" "- (obj_game_manager.current_speed * 1.0)"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "x"
	x += - (obj_game_manager.current_speed * 1.0);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7ECE4718
	/// @DnDComment : // Moves the x postiion again by the walking speed
	/// @DnDParent : 4FF129B6
	/// @DnDArgument : "expr" "-walking_speed"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "x"
	x += -walking_speed;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7AC51010
	/// @DnDComment : // Checks if the enemy has gone off screen to the left
	/// @DnDParent : 4FF129B6
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "-204"
	if(x < -204)
	{
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 6A8C4DAD
		/// @DnDComment : // Destroys the enemy
		/// @DnDParent : 7AC51010
		instance_destroy();
	}

	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 01376A58
	/// @DnDComment : // Checks the for step frame and step hasnt played for the step
	/// @DnDParent : 4FF129B6
	image_speed = 1;

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 2C4FB5C8
	/// @DnDComment : // Checks the for step frame and step hasnt played for the step
	/// @DnDParent : 4FF129B6
	/// @DnDArgument : "expr" "!has_stepped && (round(image_index) == 4 || round(image_index) == 13)"
	if(!has_stepped && (round(image_index) == 4 || round(image_index) == 13))
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5C690D05
		/// @DnDComment : // Chooses a random footstep
		/// @DnDParent : 2C4FB5C8
		/// @DnDArgument : "var" "_footstep"
		/// @DnDArgument : "value" "choose(snd_dino_robot_footstep_1, snd_dino_robot_footstep_2, snd_dino_robot_footstep_3, snd_dino_robot_footstep_4, snd_dino_robot_footstep_5, snd_dino_robot_footstep_6)"
		var _footstep = choose(snd_dino_robot_footstep_1, snd_dino_robot_footstep_2, snd_dino_robot_footstep_3, snd_dino_robot_footstep_4, snd_dino_robot_footstep_5, snd_dino_robot_footstep_6);
	
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 45E64C44
		/// @DnDComment : // Sets default gain
		/// @DnDParent : 2C4FB5C8
		/// @DnDArgument : "var" "_gain"
		/// @DnDArgument : "value" "1.0"
		var _gain = 1.0;
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 590E70A5
		/// @DnDComment : // Checks if the dino is to the right of the player
		/// @DnDParent : 2C4FB5C8
		/// @DnDArgument : "var" "x"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "obj_player.x"
		if(x > obj_player.x)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 36EA0E01
			/// @DnDComment : // Scales the gain by the distance between player and enemy to the room width
			/// @DnDParent : 590E70A5
			/// @DnDArgument : "expr" "1.0 - clamp(abs(x - obj_player.x) / room_width, 0.0, 1.0)"
			/// @DnDArgument : "var" "_gain"
			_gain = 1.0 - clamp(abs(x - obj_player.x) / room_width, 0.0, 1.0);
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 667AEBDB
		/// @DnDParent : 2C4FB5C8
		else
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 2372A0A8
			/// @DnDComment : // Scales the gain by the distance between player and enemy to a fraction of the room width
			/// @DnDParent : 667AEBDB
			/// @DnDArgument : "expr" "1.0 - clamp(abs(x - obj_player.x) / (room_width * 0.33), 0.0, 1.0)"
			/// @DnDArgument : "var" "_gain"
			_gain = 1.0 - clamp(abs(x - obj_player.x) / (room_width * 0.33), 0.0, 1.0);
		}
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 5E401129
		/// @DnDComment : // Plays the footstep sound
		/// @DnDParent : 2C4FB5C8
		/// @DnDArgument : "target_temp" "1"
		/// @DnDArgument : "soundid" "_footstep"
		/// @DnDArgument : "gain" "_gain"
		audio_play_sound(_footstep, 0, 0, _gain, undefined, 1.0);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5ECB648A
		/// @DnDComment : // Sets step state to true
		/// @DnDParent : 2C4FB5C8
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "has_stepped"
		has_stepped = true;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 765DE40A
	/// @DnDParent : 4FF129B6
	else
	{
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 15E1954B
		/// @DnDComment : // Checks is not currently on a step frame
		/// @DnDParent : 765DE40A
		/// @DnDArgument : "expr" "round(image_index) == 4 || round(image_index) == 13"
		/// @DnDArgument : "not" "1"
		if(!(round(image_index) == 4 || round(image_index) == 13))
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 769E746D
			/// @DnDComment : // Sets step state to false
			/// @DnDParent : 15E1954B
			/// @DnDArgument : "expr" "false"
			/// @DnDArgument : "var" "has_stepped"
			has_stepped = false;
		}
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 4E21178B
else
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 3A631A12
	/// @DnDComment : // Pauses the animation speed
	/// @DnDParent : 4E21178B
	/// @DnDArgument : "speed" "0"
	image_speed = 0;
}