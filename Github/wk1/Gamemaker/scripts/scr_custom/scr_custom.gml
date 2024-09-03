/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 02479BA7
/// @DnDComment : /// Smoothstep interpolation function$(13_10)// Takes in start (lowest), end (highest) and value (percentage) to output value the curves and slows more gradual
/// @DnDInput : 3
/// @DnDArgument : "funcName" "smoothstep"
/// @DnDArgument : "arg" "_start"
/// @DnDArgument : "arg_1" "_end"
/// @DnDArgument : "arg_2" "_value"
function smoothstep(_start, _end, _value) 
{
	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 4DD2BC5C
	/// @DnDComment : // Returns the lerped values
	/// @DnDParent : 02479BA7
	/// @DnDArgument : "value" "lerp(_start, _end, _value * _value * (3 - 2 * _value))"
	return lerp(_start, _end, _value * _value * (3 - 2 * _value));
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 7725C73C
/// @DnDComment : /// Parse value function$(13_10)// Takes in value of coins or distance and returns a string with value and short hand notation for k, m, b etc
/// @DnDArgument : "funcName" "parse_value"
/// @DnDArgument : "arg" "_value"
function parse_value(_value) 
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3E5C3596
	/// @DnDComment : // Stores the temp value as a floored string value
	/// @DnDParent : 7725C73C
	/// @DnDArgument : "var" "_read_value"
	/// @DnDArgument : "value" "string(floor(_value))"
	var _read_value = string(floor(_value));

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6D87002D
	/// @DnDComment : // Checks if the value is under 1000
	/// @DnDParent : 7725C73C
	/// @DnDArgument : "var" "_value"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "power(10, 3)"
	if(_value < power(10, 3))
	{
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 181399FE
		/// @DnDParent : 6D87002D
		/// @DnDArgument : "value" "_read_value + """
		return _read_value + "";
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6A806634
	/// @DnDComment : // Checks if the value is under a million
	/// @DnDParent : 7725C73C
	/// @DnDArgument : "var" "_value"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "power(10, 6)"
	if(_value < power(10, 6))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 475C1DD9
		/// @DnDParent : 6A806634
		/// @DnDArgument : "expr" "string(_value / power(10, 3))"
		/// @DnDArgument : "var" "_read_value"
		_read_value = string(_value / power(10, 3));
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 22163271
		/// @DnDParent : 6A806634
		/// @DnDArgument : "var" "string_length(_read_value) "
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "5"
		if(string_length(_read_value)  > 5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 7806E5ED
			/// @DnDParent : 22163271
			/// @DnDArgument : "expr" "string_copy(_read_value, 1, 5)"
			/// @DnDArgument : "var" "_read_value"
			_read_value = string_copy(_read_value, 1, 5);
		}
	
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 213919F8
		/// @DnDParent : 6A806634
		/// @DnDArgument : "value" "_read_value + "K""
		return _read_value + "K";
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 65BF5399
	/// @DnDComment : // Checks if the value is under a billion
	/// @DnDParent : 7725C73C
	/// @DnDArgument : "var" "_value"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "power(10, 9)"
	if(_value < power(10, 9))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7B213613
		/// @DnDParent : 65BF5399
		/// @DnDArgument : "expr" "string(_value / power(10, 6))"
		/// @DnDArgument : "var" "_read_value"
		_read_value = string(_value / power(10, 6));
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0565D163
		/// @DnDParent : 65BF5399
		/// @DnDArgument : "var" "string_length(_read_value)"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "5"
		if(string_length(_read_value) > 5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 65CE396B
			/// @DnDParent : 0565D163
			/// @DnDArgument : "expr" "string_copy(_read_value, 1, 5)"
			/// @DnDArgument : "var" "_read_value"
			_read_value = string_copy(_read_value, 1, 5);
		}
	
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 651B4EEC
		/// @DnDParent : 65BF5399
		/// @DnDArgument : "value" "_read_value + "M""
		return _read_value + "M";
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4A37FF13
	/// @DnDComment : // Checks if the value is under a trillion
	/// @DnDParent : 7725C73C
	/// @DnDArgument : "var" "_value"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "power(10, 12)"
	if(_value < power(10, 12))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4850F525
		/// @DnDParent : 4A37FF13
		/// @DnDArgument : "expr" "string(_value / power(10, 9))"
		/// @DnDArgument : "var" "_read_value"
		_read_value = string(_value / power(10, 9));
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4F6C9870
		/// @DnDParent : 4A37FF13
		/// @DnDArgument : "var" "string_length(_read_value)"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "5"
		if(string_length(_read_value) > 5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 631E0781
			/// @DnDParent : 4F6C9870
			/// @DnDArgument : "expr" "string_copy(_read_value, 1, 5)"
			/// @DnDArgument : "var" "_read_value"
			_read_value = string_copy(_read_value, 1, 5);
		}
	
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 61E5135B
		/// @DnDParent : 4A37FF13
		/// @DnDArgument : "value" "_read_value + "B""
		return _read_value + "B";
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 109EB046
	/// @DnDComment : // Checks if the value is under quadtrillion
	/// @DnDParent : 7725C73C
	/// @DnDArgument : "var" "_value"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "power(10, 15)"
	if(_value < power(10, 15))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 67B870E5
		/// @DnDParent : 109EB046
		/// @DnDArgument : "expr" "string(_value / power(10, 12))"
		/// @DnDArgument : "var" "_read_value"
		_read_value = string(_value / power(10, 12));
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 57C807A1
		/// @DnDParent : 109EB046
		/// @DnDArgument : "var" "string_length(_read_value)"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "5"
		if(string_length(_read_value) > 5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 512F5EC7
			/// @DnDParent : 57C807A1
			/// @DnDArgument : "expr" "string_copy(_read_value, 1, 5)"
			/// @DnDArgument : "var" "_read_value"
			_read_value = string_copy(_read_value, 1, 5);
		}
	
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 0131DF99
		/// @DnDParent : 109EB046
		/// @DnDArgument : "value" "_read_value + "T""
		return _read_value + "T";
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2416EC09
	/// @DnDComment : // Checks if the value is under a quintillion
	/// @DnDParent : 7725C73C
	/// @DnDArgument : "var" "_value"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "power(10, 18)"
	if(_value < power(10, 18))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 096618E6
		/// @DnDParent : 2416EC09
		/// @DnDArgument : "expr" "string(_value / power(10, 15))"
		/// @DnDArgument : "var" "_read_value"
		_read_value = string(_value / power(10, 15));
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 79E6100E
		/// @DnDParent : 2416EC09
		/// @DnDArgument : "var" "string_length(_read_value)"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "5"
		if(string_length(_read_value) > 5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 7B0EB144
			/// @DnDParent : 79E6100E
			/// @DnDArgument : "expr" "string_copy(_read_value, 1, 5)"
			/// @DnDArgument : "var" "_read_value"
			_read_value = string_copy(_read_value, 1, 5);
		}
	
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 77E85ADB
		/// @DnDParent : 2416EC09
		/// @DnDArgument : "value" "_read_value + "Qa""
		return _read_value + "Qa";
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 270E85C1
	/// @DnDComment : // Checks if the value is under a sextillion
	/// @DnDParent : 7725C73C
	/// @DnDArgument : "var" "_value"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "power(10, 21)"
	if(_value < power(10, 21))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 551C68C0
		/// @DnDParent : 270E85C1
		/// @DnDArgument : "expr" "string(_value / power(10, 18))"
		/// @DnDArgument : "var" "_read_value"
		_read_value = string(_value / power(10, 18));
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4D432673
		/// @DnDParent : 270E85C1
		/// @DnDArgument : "var" "string_length(_read_value)"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "5"
		if(string_length(_read_value) > 5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 2BE2E316
			/// @DnDParent : 4D432673
			/// @DnDArgument : "expr" "string_copy(_read_value, 1, 5)"
			/// @DnDArgument : "var" "_read_value"
			_read_value = string_copy(_read_value, 1, 5);
		}
	
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 658C7D4C
		/// @DnDParent : 270E85C1
		/// @DnDArgument : "value" "_read_value + "Qi""
		return _read_value + "Qi";
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2458D257
	/// @DnDComment : // Checks if the value is under a septillion
	/// @DnDParent : 7725C73C
	/// @DnDArgument : "var" "_value"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "power(10, 24)"
	if(_value < power(10, 24))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 254ABFC4
		/// @DnDParent : 2458D257
		/// @DnDArgument : "expr" "string(_value / power(10, 21))"
		/// @DnDArgument : "var" "_read_value"
		_read_value = string(_value / power(10, 21));
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 669BEE68
		/// @DnDParent : 2458D257
		/// @DnDArgument : "var" "string_length(_read_value)"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "5"
		if(string_length(_read_value) > 5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 75E2D303
			/// @DnDParent : 669BEE68
			/// @DnDArgument : "expr" "string_copy(_read_value, 1, 5)"
			/// @DnDArgument : "var" "_read_value"
			_read_value = string_copy(_read_value, 1, 5);
		}
	
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 03EDF3EE
		/// @DnDParent : 2458D257
		/// @DnDArgument : "value" "_read_value + "Sx""
		return _read_value + "Sx";
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 03B5898A
	/// @DnDComment : // Checks if the value is under a octillion
	/// @DnDParent : 7725C73C
	/// @DnDArgument : "var" "_value"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "power(10, 27)"
	if(_value < power(10, 27))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 41FC1FD8
		/// @DnDParent : 03B5898A
		/// @DnDArgument : "expr" "string(_value / power(10, 24))"
		/// @DnDArgument : "var" "_read_value"
		_read_value = string(_value / power(10, 24));
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0C140397
		/// @DnDParent : 03B5898A
		/// @DnDArgument : "var" "string_length(_read_value)"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "5"
		if(string_length(_read_value) > 5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 7AA127A7
			/// @DnDParent : 0C140397
			/// @DnDArgument : "expr" "string_copy(_read_value, 1, 5)"
			/// @DnDArgument : "var" "_read_value"
			_read_value = string_copy(_read_value, 1, 5);
		}
	
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 060043DE
		/// @DnDParent : 03B5898A
		/// @DnDArgument : "value" "_read_value + "Sp""
		return _read_value + "Sp";
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 202B6CE2
	/// @DnDComment : // Checks if the value is under a nonillion
	/// @DnDParent : 7725C73C
	/// @DnDArgument : "var" "_value"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "power(10, 30)"
	if(_value < power(10, 30))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 40C93A39
		/// @DnDParent : 202B6CE2
		/// @DnDArgument : "expr" "string(_value / power(10, 27))"
		/// @DnDArgument : "var" "_read_value"
		_read_value = string(_value / power(10, 27));
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7E44BC91
		/// @DnDParent : 202B6CE2
		/// @DnDArgument : "var" "string_length(_read_value)"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "5"
		if(string_length(_read_value) > 5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 7B0E5750
			/// @DnDParent : 7E44BC91
			/// @DnDArgument : "expr" "string_copy(_read_value, 1, 5)"
			/// @DnDArgument : "var" "_read_value"
			_read_value = string_copy(_read_value, 1, 5);
		}
	
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 5690B13E
		/// @DnDParent : 202B6CE2
		/// @DnDArgument : "value" "_read_value + "Oc""
		return _read_value + "Oc";
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 07148014
	/// @DnDComment : // Checks if the value is under a decillion
	/// @DnDParent : 7725C73C
	/// @DnDArgument : "var" "_value"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "power(10, 33)"
	if(_value < power(10, 33))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 03C38CC7
		/// @DnDParent : 07148014
		/// @DnDArgument : "expr" "string(_value / power(10, 30))"
		/// @DnDArgument : "var" "_read_value"
		_read_value = string(_value / power(10, 30));
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0CD7246A
		/// @DnDParent : 07148014
		/// @DnDArgument : "var" "string_length(_read_value)"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "5"
		if(string_length(_read_value) > 5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 035ED2FC
			/// @DnDParent : 0CD7246A
			/// @DnDArgument : "expr" "string_copy(_read_value, 1, 5)"
			/// @DnDArgument : "var" "_read_value"
			_read_value = string_copy(_read_value, 1, 5);
		}
	
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 2B6F5C3B
		/// @DnDParent : 07148014
		/// @DnDArgument : "value" "_read_value + "No""
		return _read_value + "No";
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 6409E151
	/// @DnDComment : // Returns the value in decillion
	/// @DnDParent : 7725C73C
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0BB01980
		/// @DnDParent : 6409E151
		/// @DnDArgument : "expr" "string(_value / power(10, 33))"
		/// @DnDArgument : "var" "_read_value"
		_read_value = string(_value / power(10, 33));
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3F03194B
		/// @DnDParent : 6409E151
		/// @DnDArgument : "var" "string_length(_read_value)"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "5"
		if(string_length(_read_value) > 5)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6FB3D46E
			/// @DnDParent : 3F03194B
			/// @DnDArgument : "expr" "string_copy(_read_value, 1, 5)"
			/// @DnDArgument : "var" "_read_value"
			_read_value = string_copy(_read_value, 1, 5);
		
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 6EEB5B6E
			/// @DnDParent : 3F03194B
			/// @DnDArgument : "value" "_read_value + "Dc""
			return _read_value + "Dc";
		}
	}
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 1631B909
/// @DnDComment : // Function that returns the current gamestate as a string
/// @DnDArgument : "funcName" "get_gamestate"
function get_gamestate() 
{
	/// @DnDAction : YoYo Games.Switch.Switch
	/// @DnDVersion : 1
	/// @DnDHash : 79DC92FB
	/// @DnDParent : 1631B909
	/// @DnDArgument : "expr" "obj_game_manager.current_game_state"
	var l79DC92FB_0 = obj_game_manager.current_game_state;
	switch(l79DC92FB_0)
	{
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 308B9A2D
		/// @DnDParent : 79DC92FB
		/// @DnDArgument : "const" "GAME_STATE.DYING"
		case GAME_STATE.DYING:
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 0A26E666
			/// @DnDParent : 308B9A2D
			/// @DnDArgument : "value" ""Dying""
			return "Dying";
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 121313BD
		/// @DnDParent : 79DC92FB
		/// @DnDArgument : "const" "GAME_STATE.ENDED"
		case GAME_STATE.ENDED:
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 52041D48
			/// @DnDParent : 121313BD
			/// @DnDArgument : "value" ""Ended""
			return "Ended";
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 274E81E0
		/// @DnDParent : 79DC92FB
		/// @DnDArgument : "const" "GAME_STATE.PAUSED"
		case GAME_STATE.PAUSED:
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 6A5BE844
			/// @DnDParent : 274E81E0
			/// @DnDArgument : "value" ""Paused""
			return "Paused";
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 26BE13ED
		/// @DnDParent : 79DC92FB
		/// @DnDArgument : "const" "GAME_STATE.PLAYING"
		case GAME_STATE.PLAYING:
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 238D47AE
			/// @DnDParent : 26BE13ED
			/// @DnDArgument : "value" ""Playing""
			return "Playing";
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 6FF315AA
		/// @DnDParent : 79DC92FB
		/// @DnDArgument : "const" "GAME_STATE.TUTORIAL"
		case GAME_STATE.TUTORIAL:
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 11BA7A63
			/// @DnDParent : 6FF315AA
			/// @DnDArgument : "value" ""Tutorial""
			return "Tutorial";
			break;
	
		/// @DnDAction : YoYo Games.Switch.Default
		/// @DnDVersion : 1
		/// @DnDHash : 6BB0E04B
		/// @DnDParent : 79DC92FB
		default:
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 6F48C000
			/// @DnDParent : 6BB0E04B
			/// @DnDArgument : "value" ""Unset""
			return "Unset";
			break;
	}
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 2E94470D
/// @DnDComment : // Function that returns the current wallstate as a string
/// @DnDArgument : "funcName" "get_interiorstate"
function get_interiorstate() 
{
	/// @DnDAction : YoYo Games.Switch.Switch
	/// @DnDVersion : 1
	/// @DnDHash : 61AD1668
	/// @DnDParent : 2E94470D
	/// @DnDArgument : "expr" "obj_interior_background.current_interior_state"
	var l61AD1668_0 = obj_interior_background.current_interior_state;
	switch(l61AD1668_0)
	{
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 3FEB571D
		/// @DnDParent : 61AD1668
		/// @DnDArgument : "const" "INTERIOR_STATE.ENTER"
		case INTERIOR_STATE.ENTER:
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 5F0282F0
			/// @DnDParent : 3FEB571D
			/// @DnDArgument : "value" ""Enter""
			return "Enter";
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 427EED60
		/// @DnDParent : 61AD1668
		/// @DnDArgument : "const" "INTERIOR_STATE.EXIT"
		case INTERIOR_STATE.EXIT:
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 4BD4E7A9
			/// @DnDParent : 427EED60
			/// @DnDArgument : "value" ""Exit""
			return "Exit";
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 41B8A8BF
		/// @DnDParent : 61AD1668
		/// @DnDArgument : "const" "INTERIOR_STATE.INSIDE"
		case INTERIOR_STATE.INSIDE:
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 30C7998B
			/// @DnDParent : 41B8A8BF
			/// @DnDArgument : "value" ""Inside""
			return "Inside";
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 334A0BCC
		/// @DnDParent : 61AD1668
		/// @DnDArgument : "const" "INTERIOR_STATE.OUTSIDE"
		case INTERIOR_STATE.OUTSIDE:
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 336BC087
			/// @DnDParent : 334A0BCC
			/// @DnDArgument : "value" ""Outside""
			return "Outside";
			break;
	
		/// @DnDAction : YoYo Games.Switch.Default
		/// @DnDVersion : 1
		/// @DnDHash : 06A70D63
		/// @DnDParent : 61AD1668
		default:
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 6BA92767
			/// @DnDParent : 06A70D63
			/// @DnDArgument : "value" ""Unset""
			return "Unset";
			break;
	}
}