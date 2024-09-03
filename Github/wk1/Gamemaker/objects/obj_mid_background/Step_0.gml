/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 4F62741E
/// @DnDComment : // Checks the game is not paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
/// @DnDArgument : "not" "1"
if(!(obj_game_manager.current_game_state == GAME_STATE.PAUSED))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 56EA8D41
	/// @DnDComment : // Moves position at the speed and rate
	/// @DnDParent : 4F62741E
	/// @DnDArgument : "expr" "-(obj_game_manager.current_speed * background_move_rate)"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "x"
	x += -(obj_game_manager.current_speed * background_move_rate);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 71991E38
	/// @DnDComment : // Checks if the x position has gone off screen to the left
	/// @DnDParent : 4F62741E
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "op" "1"
	if(x < 0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5D4B3276
		/// @DnDComment : // Sets the sprites to the next one along
		/// @DnDParent : 71991E38
		/// @DnDArgument : "expr" "sprite_index"
		/// @DnDArgument : "var" "before_sprite"
		before_sprite = sprite_index;
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 6F065CEB
		/// @DnDParent : 71991E38
		/// @DnDArgument : "spriteind" "after_sprite"
		sprite_index = after_sprite;
		image_index = 0;
	
		/// @DnDAction : YoYo Games.Switch.Switch
		/// @DnDVersion : 1
		/// @DnDHash : 6850BC48
		/// @DnDComment : // Checks what the last after sprite used was and swaps the sprite to the next one along following the pattern
		/// @DnDParent : 71991E38
		/// @DnDArgument : "expr" "after_sprite"
		var l6850BC48_0 = after_sprite;
		switch(l6850BC48_0)
		{
			/// @DnDAction : YoYo Games.Switch.Case
			/// @DnDVersion : 1
			/// @DnDHash : 3A18E2E6
			/// @DnDParent : 6850BC48
			/// @DnDArgument : "const" "sprite[0]"
			case sprite[0]:
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 3909A2B5
				/// @DnDParent : 3A18E2E6
				/// @DnDArgument : "expr" "sprite[1]"
				/// @DnDArgument : "var" "after_sprite"
				after_sprite = sprite[1];
				break;
		
			/// @DnDAction : YoYo Games.Switch.Case
			/// @DnDVersion : 1
			/// @DnDHash : 3125ECED
			/// @DnDParent : 6850BC48
			/// @DnDArgument : "const" "sprite[1]"
			case sprite[1]:
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 0F48879D
				/// @DnDParent : 3125ECED
				/// @DnDArgument : "expr" "sprite[2]"
				/// @DnDArgument : "var" "after_sprite"
				after_sprite = sprite[2];
				break;
		
			/// @DnDAction : YoYo Games.Switch.Case
			/// @DnDVersion : 1
			/// @DnDHash : 66D5AF3A
			/// @DnDParent : 6850BC48
			/// @DnDArgument : "const" "sprite[2]"
			case sprite[2]:
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 536DA7F7
				/// @DnDParent : 66D5AF3A
				/// @DnDArgument : "expr" "sprite[3]"
				/// @DnDArgument : "var" "after_sprite"
				after_sprite = sprite[3];
				break;
		
			/// @DnDAction : YoYo Games.Switch.Case
			/// @DnDVersion : 1
			/// @DnDHash : 77FFF521
			/// @DnDParent : 6850BC48
			/// @DnDArgument : "const" "sprite[3]"
			case sprite[3]:
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 05340F10
				/// @DnDParent : 77FFF521
				/// @DnDArgument : "expr" "sprite[0]"
				/// @DnDArgument : "var" "after_sprite"
				after_sprite = sprite[0];
				break;
		}
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 76D9AF50
		/// @DnDComment : // Moves the x coordinate along by its width
		/// @DnDParent : 71991E38
		/// @DnDArgument : "expr" "sprite_width"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "x"
		x += sprite_width;
	}
}