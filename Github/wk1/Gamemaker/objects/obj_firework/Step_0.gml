/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 0D0442A3
/// @DnDComment : // Checks the game is not currently paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
/// @DnDArgument : "not" "1"
if(!(obj_game_manager.current_game_state == GAME_STATE.PAUSED))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3A3BEB71
	/// @DnDComment : // Set the x position to move at the games current speed
	/// @DnDParent : 0D0442A3
	/// @DnDArgument : "expr" "-obj_game_manager.current_speed"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "x"
	x += -obj_game_manager.current_speed;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4EF7A063
	/// @DnDComment : // Speeds up the fireworks rocket speed
	/// @DnDParent : 0D0442A3
	/// @DnDArgument : "expr" "fire_speed * 1.005"
	/// @DnDArgument : "var" "fire_speed"
	fire_speed = fire_speed * 1.005;

	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 372BE457
	/// @DnDComment : // Sets the speed to the new fire speed (done this was to retain the current value if paused)
	/// @DnDParent : 0D0442A3
	/// @DnDArgument : "speed" "fire_speed"
	speed = fire_speed;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5C4D2AAF
	/// @DnDComment : // Adds time to the time alive
	/// @DnDParent : 0D0442A3
	/// @DnDArgument : "expr" "delta_time * 0.000001"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "life"
	life += delta_time * 0.000001;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3946FE47
	/// @DnDComment : // Checks if the firework has been alive for longer than the delay attached so visually only appears after a set time
	/// @DnDParent : 0D0442A3
	/// @DnDArgument : "var" "life"
	/// @DnDArgument : "op" "2"
	/// @DnDArgument : "value" "delay"
	if(life > delay)
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 051E067C
		/// @DnDComment : // Creates a new particle effect for the trail
		/// @DnDParent : 3946FE47
		/// @DnDArgument : "function" "create_ps"
		/// @DnDArgument : "arg" "trail_ps"
		create_ps(trail_ps);
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7AFB2C02
	/// @DnDComment : // Checks if the firework has been alive long enough for its final explosion
	/// @DnDParent : 0D0442A3
	/// @DnDArgument : "var" "life"
	/// @DnDArgument : "op" "2"
	/// @DnDArgument : "value" "death"
	if(life > death)
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 7E58E00F
		/// @DnDComment : // Creates the final particle effect for the explosions head
		/// @DnDParent : 7AFB2C02
		/// @DnDArgument : "function" "create_ps"
		/// @DnDArgument : "arg" "head_ps"
		create_ps(head_ps);
	
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 57B9B53C
		/// @DnDComment : Chooses random bang sound file
		/// @DnDParent : 7AFB2C02
		/// @DnDArgument : "var" "_sfx_bang"
		/// @DnDArgument : "value" "choose(snd_firework_bang_1, snd_firework_bang_2, snd_firework_bang_3)"
		var _sfx_bang = choose(snd_firework_bang_1, snd_firework_bang_2, snd_firework_bang_3);
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 0F0FC93B
		/// @DnDComment : // Plays firework bang sound
		/// @DnDParent : 7AFB2C02
		/// @DnDArgument : "soundid" "_sfx_bang"
		/// @DnDArgument : "gain" "0.5"
		audio_play_sound(_sfx_bang, 0, 0, 0.5, undefined, 1.0);
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 41F4E24A
		/// @DnDComment : // Plays firework crackle sound
		/// @DnDParent : 7AFB2C02
		/// @DnDArgument : "target" "_sfx_crackle"
		/// @DnDArgument : "target_temp" "1"
		/// @DnDArgument : "soundid" "snd_celebration_firework"
		/// @DnDArgument : "gain" "0.5"
		/// @DnDArgument : "offset" "0.5"
		/// @DnDArgument : "pitch" "random_range(0.95, 1.05)"
		/// @DnDSaveInfo : "soundid" "snd_celebration_firework"
		var _sfx_crackle = audio_play_sound(snd_celebration_firework, 0, 0, 0.5, 0.5, random_range(0.95, 1.05));
	
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Position
		/// @DnDVersion : 1
		/// @DnDHash : 72AE71EB
		/// @DnDParent : 7AFB2C02
		/// @DnDArgument : "sound" "_sfx_crackle"
		/// @DnDArgument : "time" "5.0"
		audio_sound_set_track_position(_sfx_crackle, 5.0);
	
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 04D9AFBF
		/// @DnDComment : // Destroys the firework object
		/// @DnDParent : 7AFB2C02
		instance_destroy();
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 67830447
else
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 35C8DC6F
	/// @DnDComment : // Pauses the move speed
	/// @DnDParent : 67830447
	speed = 0;
}