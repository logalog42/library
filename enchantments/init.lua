{
    hp_max = 10,
    -- Defines the maximum and default HP of the entity
    -- For Lua entities the maximum is not enforced.
    -- For players this defaults to `minetest.PLAYER_MAX_HP_DEFAULT`.

    breath_max = 0,
    -- For players only. Defaults to `minetest.PLAYER_MAX_BREATH_DEFAULT`.

    zoom_fov = 0.0,
    -- For players only. Zoom FOV in degrees.
    -- Note that zoom loads and/or generates world beyond the server's
    -- maximum send and generate distances, so acts like a telescope.
    -- Smaller zoom_fov values increase the distance loaded/generated.
    -- Defaults to 15 in creative mode, 0 in survival mode.
    -- zoom_fov = 0 disables zooming for the player.

    eye_height = 1.625,
    -- For players only. Camera height above feet position in nodes.

    physical = false,
    -- Collide with `walkable` nodes.

    collide_with_objects = true,
    -- Collide with other objects if physical = true

    collisionbox = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },  -- default
    selectionbox = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5, rotate = false },
    -- { xmin, ymin, zmin, xmax, ymax, zmax } in nodes from object position.
    -- Collision boxes cannot rotate, setting `rotate = true` on it has no effect.
    -- If not set, the selection box copies the collision box, and will also not rotate.
    -- If `rotate = false`, the selection box will not rotate with the object itself, remaining fixed to the axes.
    -- If `rotate = true`, it will match the object's rotation and any attachment rotations.
    -- Raycasts use the selection box and object's rotation, but do *not* obey attachment rotations.


    pointable = true,
    -- Whether the object can be pointed at

    visual = "cube" / "sprite" / "upright_sprite" / "mesh" / "wielditem" / "item",
    -- "cube" is a node-sized cube.
    -- "sprite" is a flat texture always facing the player.
    -- "upright_sprite" is a vertical flat texture.
    -- "mesh" uses the defined mesh model.
    -- "wielditem" is used for dropped items.
    --   (see builtin/game/item_entity.lua).
    --   For this use 'wield_item = itemname' (Deprecated: 'textures = {itemname}').
    --   If the item has a 'wield_image' the object will be an extrusion of
    --   that, otherwise:
    --   If 'itemname' is a cubic node or nodebox the object will appear
    --   identical to 'itemname'.
    --   If 'itemname' is a plantlike node the object will be an extrusion
    --   of its texture.
    --   Otherwise for non-node items, the object will be an extrusion of
    --   'inventory_image'.
    --   If 'itemname' contains a ColorString or palette index (e.g. from
    --   `minetest.itemstring_with_palette()`), the entity will inherit the color.
    -- "item" is similar to "wielditem" but ignores the 'wield_image' parameter.

    visual_size = {x = 1, y = 1, z = 1},
    -- Multipliers for the visual size. If `z` is not specified, `x` will be used
    -- to scale the entity along both horizontal axes.

    mesh = "model.obj",
    -- File name of mesh when using "mesh" visual

    textures = {},
    -- Number of required textures depends on visual.
    -- "cube" uses 6 textures just like a node, but all 6 must be defined.
    -- "sprite" uses 1 texture.
    -- "upright_sprite" uses 2 textures: {front, back}.
    -- "wielditem" expects 'textures = {itemname}' (see 'visual' above).
    -- "mesh" requires one texture for each mesh buffer/material (in order)

    colors = {},
    -- Number of required colors depends on visual

    use_texture_alpha = false,
    -- Use texture's alpha channel.
    -- Excludes "upright_sprite" and "wielditem".
    -- Note: currently causes visual issues when viewed through other
    -- semi-transparent materials such as water.

    spritediv = {x = 1, y = 1},
    -- Used with spritesheet textures for animation and/or frame selection
    -- according to position relative to player.
    -- Defines the number of columns and rows in the spritesheet:
    -- {columns, rows}.

    initial_sprite_basepos = {x = 0, y = 0},
    -- Used with spritesheet textures.
    -- Defines the {column, row} position of the initially used frame in the
    -- spritesheet.

    is_visible = true,
    -- If false, object is invisible and can't be pointed.

    makes_footstep_sound = false,
    -- If true, is able to make footstep sounds of nodes
    -- (see node sound definition for details).

    automatic_rotate = 0,
    -- Set constant rotation in radians per second, positive or negative.
    -- Object rotates along the local Y-axis, and works with set_rotation.
    -- Set to 0 to disable constant rotation.

    stepheight = 0,
    -- If positive number, object will climb upwards when it moves
    -- horizontally against a `walkable` node, if the height difference
    -- is within `stepheight`.

    automatic_face_movement_dir = 0.0,
    -- Automatically set yaw to movement direction, offset in degrees.
    -- 'false' to disable.

    automatic_face_movement_max_rotation_per_sec = -1,
    -- Limit automatic rotation to this value in degrees per second.
    -- No limit if value <= 0.

    backface_culling = true,
    -- Set to false to disable backface_culling for model

    glow = 0,
    -- Add this much extra lighting when calculating texture color.
    -- Value < 0 disables light's effect on texture color.
    -- For faking self-lighting, UI style entities, or programmatic coloring
    -- in mods.

    nametag = "",
    -- The name to display on the head of the object. By default empty.
    -- If the object is a player, a nil or empty nametag is replaced by the player's name.
    -- For all other objects, a nil or empty string removes the nametag.
    -- To hide a nametag, set its color alpha to zero. That will disable it entirely.

    nametag_color = <ColorSpec>,
    -- Sets text color of nametag

    nametag_bgcolor = <ColorSpec>,
    -- Sets background color of nametag
    -- `false` will cause the background to be set automatically based on user settings.
    -- Default: false

    infotext = "",
    -- Same as infotext for nodes. Empty by default

    static_save = true,
    -- If false, never save this object statically. It will simply be
    -- deleted when the block gets unloaded.
    -- The get_staticdata() callback is never called then.
    -- Defaults to 'true'.

    damage_texture_modifier = "^[brighten",
    -- Texture modifier to be applied for a short duration when object is hit

    shaded = true,
    -- Setting this to 'false' disables diffuse lighting of entity

    show_on_minimap = false,
    -- Defaults to true for players, false for other entities.
    -- If set to true the entity will show as a marker on the minimap.
}


    get_player_name(): returns "" if is not a player
    get_player_velocity(): table {x, y, z} representing the player s instantaneous velocity in nodes/s
    add_velocity(vel):
    get_look_dir(): get camera direction as a unit vector
    get_look_vertical(): pitch in radians
        Angle ranges between -pi/2 and pi/2, which are straight up and down respectively.
    get_look_horizontal(): yaw in radians
        Angle is counter-clockwise from the +z direction.
    set_look_vertical(radians): sets look pitch
        radians: Angle from looking forward, where positive is downwards.
    set_look_horizontal(radians): sets look yaw
        radians: Angle from the +z direction, where positive is counter-clockwise.
    get_look_pitch(): pitch in radians - Deprecated as broken. Use get_look_vertical.
        Angle ranges between -pi/2 and pi/2, which are straight down and up respectively.
    get_look_yaw(): yaw in radians - Deprecated as broken. Use get_look_horizontal.
        Angle is counter-clockwise from the +x direction.
    set_look_pitch(radians): sets look pitch - Deprecated. Use set_look_vertical.
    set_look_yaw(radians): sets look yaw - Deprecated. Use set_look_horizontal.
{
    get_breath(): returns players breath
    set_breath(value): sets players breath
        values:
            0: player is drowning
            max: bubbles bar is not shown
            See [Object properties] for more information
        Is limited to range 0 ... 65535 (2^16 - 1)
}
{
    set_fov(fov, is_multiplier, transition_time): Sets player s FOV
        fov: FOV value.
        is_multiplier: Set to true if the FOV value is a multiplier. Defaults to false.
        transition_time: If defined, enables smooth FOV transition. Interpreted as the time (in seconds) to reach target FOV. If set to 0, FOV change is instantaneous. Defaults to 0.
        Set fov to 0 to clear FOV override.
    get_fov(): Returns the following:
        Server-sent FOV value. Returns 0 if an FOV override doesn t exist.
        Boolean indicating whether the FOV value is a multiplier.
        Time (in seconds) taken for the FOV transition. Set by set_fov.
}
    get_meta(): Returns a PlayerMetaRef.
{
    set_inventory_formspec(formspec)
        Redefine player s inventory form
        Should usually be called in on_joinplayer
        If formspec is "", the player s inventory is disabled.
    get_inventory_formspec(): returns a formspec string
    set_formspec_prepend(formspec):
        the formspec string will be added to every formspec shown to the user, except for those with a no_prepend[] tag.
        This should be used to set style elements such as background[] and bgcolor[], any non-style elements (eg: label) may result in weird behavior.
        Only affects formspecs shown after this is called.
    get_formspec_prepend(formspec): returns a formspec string.
}
    get_player_control(): returns table with player pressed keys
        The table consists of fields with the following boolean values representing the pressed keys: up, down, left, right, jump, aux1, sneak, dig, place, LMB, RMB, and zoom.
        The fields LMB and RMB are equal to dig and place respectively, and exist only to preserve backwards compatibility.
        Returns an empty table {} if the object is not a player.
    get_player_control_bits(): returns integer with bit packed player pressed keys.
        Bits:
            0 - up
            1 - down
            2 - left
            3 - right
            4 - jump
            5 - aux1
            6 - sneak
            7 - dig
            8 - place
            9 - zoom
        Returns 0 (no bits set) if the object is not a player.

{
    hud_add(hud definition): add a HUD element described by HUD def, returns ID number on success
    hud_remove(id): remove the HUD element of the specified id
    hud_change(id, stat, value): change a value of a previously added HUD element.
        stat supports the same keys as in the hud definition table except for "hud_elem_type".
    hud_get(id): gets the HUD element definition structure of the specified ID
    hud_set_flags(flags): sets specified HUD flags of player.
        flags: A table with the following fields set to boolean values
            hotbar
            healthbar
            crosshair
            wielditem
            breathbar
            minimap: Modifies the client s permission to view the minimap. The client may locally elect to not view the minimap.
            minimap_radar: is only usable when minimap is true
            basic_debug: Allow showing basic debug info that might give a gameplay advantage. This includes map seed, player position, look direction, the pointed node and block bounds. Does not affect players with the debug privilege.
        If a flag equals nil, the flag is not modified
    hud_get_flags(): returns a table of player HUD flags with boolean values.
        See hud_set_flags for a list of flags that can be toggled.
    hud_set_hotbar_itemcount(count): sets number of items in builtin hotbar
        count: number of items, must be between 1 and 32
    hud_get_hotbar_itemcount: returns number of visible items
    hud_set_hotbar_image(texturename)
        sets background image for hotbar
    hud_get_hotbar_image: returns texturename
    hud_set_hotbar_selected_image(texturename)
        sets image for selected item of hotbar
    hud_get_hotbar_selected_image: returns texturename
}
    set_minimap_modes({mode, mode, ...}, selected_mode)
        Overrides the available minimap modes (and toggle order), and changes the selected mode.
        mode is a table consisting of up to four fields:
            type: Available type:
                off: Minimap off
                surface: Minimap in surface mode
                radar: Minimap in radar mode
                texture: Texture to be displayed instead of terrain map (texture is centered around 0,0 and can be scaled). Texture size is limited to 512 x 512 pixel.
            label: Optional label to display on minimap mode toggle The translation must be handled within the mod.
            size: Sidelength or diameter, in number of nodes, of the terrain displayed in minimap
            texture: Only for texture type, name of the texture to display
            scale: Only for texture type, scale of the texture map in nodes per pixel (for example a scale of 2 means each pixel represents a 2x2 nodes square)
        selected_mode is the mode index to be selected after modes have been changed (0 is the first mode).
    set_sky(sky_parameters)
        The presence of the function set_sun, set_moon or set_stars indicates whether set_sky accepts this format. Check the legacy format otherwise.
        Passing no arguments resets the sky to its default values.
        sky_parameters is a table with the following optional fields:
            base_color: ColorSpec, changes fog in "skybox" and "plain". (default: #ffffff)
            type: Available types:
                "regular": Uses 0 textures, base_color ignored
                "skybox": Uses 6 textures, base_color used as fog.
                "plain": Uses 0 textures, base_color used as both fog and sky. (default: "regular")
            textures: A table containing up to six textures in the following order: Y+ (top), Y- (bottom), X- (west), X+ (east), Z+ (north), Z- (south).
            clouds: Boolean for whether clouds appear. (default: true)
            sky_color: A table used in "regular" type only, containing the following values (alpha is ignored):
                day_sky: ColorSpec, for the top half of the sky during the day. (default: #61b5f5)
                day_horizon: ColorSpec, for the bottom half of the sky during the day. (default: #90d3f6)
                dawn_sky: ColorSpec, for the top half of the sky during dawn/sunset. (default: #b4bafa) The resulting sky color will be a darkened version of the ColorSpec. Warning: The darkening of the ColorSpec is subject to change.
                dawn_horizon: ColorSpec, for the bottom half of the sky during dawn/sunset. (default: #bac1f0) The resulting sky color will be a darkened version of the ColorSpec. Warning: The darkening of the ColorSpec is subject to change.
                night_sky: ColorSpec, for the top half of the sky during the night. (default: #006bff) The resulting sky color will be a dark version of the ColorSpec. Warning: The darkening of the ColorSpec is subject to change.
                night_horizon: ColorSpec, for the bottom half of the sky during the night. (default: #4090ff) The resulting sky color will be a dark version of the ColorSpec. Warning: The darkening of the ColorSpec is subject to change.
                indoors: ColorSpec, for when you re either indoors or underground. (default: #646464)
                fog_sun_tint: ColorSpec, changes the fog tinting for the sun at sunrise and sunset. (default: #f47d1d)
                fog_moon_tint: ColorSpec, changes the fog tinting for the moon at sunrise and sunset. (default: #7f99cc)
                fog_tint_type: string, changes which mode the directional fog abides by, "custom" uses sun_tint and moon_tint, while "default" uses the classic Minetest sun and moon tinting. Will use tonemaps, if set to "default". (default: "default")
    set_sky(base_color, type, {texture names}, clouds)
        Deprecated. Use set_sky(sky_parameters)
        base_color: ColorSpec, defaults to white
        type: Available types:
            "regular": Uses 0 textures, bgcolor ignored
            "skybox": Uses 6 textures, bgcolor used
            "plain": Uses 0 textures, bgcolor used
        clouds: Boolean for whether clouds appear in front of "skybox" or "plain" custom skyboxes (default: true)
    get_sky(as_table):
        as_table: boolean that determines whether the deprecated version of this function is being used.
            true returns a table containing sky parameters as defined in set_sky(sky_parameters).
            Deprecated: false or nil returns base_color, type, table of textures, clouds.
    get_sky_color():
        Deprecated: Use get_sky(as_table) instead.
        returns a table with the sky_color parameters as in set_sky.
    set_sun(sun_parameters):
        Passing no arguments resets the sun to its default values.
        sun_parameters is a table with the following optional fields:
            visible: Boolean for whether the sun is visible. (default: true)
            texture: A regular texture for the sun. Setting to "" will re-enable the mesh sun. (default: "sun.png", if it exists) The texture appears non-rotated at sunrise and rotated 180 degrees (upside down) at sunset.
            tonemap: A 512x1 texture containing the tonemap for the sun (default: "sun_tonemap.png")
            sunrise: A regular texture for the sunrise texture. (default: "sunrisebg.png")
            sunrise_visible: Boolean for whether the sunrise texture is visible. (default: true)
            scale: Float controlling the overall size of the sun. (default: 1) Note: For legacy reasons, the sun is bigger than the moon by a factor of about 1.57 for equal scale values.
    get_sun(): returns a table with the current sun parameters as in set_sun.
    set_moon(moon_parameters):
        Passing no arguments resets the moon to its default values.
        moon_parameters is a table with the following optional fields:
            visible: Boolean for whether the moon is visible. (default: true)
            texture: A regular texture for the moon. Setting to "" will re-enable the mesh moon. (default: "moon.png", if it exists) The texture appears non-rotated at sunrise / moonset and rotated 180 degrees (upside down) at sunset / moonrise. Note: Relative to the sun, the moon texture is hence rotated by 180°. You can use the ^[transformR180 texture modifier to achieve the same orientation.
            tonemap: A 512x1 texture containing the tonemap for the moon (default: "moon_tonemap.png")
            scale: Float controlling the overall size of the moon (default: 1) Note: For legacy reasons, the sun is bigger than the moon by a factor of about 1.57 for equal scale values.
    get_moon(): returns a table with the current moon parameters as in set_moon.
    set_stars(star_parameters):
        Passing no arguments resets stars to their default values.
        star_parameters is a table with the following optional fields:
            visible: Boolean for whether the stars are visible. (default: true)
            day_opacity: Float for maximum opacity of stars at day. No effect if visible is false. (default: 0.0; maximum: 1.0; minimum: 0.0)
            count: Integer number to set the number of stars in the skybox. Only applies to "skybox" and "regular" sky types. (default: 1000)
            star_color: ColorSpec, sets the colors of the stars, alpha channel is used to set overall star brightness. (default: #ebebff69)
            scale: Float controlling the overall size of the stars (default: 1)
    get_stars(): returns a table with the current stars parameters as in set_stars.
    set_clouds(cloud_parameters): set cloud parameters
        Passing no arguments resets clouds to their default values.
        cloud_parameters is a table with the following optional fields:
            density: from 0 (no clouds) to 1 (full clouds) (default 0.4)
            color: basic cloud color with alpha channel, ColorSpec (default #fff0f0e5).
            ambient: cloud color lower bound, use for a "glow at night" effect. ColorSpec (alpha ignored, default #000000)
            height: cloud height, i.e. y of cloud base (default per conf, usually 120)
            thickness: cloud thickness in nodes (default 16)
            speed: 2D cloud speed + direction in nodes per second (default {x=0, z=-2}).
    get_clouds(): returns a table with the current cloud parameters as in set_clouds.
    override_day_night_ratio(ratio or nil)
        0...1: Overrides day-night ratio, controlling sunlight to a specific amount.
        nil: Disables override, defaulting to sunlight based on day-night cycle
    get_day_night_ratio(): returns the ratio or nil if it isn t overridden
    set_local_animation(idle, walk, dig, walk_while_dig, frame_speed): set animation for player model in third person view.
        Every animation equals to a {x=starting frame, y=ending frame} table.
        frame_speed sets the animations frame speed. Default is 30.
    get_local_animation(): returns idle, walk, dig, walk_while_dig tables and frame_speed.
    set_eye_offset([firstperson, thirdperson]): defines offset vectors for camera per player. An argument defaults to {x=0, y=0, z=0} if unspecified.
        in first person view
        in third person view (max. values {x=-10/10,y=-10,15,z=-5/5})
    get_eye_offset(): returns first and third person offsets.
    send_mapblock(blockpos):
        Sends an already loaded mapblock to the player.
        Returns false if nothing was sent (note that this can also mean that the client already has the block)
        Resource intensive - use sparsely
    set_lighting(light_definition): sets lighting for the player
        light_definition is a table with the following optional fields:
        shadows is a table that controls ambient shadows
            intensity sets the intensity of the shadows from 0 (no shadows, default) to 1 (blackness)
    get_lighting(): returns the current state of lighting for the player.
        Result is a table with the same fields as light_definition in set_lighting.
    respawn(): Respawns the player using the same mechanism as the death screen, including calling on_respawnplayer callbacks.
