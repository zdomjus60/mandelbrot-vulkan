# Mandelbrot Fractal Explorer (Vulkan/OpenGL)

This project generates an interactive visualization of the Mandelbrot set, leveraging the power of GPU computation through Vulkan and rendering the output using OpenGL. It's designed for high-performance fractal exploration, especially for deep zooms.

## Features

*   **High-Performance Mandelbrot Generation**: Utilizes Vulkan compute shaders to calculate the Mandelbrot set on the GPU for fast rendering.
*   **Interactive Exploration**: Navigate and zoom into the fractal using keyboard controls.
*   **Hybrid Precision Rendering**: Employs a 'double-double' (128-bit simulated) precision calculation for both host and shader, enabling extremely deep zooms without precision artifacts. Standard 64-bit doubles are used for normal zoom levels.
*   **Real-time Visualization**: Renders the fractal in real-time using OpenGL within a GLFW window.

## Limitations

While this project utilizes 128-bit real number precision to minimize arithmetic precision errors and enable extremely deep zooms, the visible detail at very high zoom levels is ultimately constrained by the rendering resolution (the number of pixels on screen). At zoom levels of $9 	imes 10^{12}$x and beyond, the effective resolution per unit of the fractal may become too low to resolve finer details, leading to a perceived "pixelation" or "disintegration" of the fractal's structure, rather than a smooth infinite horizon. This is a fundamental aspect of rendering complex fractals at extreme scales within a finite pixel grid.

## Dependencies

This project has specific build dependencies, tailored for Fedora Linux.

**For Fedora:**
Use the following command to install the necessary development tools and libraries:
```bash
sudo dnf install gcc-c++ vulkan-loader-devel glfw-devel mesa-libGL-devel libX11-devel glslang
```

**Other Systems:**
On other Linux distributions, macOS, or Windows, you will need to install equivalent development packages for C++ compiler (g++ or equivalent), Vulkan SDK, GLFW, OpenGL, and `glslangValidator`. The exact package names may vary.

## Build and Execution

The project uses a shell script (`compila.sh`) to automate the build process.

1.  **Make the script executable**:
    ```bash
    chmod +x compila.sh
    ```
2.  **Compile the project**:
    ```bash
    ./compila.sh
    ```
    This script performs two main actions:
    *   **Shader Compilation**: It converts the GLSL compute shader (`mandelbrot.comp`) into SPIR-V bytecode using `glslangValidator`.
    *   **C++ Application Compilation**: It compiles the main C++ application (`main.cpp`) and links it against the necessary Vulkan, GLFW, and OpenGL libraries.

    **Note on Compiler Optimizations (`-O3`):**
    The `compila.sh` script uses aggressive compiler optimizations (`-O3`). This is crucial for maintaining smooth frame rates and responsive zooming in fractal generation. If you encounter crashes or unexpected behavior, try changing `-O3` to `-O2` in the `compila.sh` script for a more stable, though potentially less performant, build.

## Usage

Once the application is compiled and running, you can explore the Mandelbrot set using the following controls:

| Key        | Action                        |
| :--------- | :---------------------------- |
| `W`, `A`, `S`, `D` | Pan (Move camera)             |
| `Q` / `E`  | Zoom Out / Zoom In            |
| `SHIFT`    | Precision Mode (slow zoom)    |
| `P`        | Save Screenshot (`snapshot.ppm`)|
| `ESC`      | Exit the application          |

## File Structure

*   `main.cpp`: Contains the core C++ application logic, Vulkan/OpenGL setup, window management, and user input handling.
*   `mandelbrot.comp`: The GLSL compute shader responsible for calculating the Mandelbrot set on the GPU, including the high-precision logic.
*   `compila.sh`: The shell script that automates the compilation of shaders and the C++ application.
*   `istruzioni.md`: Contains specific setup and usage instructions.
*   `.gitignore`: Specifies files and directories to be ignored by Git.
*   `LICENSE`: The license file for the project.
*   `README.md`: This file, explaining the project.

*Note: `CMakeLists.txt` is present but not used for the current build process.*

## License

This project is licensed under the MIT License - see the `LICENSE` file for details.
