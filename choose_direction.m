function [direction] = choose_direction(current_direction, available_directions, ...
    pos_ghosts, pos_coins, pos_special_coins, pos_raspberry)

direction_avoid = [3,4,1,2]

possible_directions = available_directions(available_directions~=direction_avoid(current_direction));

direction = datasample(possible_directions,1);

end