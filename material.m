classdef (Abstract) material < handle
	properties (Abstract)
		albedo
	end

	methods (Abstract)
        % must pass in self to this method becuase when it's called
        % through the dot operator, the object itself is automatically sent
        % into the function as the first argument. Thus, if you don't put
        % self as the first arg here, you'll get an error of "too many
        % input arguments" when calling this method through the dot
        % operator.
		bounceRay = scatter(self, rec)
	end
end