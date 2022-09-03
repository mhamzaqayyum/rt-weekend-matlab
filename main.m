cam = camera([0 0 0], [0 0 -1], [0 1 0], 16.0/9.0, 70);

image_width = 100;
image_height = round(image_width / cam.aspect_ratio);

l = cos(pi/4);

world = hittable_list();
s_center = sphere([0 0 -1], 0.45*l, matte([0.4 0.4 0.4]));
s_below = sphere([0 -100.5*l -1], 100*l, matte([0.8 0.8 0]));

world.add(s_center);
world.add(s_below);

samples_per_pixel = 10;
bounce_depth = 50;

img = fopen('render.ppm','w');
fprintf(img, "P3\n%d %d\n255\n", image_width, image_height); 

for i = image_height:-1:1
    clc
    fprintf('Scanlines remaining: %d\n', i)
    for j = 0:1:image_width-1
        sum = [0 0 0];
        for k = 0:1:samples_per_pixel-1
            u = (j+rand())/image_width;
            v = (i+rand())/image_height;
            r = cam.get_ray(u, v);
            sum = sum + ray_color(r, world, bounce_depth);
        end
        write_color(img, sqrt(sum/samples_per_pixel));
    end
end

fclose(img);


function write_color(img, color)
    fprintf(img, '%d %d %d\n', floor(color(1)*255.999), floor(color(2)*255.999), floor(color(3)*255.999));
end


function pixel_color = ray_color(r, hittable, depth)
    if depth <= 0
        pixel_color = [0 0 0];
    end

    rec = hittable.hit(r, 0.001, 50000);
    reflected_ray = ray([0 0 0], [0 0 0]);

    if rec.hit
        reflected_ray = rec.material.scatter(rec);
        pixel_color = rec.material.albedo .* ray_color(reflected_ray, hittable, depth-1);
        return
    end
    pixel_color = [1 1 1];
end