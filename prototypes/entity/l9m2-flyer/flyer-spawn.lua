
local setting_utils = require("setting-utils")
local biterSpawner = data.raw["unit-spawner"]["spitter-spawner"]
if biterSpawner then
    local small_rate = setting_utils.getPositivePercentageOf("l9m2-flyer-small-flyer-spawn-probability")
    local medium_rate = setting_utils.getPositivePercentageOf("l9m2-flyer-medium-flyer-spawn-probability")
    local big_rate = setting_utils.getPositivePercentageOf("l9m2-flyer-big-flyer-spawn-probability")
    local behemoth_rate = setting_utils.getPositivePercentageOf("l9m2-flyer-behemoth-flyer-spawn-probability")
    local unitSet = biterSpawner["result_units"]
    unitSet[#unitSet + 1] = {
        "small-flyer",
		{
			{
			
			0.0, --Evolution Factor
			0.0 --Spawn chance
			},
			{
				0.1,
				0.3 * small_rate
			},
			{
				0.4,
				0.0
			}
		}
	}
    unitSet[#unitSet + 1] = {
        "medium-flyer",
        {
            {
                0.2,
                0.0
            },
            {
                0.4,
                0.3 * medium_rate
            },
            {
                0.7,
                0.1 * medium_rate
            }
        }
    }
    unitSet[#unitSet + 1] = {
        "big-flyer",
        {
            {
                0.5,
                0.0
            },
            {
                1.0,
                0.4 * big_rate
            }
        }
    }
    unitSet[#unitSet + 1] = {
        "behemoth-flyer",
        {
            {
                0.9,
                0.0
            },
            {
                1.0,
                0.3 * behemoth_rate
            }
        }
    }
    end