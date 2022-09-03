classdef matte < material
    properties
        albedo
    end

    methods
        % Constructor
        function obj = matte(albedo)
            obj.albedo = albedo;
        end

        % Scatter function that calculates the bounce ray
        function bounceRay = scatter(self, rec)
            target = rec.p + rec.normal + random_in_unit_sphere();
            bounceRay = ray(rec.p, target - rec.p);
        end
    end
end