/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 2170A5B2
/// @DnDComment : // Checks if the platform type is mobile
/// @DnDArgument : "expr" "os_type == os_android || os_type == os_ios"
if(os_type == os_android || os_type == os_ios)
{
	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 6442EECB
	/// @DnDComment : // Sets global touch to true
	/// @DnDParent : 2170A5B2
	/// @DnDArgument : "value" "true"
	/// @DnDArgument : "var" "global.is_touch"
	global.is_touch = true;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 52F24841
else
{
	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 62262F22
	/// @DnDComment : // Sets global touch to false
	/// @DnDParent : 52F24841
	/// @DnDArgument : "value" "false"
	/// @DnDArgument : "var" "global.is_touch"
	global.is_touch = false;
}

/// @DnDAction : YoYo Games.Miscellaneous.Set_Window_State
/// @DnDVersion : 1
/// @DnDHash : 161A7D76
/// @DnDComment : // Makes the project fullscreen
/// @DnDArgument : "type" "2"
window_set_fullscreen(true);

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 2BE89B2B
/// @DnDComment : // Play splash sequence for menu UI
/// @DnDArgument : "var" "_splash_seq"
/// @DnDArgument : "value" "layer_sequence_create("Instances", 0, 0, seq_splash)"
var _splash_seq = layer_sequence_create("Instances", 0, 0, seq_splash);

/// @DnDAction : YoYo Games.Audio.Stop_All_Audio
/// @DnDVersion : 1
/// @DnDHash : 2C4F41FF
/// @DnDComment : // Stops all previous running audio
audio_stop_all();

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 5B336BE2
/// @DnDComment : // Play audio for main menu
/// @DnDArgument : "value" "audio_play_sound(snd_menu_music, 100, true, 1.0)"
/// @DnDArgument : "var" "global.music"
global.music = audio_play_sound(snd_menu_music, 100, true, 1.0);

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 5B986F9E
/// @DnDComment : // Check for highscore variable
/// @DnDArgument : "expr" "variable_global_exists("highscore")"
/// @DnDArgument : "not" "1"
if(!(variable_global_exists("highscore")))
{
	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 3A7F4768
	/// @DnDComment : // Create empty variable for highscore
	/// @DnDParent : 5B986F9E
	/// @DnDArgument : "var" "global.highscore"
	global.highscore = 0;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 52E28BD0
	/// @DnDComment : // Loads buffer for highscore
	/// @DnDParent : 5B986F9E
	/// @DnDArgument : "expr" "buffer_load("ENDLESS_RUNNER_HS.sav")"
	/// @DnDArgument : "var" "highscore_buffer"
	highscore_buffer = buffer_load("ENDLESS_RUNNER_HS.sav");

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 55B61FBD
	/// @DnDComment : // Checks if buffer exists
	/// @DnDParent : 5B986F9E
	/// @DnDArgument : "expr" "buffer_exists(highscore_buffer)"
	if(buffer_exists(highscore_buffer))
	{
		/// @DnDAction : YoYo Games.Buffers.Buffer_Seek
		/// @DnDVersion : 1.1
		/// @DnDHash : 1A167856
		/// @DnDComment : // Goes to the start of the buffer
		/// @DnDParent : 55B61FBD
		/// @DnDArgument : "buffer" "highscore_buffer"
		/// @DnDArgument : "seek" "0"
		buffer_seek(highscore_buffer, buffer_seek_start, 0);
	
		/// @DnDAction : YoYo Games.Common.Set_Global
		/// @DnDVersion : 1
		/// @DnDHash : 529486D6
		/// @DnDComment : // Sets the highscore to value from the buffer
		/// @DnDParent : 55B61FBD
		/// @DnDArgument : "value" "buffer_read(highscore_buffer, buffer_u64)"
		/// @DnDArgument : "var" "global.highscore"
		global.highscore = buffer_read(highscore_buffer, buffer_u64);
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 1D954715
	/// @DnDParent : 5B986F9E
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1B86441A
		/// @DnDComment : // Creates highscore buffer
		/// @DnDParent : 1D954715
		/// @DnDArgument : "expr" "buffer_create(16384, buffer_fixed, 2)"
		/// @DnDArgument : "var" "highscore_buffer"
		highscore_buffer = buffer_create(16384, buffer_fixed, 2);
	
		/// @DnDAction : YoYo Games.Buffers.Buffer_Seek
		/// @DnDVersion : 1.1
		/// @DnDHash : 52077766
		/// @DnDComment : // Goes to the start of the buffer
		/// @DnDParent : 1D954715
		/// @DnDArgument : "buffer" "highscore_buffer"
		/// @DnDArgument : "seek" "0"
		buffer_seek(highscore_buffer, buffer_seek_start, 0);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 63337A08
		/// @DnDComment : // Writes highscore value to the buffer
		/// @DnDInput : 3
		/// @DnDParent : 1D954715
		/// @DnDArgument : "function" "buffer_write"
		/// @DnDArgument : "arg" "highscore_buffer"
		/// @DnDArgument : "arg_1" "buffer_u64"
		/// @DnDArgument : "arg_2" "global.highscore"
		buffer_write(highscore_buffer, buffer_u64, global.highscore);
	
		/// @DnDAction : YoYo Games.Files.Buffer_Save
		/// @DnDVersion : 1
		/// @DnDHash : 1878F134
		/// @DnDComment : // Saves the new empty highscore buffer
		/// @DnDParent : 1D954715
		/// @DnDArgument : "buffer" "highscore_buffer"
		/// @DnDArgument : "filename" ""ENDLESS_RUNNER_HS.sav""
		buffer_save(highscore_buffer, "ENDLESS_RUNNER_HS.sav");
	}
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 76B9E4B0
/// @DnDComment : // Check if game has been played this session
/// @DnDArgument : "expr" "variable_global_exists("times_played")"
/// @DnDArgument : "not" "1"
if(!(variable_global_exists("times_played")))
{
	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 67095F8B
	/// @DnDComment : // Creates times played variable and sets to zero
	/// @DnDParent : 76B9E4B0
	/// @DnDArgument : "var" "global.times_played"
	global.times_played = 0;
}