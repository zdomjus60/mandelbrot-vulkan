glslangValidator -V mandelbrot.comp -o mandelbrot.spv
g++ -O3 main.cpp -o mandelbrot_vulkan -lglfw -lvulkan -lGL -lX11
./mandelbrot_vulkan

