/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 5CDDE638
/// @DnDComment : // If the sprite animation for off state has finished
/// @DnDArgument : "expr" "sprite_index == spr_shield_off"
if(sprite_index == spr_shield_off)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 6C539591
	/// @DnDComment : // Destroy the shield object as it has died fully
	/// @DnDParent : 5CDDE638
	instance_destroy();
}