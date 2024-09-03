/// @DnDAction : YoYo Games.Switch.Switch
/// @DnDVersion : 1
/// @DnDHash : 05F36C34
/// @DnDComment : // Change logic depending on the current game state.
/// @DnDArgument : "expr" "obj_game_manager.current_game_state"
var l05F36C34_0 = obj_game_manager.current_game_state;
switch(l05F36C34_0)
{
	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 7AAC8D6A
	/// @DnDComment : // Logic for while the game is playing.
	/// @DnDParent : 05F36C34
	/// @DnDArgument : "const" "GAME_STATE.PLAYING"
	case GAME_STATE.PLAYING:
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 50133559
		/// @DnDParent : 7AAC8D6A
		/// @DnDArgument : "speed" "2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0)"
		image_speed = 2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0);
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 1E67C2EA
	/// @DnDComment : // Normal speed when dying
	/// @DnDParent : 05F36C34
	/// @DnDArgument : "const" "GAME_STATE.DYING"
	case GAME_STATE.DYING:
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 46C6E3BB
		/// @DnDParent : 1E67C2EA
		/// @DnDArgument : "speed" "1.0"
		image_speed = 1.0;
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 058BC61C
	/// @DnDComment : // Stopped animations when dead
	/// @DnDParent : 05F36C34
	/// @DnDArgument : "const" "GAME_STATE.ENDED"
	case GAME_STATE.ENDED:
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 2F782FA6
		/// @DnDParent : 058BC61C
		/// @DnDArgument : "speed" "0.0"
		image_speed = 0.0;
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 7DE4D974
	/// @DnDComment : // Stopped animations when paused
	/// @DnDParent : 05F36C34
	/// @DnDArgument : "const" "GAME_STATE.PAUSED"
	case GAME_STATE.PAUSED:
		/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 55A8CAC1
		/// @DnDParent : 7DE4D974
		/// @DnDArgument : "speed" "0.0"
		image_speed = 0.0;
		break;
}

/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 0B3886F1
draw_self();