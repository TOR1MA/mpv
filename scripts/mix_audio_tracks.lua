local is_mixed = false

function toggle_mix()
    local track_count = mp.get_property_number("track-list/count")
    
    if is_mixed then
        mp.set_property('options/lavfi-complex', "")
        mp.set_property("aid", "1")
        if mp.get_property("aid") == "no" then
            mp.set_property("aid", "2")
            mp.set_property("aid", "1")
        end
        mp.osd_message("Audio: First Track")
    else
        if track_count > 2 then
            mp.set_property('options/lavfi-complex', "[aid1] [aid2] amix=inputs=2 [ao]")
            mp.osd_message("Audio: Mixed Tracks")
        else
            mp.osd_message("Not enough audio tracks to mix")
        end
    end

    is_mixed = not is_mixed
end

mp.add_key_binding("F1", "toggle_mix", toggle_mix)
