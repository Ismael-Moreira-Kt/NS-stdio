<div align="center">
    <img src="./assets/stdio.png" alt="logo">
    <p>A Standard Input/Output library designed to run in NASM x86-64 Linux environments.<p>
</div>


<br><br>


<div>
    <h2>What is NS-stdio?</h2>
    <br>
    <p>NS-stdio is an assembly library responsible for containing functions that abstract the system's standard inputs and outputs.</p>
    <p>These functions include:</p>
    <ul>
        <li><b>stdin:</b> Abstracts the system's standard input.</li>
        <li><b>stdout:</b> Abstracts the system's standard output.</li>
        <li><b>stdoutLn:</b> Adds a line break to the output features.</li>
    </ul>
</div>


<br><br>


<div>
    <h2>How to use NS-stdio in your project?</h2>
    <br>
    <h3>Prerequisites</h3>
    <p>Make sure you have Netwide Assembly installed on your computer.</p>
    <p>If you don't have it, install it by clicking <a href="https://www.nasm.us/">here</a>.</p>
    <br><br>
    <p>1. Clone the library to your development environment.</p>

```bash
    git clone https://github.com/Ismael-Moreira-Kt/NS-stdio
```

<p>2. Move stdio.asm to your project.</p>

```bash
    mv NS.stdio/src/stdio.asm path/to/your/project
```

<p>3. Assemble the library's object code.</p>

```bash
    nasm -f elf63 -o stdio.o stdio.asm
```

<p>4. Link the object code of the library with the object code of your project.</p>

```bash
    ld -o build stdio.o your_code.o
```

<p>5. Run the project</p>

```bash
    ./build
```

<h3>Example</h3>

```bash
    nasm -f elf63 -o stdio.o stdio.asm
    nasm -f elf63 -o input.o examples/input.asm

    ld -o build stdio.o input.o

    ./build
```

</div>


<br><br>


<div>
    <h2>Examples of use</h2>
    <br>
    <p>stdin receives a variable as a parameter, through which it receives the input and does all the necessary processing to ensure that there are no problems.</p>
    <p>To implement stdin, you could do something like this.</p>

```asm
section .bss
    input1 resb 100



    

section .text
    extern _stdin
    global _start

_start:
    lea rdi, [input1]
    call _stdin
```

<br>
    <p>In turn, stdout receives a string and displays it on the screen.</p>
    <p>stdoutLn, on the other hand, does something similar, but has the difference of introducing a line break at the end.</p>

```asm
section .data
    hello db "Hello ", 0
    hello_len equ $ - hello
    world db "World!", 0
    world_len equ $ - world





section .text
    extern _stdout
    extern _stdoutLn
    global _start



_start:
    mov rsi, world 
    call _stdout

    mov rdi, hello
    call _stdoutLn

    mov rax, 60               
    xor rdi, rdi           
    syscall
```

</div>