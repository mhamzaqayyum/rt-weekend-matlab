function rand_pt = random_in_unit_sphere()
    while true
        rand_pt = rand(1,3);
        if norm(rand_pt) < 1
            break
        end     
    end
end