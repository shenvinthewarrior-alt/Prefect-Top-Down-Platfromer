if (point_in_rectangle(mouse_x, mouse_y, 0, 0, 200, 200)
&& mouse_check_button_pressed(mb_left))
{
    state = 1;
}

switch(state)
{
    case 1:
    
        // Check which current key was pressed
        for (var i = 0; i < array_length(key); i++)
        {
            if (keyboard_check_pressed(key[i]))
            {
                binding = i;
                state = 2;
                break;
            }
        }

    break;

    case 2:
        // Wait for the NEW key
        if (keyboard_check_pressed(vk_anykey))
        {
            var new_key = keyboard_lastkey;
			
            var duplicate = false;

		    for (var i = 0; i < array_length(key); i++)
		    {
		        if (i != binding && (key[i] == new_key || key[binding] == new_key))
		        {
		            duplicate = true;
		            break;
		        }
		    }

		    if (!duplicate)
		    {
		        key[binding] = new_key;
		        state = 0;
		        binding = -1;
		    }
        }
    break;
}
