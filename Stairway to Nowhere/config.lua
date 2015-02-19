application = {
	content = {
		width = 320,
		height = 480, 
		scale = "letterBox",
		fps = 30,
		
		--[[
        imageSuffix = {
		    ["@2x"] = 2,
		}
		--]]
	},
		    license =
    {
        google =
        {
            key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr5OQF7Rb9MlL7hGg7lwt9dB10c5LBNXpaUBLO0hWQCr04cpxDRHHqKO18yLpXzh7SvYeuWmn5ojrTA84RxlGtSj1Fztb2BXqeVyiATYELdg5diLWvHqv03nWIu5jv6XH7xRfmqqqzjmD1XZgHFmvxvGdjQ3jYxhqQWvN/cpALnw/DEBWVKPBKDfjnoLGMXZbIdNGYX7ko1YaGfS1rwh1lj7GhYiVAzKGySn7L6UkAsG0xf6jihQvB9g82pPxgYkiJBynz+k/90AUKoDVRAao5b7kptdTmh4PZd4QpFZ/Hd9HVaTTziQRI+30+Cs7O3Gy8YS5GFsPm1pCmZV9hKsWbQIDAQAB",
            policy = "serverManaged",
        },
    },

    --[[
    -- Push notifications

    notification =
    {
        iphone =
        {
            types =
            {
                "badge", "sound", "alert", "newsstand"
            }
        }
    }
    --]]    
}
