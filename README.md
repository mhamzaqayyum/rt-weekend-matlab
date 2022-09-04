# Raytracing in One Weekend in MATLAB
## Background
I previously [implemented](https://github.com/e6quisitory/rt-weekend) a raytracer in C++ following Peter Shirley's [_Raytracing in One Weekend_](https://raytracing.github.io/books/RayTracingInOneWeekend.html). I added some extra features on top of Shirley's implementation, like multithreading and a movable camera for video frames rendering.

In the README of that repository, I also listed some future functionality to implement, like some more camera movements, as well as hardware acceleration and video encoding. Someday I hope to implement those things. Currently, though, my immediate attention is on MATLAB, as I have a Control Systems course coming up. The syllabus states that MATLAB and Simulink will be used heavily. I personally have zero experience with either. However, I had heard that MATLAB can be used as a programming language. Thus, to get some fimiliarity with MATLAB and it's programming/scripting language, I thought I'd try my hand at implementing the raytracer I'd built previously, this time in MATLAB.

Thus, this repository contains all my MATLAB code for the raytracer.

## Build Instructions
As MATLAB is an interpreted language, no compiler or build instructions apply. To run the code, simply put all the `.m` files into a folder, and change your working folder in MATLAB to that folder. Then, open up `main.m` and run that. The output render `.ppm` file will be created in the same folder.

I'm doing this project in MATLAB version _R2022a_.
