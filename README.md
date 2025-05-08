
# README

## Download all the necessary files and tools:
```bash
sudo apt-get update && sudo apt-get install -y \
    gcc-arm-none-eabi \
    gdb-multiarch \
    qemu-system-arm \
    make \
    build-essential
```

## Run the below command in terminal 1 this will start the gdb server at port 1234:

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


## To start debug the code run this below command in terminal 2:
```bash
gdb-multiarch main.elf
```

## Below command will establish a connnection, reset, halt and put a brake point at main:
```bash
target remote localhost:1234
monitor reset halt
break main
```

### GDB Debug commands:
```bash
info register   ----> shows the GPRs

x/i $pc      ---> examine instruction at PC

x/1dw <address>   -->(1, read one count, d - decimal , w - word length, <address> eg: 0x2000000)

run

next   --> next c line (AKA step over)

nexti  --> next instruction 

step --> step in 

stepi  --> step into instruction

continue --> free run

tui enable   --> gui for src code

tui reg all  --> show all the registers

layout reg
 
layout split 

info local

(gdb) info frame

(gdb) x/4wx $sp

(gdb) x/4wx $fp


```

---

## Core Navigation & Execution

| Command             | Description                                               |
|---------------------|-----------------------------------------------------------|
| `start`             | Run the program and break at `main()`                     |
| `run` or `r`        | Start program from the beginning                          |
| `continue` or `c`   | Continue execution after a breakpoint                     |
| `step` or `s`       | Step into the next instruction or function                |
| `next` or `n`       | Step over a function call                                 |
| `finish`            | Run until the current function returns                    |
| `until <line>`      | Continue until a certain line in current function         |
| `return`            | Force return from function (can return a value)           |

---

## Breakpoints & Watchpoints

| Command                    | Description                                               |
|----------------------------|-----------------------------------------------------------|
| `break <function>`         | Set a breakpoint at a function (e.g., `b main`)           |
| `b <file>:<line>`          | Set a breakpoint at a specific line in a file             |
| `delete`                   | Delete all breakpoints                                    |
| `clear`                    | Clear breakpoint at current line                          |
| `watch <var>`              | Break when a variable is written                          |
| `rwatch <var>`             | Break when a variable is read                             |
| `awatch <var>`             | Break when a variable is read or written                  |

---

## Inspecting Variables and Memory

| Command                    | Description                                               |
|----------------------------|-----------------------------------------------------------|
| `print <var>` or `p <var>` | Print the value of a variable                             |
| `info locals`              | Show all local variables in current function              |
| `info args`                | Show all arguments to current function                    |
| `x/1wx 0x20000000`         | Examine 1 word in hex at address                          |
| `x/4xb $sp`                | View 4 bytes at stack pointer                             |
| `x/32i $pc`                | View 32 disassembled instructions from PC                 |

---

## Disassembly, Registers, Layout

| Command             | Description                                               |
|---------------------|-----------------------------------------------------------|
| `layout split`      | Split view: source + assembly + status                    |
| `layout regs`       | Show CPU registers in UI                                  |
| `info registers`    | Full register dump                                        |
| `disas`             | Disassemble current function                              |
| `tui enable`        | Enable TUI mode (text user interface)                     |

---

## Misc and Pro Tips

| Command                      | Description                                               |
|------------------------------|-----------------------------------------------------------|
| `set var <x> = 42`           | Change variable value at runtime                          |
| `frame`                      | Show current call frame                                   |
| `backtrace` or `bt`          | Show call stack                                           |
| `list` or `l`                | Show source code around current line                      |
| `set pagination off`         | Prevent GDB from pausing output                           |
| `quit` or `Ctrl+d`           | Exit GDB                                                  |

---




## For more gui with python you can refer the below link:
 
```bash
https://www.kitploit.com/2016/01/gdb-dashboard-modular-visual-interface.html

Download the .gdbinit file using:

wget -P ~ git.io/.gdbinit
```
