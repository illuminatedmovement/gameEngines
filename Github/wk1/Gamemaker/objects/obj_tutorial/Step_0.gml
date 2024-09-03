/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 1DF310E5
/// @DnDComment : // Checks if escape button pressed
/// @DnDArgument : "expr" "keyboard_check_pressed(vk_escape)"
if(keyboard_check_pressed(vk_escape))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 15F19B08
	/// @DnDComment : // Sets state to 4 skipping tutorial
	/// @DnDParent : 1DF310E5
	/// @DnDArgument : "expr" "4"
	/// @DnDArgument : "var" "tip_type"
	tip_type = 4;

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 08272298
	/// @DnDComment : // Plays button sound
	/// @DnDParent : 1DF310E5
	/// @DnDArgument : "soundid" "snd_button"
	/// @DnDSaveInfo : "soundid" "snd_button"
	audio_play_sound(snd_button, 0, 0, 1.0, undefined, 1.0);
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 5068725A
/// @DnDComment : // Checks if player 1 connected
/// @DnDArgument : "expr" "gamepad_is_connected(0)"
if(gamepad_is_connected(0))
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 22C2C9B8
	/// @DnDComment : // Checks for face button press
	/// @DnDParent : 5068725A
	/// @DnDArgument : "expr" "gamepad_button_check_pressed(0, gp_face2)"
	if(gamepad_button_check_pressed(0, gp_face2))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 26D1A961
		/// @DnDComment : // Sets state to 4 skipping tutorial
		/// @DnDParent : 22C2C9B8
		/// @DnDArgument : "expr" "4"
		/// @DnDArgument : "var" "tip_type"
		tip_type = 4;
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 6262F159
		/// @DnDComment : // Plays button sound
		/// @DnDParent : 22C2C9B8
		/// @DnDArgument : "soundid" "snd_button"
		/// @DnDSaveInfo : "soundid" "snd_button"
		audio_play_sound(snd_button, 0, 0, 1.0, undefined, 1.0);
	}
}

/// @DnDAction : YoYo Games.Switch.Switch
/// @DnDVersion : 1
/// @DnDHash : 29218BAF
/// @DnDComment : // Checks state of tip type
/// @DnDArgument : "expr" "tip_type"
var l29218BAF_0 = tip_type;
switch(l29218BAF_0)
{
	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 3AAA7FCB
	/// @DnDComment : // Tip 1 - Welcome / any button to continue
	/// @DnDParent : 29218BAF
	case 0:
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3C0AFC3C
		/// @DnDComment : // Sets target speed to 0 and pauses player animation
		/// @DnDInput : 2
		/// @DnDParent : 3AAA7FCB
		/// @DnDArgument : "var" "obj_game_manager.target_speed_percentage"
		/// @DnDArgument : "var_1" "obj_player.image_speed"
		obj_game_manager.target_speed_percentage = 0;
		obj_player.image_speed = 0;
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 71DDAF6B
		/// @DnDComment : // Checks for input by any means and enables up pushing state into next mode
		/// @DnDParent : 3AAA7FCB
		/// @DnDArgument : "expr" "is_gamepad && gamepad_button_check(0, gp_face1)"
		if(is_gamepad && gamepad_button_check(0, gp_face1))
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 15C6358B
			/// @DnDInput : 2
			/// @DnDParent : 71DDAF6B
			/// @DnDArgument : "expr" "1"
			/// @DnDArgument : "expr_1" "true"
			/// @DnDArgument : "var" "tip_type"
			/// @DnDArgument : "var_1" "can_jump"
			tip_type = 1;
			can_jump = true;
		
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 499ECB39
			/// @DnDComment : // Plays tutorial sound
			/// @DnDParent : 71DDAF6B
			/// @DnDArgument : "soundid" "snd_tutorial_text_popup"
			/// @DnDSaveInfo : "soundid" "snd_tutorial_text_popup"
			audio_play_sound(snd_tutorial_text_popup, 0, 0, 1.0, undefined, 1.0);
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 1942A034
		/// @DnDParent : 3AAA7FCB
		else
		{
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 3CB6E279
			/// @DnDParent : 1942A034
			/// @DnDArgument : "expr" "global.is_touch && mouse_check_button(mb_left)"
			if(global.is_touch && mouse_check_button(mb_left))
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 3ABC09A3
				/// @DnDInput : 2
				/// @DnDParent : 3CB6E279
				/// @DnDArgument : "expr" "1"
				/// @DnDArgument : "expr_1" "true"
				/// @DnDArgument : "var" "tip_type"
				/// @DnDArgument : "var_1" "can_jump"
				tip_type = 1;
				can_jump = true;
			
				/// @DnDAction : YoYo Games.Audio.Play_Audio
				/// @DnDVersion : 1.1
				/// @DnDHash : 782BFE58
				/// @DnDComment : // Plays tutorial sound
				/// @DnDParent : 3CB6E279
				/// @DnDArgument : "soundid" "snd_tutorial_text_popup"
				/// @DnDSaveInfo : "soundid" "snd_tutorial_text_popup"
				audio_play_sound(snd_tutorial_text_popup, 0, 0, 1.0, undefined, 1.0);
			}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 3480BA9B
			/// @DnDParent : 1942A034
			else
			{
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 501EBDED
				/// @DnDParent : 3480BA9B
				/// @DnDArgument : "expr" "keyboard_check_direct(vk_anykey) || mouse_check_button(mb_left)"
				if(keyboard_check_direct(vk_anykey) || mouse_check_button(mb_left))
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 3AFD1A05
					/// @DnDInput : 2
					/// @DnDParent : 501EBDED
					/// @DnDArgument : "expr" "1"
					/// @DnDArgument : "expr_1" "true"
					/// @DnDArgument : "var" "tip_type"
					/// @DnDArgument : "var_1" "can_jump"
					tip_type = 1;
					can_jump = true;
				
					/// @DnDAction : YoYo Games.Audio.Play_Audio
					/// @DnDVersion : 1.1
					/// @DnDHash : 5B966C76
					/// @DnDComment : // Plays tutorial sound
					/// @DnDParent : 501EBDED
					/// @DnDArgument : "soundid" "snd_tutorial_text_popup"
					/// @DnDSaveInfo : "soundid" "snd_tutorial_text_popup"
					audio_play_sound(snd_tutorial_text_popup, 0, 0, 1.0, undefined, 1.0);
				}
			}
		}
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 06FFFD0B
	/// @DnDComment : // Tip 2 - jump
	/// @DnDParent : 29218BAF
	/// @DnDArgument : "const" "1"
	case 1:
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 7B8ADB1F
		/// @DnDComment : // Sets player speed to slowly move (not full speed)
		/// @DnDParent : 06FFFD0B
		/// @DnDArgument : "function" "obj_game_manager.update_speed"
		/// @DnDArgument : "arg" "delta_time * 0.000001"
		obj_game_manager.update_speed(delta_time * 0.000001);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 03DEC052
		/// @DnDParent : 06FFFD0B
		/// @DnDArgument : "expr" "0.333"
		/// @DnDArgument : "var" "obj_game_manager.target_speed_percentage"
		obj_game_manager.target_speed_percentage = 0.333;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0E63F2D8
		/// @DnDComment : // Plays player animation at rate of speed
		/// @DnDParent : 06FFFD0B
		/// @DnDArgument : "expr" "2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0)"
		/// @DnDArgument : "var" "obj_player.image_speed"
		obj_player.image_speed = 2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0);
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 7A85DC35
		/// @DnDComment : // Checks if gamepad
		/// @DnDParent : 06FFFD0B
		/// @DnDArgument : "expr" "is_gamepad"
		if(is_gamepad)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 072F1B29
			/// @DnDComment : // Displays Default input message
			/// @DnDParent : 7A85DC35
			/// @DnDArgument : "expr" ""Use the A or Cross button to jump!""
			/// @DnDArgument : "var" "tip_message"
			tip_message = "Use the A or Cross button to jump!";
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 2EAAFC22
			/// @DnDComment : // Check for the os type$(13_10)// Switch
			/// @DnDParent : 7A85DC35
			/// @DnDArgument : "expr" "os_type ==  os_switch"
			if(os_type ==  os_switch)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 6EF9E2BA
				/// @DnDComment : // Displays input message
				/// @DnDParent : 2EAAFC22
				/// @DnDArgument : "expr" ""Use the B button\nor touch screen to jump!""
				/// @DnDArgument : "var" "tip_message"
				tip_message = "Use the B button\nor touch screen to jump!";
			}
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 270CAE20
			/// @DnDComment : // Check for the os type$(13_10)// Playstation
			/// @DnDParent : 7A85DC35
			/// @DnDArgument : "expr" "os_type == os_ps4 || os_type == os_ps5"
			if(os_type == os_ps4 || os_type == os_ps5)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 6199545B
				/// @DnDComment : // Displays input message
				/// @DnDParent : 270CAE20
				/// @DnDArgument : "expr" ""Use the Cross button to jump!""
				/// @DnDArgument : "var" "tip_message"
				tip_message = "Use the Cross button to jump!";
			}
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 24B4422F
			/// @DnDComment : // Check for the os type$(13_10)// Xbox
			/// @DnDParent : 7A85DC35
			/// @DnDArgument : "expr" "os_type == os_gdk || os_type == os_xboxseriesxs"
			if(os_type == os_gdk || os_type == os_xboxseriesxs)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 017BFFEC
				/// @DnDComment : // Displays input message
				/// @DnDParent : 24B4422F
				/// @DnDArgument : "expr" ""Use the A button to jump!""
				/// @DnDArgument : "var" "tip_message"
				tip_message = "Use the A button to jump!";
			}
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 02B2FA27
			/// @DnDComment : // Check for button input
			/// @DnDParent : 7A85DC35
			/// @DnDArgument : "expr" "gamepad_button_check(0, gp_face1) || mouse_check_button(mb_left)"
			if(gamepad_button_check(0, gp_face1) || mouse_check_button(mb_left))
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 47EF3F17
				/// @DnDComment : // Increment action timer
				/// @DnDParent : 02B2FA27
				/// @DnDArgument : "expr" "delta_time * 0.000001"
				/// @DnDArgument : "expr_relative" "1"
				/// @DnDArgument : "var" "action_timer"
				action_timer += delta_time * 0.000001;
			}
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 1A522E9F
		/// @DnDParent : 06FFFD0B
		else
		{
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 6D7E3F97
			/// @DnDComment : // Checks if touch
			/// @DnDParent : 1A522E9F
			/// @DnDArgument : "expr" "global.is_touch"
			if(global.is_touch)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 48B6B49E
				/// @DnDComment : // Displays input message
				/// @DnDParent : 6D7E3F97
				/// @DnDArgument : "expr" ""Tap or hold the screen to jump!""
				/// @DnDArgument : "var" "tip_message"
				tip_message = "Tap or hold the screen to jump!";
			
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 11D0ECA5
				/// @DnDComment : // Check for input
				/// @DnDParent : 6D7E3F97
				/// @DnDArgument : "expr" "mouse_check_button(mb_left)"
				if(mouse_check_button(mb_left))
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 0DE59301
					/// @DnDComment : // Increment action timer
					/// @DnDParent : 11D0ECA5
					/// @DnDArgument : "expr" "delta_time * 0.000001"
					/// @DnDArgument : "expr_relative" "1"
					/// @DnDArgument : "var" "action_timer"
					action_timer += delta_time * 0.000001;
				}
			}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 33D8A978
			/// @DnDParent : 1A522E9F
			else
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 493A9C8C
				/// @DnDComment : // Displays input message
				/// @DnDParent : 33D8A978
				/// @DnDArgument : "expr" ""Use space or the left mouse\nbutton to jump!""
				/// @DnDArgument : "var" "tip_message"
				tip_message = "Use space or the left mouse\nbutton to jump!";
			
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 6149AE42
				/// @DnDComment : // Check for input
				/// @DnDParent : 33D8A978
				/// @DnDArgument : "expr" "mouse_check_button(mb_left) || keyboard_check_direct(vk_space)"
				if(mouse_check_button(mb_left) || keyboard_check_direct(vk_space))
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 429AF17E
					/// @DnDComment : // Increment action timer
					/// @DnDParent : 6149AE42
					/// @DnDArgument : "expr" "delta_time * 0.000001"
					/// @DnDArgument : "expr_relative" "1"
					/// @DnDArgument : "var" "action_timer"
					action_timer += delta_time * 0.000001;
				}
			}
		}
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0BE34E13
		/// @DnDComment : // Check if action timer has surpased threshold
		/// @DnDParent : 06FFFD0B
		/// @DnDArgument : "var" "action_timer"
		/// @DnDArgument : "op" "4"
		/// @DnDArgument : "value" "1.5"
		if(action_timer >= 1.5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 61DD1202
			/// @DnDComment : // Resets action timer$(13_10)// Moves onto next tip
			/// @DnDInput : 2
			/// @DnDParent : 0BE34E13
			/// @DnDArgument : "expr_1" "2"
			/// @DnDArgument : "var" "action_timer"
			/// @DnDArgument : "var_1" "tip_type"
			action_timer = 0;
			tip_type = 2;
		
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 2BF6B264
			/// @DnDComment : // Plays tutorial sound
			/// @DnDParent : 0BE34E13
			/// @DnDArgument : "soundid" "snd_tutorial_text_popup"
			/// @DnDSaveInfo : "soundid" "snd_tutorial_text_popup"
			audio_play_sound(snd_tutorial_text_popup, 0, 0, 1.0, undefined, 1.0);
		}
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 62F1F14A
	/// @DnDComment : // Tip 3 - fall
	/// @DnDParent : 29218BAF
	/// @DnDArgument : "const" "2"
	case 2:
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 63A8F9AE
		/// @DnDComment : // Controls players speed and animations (slowed)
		/// @DnDParent : 62F1F14A
		/// @DnDArgument : "function" "obj_game_manager.update_speed"
		/// @DnDArgument : "arg" "delta_time * 0.000001"
		obj_game_manager.update_speed(delta_time * 0.000001);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7516B10F
		/// @DnDParent : 62F1F14A
		/// @DnDArgument : "expr" "0.333"
		/// @DnDArgument : "var" "obj_game_manager.target_speed_percentage"
		obj_game_manager.target_speed_percentage = 0.333;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2752D765
		/// @DnDParent : 62F1F14A
		/// @DnDArgument : "expr" "2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0)"
		/// @DnDArgument : "var" "obj_player.image_speed"
		obj_player.image_speed = 2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0);
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 37A506A0
		/// @DnDComment : // Check input types
		/// @DnDParent : 62F1F14A
		/// @DnDArgument : "expr" "is_gamepad"
		if(is_gamepad)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 0BD4A5D1
			/// @DnDComment : // Displays Default input message
			/// @DnDParent : 37A506A0
			/// @DnDArgument : "expr" ""Release the A or Cross button\nto drop down!""
			/// @DnDArgument : "var" "tip_message"
			tip_message = "Release the A or Cross button\nto drop down!";
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 794E3736
			/// @DnDComment : // Check for the os type$(13_10)// Switch
			/// @DnDParent : 37A506A0
			/// @DnDArgument : "expr" "os_type ==  os_switch"
			if(os_type ==  os_switch)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 45BFDCD7
				/// @DnDComment : // Displays input message
				/// @DnDParent : 794E3736
				/// @DnDArgument : "expr" ""Release the A button\nto drop down!""
				/// @DnDArgument : "var" "tip_message"
				tip_message = "Release the A button\nto drop down!";
			}
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 7006F9EF
			/// @DnDComment : // Check for the os type$(13_10)// Playstation
			/// @DnDParent : 37A506A0
			/// @DnDArgument : "expr" "os_type == os_ps4 || os_type == os_ps5"
			if(os_type == os_ps4 || os_type == os_ps5)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 219B529A
				/// @DnDComment : // Displays input message
				/// @DnDParent : 7006F9EF
				/// @DnDArgument : "expr" ""Release the Cross button\nto drop down!""
				/// @DnDArgument : "var" "tip_message"
				tip_message = "Release the Cross button\nto drop down!";
			}
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 21B53166
			/// @DnDComment : // Check for the os type$(13_10)// Xbox
			/// @DnDParent : 37A506A0
			/// @DnDArgument : "expr" "os_type == os_gdk || os_type == os_xboxseriesxs"
			if(os_type == os_gdk || os_type == os_xboxseriesxs)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 418584C2
				/// @DnDComment : // Displays input message
				/// @DnDParent : 21B53166
				/// @DnDArgument : "expr" ""Release the A button\nto drop down!""
				/// @DnDArgument : "var" "tip_message"
				tip_message = "Release the A button\nto drop down!";
			}
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 1B89930E
			/// @DnDComment : // Check input released
			/// @DnDParent : 37A506A0
			/// @DnDArgument : "expr" "!gamepad_button_check(0, gp_face1) && !mouse_check_button(mb_left)"
			if(!gamepad_button_check(0, gp_face1) && !mouse_check_button(mb_left))
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 2FEF06BC
				/// @DnDComment : // Increase action timer
				/// @DnDParent : 1B89930E
				/// @DnDArgument : "expr" "delta_time * 0.000001"
				/// @DnDArgument : "expr_relative" "1"
				/// @DnDArgument : "var" "action_timer"
				action_timer += delta_time * 0.000001;
			}
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 1C8812A7
		/// @DnDParent : 62F1F14A
		else
		{
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 314A87F1
			/// @DnDComment : // Check input types
			/// @DnDParent : 1C8812A7
			/// @DnDArgument : "expr" "global.is_touch"
			if(global.is_touch)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 5E5408E5
				/// @DnDComment : // Display correct message
				/// @DnDParent : 314A87F1
				/// @DnDArgument : "expr" ""Release the screen to drop down!""
				/// @DnDArgument : "var" "tip_message"
				tip_message = "Release the screen to drop down!";
			
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 5FFE938C
				/// @DnDComment : // Check input released
				/// @DnDParent : 314A87F1
				/// @DnDArgument : "expr" "mouse_check_button(mb_left)"
				/// @DnDArgument : "not" "1"
				if(!(mouse_check_button(mb_left)))
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 4B640737
					/// @DnDComment : // Increase action timer
					/// @DnDParent : 5FFE938C
					/// @DnDArgument : "expr" "delta_time * 0.000001"
					/// @DnDArgument : "expr_relative" "1"
					/// @DnDArgument : "var" "action_timer"
					action_timer += delta_time * 0.000001;
				}
			}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 3813E11A
			/// @DnDParent : 1C8812A7
			else
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 46C39C5D
				/// @DnDComment : // Display correct message
				/// @DnDParent : 3813E11A
				/// @DnDArgument : "expr" ""Release space and the left mouse\nbutton to drop down!""
				/// @DnDArgument : "var" "tip_message"
				tip_message = "Release space and the left mouse\nbutton to drop down!";
			
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 201284CD
				/// @DnDComment : // Check input released
				/// @DnDParent : 3813E11A
				/// @DnDArgument : "expr" "!mouse_check_button(mb_left) && !keyboard_check_direct(vk_space)"
				if(!mouse_check_button(mb_left) && !keyboard_check_direct(vk_space))
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 22EAC865
					/// @DnDComment : // Increase action timer
					/// @DnDParent : 201284CD
					/// @DnDArgument : "expr" "delta_time * 0.000001"
					/// @DnDArgument : "expr_relative" "1"
					/// @DnDArgument : "var" "action_timer"
					action_timer += delta_time * 0.000001;
				}
			}
		}
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 02472EF1
		/// @DnDComment : // Check action timer has passed threshold
		/// @DnDParent : 62F1F14A
		/// @DnDArgument : "var" "action_timer"
		/// @DnDArgument : "op" "4"
		/// @DnDArgument : "value" "1.5"
		if(action_timer >= 1.5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 3926079B
			/// @DnDComment : // Resets action timer$(13_10)// Moves onto next tip
			/// @DnDInput : 2
			/// @DnDParent : 02472EF1
			/// @DnDArgument : "expr_1" "3"
			/// @DnDArgument : "var" "action_timer"
			/// @DnDArgument : "var_1" "tip_type"
			action_timer = 0;
			tip_type = 3;
		
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 2E18E1E2
			/// @DnDComment : // Plays tutorial sound
			/// @DnDParent : 02472EF1
			/// @DnDArgument : "soundid" "snd_tutorial_text_popup"
			/// @DnDSaveInfo : "soundid" "snd_tutorial_text_popup"
			audio_play_sound(snd_tutorial_text_popup, 0, 0, 1.0, undefined, 1.0);
		}
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 1E9A1850
	/// @DnDComment : // Tip 4 - Good luck message
	/// @DnDParent : 29218BAF
	/// @DnDArgument : "const" "3"
	case 3:
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 40EAF565
		/// @DnDComment : // Keeps player speed and animations slowed
		/// @DnDParent : 1E9A1850
		/// @DnDArgument : "function" "obj_game_manager.update_speed"
		/// @DnDArgument : "arg" "delta_time * 0.000001"
		obj_game_manager.update_speed(delta_time * 0.000001);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 029DD86B
		/// @DnDParent : 1E9A1850
		/// @DnDArgument : "expr" "0.333"
		/// @DnDArgument : "var" "obj_game_manager.target_speed_percentage"
		obj_game_manager.target_speed_percentage = 0.333;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1BA58F4D
		/// @DnDParent : 1E9A1850
		/// @DnDArgument : "expr" "2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0)"
		/// @DnDArgument : "var" "obj_player.image_speed"
		obj_player.image_speed = 2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 006E50F9
		/// @DnDComment : // Sets new final message
		/// @DnDParent : 1E9A1850
		/// @DnDArgument : "expr" ""Collect coins and avoid\nobstacles to see how far\nyou can get!\n\n GOOD LUCK!""
		/// @DnDArgument : "var" "tip_message"
		tip_message = "Collect coins and avoid\nobstacles to see how far\nyou can get!\n\n GOOD LUCK!";
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0C816A54
		/// @DnDComment : // Increases timer
		/// @DnDParent : 1E9A1850
		/// @DnDArgument : "expr" "delta_time * 0.000001"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "action_timer"
		action_timer += delta_time * 0.000001;
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7073DB65
		/// @DnDComment : // Checks if timer has finished
		/// @DnDParent : 1E9A1850
		/// @DnDArgument : "var" "action_timer"
		/// @DnDArgument : "op" "4"
		/// @DnDArgument : "value" "4.0"
		if(action_timer >= 4.0)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 03CAD4FB
			/// @DnDComment : // Resets timer$(13_10)// Moves onto final tip state
			/// @DnDInput : 2
			/// @DnDParent : 7073DB65
			/// @DnDArgument : "expr_1" "4"
			/// @DnDArgument : "var" "action_timer"
			/// @DnDArgument : "var_1" "tip_type"
			action_timer = 0;
			tip_type = 4;
		}
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 79FA67F4
	/// @DnDComment : // Tip 5 - Clears tutorial
	/// @DnDParent : 29218BAF
	/// @DnDArgument : "const" "4"
	case 4:
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2175AF8E
		/// @DnDComment : // Sets game to playing
		/// @DnDParent : 79FA67F4
		/// @DnDArgument : "expr" "GAME_STATE.PLAYING"
		/// @DnDArgument : "var" "obj_game_manager.current_game_state"
		obj_game_manager.current_game_state = GAME_STATE.PLAYING;
	
		/// @DnDAction : YoYo Games.Audio.Stop_Audio
		/// @DnDVersion : 1
		/// @DnDHash : 6E3679D6
		/// @DnDParent : 79FA67F4
		/// @DnDArgument : "soundid" "global.music"
		audio_stop_sound(global.music);
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 24910A3C
		/// @DnDComment : // Plays the games main music at half volume
		/// @DnDParent : 79FA67F4
		/// @DnDArgument : "target" "global.music"
		/// @DnDArgument : "soundid" "snd_infinite_runner_music"
		/// @DnDArgument : "gain" "0.5"
		/// @DnDSaveInfo : "soundid" "snd_infinite_runner_music"
		global.music = audio_play_sound(snd_infinite_runner_music, 0, 0, 0.5, undefined, 1.0);
	
		/// @DnDAction : YoYo Games.Sequences.Sequence_Create
		/// @DnDVersion : 1
		/// @DnDHash : 32D267CE
		/// @DnDComment : // Creates gamemaker coin sequence to fill in deadspace
		/// @DnDParent : 79FA67F4
		/// @DnDArgument : "var" ""
		/// @DnDArgument : "sequenceid" "seq_gm_layout"
		/// @DnDArgument : "layer" ""Stage""
		/// @DnDSaveInfo : "sequenceid" "seq_gm_layout"
		layer_sequence_create("Stage", 0, 0, seq_gm_layout);
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5C207D66
		/// @DnDComment : // Checks if highscore has been set
		/// @DnDParent : 79FA67F4
		/// @DnDArgument : "var" "global.highscore"
		/// @DnDArgument : "not" "1"
		if(!(global.highscore == 0))
		{
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 5BFDBD6F
			/// @DnDComment : // Creates a flag at the highscores location setting its properties
			/// @DnDParent : 5C207D66
			/// @DnDArgument : "var" "_flag"
			/// @DnDArgument : "value" "instance_create_layer(640 + real(global.highscore) * 60, 950, "StageBack", obj_flag_marker)"
			var _flag = instance_create_layer(640 + real(global.highscore) * 60, 950, "StageBack", obj_flag_marker);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 2CE36F1A
			/// @DnDInput : 2
			/// @DnDParent : 5C207D66
			/// @DnDArgument : "expr" "true"
			/// @DnDArgument : "expr_1" "global.highscore"
			/// @DnDArgument : "var" "_flag.has_dropped"
			/// @DnDArgument : "var_1" "_flag.flag_distance"
			_flag.has_dropped = true;
			_flag.flag_distance = global.highscore;
		}
	
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 243FF806
		/// @DnDComment : // Destroys the skip button
		/// @DnDApplyTo : {obj_button_skip}
		/// @DnDParent : 79FA67F4
		with(obj_button_skip) instance_destroy();
	
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 18FA93A6
		/// @DnDComment : // Destroys this banner
		/// @DnDParent : 79FA67F4
		instance_destroy();
		break;
}