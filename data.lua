--Medium Spitters are 50 HP, so this will be a fairly tough enemy.
--Collision Mask should be blank. To make the unit ignore all collision with everything.
--Think of it similar to the Mutalisk from Starcraft. Or an airborn spitter like enemy.
--
--The data is based off of small spitter code.
--Unit Speed is 0.185 for small spitter, they're FAST, but so are Flyers at 0.215!
--I want to make them "Slippery" in the air. Kinda like how Mutalisks are in the first game.
--
--
--There's no way to easily make it "not fly" over out of bounds. Because it can fly over water.
--And "Out of Bounds" is technically water for the sake of collision.
--Might add a check for it, but bots can fly over Out of Bounds so why wouldn't they?
--
--TODO:
--Rework it to actually 'fly' over terrain obstacles. DONE
--It now flies, but now fix the rendering issues associated with 'noclipping' DONE
--Add placeholder flying Mutalisk graphics. DONE
--Perhaps Custom Spawner? Incompatibility with Rampant...? Big Problem?
--Custom Config Options
--Actual "Factorio Style" 3D model graphics. DONE
--
--
--
--
--
--
--
--
--
--
--


--require ("prototypes.entity.spawner-animation")

require ("prototypes.entity.l9m2-flyer.flyer-animations")
require ("prototypes.entity.l9m2-flyer.flyer-projectiles")
require ("prototypes.entity.l9m2-flyer.flyer-spawn")

local enemy_autoplace = require ("__base__.prototypes.entity.enemy-autoplace-utils")
require ("__base__.prototypes.entity.biter-ai-settings")


local sounds = require ("__base__.prototypes.entity.sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")

data:extend(
{
  {
    type = "unit",
    name = "small-flyer",
    icon = "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-icon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 60, 
    order="a-a-a-h",
    subgroup="enemies",
    render_layer = "air-object",
    resistances = 
	{
      {
        type = "fire",
        percent = 100
      }
	},
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
	collision_mask = {}, 
    selection_box = {{-0.7, -2.5}, {0.7, -0.5}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -2.5}, {0.3, -1.2}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 75,
	--This is a fuction in the spitter projectiles.lua file.
	--This is responsible for the spitter's attack animation.
	--Change it to be nothing????
    attack_parameters = flyer_attack_parameters(
    {
      acid_stream_name = "acid-stream-flyer-small",
      range = range_flyer_small,
	  min_range = 3,
      min_attack_distance = 12,
      cooldown = 80,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_flyer_small,
      scale = scale_flyer_small,
      tint1 = tint_1_flyer_small,
      tint2 = tint_2_flyer_small,
      roarvolume = 0.4,
      range_mode = "bounding-box-to-bounding-box"
    }),
    vision_distance = 45,
    movement_speed = 0.215,

    distance_per_frame = 0.055,
    -- in pu
    pollution_to_join_attack = 4,
	--Actually, they just pop into a splatter of blood. Might be better.
    --corpse = "small-flyer-corpse",
    dying_explosion = "small-spitter-die",
    working_sound = sounds.spitter_calls(0.44),
    dying_sound = sounds.spitter_dying(0.45),
    run_animation = l9m2_flyerrunanimation(scale_flyer_small, tint_1_flyer_small, tint_2_flyer_small),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk(0.3),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(scale_flyer_small)
  },
  {
    type = "unit",
    name = "medium-flyer",
    icon = "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-icon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 120, 
    order="a-a-a-h",
    subgroup="enemies",
    render_layer = "air-object",
    resistances = 
	{
      {
        type = "fire",
        percent = 100
      }
	},
    healing_per_tick = 0.01,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -3}, {0.7, -0.5}},
	collision_mask = {}, 
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -2.6}, {0.3, -1.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 75,
	--This is a fuction in the spitter projectiles.lua file.
	--This is responsible for the spitter's attack animation.
	--Change it to be nothing????
    attack_parameters = flyer_mid_attack_parameters(
    {
      acid_stream_name = "acid-stream-flyer-medium",
      range = range_flyer_medium,
	  min_range = 3,
      min_attack_distance = 14,
      cooldown = 80,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_flyer_medium,
      scale = scale_flyer_medium,
      tint1 = tint_1_flyer_medium,
      tint2 = tint_2_flyer_medium,
      roarvolume = 0.4,
      range_mode = "bounding-box-to-bounding-box"
    }),
    vision_distance = 45,
    movement_speed = 0.205,

    distance_per_frame = 0.066,
    -- in pu
    pollution_to_join_attack = 12,
	--Actually, they just pop into a splatter of blood. Might be better.
    --corpse = "medium-flyer-corpse",
    dying_explosion = "medium-spitter-die",
    working_sound = sounds.spitter_calls(0.44),
    dying_sound = sounds.spitter_dying(0.45),
    run_animation = l9m2_flyerrunanimation(scale_flyer_medium, tint_1_flyer_medium, tint_2_flyer_medium),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk(0.3),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(scale_flyer_medium)
  },
  {
    type = "unit",
    name = "big-flyer",
    icon = "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-icon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 480, 
    order="a-a-a-h",
    subgroup="enemies",
    render_layer = "air-object",
    resistances = 
	{
      {
        type = "fire",
        percent = 100
      }
	},
    healing_per_tick = 0.01,
	collision_mask = {}, 
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -4.0}, {0.7, -0.5}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -3.7}, {0.3, -1.3}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 75,
	--This is a fuction in the spitter projectiles.lua file.
	--This is responsible for the spitter's attack animation.
	--Change it to be nothing????
    attack_parameters = flyer_big_attack_parameters(
    {
      acid_stream_name = "acid-stream-flyer-big",
      range = range_flyer_big,
	  min_range = 3,
      min_attack_distance = 14,
      cooldown = 80,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_flyer_big,
      scale = scale_flyer_big,
      tint1 = tint_1_flyer_big,
      tint2 = tint_2_flyer_big,
      roarvolume = 0.4,
      range_mode = "bounding-box-to-bounding-box"
    }),
    vision_distance = 45,
    movement_speed = 0.180,

    distance_per_frame = 0.08,
    -- in pu
    pollution_to_join_attack = 30,
	--Actually, they just pop into a splatter of blood. Might be better.
    --corpse = "big-flyer-corpse",
    dying_explosion = "big-spitter-die",
    working_sound = sounds.spitter_calls(0.44),
    dying_sound = sounds.spitter_dying(0.45),
    run_animation = l9m2_flyerrunanimation(scale_flyer_big, tint_1_flyer_big, tint_2_flyer_big),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk(0.3),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(scale_flyer_big)
  },
  {
    type = "unit",
    name = "behemoth-flyer",
    icon = "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-icon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 1920, 
    order="a-a-a-h",
    subgroup="enemies",
    render_layer = "air-object",
    resistances = 
	{
      {
        type = "fire",
        percent = 100
      }
	},
    healing_per_tick = 0.01,
	collision_mask = {}, 
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.7, -4.5}, {0.7, -0.5}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -4.2}, {0.3, -1.4}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 75,
	--This is a fuction in the spitter projectiles.lua file.
	--This is responsible for the spitter's attack animation.
	--Change it to be nothing????
    attack_parameters = flyer_behemoth_attack_parameters(
    {
      acid_stream_name = "acid-stream-flyer-behemoth",
      range = range_flyer_behemoth,
	  min_range = 3,
      min_attack_distance = 18,
      cooldown = 80,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_flyer_behemoth,
      scale = scale_flyer_behemoth,
      tint1 = tint_1_flyer_behemoth,
      tint2 = tint_2_flyer_behemoth,
      roarvolume = 0.4,
      range_mode = "bounding-box-to-bounding-box"
    }),
    vision_distance = 45,
    movement_speed = 0.165,

    distance_per_frame = 0.084,
    -- in pu
    pollution_to_join_attack = 200,
	--Actually, they just pop into a splatter of blood. Might be better.
    --corpse = "behemoth-flyer-corpse",
    dying_explosion = "behemoth-spitter-die",
    working_sound = sounds.spitter_calls(0.44),
    dying_sound = sounds.spitter_dying(0.45),
    run_animation = l9m2_flyerrunanimation(scale_flyer_behemoth, tint_1_flyer_behemoth, tint_2_flyer_behemoth),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk(0.3),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(scale_flyer_behemoth)
  }
}
)