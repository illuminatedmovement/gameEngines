/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 5EAEE12C
/// @DnDComment : // Checks the game is not currently paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state != GAME_STATE.PAUSED"
if(obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 15B9BC16
	/// @DnDComment : // Moves the x position by the current speed value
	/// @DnDParent : 5EAEE12C
	/// @DnDArgument : "expr" "-obj_game_manager.current_speed * 1.0"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "x"
	x += -obj_game_manager.current_speed * 1.0;

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 060E4455
	/// @DnDComment : // Checks if the flag needs to drop
	/// @DnDParent : 5EAEE12C
	/// @DnDArgument : "expr" "has_dropped"
	/// @DnDArgument : "not" "1"
	if(!(has_dropped))
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4D47116C
		/// @DnDComment : // Checks if the flag is still in air
		/// @DnDParent : 060E4455
		/// @DnDArgument : "var" "y"
		/// @DnDArgument : "op" "1"
		/// @DnDArgument : "value" "950"
		if(y < 950)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 3283BA99
			/// @DnDComment : // Adds fall speed to flag
			/// @DnDParent : 4D47116C
			/// @DnDArgument : "expr" "120 * delta_time * 0.000001"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "fall_speed"
			fall_speed += 120 * delta_time * 0.000001;
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1EB01F09
			/// @DnDComment : // Adjusts the y position
			/// @DnDParent : 4D47116C
			/// @DnDArgument : "expr" "fall_speed"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "y"
			y += fall_speed;
		
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 644D6E2F
			/// @DnDComment : // Checks the y position if is now grounded
			/// @DnDParent : 4D47116C
			/// @DnDArgument : "var" "y"
			/// @DnDArgument : "op" "2"
			/// @DnDArgument : "value" "950"
			if(y > 950)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 225A726A
				/// @DnDComment : // Hard sets ground position
				/// @DnDParent : 644D6E2F
				/// @DnDArgument : "expr" "950"
				/// @DnDArgument : "var" "y"
				y = 950;
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 167FFA1F
				/// @DnDComment : // Sets warping state to true
				/// @DnDParent : 644D6E2F
				/// @DnDArgument : "expr" "true"
				/// @DnDArgument : "var" "is_warping"
				is_warping = true;
			
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 50ECA184
				/// @DnDComment : // Calls firework function since landed
				/// @DnDParent : 644D6E2F
				/// @DnDArgument : "function" "create_firework"
				create_firework();
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 3A4DD754
				/// @DnDComment : // Sets up handle request to keep calling fireworks at random intervals repeating until stopped
				/// @DnDParent : 644D6E2F
				/// @DnDArgument : "expr" "call_later(random_range(90, 120), time_source_units_frames, create_firework, true)"
				/// @DnDArgument : "var" "handle_request"
				handle_request = call_later(random_range(90, 120), time_source_units_frames, create_firework, true);
			
				/// @DnDAction : YoYo Games.Common.Temp_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 23854820
				/// @DnDComment : // Sets up smoke particle effect for landing smoke
				/// @DnDParent : 644D6E2F
				/// @DnDArgument : "var" "_smoke_particle"
				/// @DnDArgument : "value" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
				var _smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 67749658
				/// @DnDParent : 644D6E2F
				/// @DnDArgument : "expr" "self"
				/// @DnDArgument : "var" "_smoke_particle.owner"
				_smoke_particle.owner = self;
			
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 420FF19D
				/// @DnDInput : 2
				/// @DnDParent : 644D6E2F
				/// @DnDArgument : "function" "_smoke_particle.set_particle"
				/// @DnDArgument : "arg" "ps_flag_smoke"
				/// @DnDArgument : "arg_1" ""StageShadowsEffects""
				_smoke_particle.set_particle(ps_flag_smoke, "StageShadowsEffects");
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 2DA4CCAD
				/// @DnDComment : // Sets has dropped flag to true
				/// @DnDParent : 644D6E2F
				/// @DnDArgument : "expr" "true"
				/// @DnDArgument : "var" "has_dropped"
				has_dropped = true;
			}
		}
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 57A05E33
	/// @DnDComment : // Checks if flag is currently warping
	/// @DnDParent : 5EAEE12C
	/// @DnDArgument : "expr" "is_warping"
	if(is_warping)
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3351BB92
		/// @DnDComment : // Sets temp warp rate
		/// @DnDParent : 57A05E33
		/// @DnDArgument : "var" "_warp_rate"
		/// @DnDArgument : "value" "1.2"
		var _warp_rate = 1.2;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 44488956
		/// @DnDComment : Adjusts the curve percent by the time passed and rate
		/// @DnDParent : 57A05E33
		/// @DnDArgument : "expr" "delta_time * 0.000001 * _warp_rate"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "warp_curve_percent"
		warp_curve_percent += delta_time * 0.000001 * _warp_rate;
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0DADB3A9
		/// @DnDComment : // Checks if the curve has finished
		/// @DnDParent : 57A05E33
		/// @DnDArgument : "var" "warp_curve_percent"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "1"
		if(warp_curve_percent > 1)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 01EC2FE0
			/// @DnDComment : // Sets curve value to full (100%)
			/// @DnDParent : 0DADB3A9
			/// @DnDArgument : "expr" "1"
			/// @DnDArgument : "var" "warp_curve_percent"
			warp_curve_percent = 1;
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 71A78DBE
			/// @DnDComment : // Stops warping state
			/// @DnDParent : 0DADB3A9
			/// @DnDArgument : "expr" "false"
			/// @DnDArgument : "var" "is_warping"
			is_warping = false;
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 19CD86F0
			/// @DnDComment : // Resets text alpha for flag
			/// @DnDParent : 0DADB3A9
			/// @DnDArgument : "expr" "0.0"
			/// @DnDArgument : "var" "text_alpha"
			text_alpha = 0.0;
		
			/// @DnDAction : YoYo Games.Common.Function
			/// @DnDVersion : 1
			/// @DnDHash : 0FFFDB18
			/// @DnDComment : // Creates function called gameover for triggering gameover
			/// @DnDParent : 0DADB3A9
			/// @DnDArgument : "funcName" "_new_gameover"
			/// @DnDArgument : "temp" "1"
			var _new_gameover = function() 
			{
				/// @DnDAction : YoYo Games.Audio.Stop_Audio
				/// @DnDVersion : 1
				/// @DnDHash : 5EE7CCA5
				/// @DnDComment : // Stops the music
				/// @DnDParent : 0FFFDB18
				/// @DnDArgument : "soundid" "global.music"
				audio_stop_sound(global.music);
			
				/// @DnDAction : YoYo Games.Audio.Play_Audio
				/// @DnDVersion : 1.1
				/// @DnDHash : 5073AB8D
				/// @DnDParent : 0FFFDB18
				/// @DnDArgument : "soundid" "snd_game_over_popup"
				/// @DnDSaveInfo : "soundid" "snd_game_over_popup"
				audio_play_sound(snd_game_over_popup, 0, 0, 1.0, undefined, 1.0);
			
				/// @DnDAction : YoYo Games.Common.Set_Global
				/// @DnDVersion : 1
				/// @DnDHash : 0C2FBE59
				/// @DnDComment : // Plays game over sound effect and changes the global music to ambience
				/// @DnDParent : 0FFFDB18
				/// @DnDArgument : "value" "audio_play_sound(snd_ambience, 100, true, 1.0)"
				/// @DnDArgument : "var" "global.music"
				global.music = audio_play_sound(snd_ambience, 100, true, 1.0);
			
				/// @DnDAction : YoYo Games.Common.Temp_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 61B5F8A5
				/// @DnDComment : // Play game over sequence for menu UI
				/// @DnDParent : 0FFFDB18
				/// @DnDArgument : "var" "_gameover_seq"
				/// @DnDArgument : "value" "layer_sequence_create("GUI", 0, 0, seq_gameover)"
				var _gameover_seq = layer_sequence_create("GUI", 0, 0, seq_gameover);
			}
		
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 0028DA66
			/// @DnDComment : // Creates a game over handle for calling the game over function after 60 frames
			/// @DnDParent : 0DADB3A9
			/// @DnDArgument : "var" "_go_handle"
			/// @DnDArgument : "value" "call_later(60, time_source_units_frames, _new_gameover, false)"
			var _go_handle = call_later(60, time_source_units_frames, _new_gameover, false);
		}
	
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3F4295F3
		/// @DnDComment : // Calculates the adjusted value from the curve
		/// @DnDParent : 57A05E33
		/// @DnDArgument : "var" "_adjust_val"
		/// @DnDArgument : "value" "animcurve_channel_evaluate(warp_curve, warp_curve_percent)"
		var _adjust_val = animcurve_channel_evaluate(warp_curve, warp_curve_percent);
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Scale
		/// @DnDVersion : 1
		/// @DnDHash : 2E64A665
		/// @DnDComment : // Sets the y scale to follow this curve
		/// @DnDParent : 57A05E33
		/// @DnDArgument : "yscale" "1.0 + _adjust_val"
		image_xscale = 1;
		image_yscale = 1.0 + _adjust_val;
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 47B9F999
	/// @DnDComment : // Checks if the flag has been passed and a new highscore should occur
	/// @DnDParent : 5EAEE12C
	/// @DnDArgument : "expr" "!has_passed && obj_game_manager.current_distance > global.highscore"
	if(!has_passed && obj_game_manager.current_distance > global.highscore)
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 602CA847
		/// @DnDComment : // Creates particle effect manager and sets up a confetti effect
		/// @DnDParent : 47B9F999
		/// @DnDArgument : "var" "_confetti_particle"
		/// @DnDArgument : "value" "instance_create_layer(x - 50, y - 20, "Stage", obj_particle_manager)"
		var _confetti_particle = instance_create_layer(x - 50, y - 20, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7355A269
		/// @DnDParent : 47B9F999
		/// @DnDArgument : "expr" "self"
		/// @DnDArgument : "var" "_confetti_particle.owner"
		_confetti_particle.owner = self;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 07939E9A
		/// @DnDInput : 2
		/// @DnDParent : 47B9F999
		/// @DnDArgument : "function" "_confetti_particle.set_particle"
		/// @DnDArgument : "arg" "ps_confetti"
		/// @DnDArgument : "arg_1" ""StageShadowsEffects""
		_confetti_particle.set_particle(ps_confetti, "StageShadowsEffects");
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 3BFF3448
		/// @DnDInput : 2
		/// @DnDParent : 47B9F999
		/// @DnDArgument : "function" "_confetti_particle.set_offset"
		/// @DnDArgument : "arg" "-50"
		/// @DnDArgument : "arg_1" "-240"
		_confetti_particle.set_offset(-50, -240);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 1A347B08
		/// @DnDComment : // Calls the firework function
		/// @DnDParent : 47B9F999
		/// @DnDArgument : "function" "create_firework"
		create_firework();
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2DA91F7E
		/// @DnDComment : // Sets has passed flag to true
		/// @DnDParent : 47B9F999
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "has_passed"
		has_passed = true;
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 15CC0B0E
	/// @DnDComment : // Checks if cooldown has been adjusted to stop coins overlaying the flag to be passed
	/// @DnDParent : 5EAEE12C
	/// @DnDArgument : "expr" "has_cooldown_adjusted"
	/// @DnDArgument : "not" "1"
	if(!(has_cooldown_adjusted))
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 212188DC
		/// @DnDComment : // Calculates the x position when next segment
		/// @DnDParent : 15CC0B0E
		/// @DnDArgument : "var" "x"
		/// @DnDArgument : "op" "1"
		/// @DnDArgument : "value" "room_width * 2.33"
		if(x < room_width * 2.33)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 3926560D
			/// @DnDComment : // Resets the spawn cooldown with space for the flags placement
			/// @DnDParent : 212188DC
			/// @DnDArgument : "expr" "(room_width * 0.66) / 60"
			/// @DnDArgument : "var" "obj_spawn_manager.spawn_cooldown"
			obj_spawn_manager.spawn_cooldown = (room_width * 0.66) / 60;
		
			/// @DnDAction : YoYo Games.Common.Apply_To
			/// @DnDVersion : 1
			/// @DnDHash : 041E44A9
			/// @DnDComment : // Checks all the coins within the room
			/// @DnDApplyTo : {obj_pickup_coin}
			/// @DnDParent : 212188DC
			with(obj_pickup_coin) {
				/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 4A1DBDD0
				/// @DnDComment : // Checks if coin is after the spawn point (or just before the flag)
				/// @DnDParent : 041E44A9
				/// @DnDArgument : "var" "x"
				/// @DnDArgument : "op" "4"
				/// @DnDArgument : "value" "room_width * 2"
				if(x >= room_width * 2)
				{
					/// @DnDAction : YoYo Games.Instances.Destroy_Instance
					/// @DnDVersion : 1
					/// @DnDHash : 58282321
					/// @DnDComment : // Destroys the coin
					/// @DnDParent : 4A1DBDD0
					instance_destroy();
				}
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6F55E7B5
			/// @DnDComment : // Sets cooldown adjusted state to true
			/// @DnDParent : 212188DC
			/// @DnDArgument : "expr" "true"
			/// @DnDArgument : "var" "has_cooldown_adjusted"
			has_cooldown_adjusted = true;
		}
	}

	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 6609FF9D
	/// @DnDComment : // Plays the animation for the flag
	/// @DnDParent : 5EAEE12C
	image_speed = 1;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 79A621B7
else
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 35A1D365
	/// @DnDComment : // Pauses the animation for the flag
	/// @DnDParent : 79A621B7
	/// @DnDArgument : "speed" "0"
	image_speed = 0;
}