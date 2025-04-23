
# README

## To Generate Preprocessed Output from `src` File:
```bash
arm-none-eabi-gcc -E main.c -o main.i
```

## To Generate `.s` or Assembly File for a Particular Architecture:
- Default architecture will be selected if you use this command:
```bash
arm-none-eabi-gcc -S main.i -o main.s
```

- For ARM Cortex-M0:
```bash
arm-none-eabi-gcc -S -mcpu=cortex-m0 -mthumb main.i -o main.s
```

## To Compile `.c` to `.o` Object File:
```bash
arm-none-eabi-gcc -c -mcpu=cortex-m0 -mthumb startup.c -o startup.o	
arm-none-eabi-gcc -c -mcpu=cortex-m0 -mthumb main.c -o main.o
```

## To Link Multiple `.o` Files:
```bash
arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -T main.ld -o main.elf main.o startup.o
```

### Output:
```bash
D:\_AJITH_ANANDHAN\Practice Project\lowlevel_c_ practice\sample_project1> arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -nostdlib -T main.ld -o main.elf main.o startup.o
C:/arm-gnu-toolchain-14.2.rel1-mingw-w64-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/14.2.1/../../../../arm-none-eabi/bin/ld.exe: warning: main.elf has a LOAD segment with RWX permissions
```

## To Generate `.map` File:
Add the following option to the GCC command:
```bash
arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -nostdlib -Wl,-Map=main.map -T main.ld -o main.elf main.o startup.o
```

### Output:
```bash
D:\_AJITH_ANANDHAN\Practice Project\lowlevel_c_ practice\sample_project1> arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -nostdlib -Wl,-Map=main.map -T main.ld -o main.elf main.o startup.o
C:/arm-gnu-toolchain-14.2.rel1-mingw-w64-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/14.2.1/../../../../arm-none-eabi/bin/ld.exe: warning: main.elf has a LOAD segment with RWX permissions
```

## Makefile Cookbook:
For more information on creating Makefiles, check out the [Makefile Cookbook](https://makefiletutorial.com/#makefile-cookbook).
```



Ah, got it! You want the **commands** I suggested for **GitHub Codespaces** to be formatted in a **Markdown file**. Here's how you can structure it for your **GitHub README.md**:

---
## GitHub Codespaces QEMU Debugging Workflow 
---

### Setting Up the Development Environment

1. **Install Required Packages**

   In GitHub Codespaces, open a terminal and run the following to install the necessary packages:

    ```bash
    sudo apt-get update && sudo apt-get install -y \
      gcc-arm-none-eabi \
      gdb-multiarch \
      qemu-system-arm \
      make \
      build-essential
    ```

---

### Building the Project

2. **Build the Project**

    After you've set up the environment, you can build your lm3s6965evb project using **Make**.

    Assuming you have a valid `Makefile` set up in the project directory with specific build -mcpu=cortex-m3 for "lm3s6965evb':

    ```bash
    make
    ```

---

### Running QEMU

3. **Run QEMU**

    To simulate the STM32F0x microcontroller, use the following command:

    ```bash
    qemu-system-arm \
      -M lm3s6965evb \
      -kernel main.elf \
      -gdb tcp::1234 \
      -S \
      -nographic
    ```

    - **`-M lm3s6965evb`**: Specifies the TI lm3s6965evb target (you can replace this with any supported ARM model).
    - **`-kernel main.elf`**: Points to your compiled ELF file.
    - **`-gdb tcp::1234`**: Opens a GDB server on TCP port 1234.
    - **`-S`**: Pauses execution immediately for GDB to connect.
    - **`-nographic`**: Disables graphical output and logs to the terminal.

---

### Debugging with GDB

4. **Connect GDB to QEMU**

    Open another terminal in your Codespace and start GDB:

    ```bash
    gdb-multiarch main.elf
    ```

    Then, connect to QEMU and start debugging:

    ```gdb
    target remote localhost:1234
    monitor reset halt
    break main
    continue
    ```

    - **`target remote localhost:1234`**: Connects GDB to QEMU.
    - **`monitor reset halt`**: Resets the target and halts immediately.
    - **`break main`**: Sets a breakpoint at the entry point of `main()`.
    - **`continue`**: Continues execution until hitting the breakpoint.

---

### Optional: Hardware Debugging with OpenOCD

If you want to debug your project using **real hardware** (STM32F0x), you can use **OpenOCD** for **JTAG/SWD debugging**.

1. **Install OpenOCD**:
    ```bash
    sudo apt-get install -y openocd
    ```

2. **Run OpenOCD for STM32F0x**:
    ```bash
    openocd -f interface/stlink.cfg -f target/stm32f0x.cfg
    ```

3. **Connect GDB to OpenOCD**:
    ```bash
    gdb-multiarch main.elf
    target remote localhost:3333
    ```

---


---

https://www.kitploit.com/2016/01/gdb-dashboard-modular-visual-interface.html

Download the .gdbinit file using:

wget -P ~ git.io/.gdbinit


---