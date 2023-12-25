require ("prototypes.entity.l9m2-flyer.flyer-animations")
--require("__base__.prototypes.entity.fire")
local sounds = require("__base__.prototypes.entity.sounds")
local fireutil = require("__base__.prototypes.fire-util")
local math3d = require "math3d"
local setting_utils = require("setting-utils")
--require("settings")




--local small_isfire = settings.startup["l9m2-flyer-small-fire-or-acid"].value
--local medium_isfire = settings.startup["l9m2-flyer-medium-fire-or-acid"].value
--local big_isfire = settings.startup["l9m2-flyer-big-fire-or-acid"].value
--local behemoth_isfire = settings.startup["l9m2-flyer-behemoth-fire-or-acid"].value


function flyer_attack_parameters(data)
	if settings.startup["l9m2-flyer-small-fire-or-acid"].value then
		return
		{
			type = "stream",
			ammo_category = "biological",
			cooldown = data.cooldown,
			cooldown_deviation = data.cooldown_deviation,
			range = data.range,
			range_mode = data.range_mode,
			min_range = data.min_range,
			min_attack_distance = data.min_attack_distance,
			--projectile_creation_distance = 1.9,
			damage_modifier = data.damage_modifier,
			warmup = 30,
			projectile_creation_parameters = flyer_shoot_shiftings(data.scale, data.scale * scale_flyer_stream),
			use_shooter_direction = true,
		
			lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream
		
			ammo_type =
			{
			category = "biological",
			action =
			{
				type = "direct",
				action_delivery =
				{
				type = "stream",
						stream = "flyer-fire-stream"
				}
			}
			},
			cyclic_sound =
			{
			begin_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-start-1.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-2.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-3.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-4.ogg",
				volume = 0.27
				}
			},
			middle_sound =
			{
				{
				filename = "__base__/sound/fight/flamethrower-mid.ogg",
				volume = 0
				}
			},
			end_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-end-1.ogg",
				volume = 0
				}
			}
			},
			--sound = sounds.flyer_roars(data.roarvolume),
			animation = l9m2_flyerattackanimation(data.scale, data.tint1, data.tint2)
		}
	else
		return
		{
			type = "stream",
			ammo_category = "biological",
			cooldown = data.cooldown,
			cooldown_deviation = data.cooldown_deviation,
			range = data.range,
			range_mode = data.range_mode,
			min_range = data.min_range,
			min_attack_distance = data.min_attack_distance,
			--projectile_creation_distance = 1.9,
			damage_modifier = data.damage_modifier,
			warmup = 30,
			projectile_creation_parameters = flyer_shoot_shiftings(data.scale, data.scale * scale_flyer_stream),
			use_shooter_direction = true,
		
			lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream
		
			ammo_type =
			{
			category = "biological",
			action =
			{
				type = "direct",
				action_delivery =
				{
				type = "stream",
				--stream = data.acid_stream_name
					--Fire Ants? FLYER FIRE ANT
					--settings.startup["l9m2-flyer-small-fire-or-acid"].value
						--stream = "flamethrower-fire-stream"
						stream = data.acid_stream_name
				}
			}
			},
			cyclic_sound =
			{
			begin_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-start-1.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-2.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-3.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-4.ogg",
				volume = 0.27
				}
			},
			middle_sound =
			{
				{
				filename = "__base__/sound/fight/flamethrower-mid.ogg",
				volume = 0
				}
			},
			end_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-end-1.ogg",
				volume = 0
				}
			}
			},
			--sound = sounds.flyer_roars(data.roarvolume),
			animation = l9m2_flyerattackanimation(data.scale, data.tint1, data.tint2)
		}
	end
end

function flyer_mid_attack_parameters(data)
	if settings.startup["l9m2-flyer-medium-fire-or-acid"].value then
		return
		{
			type = "stream",
			ammo_category = "biological",
			cooldown = data.cooldown,
			cooldown_deviation = data.cooldown_deviation,
			range = data.range,
			range_mode = data.range_mode,
			min_range = data.min_range,
			min_attack_distance = data.min_attack_distance,
			--projectile_creation_distance = 1.9,
			damage_modifier = data.damage_modifier,
			warmup = 30,
			projectile_creation_parameters = flyer_shoot_shiftings(data.scale, data.scale * scale_flyer_stream),
			use_shooter_direction = true,
		
			lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream
		
			ammo_type =
			{
			category = "biological",
			action =
			{
				type = "direct",
				action_delivery =
				{
				type = "stream",
						stream = "flyer-fire-stream"
				}
			}
			},
			cyclic_sound =
			{
			begin_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-start-1.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-2.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-3.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-4.ogg",
				volume = 0.27
				}
			},
			middle_sound =
			{
				{
				filename = "__base__/sound/fight/flamethrower-mid.ogg",
				volume = 0
				}
			},
			end_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-end-1.ogg",
				volume = 0
				}
			}
			},
			--sound = sounds.flyer_roars(data.roarvolume),
			animation = l9m2_flyerattackanimation(data.scale, data.tint1, data.tint2)
		}
	else
		return
		{
			type = "stream",
			ammo_category = "biological",
			cooldown = data.cooldown,
			cooldown_deviation = data.cooldown_deviation,
			range = data.range,
			range_mode = data.range_mode,
			min_range = data.min_range,
			min_attack_distance = data.min_attack_distance,
			--projectile_creation_distance = 1.9,
			damage_modifier = data.damage_modifier,
			warmup = 30,
			projectile_creation_parameters = flyer_shoot_shiftings(data.scale, data.scale * scale_flyer_stream),
			use_shooter_direction = true,
		
			lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream
		
			ammo_type =
			{
			category = "biological",
			action =
			{
				type = "direct",
				action_delivery =
				{
				type = "stream",
				--stream = data.acid_stream_name
					--Fire Ants? FLYER FIRE ANT
					--settings.startup["l9m2-flyer-small-fire-or-acid"].value
						--stream = "flamethrower-fire-stream"
						stream = data.acid_stream_name
				}
			}
			},
			cyclic_sound =
			{
			begin_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-start-1.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-2.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-3.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-4.ogg",
				volume = 0.27
				}
			},
			middle_sound =
			{
				{
				filename = "__base__/sound/fight/flamethrower-mid.ogg",
				volume = 0
				}
			},
			end_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-end-1.ogg",
				volume = 0
				}
			}
			},
			--sound = sounds.flyer_roars(data.roarvolume),
			animation = l9m2_flyerattackanimation(data.scale, data.tint1, data.tint2)
		}
	end
end

function flyer_big_attack_parameters(data)
  	if settings.startup["l9m2-flyer-big-fire-or-acid"].value then
		return
		{
			type = "stream",
			ammo_category = "biological",
			cooldown = data.cooldown,
			cooldown_deviation = data.cooldown_deviation,
			range = data.range,
			range_mode = data.range_mode,
			min_range = data.min_range,
			min_attack_distance = data.min_attack_distance,
			--projectile_creation_distance = 1.9,
			damage_modifier = data.damage_modifier,
			warmup = 30,
			projectile_creation_parameters = flyer_shoot_shiftings(data.scale, data.scale * scale_flyer_stream),
			use_shooter_direction = true,
		
			lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream
		
			ammo_type =
			{
			category = "biological",
			action =
			{
				type = "direct",
				action_delivery =
				{
				type = "stream",
						stream = "flyer-fire-stream"
				}
			}
			},
			cyclic_sound =
			{
			begin_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-start-1.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-2.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-3.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-4.ogg",
				volume = 0.27
				}
			},
			middle_sound =
			{
				{
				filename = "__base__/sound/fight/flamethrower-mid.ogg",
				volume = 0
				}
			},
			end_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-end-1.ogg",
				volume = 0
				}
			}
			},
			--sound = sounds.flyer_roars(data.roarvolume),
			animation = l9m2_flyerattackanimation(data.scale, data.tint1, data.tint2)
		}
	else
		return
		{
			type = "stream",
			ammo_category = "biological",
			cooldown = data.cooldown,
			cooldown_deviation = data.cooldown_deviation,
			range = data.range,
			range_mode = data.range_mode,
			min_range = data.min_range,
			min_attack_distance = data.min_attack_distance,
			--projectile_creation_distance = 1.9,
			damage_modifier = data.damage_modifier,
			warmup = 30,
			projectile_creation_parameters = flyer_shoot_shiftings(data.scale, data.scale * scale_flyer_stream),
			use_shooter_direction = true,
		
			lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream
		
			ammo_type =
			{
			category = "biological",
			action =
			{
				type = "direct",
				action_delivery =
				{
				type = "stream",
				--stream = data.acid_stream_name
					--Fire Ants? FLYER FIRE ANT
					--settings.startup["l9m2-flyer-small-fire-or-acid"].value
						--stream = "flamethrower-fire-stream"
						stream = data.acid_stream_name
				}
			}
			},
			cyclic_sound =
			{
			begin_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-start-1.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-2.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-3.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-4.ogg",
				volume = 0.27
				}
			},
			middle_sound =
			{
				{
				filename = "__base__/sound/fight/flamethrower-mid.ogg",
				volume = 0
				}
			},
			end_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-end-1.ogg",
				volume = 0
				}
			}
			},
			--sound = sounds.flyer_roars(data.roarvolume),
			animation = l9m2_flyerattackanimation(data.scale, data.tint1, data.tint2)
		}
	end
end

function flyer_behemoth_attack_parameters(data)
  	if settings.startup["l9m2-flyer-behemoth-fire-or-acid"].value then
		return
		{
			type = "stream",
			ammo_category = "biological",
			cooldown = data.cooldown,
			cooldown_deviation = data.cooldown_deviation,
			range = data.range,
			range_mode = data.range_mode,
			min_range = data.min_range,
			min_attack_distance = data.min_attack_distance,
			--projectile_creation_distance = 1.9,
			damage_modifier = data.damage_modifier,
			warmup = 30,
			projectile_creation_parameters = flyer_shoot_shiftings(data.scale, data.scale * scale_flyer_stream),
			use_shooter_direction = true,
		
			lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream
		
			ammo_type =
			{
			category = "biological",
			action =
			{
				type = "direct",
				action_delivery =
				{
				type = "stream",
						stream = "flyer-fire-stream"
				}
			}
			},
			cyclic_sound =
			{
			begin_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-start-1.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-2.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-3.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-4.ogg",
				volume = 0.27
				}
			},
			middle_sound =
			{
				{
				filename = "__base__/sound/fight/flamethrower-mid.ogg",
				volume = 0
				}
			},
			end_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-end-1.ogg",
				volume = 0
				}
			}
			},
			--sound = sounds.flyer_roars(data.roarvolume),
			animation = l9m2_flyerattackanimation(data.scale, data.tint1, data.tint2)
		}
	else
		return
		{
			type = "stream",
			ammo_category = "biological",
			cooldown = data.cooldown,
			cooldown_deviation = data.cooldown_deviation,
			range = data.range,
			range_mode = data.range_mode,
			min_range = data.min_range,
			min_attack_distance = data.min_attack_distance,
			--projectile_creation_distance = 1.9,
			damage_modifier = data.damage_modifier,
			warmup = 30,
			projectile_creation_parameters = flyer_shoot_shiftings(data.scale, data.scale * scale_flyer_stream),
			use_shooter_direction = true,
		
			lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream
		
			ammo_type =
			{
			category = "biological",
			action =
			{
				type = "direct",
				action_delivery =
				{
				type = "stream",
				--stream = data.acid_stream_name
					--Fire Ants? FLYER FIRE ANT
					--settings.startup["l9m2-flyer-small-fire-or-acid"].value
						--stream = "flamethrower-fire-stream"
						stream = data.acid_stream_name
				}
			}
			},
			cyclic_sound =
			{
			begin_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-start-1.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-2.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-3.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-4.ogg",
				volume = 0.27
				}
			},
			middle_sound =
			{
				{
				filename = "__base__/sound/fight/flamethrower-mid.ogg",
				volume = 0
				}
			},
			end_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-end-1.ogg",
				volume = 0
				}
			}
			},
			--sound = sounds.flyer_roars(data.roarvolume),
			animation = l9m2_flyerattackanimation(data.scale, data.tint1, data.tint2)
		}
	end
end


scale_flyer_small    = 0.5
scale_flyer_medium   = 0.7
scale_flyer_big      = 1.0
scale_flyer_behemoth = 1.2

stream_scale_flyer_small    = 0.5
stream_scale_flyer_medium   = 0.7
stream_scale_flyer_big      = 1.0
stream_scale_flyer_behemoth = 1.2

tint_1_flyer_small    = {r=0.248 , g=0.122 , b=0.021 , a=1 } --hr
tint_2_flyer_small    = {r=0.91 , g=0.92 , b=0.87 , a=1 } --non hr
tint_1_flyer_medium   = {r=0.625 , g=0.051 , b=0.052 , a=1 }
tint_2_flyer_medium   = {r=0.89 , g=0.84 , b=0.85 , a=1 }
tint_1_flyer_big      = {r=0.044 , g=0.206 , b=0.245 , a=1 }
tint_2_flyer_big      = {r=0.8  , g=0.82 , b=0.85 , a=1 }
tint_1_flyer_behemoth = {r=0.088 , g=0.415 , b=0.04 , a=1 }
tint_2_flyer_behemoth = {r = 0.7, g = 0.95, b = 0.4, a = 1.000}

--stream_tint =  {r = 0.917, g = 1.000, b = 0.282, a = 1.000}-- #e9ff47ff
--splash_tint =  {r = 1.000, g = 0.992, b = 0.512, a = 1.000} -- #fffc82ff
--sticker_tint = {r = 0.129, g = 0.283, b = 0.078, a = 1.000} -- #204813ff

stream_tint_flyer_small    = stream_tint
stream_tint_flyer_medium   = stream_tint
stream_tint_flyer_big      = stream_tint
stream_tint_flyer_behemoth = stream_tint

stream_tint_flyer_small    = stream_tint_flyer_small
stream_tint_flyer_medium   = stream_tint_flyer_medium
stream_tint_flyer_big      = stream_tint_flyer_big
stream_tint_flyer_behemoth = stream_tint_flyer_behemoth

tint_flyer_small      = {r = 0.7, g = 1, b = 0.3  , a = 0.5}--{r=1    , g=0.63 , b=0    , a=0.5  }
tint_flyer_medium     = {r=0.9  , g=0.15 , b=0.3  , a=1    }
tint_flyer_big        = {r=0.34 , g=0.68 , b=0.90 , a=0.8    }
tint_flyer_behemoth   = {r = 0.3, g = 1, b = 0  , a = 0.8}

splash_tint_flyer_small      = splash_tint
splash_tint_flyer_medium     = splash_tint
splash_tint_flyer_big        = splash_tint
splash_tint_flyer_behemoth   = splash_tint

splash_tint_flyer_small      = splash_tint_flyer_small
splash_tint_flyer_medium     = splash_tint_flyer_medium
splash_tint_flyer_big        = splash_tint_flyer_big
splash_tint_flyer_behemoth   = splash_tint_flyer_behemoth

sticker_tint_small     = sticker_tint
sticker_tint_medium    = sticker_tint
sticker_tint_big       = sticker_tint
sticker_tint_behemoth  = sticker_tint

scale_flyer_small     = 0.65
scale_flyer_medium    = 0.83
scale_flyer_big       = 1.0
scale_flyer_behemoth  = 1.2

scale_flyer_stream    = 15
scale_flyer_stream = 20

stream_scale_flyer_small    = 0.65
stream_scale_flyer_medium   = 0.83
stream_scale_flyer_big      = 1.0
stream_scale_flyer_behemoth = 1.2

damage_modifier_flyer_small    = 12
damage_modifier_flyer_medium   = 24
damage_modifier_flyer_big      = 36
damage_modifier_flyer_behemoth = 60

damage_modifier_flyer_small    = 36
damage_modifier_flyer_medium   = 48
damage_modifier_flyer_big      = 72
damage_modifier_flyer_behemoth = 96

damage_splash_flyer_small    = 0.1
damage_splash_flyer_medium   = 0.2
damage_splash_flyer_big      = 0.6
damage_splash_flyer_behemoth = 1.2

damage_splash_flyer_small    = 0.1
damage_splash_flyer_medium   = 0.2
damage_splash_flyer_big      = 0.6
damage_splash_flyer_behemoth = 1.0

stream_radius_flyer_small    = 1
stream_radius_flyer_medium   = 1.25
stream_radius_flyer_big      = 1.35
stream_radius_flyer_behemoth = 1.75

stream_radius_flyer_small    = 1.4
stream_radius_flyer_medium   = 1.55
stream_radius_flyer_big      = 1.75
stream_radius_flyer_behemoth = 2

range_flyer_small    = 25
range_flyer_medium   = 30
range_flyer_big      = 38
range_flyer_behemoth = 48

prepare_range_flyer_small    = 8
prepare_range_flyer_medium   = 16
prepare_range_flyer_big      = 24
prepare_range_flyer_behemoth = 36

ground_patch_scale_modifier = 0.65
patch_opacity = 0.7


data:extend({
---STREAMS
-----------------------------------------------------
 acid_stream({
    name = "acid-stream-flyer-small",
    scale = scale_flyer_small*1.1,
    tint = stream_tint_flyer_small,
    corpse_name = "acid-splash-flyer-small",
    spit_radius = stream_radius_flyer_small,
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "acid-splash-fire-spitter-small",
    sticker_name = "acid-sticker-small"
  }),
  acid_stream({
    name = "acid-stream-flyer-medium",
    scale = scale_flyer_medium,
    tint = stream_tint_flyer_medium,
    corpse_name = "acid-splash-flyer-medium",
    spit_radius = stream_radius_flyer_medium,
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "acid-splash-fire-spitter-medium",
    sticker_name = "acid-sticker-medium"
  }),
  acid_stream({
    name = "acid-stream-flyer-big",
    scale = scale_flyer_big,
    tint = stream_tint_flyer_big,
    corpse_name = "acid-splash-flyer-big",
    spit_radius = stream_radius_flyer_big,
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "acid-splash-fire-spitter-big",
    sticker_name = "acid-sticker-big"
  }),
  acid_stream({
    name = "acid-stream-flyer-behemoth",
    scale = scale_flyer_behemoth,
    tint = stream_tint_flyer_behemoth,
    corpse_name = "acid-splash-flyer-behemoth",
    spit_radius = stream_radius_flyer_behemoth,
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "acid-splash-fire-spitter-behemoth",
    sticker_name = "acid-sticker-behemoth"
  })
})
--From Fire.lua

local stream_sprites =
{
  spine_animation = util.draw_as_glow
  {
    filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-fire-stream-spine.png",
    blend_mode = "additive",
    --tint = {r=1, g=1, b=1, a=0.5},
    line_length = 4,
    width = 32,
    height = 18,
    frame_count = 32,
    axially_symmetrical = false,
    direction_count = 1,
    animation_speed = 2,
    shift = {0, 0}
  },

  shadow =
  {
    filename = "__base__/graphics/entity/acid-projectile/projectile-shadow.png",
    line_length = 5,
    width = 28,
    height = 16,
    frame_count = 33,
    priority = "high",
    shift = {-0.09, 0.395}
  },

  particle = util.draw_as_glow
  {
    filename = "__base__/graphics/entity/flamethrower-fire-stream/flamethrower-explosion.png",
    priority = "extra-high",
    width = 64,
    height = 64,
    frame_count = 32,
    line_length = 8
  }
}

data:extend(
{
  {
    type = "stream",
    name = "flyer-fire-stream",
    flags = {"not-on-map"},
    --stream_light = {intensity = 1, size = 4},
    --ground_light = {intensity = 0.8, size = 4},

    smoke_sources =
    {
      {
        name = "soft-fire-smoke",
        frequency = 0.05, --0.25,
        position = {0.0, 0}, -- -0.8},
        starting_frame_deviation = 60
      }
    },
    particle_buffer_size = 90,
    particle_spawn_interval = 2,
    particle_spawn_timeout = 8,
    particle_vertical_acceleration = 0.005 * 0.60,
    particle_horizontal_speed = 0.2* 0.75 * 1.5,
    particle_horizontal_speed_deviation = 0.005 * 0.70,
    particle_start_alpha = 0.5,
    particle_end_alpha = 1,
    particle_start_scale = 0.2,
    particle_loop_frame_count = 3,
    particle_fade_out_threshold = 0.9,
    particle_loop_exit_threshold = 0.25,
    action =
    {
      {
        type = "area",
        radius = 2.5,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = "fire-sticker",
              show_in_tooltip = true
            },
            {
              type = "damage",
              damage = { amount = 3, type = "fire" },
              apply_damage_to_trees = false
            }
          }
        }
      },
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-fire",
              entity_name = "fire-flame",
              show_in_tooltip = true
            }
          }
        }
      }
    },
    spine_animation = stream_sprites.spine_animation,
    shadow = stream_sprites.shadow,
    particle = stream_sprites.particle
  }
}
)