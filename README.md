# Memory Management & File Storage Simulator — x86 Assembly

A **low-level simulation of memory management and a file system**, implemented in **x86 Assembly**.  
This project demonstrates, in a hands-on way, how an operating system can **allocate, access, delete, and reorganize files** within both one-dimensional and two-dimensional memory structures.

---

## Overview

The simulator models two memory layouts:

- **1D Memory Model** (`unidimensional.s`) — memory is represented as a flat array of **1,024 cells**
- **2D Memory Model** (`bidimensional.s`) — memory is organized as a **256 × 1,024 matrix**

Each cell stores a **file descriptor** (an integer value) corresponding to a file saved in the system. Files can span multiple contiguous cells, and the simulator manages allocation, lookup, deletion, and compaction across these structures.

---

## Features

| Operation | Description |
|-----------|-------------|
| **Add** (op `1`) | Allocates a new file into available memory blocks |
| **Get** (op `2`) | Finds and displays the position (coordinates) of a file by its descriptor |
| **Delete** (op `3`) | Frees all memory blocks occupied by a given file |
| **Defragment** (op `4`) | Compacts memory by shifting files to eliminate gaps |

---

## Input Format

The program reads commands from stdin. Each session starts with the total number of operations `N`, followed by operation lines:

```
N
1 <count>          → Add: followed by <count> pairs of (descriptor, size)
2 <descriptor>     → Get: find file by descriptor
3 <descriptor>     → Delete: remove file by descriptor
4                  → Defragment memory
```

### Output examples

**Add / Delete / Defragment:**
```
<descriptor>: ((<row>, <col_start>), (<row>, <col_end>))   ← 2D
<descriptor>: (<col_start>, <col_end>)                     ← 1D
```

**Get:**
```
((<row>, <col_start>), (<row>, <col_end>))   ← 2D
(<col_start>, <col_end>)                     ← 1D
```

---

## How to Build & Run

### Prerequisites
- Linux (x86 or x86 compatibility layer)
- `gcc` or `as` + `ld` (GNU assembler/linker)
- 32-bit support: `sudo apt install gcc-multilib` (if on 64-bit system)

### Compile

```bash
# Unidimensional
gcc -m32 -o uni unidimensional.s

# Bidimensional
gcc -m32 -o bi bidimensional.s
```

### Run

```bash
./uni < input.txt
./bi  < input.txt
```

---

## Implementation Notes

- Memory is statically allocated in the `.data` segment — `4 KB` for 1D, `1 MB` for 2D
- The allocation algorithm scans for contiguous free blocks that fit the requested file size
- All I/O is done via `printf`/`scanf` using the C calling convention


---

## Learning Outcomes

- Direct memory manipulation using registers and base+index addressing
- Interesting hinting for what was to be studied in the next academical year.
- Implementing data structure operations (search, insert, delete, compact) at the assembly level
- Understanding how OS-level memory/file management concepts map to low-level code
- Working with the x86 calling convention for C standard library interop
