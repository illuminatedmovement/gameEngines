/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
/// @DnDVersion : 1.1
/// @DnDHash : 61FC2BB0
/// @DnDComment : // Adjust the pitch and gain to the banners image alpha
/// @DnDArgument : "sound" "global.music"
/// @DnDArgument : "volume" "0.5 - (0.25 * image_alpha)"
audio_sound_gain(global.music, 0.5 - (0.25 * image_alpha), 0);

/// @DnDAction : YoYo Games.Audio.Audio_Set_Pitch
/// @DnDVersion : 1
/// @DnDHash : 6D345EB0
/// @DnDArgument : "sound" "global.music"
/// @DnDArgument : "pitch" "1 - (0.2 * image_alpha)"
audio_sound_pitch(global.music, 1 - (0.2 * image_alpha));