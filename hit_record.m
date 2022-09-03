classdef hit_record < handle
    properties
        hit
        p
        normal
        t
        material
        is_front_face
    end

    methods
        % Sets normal depending on if ray intersection was inside or outside the sphere
        function self = set_face_normal(self, ray, outward_normal)
            if dot(ray.direction, outward_normal) < 0
                self.is_front_face = true;
                self.normal = outward_normal;
            else
                self.is_front_face = false;
                self.normal = -outward_normal;
            end
        end
    end
end