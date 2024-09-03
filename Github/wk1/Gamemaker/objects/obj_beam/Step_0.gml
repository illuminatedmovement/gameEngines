/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 1C5C277C
/// @DnDComment : // Checks the game is not paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
/// @DnDArgument : "not" "1"
if(!(obj_game_manager.current_game_state == GAME_STATE.PAUSED))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0A63EF8D
	/// @DnDParent : 1C5C277C
	/// @DnDArgument : "expr" "- (obj_game_manager.current_speed * 1.0)"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "x"
	x += - (obj_game_manager.current_speed * 1.0);

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0699AC29
	/// @DnDComment : // Creates a particle emitter manager object at top position and sets the beam effect for it
	/// @DnDParent : 1C5C277C
	/// @DnDArgument : "var" "_beam_top_particle"
	/// @DnDArgument : "value" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
	var _beam_top_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2ED5975D
	/// @DnDParent : 1C5C277C
	/// @DnDArgument : "expr" "self"
	/// @DnDArgument : "var" "_beam_top_particle.owner"
	_beam_top_particle.owner = self;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 47E310CE
	/// @DnDInput : 2
	/// @DnDParent : 1C5C277C
	/// @DnDArgument : "function" "_beam_top_particle.set_particle"
	/// @DnDArgument : "arg" "ps_enemy_laser"
	/// @DnDArgument : "arg_1" ""StageFrontEffects""
	_beam_top_particle.set_particle(ps_enemy_laser, "StageFrontEffects");

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 3BDE8D70
	/// @DnDParent : 1C5C277C
	/// @DnDArgument : "function" "_beam_top_particle.set_angle"
	/// @DnDArgument : "arg" "180"
	_beam_top_particle.set_angle(180);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 08DC9D9E
	/// @DnDInput : 2
	/// @DnDParent : 1C5C277C
	/// @DnDArgument : "function" "_beam_top_particle.set_offset"
	/// @DnDArgument : "arg" "0"
	/// @DnDArgument : "arg_1" "-128"
	_beam_top_particle.set_offset(0, -128);

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2DF488BC
	/// @DnDComment : // Creates a particle emitter manager object at low position and sets the beam effect for it
	/// @DnDParent : 1C5C277C
	/// @DnDArgument : "var" "_beam_bottom_particle"
	/// @DnDArgument : "value" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
	var _beam_bottom_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 202B001D
	/// @DnDParent : 1C5C277C
	/// @DnDArgument : "expr" "self"
	/// @DnDArgument : "var" "_beam_bottom_particle.owner"
	_beam_bottom_particle.owner = self;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 2B5925AE
	/// @DnDInput : 2
	/// @DnDParent : 1C5C277C
	/// @DnDArgument : "function" "_beam_bottom_particle.set_particle"
	/// @DnDArgument : "arg" "ps_enemy_laser"
	/// @DnDArgument : "arg_1" ""StageFrontEffects""
	_beam_bottom_particle.set_particle(ps_enemy_laser, "StageFrontEffects");

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 77945BE2
	/// @DnDParent : 1C5C277C
	/// @DnDArgument : "function" "_beam_bottom_particle.set_angle"
	/// @DnDArgument : "arg" "0"
	_beam_bottom_particle.set_angle(0);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 0EF7FA15
	/// @DnDInput : 2
	/// @DnDParent : 1C5C277C
	/// @DnDArgument : "function" "_beam_bottom_particle.set_offset"
	/// @DnDArgument : "arg" "0"
	/// @DnDArgument : "arg_1" "+128"
	_beam_bottom_particle.set_offset(0, +128);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7B158B12
	/// @DnDComment : // Checks if the beam has gone offscreen to the left
	/// @DnDParent : 1C5C277C
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "-59"
	if(x < -59)
	{
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 166D131F
		/// @DnDComment : // Destroys the beam
		/// @DnDParent : 7B158B12
		instance_destroy();
	}

	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 0CB1A3C2
	/// @DnDComment : // Plays the animation normally
	/// @DnDParent : 1C5C277C
	image_speed = 1;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 0D544AF1
else
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 03BBCD30
	/// @DnDComment : // Pauses the animation
	/// @DnDParent : 0D544AF1
	/// @DnDArgument : "speed" "0"
	image_speed = 0;
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 72FE7049
/// @DnDComment : // Checks the game is playing
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PLAYING"
if(obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3F9B6735
	/// @DnDComment : // Checks if the beam is to the right of the player
	/// @DnDParent : 72FE7049
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "op" "2"
	/// @DnDArgument : "value" "obj_player.x"
	if(x > obj_player.x)
	{
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 781DD97D
		/// @DnDComment : // Scales the gain by the distance between player and beam to the room width
		/// @DnDParent : 3F9B6735
		/// @DnDArgument : "sound" "beam_sound"
		/// @DnDArgument : "volume" "1.0 - clamp(abs(x - obj_player.x) / room_width, 0.0, 1.0)"
		audio_sound_gain(beam_sound, 1.0 - clamp(abs(x - obj_player.x) / room_width, 0.0, 1.0), 0);
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 4C4C536F
	/// @DnDParent : 72FE7049
	else
	{
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 47CEE079
		/// @DnDComment : // Scales the gain by the distance between player and beam to a fraction of the room width
		/// @DnDParent : 4C4C536F
		/// @DnDArgument : "sound" "beam_sound"
		/// @DnDArgument : "volume" "1.0 - clamp(abs(x - obj_player.x) / (room_width * 0.33), 0.0, 1.0)"
		audio_sound_gain(beam_sound, 1.0 - clamp(abs(x - obj_player.x) / (room_width * 0.33), 0.0, 1.0), 0);
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 743F7FCE
else
{
	/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
	/// @DnDVersion : 1.1
	/// @DnDHash : 49871D81
	/// @DnDComment : // Fades out the beam sounds
	/// @DnDParent : 743F7FCE
	/// @DnDArgument : "sound" "beam_sound"
	/// @DnDArgument : "volume" "0"
	/// @DnDArgument : "time" "3000"
	audio_sound_gain(beam_sound, 0, 3000);
}