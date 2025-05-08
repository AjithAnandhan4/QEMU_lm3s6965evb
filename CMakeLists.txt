cmake_minimum_required(VERSION 3.10)
project(SimpleProject)

# Set the C compiler
set(CMAKE_C_COMPILER arm-none-eabi-gcc)

# Compilation flags
set(CMAKE_C_FLAGS "-mcpu=cortex-m3 -mthumb -g")

# Linker flags with full path to main.ld
set(CMAKE_EXE_LINKER_FLAGS "-mcpu=cortex-m3 -nostdlib -mthumb -Wl,-Map=main.map -T ${CMAKE_SOURCE_DIR}/main.ld")

# Add executable target
add_executable(main.elf startup.c main.c)

# Custom target for cleaning
add_custom_target(clean_all
    COMMAND rm -f *.o *.elf *.map
)

# Custom target for debugging with QEMU
add_custom_target(debug
    COMMAND qemu-system-arm -M lm3s6965evb -kernel main.elf -gdb tcp::1234 -S -nographic
)

# Custom target for GDB
add_custom_target(gdb
    COMMAND gdb-multiarch main.elf -ex "target remote localhost:1234" -ex "layout src" -ex "layout regs"
)