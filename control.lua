--[[if we got enemyracemanager installed. Do this!]] 
if script.active_mods['enemyracemanager'] then
local Event = require('__stdlib__/stdlib/event/event')
local ErmConfig = require('__enemyracemanager__/lib/global_config')
local RaceSettingHelper = require('__enemyracemanager__/lib/helper/race_settings_helper')
local ErmDebugHelper = require('__enemyracemanager__/lib/debug_helper')

function modify_race_settings()
    ErmDebugHelper.print('L9M2\'s flyer mod is active')
    local race_settings = remote.call('enemyracemanager', 'get_race', MOD_NAME)
    if race_settings == nil then
        race_settings = {}
    end

    race_settings.race =  race_settings.race or MOD_NAME
    race_settings.label = {'gui.label-l9m2-flyer-enemy'}
    race_settings.level =  race_settings.level or 1
    race_settings.tier =  race_settings.tier or 1
    race_settings.evolution_point =  race_settings.evolution_point or 0
    race_settings.evolution_base_point =  race_settings.evolution_base_point or 0
    race_settings.attack_meter = race_settings.attack_meter or 0
    race_settings.attack_meter_total = race_settings.attack_meter_total or 0
    race_settings.last_attack_meter_total = race_settings.last_attack_meter_total or 0
    race_settings.next_attack_threshold = race_settings.next_attack_threshold or 0

    --- Units here will used for calculating attack point and level evolution
    --- It should not include timed units and units spawned by other units.
    --[[
    small-flyer
    medium-flyer
    big-flyer
    behemoth-flyer
    ultra-flyer
    ]]
    --RaceSettingHelper.remove_unit_from_tier(race_settings, 1, 'small-flyer')
    --RaceSettingHelper.remove_unit_from_tier(race_settings, 1, 'medium-flyer')
    --RaceSettingHelper.remove_unit_from_tier(race_settings, 2, 'big-flyer')
    --RaceSettingHelper.remove_unit_from_tier(race_settings, 3, 'behemoth-flyer')
    --RaceSettingHelper.remove_unit_from_tier(race_settings, 4, 'ultra-flyer')


race_settings.featured_flying_groups = {
    --Unit list, spawn percentage, unit_cost
    { { 'small-flyer', 'medium-flyer' }, { 1, 1 }, 75 },
    { { 'medium-flyer', 'big-flyer'}, { 3, 1}, 75 },
    { { 'medium-flyer', 'big-flyer', 'behemoth-flyer' }, { 1, 2, 1 }, 75 },
    { {'big-flyer', 'behemoth-flyer', 'ultra-flyer' }, { 1, 2, 1 }, 75 },
}
end
Event.on_init(function(event)
    modify_race_settings()
end)
Event.on_configuration_changed(function(event)
    modify_race_settings()
end)
end