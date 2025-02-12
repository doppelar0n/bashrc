# My Custom `.bashrc` File 🚀

Welcome to my customized `.bashrc`! This configuration file comes with some awesome features that enhance your terminal experience. Here's an overview of what's inside:

---

## Features 🛠️

### 1. **Timer for Command Duration** ⏱️
Ever wondered how long a command takes to run? This `.bashrc` includes a timer that calculates and displays the duration of each command.

- **How it works:**
  - A timer starts automatically when a command is executed.
  - When the command finishes, the duration is displayed in the prompt in hours, minutes, and seconds.
- **Example Prompt:** `[1m 45s]`

---

### 2. **Exit Code Display** ❌✅
Know immediately if your last command succeeded or failed.

- **How it works:**
  - The exit code of the last command is displayed in red if non-zero (error), or omitted if the command succeeded.
- **Example Prompt:** ![127](https://github.com/user-attachments/assets/d029d902-9f5d-4a32-9e26-8b5720903cd2) (indicating an error with exit code 127 - command not found).


---

### 3. **Fancy Prompt** ✨
Your terminal prompt is informative and colorful, showing:

- Current time ⏰
- Username and hostname 👤
- Current working directory 📁
- Git branch (if inside a Git repository) 🌿

**Example:**
```
[1m 45s][14:32:12] user@hostname:/path/to/dir (main)$
```

---

### 4. **Improved Bash Completion** 🖇️
Bash completion is enabled for easier command navigation.

---

### 5. **`command-not-found` Integration** 🔍
If you type a command that doesn't exist, this configuration provides helpful suggestions (if the `command-not-found` package is installed).

---

### 6. **Enhanced `ls` Aliases** 🌈
Navigate your file system with ease using colorful output and handy aliases:

- `l` - List all files in long format.
- `ll` - Same as `ls -l`.
- `lt` - Sort files by modification time.
- `la` - List all files, including hidden ones.
- `lh` - Display sizes in human-readable format.
- `lat` - Detailed listing with permissions, sizes, and timestamps.

---

### 7. **Custom Path Management** 🚦
The `.bashrc` dynamically adds the Go binaries directory to your `PATH` if Go is installed.

---

### 8. **Default Editor Settings** ✏️
Sets `vim` as the default editor for both `EDITOR` and `VISUAL` environment variables.

---

### 9. **Sudo Alias** 🛡️
Allows aliases to work even when using `sudo`.

---

## Preview

![bash](https://github.com/user-attachments/assets/eb1ec43e-fec3-4c2e-8c97-83e0936fa28a)

---

## Install Dependencies 🔧

```bash
sudo apt update && sudo apt install -y vim git bash-completion
```

---

## Usage 📖

1. Copy the `.bashrc` file to your home directory:
   ```bash
   cp .bashrc ~/.bashrc
   ```
2. Reload your `.bashrc`:
   ```bash
   source ~/.bashrc
   ```

---

## Additional Files 📂

```bash
inputrc
```

If it interests you, I’ve also included my `inputrc` file for enhanced input behavior in the terminal. Feel free to check it out!

---

## Contributing 🤝
Feel free to submit pull requests or open issues if you have suggestions or improvements.

---

## License 📜
This `.bashrc` configuration is open-source and available under the [MIT License](LICENSE).

---

Enjoy your enhanced terminal experience! 🎉

