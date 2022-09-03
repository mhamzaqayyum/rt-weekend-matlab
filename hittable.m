classdef (Abstract) hittable < handle & matlab.mixin.Heterogeneous
    methods (Abstract)
        rec = hit(self, ray, t_min, t_max);
    end
end