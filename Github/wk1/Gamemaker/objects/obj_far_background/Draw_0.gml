/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
/// @DnDVersion : 1
/// @DnDHash : 56565D2C
/// @DnDComment : // Draw the before sprite at an offset of minus its width
/// @DnDArgument : "x" "- sprite_get_width(before_sprite)"
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "sprite" "before_sprite"
draw_sprite(before_sprite, 0, x + - sprite_get_width(before_sprite), y + 0);

/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 0F3B32AB
/// @DnDComment : // Draw the main/middle sprite
draw_self();

/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
/// @DnDVersion : 1
/// @DnDHash : 4EB79DDB
/// @DnDComment : // Draw the final sprite at an offset of its width
/// @DnDArgument : "x" "sprite_width"
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "sprite" "after_sprite"
draw_sprite(after_sprite, 0, x + sprite_width, y + 0);