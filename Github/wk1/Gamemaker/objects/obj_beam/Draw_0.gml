/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 07E270C8
/// @DnDComment : // Draws the main beam body
draw_self();

/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
/// @DnDVersion : 1
/// @DnDHash : 7083B188
/// @DnDComment : // Draws the top beam head sprite flipped
/// @DnDArgument : "x" "x"
/// @DnDArgument : "y" "y - 128 - 22"
/// @DnDArgument : "rot" "180"
/// @DnDArgument : "alpha" "image_alpha"
/// @DnDArgument : "sprite" "spr_beam_head"
/// @DnDArgument : "col" "image_blend"
/// @DnDSaveInfo : "sprite" "spr_beam_head"
draw_sprite_ext(spr_beam_head, 0, x, y - 128 - 22, 1, 1, 180, image_blend & $ffffff, image_alpha);

/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
/// @DnDVersion : 1
/// @DnDHash : 6473CAAA
/// @DnDComment : // Draws the bottom beam head sprite normally 
/// @DnDArgument : "x" "x"
/// @DnDArgument : "y" "y + 128 + 22"
/// @DnDArgument : "sprite" "spr_beam_head"
/// @DnDSaveInfo : "sprite" "spr_beam_head"
draw_sprite(spr_beam_head, 0, x, y + 128 + 22);