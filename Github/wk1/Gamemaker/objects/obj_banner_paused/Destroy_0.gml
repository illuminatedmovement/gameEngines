/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 3EED8078
/// @DnDComment : // Destroy buttons assocciated to pause menu
/// @DnDApplyTo : {obj_button_play_paused}
with(obj_button_play_paused) instance_destroy();

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 48084477
/// @DnDApplyTo : {obj_button_home}
with(obj_button_home) instance_destroy();

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 44921B66
/// @DnDApplyTo : {obj_button_retry}
with(obj_button_retry) instance_destroy();

/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
/// @DnDVersion : 1.1
/// @DnDHash : 55F5B9F1
/// @DnDComment : // Return the sound pitch and gain to normal
/// @DnDArgument : "sound" "global.music"
/// @DnDArgument : "volume" "0.5"
/// @DnDArgument : "time" "4000"
audio_sound_gain(global.music, 0.5, 4000);

/// @DnDAction : YoYo Games.Audio.Audio_Set_Pitch
/// @DnDVersion : 1
/// @DnDHash : 37AFB840
/// @DnDArgument : "sound" "global.music"
audio_sound_pitch(global.music, 1);