data:extend(
    {
	    {
            type = "string-setting",
            name = "l9m2-flyer-small-flyer-spawn-probability",
            setting_type = "startup",
            default_value = "75%",
            allowed_values = {"25%", "50%", "75%", "100%", "125%", "150%", "200%", "300%", "400%"},
            order = "a1"
        },
		{
            type = "string-setting",
            name = "l9m2-flyer-medium-flyer-spawn-probability",
            setting_type = "startup",
            default_value = "75%",
            allowed_values = {"25%", "50%", "75%", "100%", "125%", "150%", "200%", "300%", "400%"},
            order = "a2"
        },
		{
            type = "string-setting",
            name = "l9m2-flyer-big-flyer-spawn-probability",
            setting_type = "startup",
            default_value = "75%",
            allowed_values = {"25%", "50%", "75%", "100%", "125%", "150%", "200%", "300%", "400%"},
            order = "a3"
        },
		{
            type = "string-setting",
            name = "l9m2-flyer-behemoth-flyer-spawn-probability",
            setting_type = "startup",
            default_value = "75%",
            allowed_values = {"25%", "50%", "75%", "100%", "125%", "150%", "200%", "300%", "400%"},
            order = "a4"
        },
		--Default True = Fire
		{
			type = "bool-setting",
			name = "l9m2-flyer-small-fire-or-acid",
			setting_type = "startup",
			default_value = false
		},
		{
			type = "bool-setting",
			name = "l9m2-flyer-medium-fire-or-acid",
			setting_type = "startup",
			default_value = false
		},
		{
			type = "bool-setting",
			name = "l9m2-flyer-big-fire-or-acid",
			setting_type = "startup",
			default_value = true
		},
		{
			type = "bool-setting",
			name = "l9m2-flyer-behemoth-fire-or-acid",
			setting_type = "startup",
			default_value = true
		}
	}
)