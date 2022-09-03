classdef ray
    properties
        origin
        direction
    end

    methods
        % Constructor
        function obj = ray(origin, direction)
            obj.direction = direction;
            obj.origin = origin;
        end

        % Evaluate ray at a certain t value
        function rayEval = at(self, t)
            rayEval = self.origin + t*self.direction;
        end
    end
end