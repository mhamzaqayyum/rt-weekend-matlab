classdef hittable_list < hittable
    properties
        h_list = sphere.empty();
    end

    methods
        function self = add(self, hittable_object)
            self.h_list(end+1) = hittable_object;
        end

        function final_rec = hit(self, ray, t_min, t_max)
            final_rec = hit_record();
            hit_anything = false;
            t_closest = t_max;
            for n = 1 : length(self.h_list)
                temp_rec = self.h_list(n).hit(ray, t_min, t_closest);
                if temp_rec.hit
                    hit_anything = true;
                    t_closest = temp_rec.t;
                    final_rec = temp_rec;
                end
            end
        end

    end

end