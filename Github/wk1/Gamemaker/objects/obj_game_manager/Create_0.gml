/// @DnDAction : YoYo Games.Random.Randomize
/// @DnDVersion : 1
/// @DnDHash : 44A25A7A
/// @DnDComment : //// Game Manager Object.$(13_10)// This object is used to control the main game loop and stores information for use in other objects.$(13_10)$(13_10)// Sets new random seed
randomize();

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4597E24D
/// @DnDComment : // Code Block for enum states
/// @DnDArgument : "code" "// Game states.$(13_10)enum GAME_STATE$(13_10){$(13_10)	PLAYING,$(13_10)	DYING,	$(13_10)	ENDED,$(13_10)	PAUSED,$(13_10)	TUTORIAL,$(13_10)	SIZE$(13_10)}"
// Game states.
enum GAME_STATE
{
	PLAYING,
	DYING,	
	ENDED,
	PAUSED,
	TUTORIAL,
	SIZE
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 41895734
/// @DnDComment : // Variables for gameplay (gold tracking is what will speed up the player later in the game)
/// @DnDInput : 4
/// @DnDArgument : "expr" "1"
/// @DnDArgument : "var" "current_level"
/// @DnDArgument : "var_1" "current_level_gold"
/// @DnDArgument : "var_2" "current_distance"
/// @DnDArgument : "var_3" "current_gold"
current_level = 1;
current_level_gold = 0;
current_distance = 0;
current_gold = 0;

/// @DnDAction : YoYo Games.Audio.Stop_Audio
/// @DnDVersion : 1
/// @DnDHash : 2777601D
/// @DnDComment : // Stops the music track that was previously playing
/// @DnDArgument : "soundid" "global.music"
audio_stop_sound(global.music);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5BE339E2
/// @DnDComment : // Checks if the game has been played before
/// @DnDArgument : "var" "global.times_played"
if(global.times_played == 0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6383C0A8
	/// @DnDComment : // Sets the game state to tutorial mode
	/// @DnDParent : 5BE339E2
	/// @DnDArgument : "expr" "GAME_STATE.TUTORIAL"
	/// @DnDArgument : "var" "current_game_state"
	current_game_state = GAME_STATE.TUTORIAL;

	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 35098FA5
	/// @DnDComment : // Creates the tutorial object
	/// @DnDParent : 5BE339E2
	/// @DnDArgument : "xpos" "room_width * 0.5"
	/// @DnDArgument : "ypos" "room_height * 0.5"
	/// @DnDArgument : "objectid" "obj_tutorial"
	/// @DnDArgument : "layer" ""GUI""
	/// @DnDSaveInfo : "objectid" "obj_tutorial"
	instance_create_layer(room_width * 0.5, room_height * 0.5, "GUI", obj_tutorial);

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 5F26ECFD
	/// @DnDComment : // Play audio for tutorial
	/// @DnDParent : 5BE339E2
	/// @DnDArgument : "value" "audio_play_sound(snd_ambience, 100, true, 1.0)"
	/// @DnDArgument : "var" "global.music"
	global.music = audio_play_sound(snd_ambience, 100, true, 1.0);
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 3B8E637B
else
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3A129BC2
	/// @DnDComment : // Sets the game to play normally
	/// @DnDParent : 3B8E637B
	/// @DnDArgument : "expr" "GAME_STATE.PLAYING"
	/// @DnDArgument : "var" "current_game_state"
	current_game_state = GAME_STATE.PLAYING;

	/// @DnDAction : YoYo Games.Sequences.Sequence_Create
	/// @DnDVersion : 1
	/// @DnDHash : 28FF2161
	/// @DnDComment : // Spawns the inital GameMaker logo in coins to fill in dead space
	/// @DnDParent : 3B8E637B
	/// @DnDArgument : "var" ""
	/// @DnDArgument : "sequenceid" "seq_gm_layout"
	/// @DnDArgument : "layer" ""Stage""
	/// @DnDSaveInfo : "sequenceid" "seq_gm_layout"
	layer_sequence_create("Stage", 0, 0, seq_gm_layout);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 16AE8FAC
	/// @DnDComment : // Checks if a highscore has been previously set
	/// @DnDParent : 3B8E637B
	/// @DnDArgument : "var" "global.highscore"
	/// @DnDArgument : "not" "1"
	if(!(global.highscore == 0))
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1C039323
		/// @DnDComment : // Creates a flag object for the highscore at its position it would be in
		/// @DnDParent : 16AE8FAC
		/// @DnDArgument : "var" "_flag"
		/// @DnDArgument : "value" "instance_create_layer(640 + real(global.highscore) * 60, 950, "StageBack", obj_flag_marker)"
		var _flag = instance_create_layer(640 + real(global.highscore) * 60, 950, "StageBack", obj_flag_marker);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 36F13528
		/// @DnDComment : // Sets the flag paramerters to know it has droppped and the score it should have
		/// @DnDInput : 2
		/// @DnDParent : 16AE8FAC
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "expr_1" "global.highscore"
		/// @DnDArgument : "var" "_flag.has_dropped"
		/// @DnDArgument : "var_1" "_flag.flag_distance"
		_flag.has_dropped = true;
		_flag.flag_distance = global.highscore;
	}

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 7C47B0E0
	/// @DnDComment : // Plays the games main music
	/// @DnDParent : 3B8E637B
	/// @DnDArgument : "value" "audio_play_sound(snd_infinite_runner_music, 100, true, 0.5)"
	/// @DnDArgument : "var" "global.music"
	global.music = audio_play_sound(snd_infinite_runner_music, 100, true, 0.5);
}

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 6F31BCD4
/// @DnDComment : // Counts up the times played
/// @DnDArgument : "value" "1"
/// @DnDArgument : "value_relative" "1"
/// @DnDArgument : "var" "global.times_played"
global.times_played += 1;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 64B6B794
/// @DnDComment : /// Variables used to control the players speed$(13_10)// Min speed is the slowest possible speed for players (ie zero for stopped)$(13_10)// Max speed is the current maximum speed allowed (Boosted speed)$(13_10)// Sets the new max speed as the current max speed (this variable is what adjusts the games speed curves$(13_10)// True max speed the the absolute fastest a player can go
/// @DnDInput : 4
/// @DnDArgument : "expr_1" "24"
/// @DnDArgument : "expr_2" "max_speed"
/// @DnDArgument : "expr_3" "72"
/// @DnDArgument : "var" "min_speed"
/// @DnDArgument : "var_1" "max_speed"
/// @DnDArgument : "var_2" "new_max_speed"
/// @DnDArgument : "var_3" "true_max_speed"
min_speed = 0;
max_speed = 24;
new_max_speed = max_speed;
true_max_speed = 72;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5ADA0526
/// @DnDComment : // Current speed is what tracks current movement for the backgrounds and level elements that need to move over time
/// @DnDArgument : "var" "current_speed"
current_speed = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 2FA5DD0A
/// @DnDComment : // The speed percentages are used to gradually increase and decrease the speed using smooth step interpolation
/// @DnDInput : 2
/// @DnDArgument : "expr_1" "0.5"
/// @DnDArgument : "var" "current_speed_percentage"
/// @DnDArgument : "var_1" "target_speed_percentage"
current_speed_percentage = 0;
target_speed_percentage = 0.5;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5B020534
/// @DnDComment : // The rate speed will go up or down so the player will stop or slow down quicker than speeding up
/// @DnDInput : 2
/// @DnDArgument : "expr" "0.2"
/// @DnDArgument : "expr_1" "0.5"
/// @DnDArgument : "var" "speed_up_rate"
/// @DnDArgument : "var_1" "speed_down_rate"
speed_up_rate = 0.2;
speed_down_rate = 0.5;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6D100A03
/// @DnDComment : // Initial cooldown for the background changing
/// @DnDArgument : "expr" "100"
/// @DnDArgument : "var" "background_cooldown"
background_cooldown = 100;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 469139AA
/// @DnDComment : // Flag used to check if the environments have finished loading to before starting the game
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "has_prefetched"
has_prefetched = false;

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 0E8FC1D5
/// @DnDComment : // Creates game objects for room environment
/// @DnDArgument : "objectid" "obj_far_background"
/// @DnDArgument : "layer" ""Farground""
/// @DnDSaveInfo : "objectid" "obj_far_background"
instance_create_layer(0, 0, "Farground", obj_far_background);

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 297E86CA
/// @DnDArgument : "objectid" "obj_interior_background"
/// @DnDArgument : "layer" ""Midground""
/// @DnDSaveInfo : "objectid" "obj_interior_background"
instance_create_layer(0, 0, "Midground", obj_interior_background);

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 6FDB62BF
/// @DnDArgument : "objectid" "obj_mid_background"
/// @DnDArgument : "layer" ""Midground""
/// @DnDSaveInfo : "objectid" "obj_mid_background"
instance_create_layer(0, 0, "Midground", obj_mid_background);

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 776C7DC6
/// @DnDArgument : "objectid" "obj_front_floor"
/// @DnDArgument : "layer" ""Foreground""
/// @DnDSaveInfo : "objectid" "obj_front_floor"
instance_create_layer(0, 0, "Foreground", obj_front_floor);

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 5A43FD0E
/// @DnDArgument : "objectid" "obj_front_ceiling"
/// @DnDArgument : "layer" ""Foreground""
/// @DnDSaveInfo : "objectid" "obj_front_ceiling"
instance_create_layer(0, 0, "Foreground", obj_front_ceiling);

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 5AF46DFA
/// @DnDComment : // Creates player object
/// @DnDArgument : "objectid" "obj_player"
/// @DnDArgument : "layer" ""Stage""
/// @DnDSaveInfo : "objectid" "obj_player"
instance_create_layer(0, 0, "Stage", obj_player);

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 160ADFD5
/// @DnDComment : // Function used to update the speed with delta time passed though as that is the time passed this frame meaning more accurate movement
/// @DnDArgument : "funcName" "update_speed"
/// @DnDArgument : "arg" "_delta_time"
function update_speed(_delta_time) 
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 12700285
	/// @DnDComment : // Checks if a player has collected 50 gold since the last time they leveled up
	/// @DnDParent : 160ADFD5
	/// @DnDArgument : "var" "current_level_gold"
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "50"
	if(current_level_gold >= 50)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1E1366E2
		/// @DnDComment : // Removed the gold from their current count
		/// @DnDParent : 12700285
		/// @DnDArgument : "expr" "-50"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "current_level_gold"
		current_level_gold += -50;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 455C53A1
		/// @DnDComment : // Increases the level
		/// @DnDParent : 12700285
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "current_level"
		current_level += 1;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6CBC00A1
		/// @DnDComment : // Sets the max speed to be 5% faster
		/// @DnDParent : 12700285
		/// @DnDArgument : "expr" "max_speed * 1.05"
		/// @DnDArgument : "var" "new_max_speed"
		new_max_speed = max_speed * 1.05;
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 604A5961
	/// @DnDComment : // Limits the max speed to the true max speed
	/// @DnDParent : 160ADFD5
	/// @DnDArgument : "var" "new_max_speed"
	/// @DnDArgument : "op" "2"
	/// @DnDArgument : "value" "true_max_speed"
	if(new_max_speed > true_max_speed)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 098FCB27
		/// @DnDComment : // Sets max to true max
		/// @DnDParent : 604A5961
		/// @DnDArgument : "expr" "true_max_speed"
		/// @DnDArgument : "var" "new_max_speed"
		new_max_speed = true_max_speed;
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 77C62856
	/// @DnDComment : // Checks if new max speed has changed.
	/// @DnDParent : 160ADFD5
	/// @DnDArgument : "var" "new_max_speed"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "max_speed"
	if(!(new_max_speed == max_speed))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 69D7A950
		/// @DnDComment : // Adjusts the percentage.
		/// @DnDParent : 77C62856
		/// @DnDArgument : "expr" "current_speed_percentage * (max_speed / new_max_speed)"
		/// @DnDArgument : "var" "current_speed_percentage"
		current_speed_percentage = current_speed_percentage * (max_speed / new_max_speed);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 63217190
		/// @DnDComment : // Sets max speed to new value.
		/// @DnDParent : 77C62856
		/// @DnDArgument : "expr" "new_max_speed"
		/// @DnDArgument : "var" "max_speed"
		max_speed = new_max_speed;
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7392A779
	/// @DnDComment : // Check if speed is less than target.
	/// @DnDParent : 160ADFD5
	/// @DnDArgument : "var" "current_speed_percentage"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "target_speed_percentage"
	if(current_speed_percentage < target_speed_percentage)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5FE0A9C7
		/// @DnDComment : // Speed up at rate.
		/// @DnDParent : 7392A779
		/// @DnDArgument : "expr" "speed_up_rate * _delta_time"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "current_speed_percentage"
		current_speed_percentage += speed_up_rate * _delta_time;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2CF2385B
		/// @DnDComment : // Limit speed to target.
		/// @DnDParent : 7392A779
		/// @DnDArgument : "expr" "min(current_speed_percentage, target_speed_percentage)"
		/// @DnDArgument : "var" "current_speed_percentage"
		current_speed_percentage = min(current_speed_percentage, target_speed_percentage);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3C815B0B
		/// @DnDComment : // Interpolate speed using smoothstep curve.
		/// @DnDParent : 7392A779
		/// @DnDArgument : "expr" "smoothstep(min_speed, max_speed, current_speed_percentage)"
		/// @DnDArgument : "var" "current_speed"
		current_speed = smoothstep(min_speed, max_speed, current_speed_percentage);
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 0684385B
	/// @DnDParent : 160ADFD5
	else
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4AF8AA8E
		/// @DnDComment : // Check if speed is greater than target.
		/// @DnDParent : 0684385B
		/// @DnDArgument : "var" "current_speed_percentage"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "target_speed_percentage"
		if(current_speed_percentage > target_speed_percentage)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 75E9418A
			/// @DnDComment : // Slow down at rate.
			/// @DnDParent : 4AF8AA8E
			/// @DnDArgument : "expr" "-(speed_down_rate * _delta_time)"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "current_speed_percentage"
			current_speed_percentage += -(speed_down_rate * _delta_time);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 070173F0
			/// @DnDComment : // Limit speed to target.
			/// @DnDParent : 4AF8AA8E
			/// @DnDArgument : "expr" "max(current_speed_percentage, target_speed_percentage)"
			/// @DnDArgument : "var" "current_speed_percentage"
			current_speed_percentage = max(current_speed_percentage, target_speed_percentage);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 406C80CC
			/// @DnDComment : // Interpolate speed using smoothstep curve.
			/// @DnDParent : 4AF8AA8E
			/// @DnDArgument : "expr" "smoothstep(min_speed, max_speed, current_speed_percentage)"
			/// @DnDArgument : "var" "current_speed"
			current_speed = smoothstep(min_speed, max_speed, current_speed_percentage);
		}
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 38F5405D
	/// @DnDComment : // Checks if game is not running in tutorial mode
	/// @DnDParent : 160ADFD5
	/// @DnDArgument : "expr" "current_game_state == GAME_STATE.TUTORIAL"
	/// @DnDArgument : "not" "1"
	if(!(current_game_state == GAME_STATE.TUTORIAL))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7ABD5397
		/// @DnDComment : // Add current speed to distance traveled.
		/// @DnDParent : 38F5405D
		/// @DnDArgument : "expr" "current_speed * _delta_time"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "current_distance"
		current_distance += current_speed * _delta_time;
	}
}