local setting_utils = {}

local percentage_values = 
{
	["0%"] = 0, 
	["25%"] = 0.25, 
	["50%"] = 0.5, 
	["75%"] = 0.75, 
	["100%"] = 1.0, 
	["125%"] = 1.25, 
	["150%"] = 1.5, 
	["200%"] = 2.0, 
	["300%"] = 3.0,
	["400%"] = 4.0,
	["500%"] = 5.0,
	["700%"] = 7.0,
	["1000%"] = 10.0,
}


function setting_utils.getPositivePercentageOf(name)
	if settings.startup[name] and settings.startup[name].value then
		return percentage_values[settings.startup[name].value] or 1.0
	end
end


return setting_utils