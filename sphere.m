classdef sphere
    properties
        center
        radius
        material
    end

    methods
        % Constructor
        function obj = sphere(center, radius, material)
            obj.center = center;
            obj.radius = radius;
            obj.material = material;
        end

        % Calculates if ray intersects with sphere and, if so, fills in hit record
        function rec = hit(self, ray, t_min, t_max)
            rec = hit_record(); % must specify type of object for rec before filling in properties
            
            dir = ray.direction;
            origin_center = ray.origin - self.center;
            a = norm(dir)^2;
            b = 2*dot(dir, origin_center);
            c = norm(origin_center)^2 - self.radius^2;

            discriminant = b^2 - 4*a*c;
            
            if discriminant < 0
                rec.hit = false;
                return
            else
                % check which root is within range
                t = (-b - sqrt(discriminant))/(2*a);
                if t < t_min || t > t_max
                    rec.hit = false;
                    return
                end
                % root in range has been found
                rec.t = t;
                rec.p = ray.at(rec.t);
                outward_normal = (rec.p - self.center)/self.radius;
                rec.set_face_normal(ray, outward_normal);
                rec.material = self.material;
                rec.hit = true;
            end
        end
    end
end