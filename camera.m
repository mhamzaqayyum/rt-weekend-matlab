classdef camera < handle

    properties
       aspect_ratio
       focal_length
       origin
       horizontal
       vertical
       lower_left_corner
    end

    methods
        % Constructor
        function obj = camera(lookfrom, lookat, vup, aspr, y_fov)
            obj.aspect_ratio = aspr;
            obj.focal_length = 1.0;

            % Use vertical FOV to set viewport dimensions
            h = tan(deg2rad(y_fov)/2)*obj.focal_length;
            viewport_height = 2.0*h;
            viewport_width = obj.aspect_ratio * viewport_height;

            % Camera basis vectors
            view_dir = unit_vector(lookat-lookfrom);
            x = unit_vector(cross(view_dir, vup));
            y = cross(-x, -view_dir);

            % Set imageplane vars
            obj.origin = lookfrom;
            obj.horizontal = x * viewport_width;
            obj.vertical = y * viewport_height;
            obj.lower_left_corner = obj.origin + obj.focal_length * view_dir - obj.horizontal/2 - obj.vertical/2;
        end

        % Takes in position within image as horizontal and vertical percentages and returns the ray from the cam origin to that point
        function inRay = get_ray(self, u, v)
            inRay = ray(self.origin, (self.lower_left_corner + u*self.horizontal + v*self.vertical) - self.origin);
        end
    end
end