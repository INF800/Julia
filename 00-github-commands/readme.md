# Clone

- Install git
    ```
    apt install git
    ```
- Goto repository link
- Copy link (https://)
- In terminal
    ```
    git clone <link>
    ```
    eg. `git clone https://github.com/rajesh-asapanna/Julia.git`

# Push

- Using Go inside cloned dir
    1. **ADD**
        - Add files to push
            ```
            git add .
            ```
            Note: `.` means all files in cur dir. For specific files use `git add test.cpp` (from exact folder)
    2. **COMMIT**
        - Locally makes changes
            ```
            git commit -m "added github commangs dir"
            ```
    3. **PUSH**
        - Make changes in server
            ```
            git push
            ```
            If first time `git push origin master`