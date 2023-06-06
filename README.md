# Raytracing in One Weekend in MATLAB
I previously [implemented](https://github.com/e6quisitory/rt-weekend) a raytracer in C++ following Peter Shirley's [_Raytracing in One Weekend_](https://raytracing.github.io/books/RayTracingInOneWeekend.html). I added some extra features on top of Shirley's implementation, like multithreading and a movable camera for video frames rendering.

This is that same raytracer implemented in... MATLAB

## Results
![render-m](https://user-images.githubusercontent.com/25702188/188300262-a640bfbc-940b-42f5-bb61-afbfe84d07d8.jpg)

## Build Instructions
As MATLAB is an interpreted language, no compiler or "build" instructions apply. To run the code, simply put all the `.m` files into a folder, and change your working folder in MATLAB to that folder. Then, open up `main.m` and run that. The output render `.ppm` file will be created in the same folder.

I did this project in MATLAB version _R2022a_.

### Performance (lol)
Rendering the above 500x281 image in MATLAB took 45 minutes. For reference, in my C++ (old, single-threaded) implementation, it took only 15.7 seconds to render the same image (on a 2012 MacBook Air, i5 dual-core, 4GB RAM). So MATLAB is a shocking **_172x_** slower than my C++ implementation. 

After some [research](https://stackoverflow.com/questions/20513071/performance-tradeoff-when-is-matlab-better-slower-than-c-c) it does seem like this performance discrepancy is to be expected. MATLAB is interpreted, after all, like Python.

To speed things up, people recommend [vectorizing](https://www.mathworks.com/help/matlab/matlab_prog/vectorization.html) your code. Another thing I've thought of is trying to optimize the ray-sphere intersection code. Currently I have it setup to solve a quadratic equation, step-by-step. However, if I could somehow get MATLAB to directly [solve the vector equation itself](https://www.mathworks.com/matlabcentral/answers/32582-solve-matrix-vector-equations-thats-not-a-x-b) (which I know it's fast at doing), perhaps that could greatly speed things up, as that is the calculation which takes up the most CPU time.

I could also try my hand at multi-threading, which I implemented in my C++ version, and is [also possible in MATLAB](https://www.mathworks.com/discovery/matlab-multicore.html).

### Raytracer features left to implement
More materials, defocus blur, movable camera, video frames rendering; all of these features which I implemented in my C++ version of this raytracer have not been added into this MATLAB version. 
