/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 0AE1281E
/// @DnDComment : // Checks if the game is paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
if(obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
	/// @DnDVersion : 1.1
	/// @DnDHash : 67054317
	/// @DnDComment : // Fades out the sounds
	/// @DnDParent : 0AE1281E
	/// @DnDArgument : "sound" "jet_sound"
	/// @DnDArgument : "volume" "0"
	/// @DnDArgument : "time" "100"
	audio_sound_gain(jet_sound, 0, 100);

	/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
	/// @DnDVersion : 1.1
	/// @DnDHash : 168C4A35
	/// @DnDParent : 0AE1281E
	/// @DnDArgument : "sound" "air_sound"
	/// @DnDArgument : "volume" "0"
	/// @DnDArgument : "time" "100"
	audio_sound_gain(air_sound, 0, 100);

	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 63B73CB2
	/// @DnDComment : // Exits this event as no new particles need to be drawn
	/// @DnDParent : 0AE1281E
	exit;
}

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 18E72381
/// @DnDComment : // Set up temp variables for the particle effects
/// @DnDInput : 4
/// @DnDArgument : "var" "_new_flame_particle"
/// @DnDArgument : "value" "-1"
/// @DnDArgument : "var_1" "_new_flame_glow"
/// @DnDArgument : "value_1" "-1"
/// @DnDArgument : "var_2" "_new_smoke_particle"
/// @DnDArgument : "value_2" "-1"
/// @DnDArgument : "var_3" "_new_shimmer_particle"
/// @DnDArgument : "value_3" "-1"
var _new_flame_particle = -1;
var _new_flame_glow = -1;
var _new_smoke_particle = -1;
var _new_shimmer_particle = -1;

/// @DnDAction : YoYo Games.Switch.Switch
/// @DnDVersion : 1
/// @DnDHash : 1B544256
/// @DnDComment : // Check the players states
/// @DnDArgument : "expr" "current_player_state"
var l1B544256_0 = current_player_state;
switch(l1B544256_0)
{
	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 325ABCB7
	/// @DnDComment : // When big jumping up
	/// @DnDParent : 1B544256
	/// @DnDArgument : "const" "PLAYER_STATE.FLY_BIG"
	case PLAYER_STATE.FLY_BIG:
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 2946C88E
		/// @DnDComment : // Checks if the right sound file is playing
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "expr" "audio_get_name(jet_sound) != "snd_jet_turbine""
		if(audio_get_name(jet_sound) != "snd_jet_turbine")
		{
			/// @DnDAction : YoYo Games.Audio.Stop_Audio
			/// @DnDVersion : 1
			/// @DnDHash : 7A598F70
			/// @DnDComment : // Stops the current sound
			/// @DnDParent : 2946C88E
			/// @DnDArgument : "soundid" "jet_sound"
			audio_stop_sound(jet_sound);
		
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 04D2630F
			/// @DnDComment : // Plays the correct sound
			/// @DnDParent : 2946C88E
			/// @DnDArgument : "target" "jet_sound"
			/// @DnDArgument : "soundid" "snd_jet_turbine"
			/// @DnDSaveInfo : "soundid" "snd_jet_turbine"
			jet_sound = audio_play_sound(snd_jet_turbine, 0, 0, 1.0, undefined, 1.0);
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 16BD7843
		/// @DnDParent : 325ABCB7
		else
		{
			/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
			/// @DnDVersion : 1.1
			/// @DnDHash : 547689AB
			/// @DnDComment : // Sets sound gain
			/// @DnDParent : 16BD7843
			/// @DnDArgument : "sound" "air_sound"
			audio_sound_gain(air_sound, 1, 0);
		}
	
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 0B014423
		/// @DnDComment : // Sets sound gain
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "sound" "jet_sound"
		audio_sound_gain(jet_sound, 1, 0);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 69CCB8F3
		/// @DnDComment : // Long flame press effect
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "expr" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
		/// @DnDArgument : "var" "_new_flame_particle"
		_new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2222C1F3
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "expr" "self"
		/// @DnDArgument : "var" "_new_flame_particle.owner"
		_new_flame_particle.owner = self;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 38985F8E
		/// @DnDInput : 2
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "function" "_new_flame_particle.set_particle"
		/// @DnDArgument : "arg" "ps_long_press_flame"
		/// @DnDArgument : "arg_1" ""StageBackEffects""
		_new_flame_particle.set_particle(ps_long_press_flame, "StageBackEffects");
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 79D74092
		/// @DnDInput : 2
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "function" "_new_flame_particle.set_offset"
		/// @DnDArgument : "arg" "5"
		/// @DnDArgument : "arg_1" "95"
		_new_flame_particle.set_offset(5, 95);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7DBCD705
		/// @DnDComment : // Flame glow effect
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "expr" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
		/// @DnDArgument : "var" "_new_flame_glow"
		_new_flame_glow = instance_create_layer(x, y, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 70C7F5AD
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "expr" "self"
		/// @DnDArgument : "var" "_new_flame_glow.owner"
		_new_flame_glow.owner = self;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 12C1417F
		/// @DnDInput : 2
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "function" "_new_flame_glow.set_particle"
		/// @DnDArgument : "arg" "ps_flame_glow"
		/// @DnDArgument : "arg_1" ""StageFrontEffects""
		_new_flame_glow.set_particle(ps_flame_glow, "StageFrontEffects");
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 1A61515D
		/// @DnDInput : 2
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "function" "_new_flame_glow.set_offset"
		/// @DnDArgument : "arg" "5"
		/// @DnDArgument : "arg_1" "95"
		_new_flame_glow.set_offset(5, 95);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 151113FA
		/// @DnDComment : // Long press smoke effect
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "expr" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
		/// @DnDArgument : "var" "_new_smoke_particle"
		_new_smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2F5D9FB1
		/// @DnDInput : 2
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "expr_1" "0.04"
		/// @DnDArgument : "var" "_new_smoke_particle.move_rate"
		/// @DnDArgument : "var_1" "_new_smoke_particle.drag_rate"
		_new_smoke_particle.move_rate = 0;
		_new_smoke_particle.drag_rate = 0.04;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 09AD4541
		/// @DnDInput : 2
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "function" "_new_smoke_particle.set_particle"
		/// @DnDArgument : "arg" "ps_long_press_smoke"
		/// @DnDArgument : "arg_1" ""StageFrontEffects""
		_new_smoke_particle.set_particle(ps_long_press_smoke, "StageFrontEffects");
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 3EAB6024
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "function" "_new_smoke_particle.set_angle"
		/// @DnDArgument : "arg" "180"
		_new_smoke_particle.set_angle(180);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 42447B9F
		/// @DnDInput : 2
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "function" "_new_smoke_particle.set_offset"
		/// @DnDArgument : "arg" "0"
		/// @DnDArgument : "arg_1" "100"
		_new_smoke_particle.set_offset(0, 100);
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 31B68D33
		/// @DnDComment : // Checks if game is in tutorial mode
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.TUTORIAL"
		if(obj_game_manager.current_game_state == GAME_STATE.TUTORIAL)
		{
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 69DA415F
			/// @DnDComment : // Exits as shimmers not needed
			/// @DnDParent : 31B68D33
			break;
		}
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 56742A69
		/// @DnDComment : // Sets shimmers to normal level
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "expr" "instance_create_layer(0, 0, "Stage", obj_particle_manager)"
		/// @DnDArgument : "var" "_new_shimmer_particle"
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 6A7E128D
		/// @DnDInput : 2
		/// @DnDParent : 325ABCB7
		/// @DnDArgument : "function" "_new_shimmer_particle.set_particle"
		/// @DnDArgument : "arg" "ps_glimmers"
		/// @DnDArgument : "arg_1" ""StageFrontEffects""
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 70798B6D
	/// @DnDComment : // When small jumping up
	/// @DnDParent : 1B544256
	/// @DnDArgument : "const" "PLAYER_STATE.FLY_SMALL"
	case PLAYER_STATE.FLY_SMALL:
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 14DBA258
		/// @DnDComment : // Checks if the right sound file is playing
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "expr" "audio_get_name(jet_sound) != "snd_jet_turbine""
		if(audio_get_name(jet_sound) != "snd_jet_turbine")
		{
			/// @DnDAction : YoYo Games.Audio.Stop_Audio
			/// @DnDVersion : 1
			/// @DnDHash : 2E7B3904
			/// @DnDComment : // Stops the current sound
			/// @DnDParent : 14DBA258
			/// @DnDArgument : "soundid" "jet_sound"
			audio_stop_sound(jet_sound);
		
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 4841C0B7
			/// @DnDComment : // Plays the correct sound
			/// @DnDParent : 14DBA258
			/// @DnDArgument : "target" "jet_sound"
			/// @DnDArgument : "soundid" "snd_jet_turbine"
			/// @DnDSaveInfo : "soundid" "snd_jet_turbine"
			jet_sound = audio_play_sound(snd_jet_turbine, 0, 0, 1.0, undefined, 1.0);
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 19460115
		/// @DnDParent : 70798B6D
		else
		{
			/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
			/// @DnDVersion : 1.1
			/// @DnDHash : 4FE171A4
			/// @DnDComment : // Sets sound gain
			/// @DnDParent : 19460115
			/// @DnDArgument : "sound" "air_sound"
			audio_sound_gain(air_sound, 1, 0);
		}
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 32CF7008
		/// @DnDComment : // Small press flame effect
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "expr" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
		/// @DnDArgument : "var" "_new_flame_particle"
		_new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6B975789
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "expr" "self"
		/// @DnDArgument : "var" "_new_flame_particle.owner"
		_new_flame_particle.owner = self;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 425522B7
		/// @DnDInput : 2
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "function" "_new_flame_particle.set_particle"
		/// @DnDArgument : "arg" "ps_short_press_flame"
		/// @DnDArgument : "arg_1" ""StageBackEffects""
		_new_flame_particle.set_particle(ps_short_press_flame, "StageBackEffects");
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 16939DCD
		/// @DnDInput : 2
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "function" "_new_flame_particle.set_offset"
		/// @DnDArgument : "arg" "5"
		/// @DnDArgument : "arg_1" "95"
		_new_flame_particle.set_offset(5, 95);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3977084D
		/// @DnDComment : // Flame glow effect
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "expr" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
		/// @DnDArgument : "var" "_new_flame_glow"
		_new_flame_glow = instance_create_layer(x, y, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 68B3E4C7
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "expr" "self"
		/// @DnDArgument : "var" "_new_flame_glow.owner"
		_new_flame_glow.owner = self;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 080922CA
		/// @DnDInput : 2
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "function" "_new_flame_glow.set_particle"
		/// @DnDArgument : "arg" "ps_flame_glow"
		/// @DnDArgument : "arg_1" ""StageFrontEffects""
		_new_flame_glow.set_particle(ps_flame_glow, "StageFrontEffects");
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 162BB598
		/// @DnDInput : 2
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "function" "_new_flame_glow.set_offset"
		/// @DnDArgument : "arg" "5"
		/// @DnDArgument : "arg_1" "95"
		_new_flame_glow.set_offset(5, 95);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 29001618
		/// @DnDComment : // Smoke particle effect
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "expr" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
		/// @DnDArgument : "var" "_new_smoke_particle"
		_new_smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1C20D6C9
		/// @DnDInput : 2
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "expr_1" "0.04"
		/// @DnDArgument : "var" "_new_smoke_particle.move_rate"
		/// @DnDArgument : "var_1" "_new_smoke_particle.drag_rate"
		_new_smoke_particle.move_rate = 0;
		_new_smoke_particle.drag_rate = 0.04;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 2526D1DD
		/// @DnDInput : 2
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "function" "_new_smoke_particle.set_particle"
		/// @DnDArgument : "arg" "ps_short_press_smoke"
		/// @DnDArgument : "arg_1" ""StageFrontEffects""
		_new_smoke_particle.set_particle(ps_short_press_smoke, "StageFrontEffects");
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 1CB069BC
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "function" "_new_smoke_particle.set_angle"
		/// @DnDArgument : "arg" "180"
		_new_smoke_particle.set_angle(180);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 3F2F6E46
		/// @DnDInput : 2
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "function" "_new_smoke_particle.set_offset"
		/// @DnDArgument : "arg" "0"
		/// @DnDArgument : "arg_1" "100"
		_new_smoke_particle.set_offset(0, 100);
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 3733EE21
		/// @DnDComment : // Checks if game is in tutorial mode
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.TUTORIAL"
		if(obj_game_manager.current_game_state == GAME_STATE.TUTORIAL)
		{
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 6BD761B6
			/// @DnDComment : // Exits as shimmers not needed
			/// @DnDParent : 3733EE21
			break;
		}
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5C12AC11
		/// @DnDComment : // Sets shimmers to normal level
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "expr" "instance_create_layer(0, 0, "Stage", obj_particle_manager)"
		/// @DnDArgument : "var" "_new_shimmer_particle"
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 71F753B9
		/// @DnDInput : 2
		/// @DnDParent : 70798B6D
		/// @DnDArgument : "function" "_new_shimmer_particle.set_particle"
		/// @DnDArgument : "arg" "ps_glimmers"
		/// @DnDArgument : "arg_1" ""StageFrontEffects""
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 1E67EB82
	/// @DnDComment : // When boosting
	/// @DnDParent : 1B544256
	/// @DnDArgument : "const" "PLAYER_STATE.BOOST"
	case PLAYER_STATE.BOOST:
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 46DFDA6E
		/// @DnDComment : // Checks if the right sound file is playing
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "expr" "audio_get_name(jet_sound) != "snd_jet_speed""
		if(audio_get_name(jet_sound) != "snd_jet_speed")
		{
			/// @DnDAction : YoYo Games.Audio.Stop_Audio
			/// @DnDVersion : 1
			/// @DnDHash : 5381DCFD
			/// @DnDComment : // Stops the current sound
			/// @DnDParent : 46DFDA6E
			/// @DnDArgument : "soundid" "jet_sound"
			audio_stop_sound(jet_sound);
		
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 710CC141
			/// @DnDComment : // Plays the correct sound
			/// @DnDParent : 46DFDA6E
			/// @DnDArgument : "target" "jet_sound"
			/// @DnDArgument : "soundid" "snd_jet_speed"
			/// @DnDSaveInfo : "soundid" "snd_jet_speed"
			jet_sound = audio_play_sound(snd_jet_speed, 0, 0, 1.0, undefined, 1.0);
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 760BFD6A
		/// @DnDParent : 1E67EB82
		else
		{
			/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
			/// @DnDVersion : 1.1
			/// @DnDHash : 2C179BCF
			/// @DnDComment : // Sets sound gain
			/// @DnDParent : 760BFD6A
			/// @DnDArgument : "sound" "air_sound"
			audio_sound_gain(air_sound, 1, 0);
		}
	
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 13B2D110
		/// @DnDComment : // Creates speed boosting aura effect
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "var" "_new_aura_particle"
		/// @DnDArgument : "value" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
		var _new_aura_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 52225F1A
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "expr" "self"
		/// @DnDArgument : "var" "_new_aura_particle.owner"
		_new_aura_particle.owner = self;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 6F728C15
		/// @DnDInput : 2
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "function" "_new_aura_particle.set_particle"
		/// @DnDArgument : "arg" "ps_speed_booster_aura"
		/// @DnDArgument : "arg_1" ""StageFrontEffects""
		_new_aura_particle.set_particle(ps_speed_booster_aura, "StageFrontEffects");
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 5D4A34B1
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "function" "_new_aura_particle.set_angle"
		/// @DnDArgument : "arg" "270"
		_new_aura_particle.set_angle(270);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 7372E612
		/// @DnDInput : 2
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "function" "_new_aura_particle.set_offset"
		/// @DnDArgument : "arg" "-140"
		/// @DnDArgument : "arg_1" "10"
		_new_aura_particle.set_offset(-140, 10);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 558EF99F
		/// @DnDComment : // Creates speed boosting flame effect
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "expr" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
		/// @DnDArgument : "var" "_new_flame_particle"
		_new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0AB9A509
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "expr" "self"
		/// @DnDArgument : "var" "_new_flame_particle.owner"
		_new_flame_particle.owner = self;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 21C9ADBD
		/// @DnDInput : 2
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "function" "_new_flame_particle.set_particle"
		/// @DnDArgument : "arg" "ps_speed_booster_flame"
		/// @DnDArgument : "arg_1" ""StageBackEffects""
		_new_flame_particle.set_particle(ps_speed_booster_flame, "StageBackEffects");
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 130157DE
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "function" "_new_flame_particle.set_angle"
		/// @DnDArgument : "arg" "270"
		_new_flame_particle.set_angle(270);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 22CB2BC7
		/// @DnDInput : 2
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "function" "_new_flame_particle.set_offset"
		/// @DnDArgument : "arg" "-100	"
		/// @DnDArgument : "arg_1" "30"
		_new_flame_particle.set_offset(-100	, 30);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7765F933
		/// @DnDComment : // Creates speed boosting smoke effect
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "expr" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
		/// @DnDArgument : "var" "_new_smoke_particle"
		_new_smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3489E96B
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "expr" "self"
		/// @DnDArgument : "var" "_new_smoke_particle.owner"
		_new_smoke_particle.owner = self;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 5D6FEDF1
		/// @DnDInput : 2
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "function" "_new_smoke_particle.set_particle"
		/// @DnDArgument : "arg" "ps_speed_booster_smoke"
		/// @DnDArgument : "arg_1" ""StageFrontEffects""
		_new_smoke_particle.set_particle(ps_speed_booster_smoke, "StageFrontEffects");
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 10C12CB2
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "function" "_new_smoke_particle.set_angle"
		/// @DnDArgument : "arg" "90"
		_new_smoke_particle.set_angle(90);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 1D87BE2B
		/// @DnDInput : 2
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "function" "_new_smoke_particle.set_offset"
		/// @DnDArgument : "arg" "-100"
		/// @DnDArgument : "arg_1" "30"
		_new_smoke_particle.set_offset(-100, 30);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1255A07F
		/// @DnDComment : // Creates intense shimmmering effect
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "expr" "instance_create_layer(0, 0, "Stage", obj_particle_manager)"
		/// @DnDArgument : "var" "_new_shimmer_particle"
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 5C3BC027
		/// @DnDInput : 2
		/// @DnDParent : 1E67EB82
		/// @DnDArgument : "function" "_new_shimmer_particle.set_particle"
		/// @DnDArgument : "arg" "ps_glimmers_intense"
		/// @DnDArgument : "arg_1" ""StageFrontEffects""
		_new_shimmer_particle.set_particle(ps_glimmers_intense, "StageFrontEffects");
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 790A7E49
	/// @DnDComment : // When player is normal running
	/// @DnDParent : 1B544256
	/// @DnDArgument : "const" "PLAYER_STATE.RUN"
	case PLAYER_STATE.RUN:
		/// @DnDAction : YoYo Games.Audio.Stop_Audio
		/// @DnDVersion : 1
		/// @DnDHash : 3BC9F602
		/// @DnDComment : // Sets sound gain to 0 and resets jet sound
		/// @DnDParent : 790A7E49
		/// @DnDArgument : "soundid" "jet_sound"
		audio_stop_sound(jet_sound);
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 36051948
		/// @DnDParent : 790A7E49
		/// @DnDArgument : "target" "jet_sound"
		/// @DnDArgument : "soundid" "snd_jet_air"
		/// @DnDArgument : "loop" "1"
		/// @DnDArgument : "gain" "0"
		/// @DnDSaveInfo : "soundid" "snd_jet_air"
		jet_sound = audio_play_sound(snd_jet_air, 0, 1, 0, undefined, 1.0);
	
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 5AC980AC
		/// @DnDParent : 790A7E49
		/// @DnDArgument : "sound" "air_sound"
		/// @DnDArgument : "volume" "0"
		audio_sound_gain(air_sound, 0, 0);
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 10F34EBB
		/// @DnDComment : // If the player is running fast enough (more than 5%)
		/// @DnDParent : 790A7E49
		/// @DnDArgument : "var" "obj_game_manager.current_speed_percentage"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "0.05"
		if(obj_game_manager.current_speed_percentage > 0.05)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6C30E09F
			/// @DnDComment : // Create running dust effect
			/// @DnDParent : 10F34EBB
			/// @DnDArgument : "expr" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
			/// @DnDArgument : "var" "_new_smoke_particle"
			_new_smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1B3407FE
			/// @DnDInput : 2
			/// @DnDParent : 10F34EBB
			/// @DnDArgument : "expr_1" "0.005"
			/// @DnDArgument : "var" "_new_smoke_particle.move_rate"
			/// @DnDArgument : "var_1" "_new_smoke_particle.drag_rate"
			_new_smoke_particle.move_rate = 0;
			_new_smoke_particle.drag_rate = 0.005;
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 4D7D1C5B
			/// @DnDInput : 2
			/// @DnDParent : 10F34EBB
			/// @DnDArgument : "function" "_new_smoke_particle.set_particle"
			/// @DnDArgument : "arg" "ps_run_dust"
			/// @DnDArgument : "arg_1" ""StageBackEffects""
			_new_smoke_particle.set_particle(ps_run_dust, "StageBackEffects");
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 0F2FFC3B
			/// @DnDInput : 2
			/// @DnDParent : 10F34EBB
			/// @DnDArgument : "function" "_new_smoke_particle.set_offset"
			/// @DnDArgument : "arg" "-10"
			/// @DnDArgument : "arg_1" "85"
			_new_smoke_particle.set_offset(-10, 85);
		}
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 2DB88A4B
		/// @DnDComment : // When the game is not in the tutorial
		/// @DnDParent : 790A7E49
		/// @DnDArgument : "expr" "obj_game_manager.current_game_state != GAME_STATE.TUTORIAL"
		if(obj_game_manager.current_game_state != GAME_STATE.TUTORIAL)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 53F66693
			/// @DnDComment : // Create the shimmering effect
			/// @DnDParent : 2DB88A4B
			/// @DnDArgument : "expr" "instance_create_layer(0, 0, "Stage", obj_particle_manager)"
			/// @DnDArgument : "var" "_new_shimmer_particle"
			_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 55529D6F
			/// @DnDInput : 2
			/// @DnDParent : 2DB88A4B
			/// @DnDArgument : "function" "_new_shimmer_particle.set_particle"
			/// @DnDArgument : "arg" "ps_glimmers"
			/// @DnDArgument : "arg_1" ""StageFrontEffects""
			_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		}
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 4E5583D3
		/// @DnDComment : // Checks the for step frame and step hasnt played for the step
		/// @DnDParent : 790A7E49
		/// @DnDArgument : "expr" "!has_stepped && (round(image_index) == 2 || round(image_index) == 7)"
		if(!has_stepped && (round(image_index) == 2 || round(image_index) == 7))
		{
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 055F5B9D
			/// @DnDComment : // Chooses a random footstep
			/// @DnDParent : 4E5583D3
			/// @DnDArgument : "var" "_footstep"
			/// @DnDArgument : "value" "choose(snd_chicken_footstep_1, snd_chicken_footstep_2, snd_chicken_footstep_3, snd_chicken_footstep_4, snd_chicken_footstep_5, snd_chicken_footstep_6, snd_chicken_footstep_7)"
			var _footstep = choose(snd_chicken_footstep_1, snd_chicken_footstep_2, snd_chicken_footstep_3, snd_chicken_footstep_4, snd_chicken_footstep_5, snd_chicken_footstep_6, snd_chicken_footstep_7);
		
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 4B378ED6
			/// @DnDComment : // Plays the footstep sound
			/// @DnDParent : 4E5583D3
			/// @DnDArgument : "soundid" "_footstep"
			audio_play_sound(_footstep, 0, 0, 1.0, undefined, 1.0);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 044367FE
			/// @DnDComment : // Sets step state to true
			/// @DnDParent : 4E5583D3
			/// @DnDArgument : "expr" "true"
			/// @DnDArgument : "var" "has_stepped"
			has_stepped = true;
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 023FE92A
		/// @DnDParent : 790A7E49
		else
		{
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 30634C87
			/// @DnDComment : // Checks is not currently on a step frame
			/// @DnDParent : 023FE92A
			/// @DnDArgument : "expr" "round(image_index) == 2 || round(image_index) == 7"
			/// @DnDArgument : "not" "1"
			if(!(round(image_index) == 2 || round(image_index) == 7))
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 647D34CF
				/// @DnDComment : // Sets step state to false
				/// @DnDParent : 30634C87
				/// @DnDArgument : "expr" "false"
				/// @DnDArgument : "var" "has_stepped"
				has_stepped = false;
			}
		}
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 679A238E
	/// @DnDComment : // When the player is idle
	/// @DnDParent : 1B544256
	/// @DnDArgument : "const" "PLAYER_STATE.IDLE"
	case PLAYER_STATE.IDLE:
		/// @DnDAction : YoYo Games.Audio.Stop_Audio
		/// @DnDVersion : 1
		/// @DnDHash : 75EB9A45
		/// @DnDComment : // Sets sound gain to 0 and resets jet sound
		/// @DnDParent : 679A238E
		/// @DnDArgument : "soundid" "jet_sound"
		audio_stop_sound(jet_sound);
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 5C55CE20
		/// @DnDParent : 679A238E
		/// @DnDArgument : "target" "jet_sound"
		/// @DnDArgument : "soundid" "snd_jet_air"
		/// @DnDArgument : "loop" "1"
		/// @DnDArgument : "gain" "0"
		/// @DnDSaveInfo : "soundid" "snd_jet_air"
		jet_sound = audio_play_sound(snd_jet_air, 0, 1, 0, undefined, 1.0);
	
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 1B21DF35
		/// @DnDParent : 679A238E
		/// @DnDArgument : "sound" "air_sound"
		/// @DnDArgument : "volume" "0"
		audio_sound_gain(air_sound, 0, 0);
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 40045376
		/// @DnDComment : // Game is not in tutorial
		/// @DnDParent : 679A238E
		/// @DnDArgument : "expr" "obj_game_manager.current_game_state != GAME_STATE.TUTORIAL"
		if(obj_game_manager.current_game_state != GAME_STATE.TUTORIAL)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 130A3DD9
			/// @DnDComment : // Create the shimmering effect
			/// @DnDParent : 40045376
			/// @DnDArgument : "expr" "instance_create_layer(0, 0, "Stage", obj_particle_manager)"
			/// @DnDArgument : "var" "_new_shimmer_particle"
			_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 4E6D36A4
			/// @DnDInput : 2
			/// @DnDParent : 40045376
			/// @DnDArgument : "function" "_new_shimmer_particle.set_particle"
			/// @DnDArgument : "arg" "ps_glimmers"
			/// @DnDArgument : "arg_1" ""StageFrontEffects""
			_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		}
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 05924F40
	/// @DnDComment : // When the player has released the fly button
	/// @DnDParent : 1B544256
	/// @DnDArgument : "const" "PLAYER_STATE.FLY_RELEASED"
	case PLAYER_STATE.FLY_RELEASED:
		/// @DnDAction : YoYo Games.Audio.Stop_Audio
		/// @DnDVersion : 1
		/// @DnDHash : 036245FC
		/// @DnDComment : // Sets sound gain to 0 and resets jet sound
		/// @DnDParent : 05924F40
		/// @DnDArgument : "soundid" "jet_sound"
		audio_stop_sound(jet_sound);
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 2D7D58F1
		/// @DnDParent : 05924F40
		/// @DnDArgument : "target" "jet_sound"
		/// @DnDArgument : "soundid" "snd_jet_air"
		/// @DnDArgument : "loop" "1"
		/// @DnDArgument : "gain" "0"
		/// @DnDSaveInfo : "soundid" "snd_jet_air"
		jet_sound = audio_play_sound(snd_jet_air, 0, 1, 0, undefined, 1.0);
	
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 08C3C28D
		/// @DnDParent : 05924F40
		/// @DnDArgument : "sound" "air_sound"
		/// @DnDArgument : "volume" "0"
		audio_sound_gain(air_sound, 0, 0);
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 34F45956
		/// @DnDComment : // Game is not in tutorial
		/// @DnDParent : 05924F40
		/// @DnDArgument : "expr" "obj_game_manager.current_game_state != GAME_STATE.TUTORIAL"
		if(obj_game_manager.current_game_state != GAME_STATE.TUTORIAL)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 4688AF4F
			/// @DnDComment : // Create the shimmering effect
			/// @DnDParent : 34F45956
			/// @DnDArgument : "expr" "instance_create_layer(0, 0, "Stage", obj_particle_manager)"
			/// @DnDArgument : "var" "_new_shimmer_particle"
			_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 69261121
			/// @DnDInput : 2
			/// @DnDParent : 34F45956
			/// @DnDArgument : "function" "_new_shimmer_particle.set_particle"
			/// @DnDArgument : "arg" "ps_glimmers"
			/// @DnDArgument : "arg_1" ""StageFrontEffects""
			_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		}
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 0D6F7A54
	/// @DnDComment : // When the player is dying
	/// @DnDParent : 1B544256
	/// @DnDArgument : "const" "PLAYER_STATE.DEATH"
	case PLAYER_STATE.DEATH:
		/// @DnDAction : YoYo Games.Audio.Stop_Audio
		/// @DnDVersion : 1
		/// @DnDHash : 04F2D8A6
		/// @DnDComment : // Sets sound gain to 0 and resets jet sound
		/// @DnDParent : 0D6F7A54
		/// @DnDArgument : "soundid" "jet_sound"
		audio_stop_sound(jet_sound);
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 56A429C1
		/// @DnDParent : 0D6F7A54
		/// @DnDArgument : "target" "jet_sound"
		/// @DnDArgument : "soundid" "snd_jet_air"
		/// @DnDArgument : "loop" "1"
		/// @DnDArgument : "gain" "0"
		/// @DnDSaveInfo : "soundid" "snd_jet_air"
		jet_sound = audio_play_sound(snd_jet_air, 0, 1, 0, undefined, 1.0);
	
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 73873E32
		/// @DnDParent : 0D6F7A54
		/// @DnDArgument : "sound" "air_sound"
		/// @DnDArgument : "volume" "0"
		audio_sound_gain(air_sound, 0, 0);
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 1A5D527F
		/// @DnDComment : // If the game has ended
		/// @DnDParent : 0D6F7A54
		/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.ENDED"
		if(obj_game_manager.current_game_state == GAME_STATE.ENDED)
		{
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 529516D5
			/// @DnDComment : // Exits without shimmers
			/// @DnDParent : 1A5D527F
			break;
		}
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4B2AF4D7
		/// @DnDComment : // Create shimmers as player is technically still moving
		/// @DnDParent : 0D6F7A54
		/// @DnDArgument : "expr" "instance_create_layer(0, 0, "Stage", obj_particle_manager)"
		/// @DnDArgument : "var" "_new_shimmer_particle"
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 1A2F8DF5
		/// @DnDInput : 2
		/// @DnDParent : 0D6F7A54
		/// @DnDArgument : "function" "_new_shimmer_particle.set_particle"
		/// @DnDArgument : "arg" "ps_glimmers"
		/// @DnDArgument : "arg_1" ""StageFrontEffects""
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		break;
}