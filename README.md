# csci2510 _(CSCI2510 Code Implementation and Ubuntu Setup)_

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)  

Ubuntu setup and CUHK CSCI2510 2023Fall code implementation.  
  
The repo contains all the codes exercises and notes during lectures, tutorials, and assignments for CUHK CSCI2510 Computer Organization. All of the commands are based on RISC-V and implemented in Ubuntu. 

## Table of Contents
- [Usage](#usage)
- [Meaning of Pseudo Code](#meaning-of-pseudo-code)
- [Special Purpose Registers](#special-purpose-registers)
- [Execution Instructions](#execution-instructions1)
- [Debug Mode Instructions](#debug-mode-instructions1)
- [To Do](#to-do)
- [Contributing](#contributing)
- [License](#license)

## Usage

- Windows
    - Download WSL, Ubuntu in Microsoft Store  
    - Initialize Ubuntu
    - Run the following commands to compile riscv   

        ```shell
        sudo apt update

        sudo apt install zstd autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libboost-all-dev device-tree-compiler

        wget --no-check-certificate https://www.cse.cuhk.edu.hk/~mcyang/csci2510/riscv/riscv-linux-amd64.tar.zst

        sudo tar axvf riscv-linux-amd64.tar.zst -C /opt

        sudo chown -R $(whoami) /opt/riscv
        ```
    - Run the following command to clone the repo
        ```shell
        git clone https://github.com/Gavin-OP/csci2510.git
        ```

## Meaning of Pseudo Code

| Pseudo Code | Example                   | Meaning                                                      |
|-------------|---------------------------|--------------------------------------------------------------|
| li          | `li a0, 1`                | load inmmediates 1 into `a0`                                 |
| mv          | `mv a2, a0`               | move the value `a0` into `a2`                                |
| lw          | `lw t1, (t0)`             | load content in the address `t0` into `t1`                   |
| sw          | `sw t1, (t0)`             | store value of `t1` into address `t0`                        |
| la          | `la t0, array`            | load the address of the first elements in an array in `t0`      |
| sd          |                           |                                                              |
| add         | `add a4, a3, a2`          | `a4` = `a3` + `a2`                                           |
| sub         | `sub a4, a3, a2`          | `a4` = `a3` - `a2`                                           |
| mul         | `mul a4, a3, a2`          | `a4` = `a3` * `a2`                                           |
| div         | `div a4, a3, a2`          | `a4` = `a3` / `a2`                                           |
| rem         | `rem a4, a3, a2`          | `a4` = `a3` % `a2`                                           |
| and         | `and a4, a3, a2`          | `a4` = `a3` and  `a2`                                        |
| or          | 'or a4, a3, a2`           | `a4` = `a3` or  `a2`                                         |
| xor         |                           |                                                              |
| beq         | beq, a0, a1, branch_label | if `a0` = `a1`, go to branch_label                           |
| bnq         | bnq, a0, a1, branch_label | if `a0` $\ne$ `a1`, go to branch_label                       |
| blt         | blt, a0, a1, branch_label | if `a0` < `a1`, go to branch_label                           |
| bge         | bge, a0, a1, branch_label | if `a0` $\ge$ `a1`, go to branch_label                       |
| bltu        |                           |                                                              |
| bgeu        |                           |                                                              |
| jal         | jal a0, branch_label      | jump to branch_label and store return address in `a0`        |
| jalr        | jalr a0, a1, branch_label | jump to branch_label + `a1` and store return address in `a0` |
| j           | j branch_label            | jump to branch_label without saving return address           |
| jr          | jr a0                     | jump to address inside `a0` without saving return address    |
| call        | call branch_label         | jump to branch_label and store the return address in `ra`    |



## Special Purpose Registers  

| Register    | Meaning                                |
|-------------|----------------------------------------|
| `sp`        | point to top of stack (lowest address) |
| `s0` / `fp` | frame pointer                          |
| `ra`        | return address                         |


## Execution Instructions[^1]

- Compile the program  

    ```Shell
    /opt/riscv/bin/riscv64-unknown-linux-musl-gcc -static -no-pie -o hello hello.s
    ```

- Run the program  

    ```Shell
    /opt/riscv/bin/spike /opt/riscv/riscv64-unknown-linux-musl/bin/pk hello
    ```

- Generate executable program

    - Preprocessed file (`xx.i`) 

        ```
        /opt/riscv/bin/riscv64-unknown-linux-musl-gcc -E hello5.c -o hello5.i
        ```
    
    - Compilation Assembly language file (`xxx.s`)

        ```
        /opt/riscv/bin/riscv64-unknown-linux-musl-gcc -S -O0 hello5.i (or hello5.c) -o hello5.s
        ```
    
    - Generate object file (`xxx.o`)
    
        ```
        /opt/riscv/bin/riscv64-unknown-linux-musl-gcc -c hello5.s -o hello5.o
        ```

## Debug Mode Instructions[^1]

[^1]: the following codes use `hello` as the example filename. 

- Install package using commands below (only once)  

    ```
    sudo apt-get install libdebuginfod-dev
    ```

- Compile the program  

    ```Shell
    /opt/riscv/bin/riscv64-unknown-linux-musl-gcc -static -no-pie -o hello hello.s
    ```

- Disassemble the executable

    ```Shell
    /opt/riscv/bin/riscv64-unknown-linux-musl-objdump -D hello >> hello.temp
    ```

- Enter debug mode  

    ```Shell
    /opt/riscv/bin/spike -d /opt/riscv/riscv64-unknown-linux-musl/bin/pk hello
    ```

- Debug mode commands
    
    - `until pc 0 1023e`: run the program until the program counter to line 1023e[^2]

    [^2]: `1023e` is the line number of the start of `main` label, which can be checked by searching `main` in the `hello.temp` file   
    
    - `reg 0 a0`: see the contents of register a0 in core 0  

    - `mem 0 2020`: see the contents of the memory address of `2020` in core 0[^3]  

[^3]: the address of the first element in an array, it can be derived by concatenating `0x00000000000` with the address shown in the `hello.temp` file. E.g. if the file shows that `# 10024 <array>`, then the address of the first element in the array is `0x0000000000010024`  
  
## To Do

- [ ] Tutorial 8, 9, 10. Read PPT. Implement the code. 
- [ ] Assignment 3 Bonus Question. Implement the code. 

## Contributing  

PRs are welcome.  
Issues for materials can be raised in [issue](https://github.com/Gavin-OP/csci2510/issues)

## License
[UNLICENSED](./LICENSE)
