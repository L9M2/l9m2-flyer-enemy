--Good luck trying to remove the supposed "optional" arguments, because the game will say otherwise.
--Okay this ONE layer is the bare MINIMUM to achieve the game not complaining on startup.
--__l9m2-flyer-enemy__
l9m2_flyer_scale = 1.1;
function l9m2_flyerrunanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        filenames =
        {
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-run-01.png",
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-run-02.png",
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-run-03.png",
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-run-04.png"
        },
        priority = "high",
		--Where to count the 'end of a line'??
		--Or to consider what row is the 'end of the image'??
        slice = 8,
		--Total rows in the sheet file
        lines_per_file = 8,
		--Sprites in the image on a line
        line_length = 8,
		--Sprite width and height
		--156
        width = 156,
		--Sprite width and height
		--132
        height = 132,
		--Frames in a given animation
        frame_count = 16,
		--Facing direction
        direction_count = 16,
        animation_speed = 0.125,
		shift = util.mul_shift(util.by_pixel(0, -60), scale),
        scale = scale*l9m2_flyer_scale,
		tint = tint1
      },
	  {
        filenames =
        {
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-run-shadow-01.png",
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-run-shadow-02.png",
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-run-shadow-03.png",
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-run-shadow-04.png"
        },
        priority = "high",
		--Where to count the 'end of a line'??
		--Or to consider what row is the 'end of the image'??
        slice = 8,
		--Total rows in the sheet file
        lines_per_file = 8,
		--Sprites in the image on a line
        line_length = 8,
		--Sprite width and height
		--156
        width = 224,
		--Sprite width and height
		--132
        height = 132,
		--Frames in a given animation
        frame_count = 16,
		--Facing direction
        direction_count = 16,
        animation_speed = 0.06125,
		shift = util.mul_shift(util.by_pixel(120, 0), scale),
        scale = scale*l9m2_flyer_scale,
        draw_as_shadow = true
      }
    }
  }
end
function l9m2_flyerattackanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        filenames =
        {
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-attack-01.png",
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-attack-02.png",
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-attack-03.png",
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-attack-04.png"
        },
        priority = "high",
		--Where to count the 'end of a line'??
		--Or to consider what row is the 'end of the image'??
        slice = 7,
		--Total rows in the sheet file
        lines_per_file = 8,
		--Sprites in the image on a line
        line_length = 7,
		--Sprite width and height
		--156
        width = 156,
		--Sprite width and height
		--132
        height = 132,
		--Frames in a given animation
        frame_count = 14,
		--Facing direction
        direction_count = 16,
        animation_speed = 0.125,
        shift = util.mul_shift(util.by_pixel(0, -60), scale),
        scale = scale*l9m2_flyer_scale,
		tint = tint1
      },
	  {
        filenames =
        {
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-attack-shadow-01.png",
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-attack-shadow-02.png",
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-attack-shadow-03.png",
		  "__l9m2-flyer-enemy__/graphics/l9m2-flyer/flyer-attack-shadow-04.png"
        },
        priority = "high",
		--Where to count the 'end of a line'??
		--Or to consider what row is the 'end of the image'??
        slice = 7,
		--Total rows in the sheet file
        lines_per_file = 8,
		--Sprites in the image on a line
        line_length = 7,
		--Sprite width and height
		--156
        width = 224,
		--Sprite width and height
		--132
        height = 132,
		--Frames in a given animation
        frame_count = 14,
		--Facing direction
        direction_count = 16,
        animation_speed = 0.06125,
        shift = util.mul_shift(util.by_pixel(120, 0), scale),
        scale = scale*l9m2_flyer_scale,
        draw_as_shadow = true
      }
    }
  }
end

function spitter_water_reflection(scale)
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/spitter/spitter-reflection.png",
      priority = "extra-high",
      width = 20,
      height = 32,
      shift = util.by_pixel(0, 50),
      scale = 5 * scale,
      variation_count = 1
    },
    rotate = true,
    orientation_to_variation = false
  }
end
function flyer_shoot_shiftings(scale, offset)
  return
  {
    {0.0625 *  0, util.add_shift(util.mul_shift(util.by_pixel(   0, -135), scale * 0.5), util.by_pixel(  offset *    0, -offset *    1))},
    {0.0625 *  1, util.add_shift(util.mul_shift(util.by_pixel(  24, -133), scale * 0.5), util.by_pixel(  offset * 0.38, -offset * 0.92))},
    {0.0625 *  2, util.add_shift(util.mul_shift(util.by_pixel(  48, -121), scale * 0.5), util.by_pixel(  offset * 0.71, -offset * 0.71))},
    {0.0625 *  3, util.add_shift(util.mul_shift(util.by_pixel(  76, -105), scale * 0.5), util.by_pixel(  offset * 0.92, -offset * 0.38))},
    {0.0625 *  4, util.add_shift(util.mul_shift(util.by_pixel(  86,  -73), scale * 0.5), util.by_pixel(  offset *    1,  offset *    0))},
    {0.0625 *  5, util.add_shift(util.mul_shift(util.by_pixel(  74,  -43), scale * 0.5), util.by_pixel(  offset * 0.92,  offset * 0.38))},
    {0.0625 *  6, util.add_shift(util.mul_shift(util.by_pixel(  52,  -25), scale * 0.5), util.by_pixel(  offset * 0.71,  offset * 0.71))},
    {0.0625 *  7, util.add_shift(util.mul_shift(util.by_pixel(  26,  -17), scale * 0.5), util.by_pixel(  offset * 0.38,  offset * 0.92))},
    {0.0625 *  8, util.add_shift(util.mul_shift(util.by_pixel(   1,  -13), scale * 0.5), util.by_pixel(  offset *    0,  offset *    1))},
    {0.0625 *  9, util.add_shift(util.mul_shift(util.by_pixel( -27,  -16), scale * 0.5), util.by_pixel( -offset * 0.38,  offset * 0.92))},
    {0.0625 * 10, util.add_shift(util.mul_shift(util.by_pixel( -51,  -23), scale * 0.5), util.by_pixel( -offset * 0.71,  offset * 0.71))},
    {0.0625 * 11, util.add_shift(util.mul_shift(util.by_pixel( -71,  -41), scale * 0.5), util.by_pixel( -offset * 0.92,  offset * 0.38))},
    {0.0625 * 12, util.add_shift(util.mul_shift(util.by_pixel( -85,  -71), scale * 0.5), util.by_pixel( -offset *    1,  offset *    0))},
    {0.0625 * 13, util.add_shift(util.mul_shift(util.by_pixel( -71, -103), scale * 0.5), util.by_pixel( -offset * 0.92, -offset * 0.38))},
    {0.0625 * 14, util.add_shift(util.mul_shift(util.by_pixel( -49, -119), scale * 0.5), util.by_pixel( -offset * 0.71, -offset * 0.71))},
    {0.0625 * 15, util.add_shift(util.mul_shift(util.by_pixel( -23, -125), scale * 0.5), util.by_pixel( -offset * 0.38, -offset * 0.92))}
  }
end