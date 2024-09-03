/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6307F0F6
/// @DnDComment : // Sets the inital player position
/// @DnDArgument : "expr" "640"
/// @DnDArgument : "var" "x"
x = 640;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 71C42DB2
/// @DnDArgument : "expr" "840"
/// @DnDArgument : "var" "y"
y = 840;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3C114147
/// @DnDComment : // Sets the start y value to y
/// @DnDArgument : "expr" "y"
/// @DnDArgument : "var" "ystart"
ystart = y;

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 47FAC5FD
/// @DnDComment : // Enum states used for the player
/// @DnDArgument : "code" "// Enum states used for the player$(13_10)enum PLAYER_STATE$(13_10){$(13_10)	IDLE,$(13_10)	RUN,$(13_10)	FLY_SMALL,$(13_10)	FLY_BIG,$(13_10)	FLY_RELEASED,$(13_10)	BOOST,$(13_10)	DEATH$(13_10)}"
// Enum states used for the player
enum PLAYER_STATE
{
	IDLE,
	RUN,
	FLY_SMALL,
	FLY_BIG,
	FLY_RELEASED,
	BOOST,
	DEATH
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5E6DE294
/// @DnDComment : // Sets the players current state
/// @DnDArgument : "expr" "PLAYER_STATE.RUN"
/// @DnDArgument : "var" "current_player_state"
current_player_state = PLAYER_STATE.RUN;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 76DC0365
/// @DnDComment : // Variables used for the players movement
/// @DnDInput : 4
/// @DnDArgument : "expr" "110"
/// @DnDArgument : "expr_1" "10"
/// @DnDArgument : "expr_2" "0.8"
/// @DnDArgument : "expr_3" "0.0"
/// @DnDArgument : "var" "jump_strength"
/// @DnDArgument : "var_1" "jump_threshold"
/// @DnDArgument : "var_2" "gravity_strength"
/// @DnDArgument : "var_3" "y_velo"
jump_strength = 110;
jump_threshold = 10;
gravity_strength = 0.8;
y_velo = 0.0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 374D4921
/// @DnDComment : // Boosting variables
/// @DnDInput : 2
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "is_boosting"
/// @DnDArgument : "var_1" "boost_cooldown"
is_boosting = false;
boost_cooldown = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 545F7965
/// @DnDComment : // Jump state
/// @DnDArgument : "var" "has_jumped"
has_jumped = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 58047C20
/// @DnDComment : // Footstep state
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "has_stepped"
has_stepped = false;

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 5E8F4CD5
/// @DnDComment : // Plays jet sound with no gain
/// @DnDArgument : "target" "jet_sound"
/// @DnDArgument : "soundid" "snd_jet_turbine"
/// @DnDArgument : "gain" "0.0"
/// @DnDSaveInfo : "soundid" "snd_jet_turbine"
jet_sound = audio_play_sound(snd_jet_turbine, 0, 0, 0.0, undefined, 1.0);

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 7A938CBB
/// @DnDComment : // Plays air sound with no gain
/// @DnDArgument : "target" "air_sound"
/// @DnDArgument : "soundid" "snd_jet_air"
/// @DnDArgument : "loop" "1"
/// @DnDArgument : "gain" "0.0"
/// @DnDSaveInfo : "soundid" "snd_jet_air"
air_sound = audio_play_sound(snd_jet_air, 0, 1, 0.0, undefined, 1.0);

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 67CB7F12
/// @DnDComment : // Creates a shadow to follow the player with the owner and offset setup to the player
/// @DnDArgument : "var" "_shadow"
/// @DnDArgument : "value" "instance_create_layer(x, y, "StageShadows", obj_shadow)"
var _shadow = instance_create_layer(x, y, "StageShadows", obj_shadow);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 52FE92B4
/// @DnDArgument : "expr" "self"
/// @DnDArgument : "var" "_shadow.owner"
_shadow.owner = self;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 063F581D
/// @DnDArgument : "function" "_shadow.set_y_offset"
/// @DnDArgument : "arg" "100"
_shadow.set_y_offset(100);

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 7AEE1A72
/// @DnDComment : // Function used when the player is hit by an enemy
/// @DnDArgument : "funcName" "kill_player"
function kill_player() 
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 532E162B
	/// @DnDComment : // Checks the game is playing
	/// @DnDParent : 7AEE1A72
	/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PLAYING"
	if(obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 0203F857
		/// @DnDComment : // Checks if a shield object exists within the room
		/// @DnDParent : 532E162B
		/// @DnDArgument : "expr" "instance_exists(obj_shield)"
		if(instance_exists(obj_shield))
		{
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 744751EE
			/// @DnDComment : // Plays shield break sound
			/// @DnDDisabled : 1
			/// @DnDParent : 0203F857
			/// @DnDArgument : "soundid" "snd_force_field_impact"
			/// @DnDSaveInfo : "soundid" "snd_force_field_impact"
		
		
			/// @DnDAction : YoYo Games.Common.Apply_To
			/// @DnDVersion : 1
			/// @DnDHash : 2DBF95E4
			/// @DnDComment : // With that (and all) shields
			/// @DnDApplyTo : {obj_shield}
			/// @DnDParent : 0203F857
			with(obj_shield) {
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 75689184
				/// @DnDComment : // Set their life to 0 so they die
				/// @DnDParent : 2DBF95E4
				/// @DnDArgument : "var" "life"
				life = 0;
			
				/// @DnDAction : YoYo Games.Common.Exit_Event
				/// @DnDVersion : 1
				/// @DnDHash : 00E71E19
				/// @DnDParent : 2DBF95E4
				exit;
			}
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 424115D0
		/// @DnDParent : 532E162B
		else
		{
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 6DC8E485
			/// @DnDComment : // Plays death sound
			/// @DnDParent : 424115D0
			/// @DnDArgument : "soundid" "snd_chicken_death"
			/// @DnDSaveInfo : "soundid" "snd_chicken_death"
			audio_play_sound(snd_chicken_death, 0, 0, 1.0, undefined, 1.0);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 78170573
			/// @DnDComment : // Sets the player to die
			/// @DnDParent : 424115D0
			/// @DnDArgument : "expr" "GAME_STATE.DYING"
			/// @DnDArgument : "var" "obj_game_manager.current_game_state"
			obj_game_manager.current_game_state = GAME_STATE.DYING;
		
			/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
			/// @DnDVersion : 1.1
			/// @DnDHash : 498AE6B8
			/// @DnDComment : // Lowers the music
			/// @DnDParent : 424115D0
			/// @DnDArgument : "sound" "global.music"
			/// @DnDArgument : "volume" "0.1"
			/// @DnDArgument : "time" "3000"
			audio_sound_gain(global.music, 0.1, 3000);
		
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 7F152CF2
			/// @DnDComment : // Creates a boom particle effect by using a manager object
			/// @DnDParent : 424115D0
			/// @DnDArgument : "var" "_boom_particle"
			/// @DnDArgument : "value" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
			var _boom_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6F3EDC79
			/// @DnDParent : 424115D0
			/// @DnDArgument : "expr" "self"
			/// @DnDArgument : "var" "_boom_particle.owner"
			_boom_particle.owner = self;
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 257A47CE
			/// @DnDInput : 2
			/// @DnDParent : 424115D0
			/// @DnDArgument : "function" "_boom_particle.set_particle"
			/// @DnDArgument : "arg" "ps_defeat"
			/// @DnDArgument : "arg_1" ""StageEffects""
			_boom_particle.set_particle(ps_defeat, "StageEffects");
		
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 7F0DD347
			/// @DnDComment : // Sets the player to a temp variable
			/// @DnDParent : 424115D0
			/// @DnDArgument : "var" "_player"
			/// @DnDArgument : "value" "self"
			var _player = self;
		
			/// @DnDAction : YoYo Games.Common.Apply_To
			/// @DnDVersion : 1
			/// @DnDHash : 64ECB406
			/// @DnDComment : // Checks with all shadows in the room
			/// @DnDApplyTo : {obj_shadow}
			/// @DnDParent : 424115D0
			with(obj_shadow) {
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 094DFE58
				/// @DnDComment : // If the player is the owner
				/// @DnDParent : 64ECB406
				/// @DnDArgument : "expr" "owner == _player"
				if(owner == _player)
				{
					/// @DnDAction : YoYo Games.Common.Function_Call
					/// @DnDVersion : 1
					/// @DnDHash : 78DDFF28
					/// @DnDComment : // Call fade out function
					/// @DnDParent : 094DFE58
					/// @DnDArgument : "function" "fade_out"
					/// @DnDArgument : "arg" "2.2"
					fade_out(2.2);
				}
			}
		}
	}
}