# csci2510

## RISC-V Environment Setup

- Windows
    - Download WSL, Ubuntu in Microsoft Store  
    - Initialize Ubuntu
    - Run the following commands  

        ```
        sudo apt update

        sudo apt install zstd autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libboost-all-dev device-tree-compiler

        wget --no-check-certificate https://www.cse.cuhk.edu.hk/~mcyang/csci2510/riscv/riscv-linux-amd64.tar.zst

        sudo tar axvf riscv-linux-amd64.tar.zst -C /opt

        sudo chown -R $(whoami) /opt/riscv
        ```

## Meaning of Pseudo Code

| Pseudo Code | Example          | Meaning                                    |
|-------------|------------------|--------------------------------------------|
| li          | `li a0, 1`       | load inmmediates 1 into `a0`               |
| mv          | `mv a2, a0`      | move the value `a0` into `a2`              |
| lw          | `lw t1, (t0)`    | load content in the address `t0` into `t1` |
| sw          | `sw t1, (t0)`    | store value of `t1` into address `t0`      |
| sd          |                  |                                            |
| add         | `add a4, a3, a2` | `a4` = `a3` + `a2`                         |
| sub         | `sub a4, a3, a2` | `a4` = `a3` - `a2`                         |
| mul         | `mul a4, a3, a2` | `a4` = `a3` * `a2`                         |
| div         | `div a4, a3, a2` | `a4` = `a3` / `a2`                         |
| rem         | `rem a4, a3, a2` | `a4` = `a3` % `a2`                         |
| and         | `and a4, a3, a2` | `a4` = `a3` and  `a2`                      |
| or          | 'or a4, a3, a2`  | `a4` = `a3` or  `a2`                       |
| xor         |                  |                                            |

## Execution Instructions[^1]

- Compile the program  

    ```Shell
    /opt/riscv/bin/riscv64-unknown-linux-musl-gcc -static -no-pie -o hello hello.s
    ```

- Run the program  

    ```Shell
    /opt/riscv/bin/spike /opt/riscv/riscv64-unknown-linux-musl/bin/pk hello
    ```

## Debug Mode Instructions[^1]

[^1]: the following codes use hello as the example filename. 

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

