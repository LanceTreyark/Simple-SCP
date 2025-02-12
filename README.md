# README

This repository contains two scripts: one for your local PC (I use WSL on Windows 11) and one for the server (I use Debian 12).

I set these up to be run with alias commands: `simpleScp` and `scpUnpack`.

## Local Script

1. **Make the script executable:**

   ```bash
   sudo chmod +x simpleScp.sh
   ```

2. **Run the script:**

   ```bash
   ./simpleScp.sh
   ```

3. **Optional: Create an alias for easier use:**

   Add the following line to your `~/.bash_aliases` file:

   ```bash
   alias simpleScp="sh /path/to/simpleScp.sh"
   ```

   Then reload your aliases:

   ```bash
   source ~/.bash_aliases
   ```

## Server Script

1. **Make the script executable:**

   ```bash
   sudo chmod +x scpUnpack.sh
   ```

2. **Run the script:**

   Use `sudo` to access `/var/www`:

   ```bash
   sudo ./scpUnpack.sh
   ```

3. **Optional: Create an alias for easier use:**

   Add the following line to your `~/.bash_aliases` file:

   ```bash
   alias scpUnpack="sudo bash /home/yourUsername/scpUnpack.sh"
   ```

   Then reload your aliases:

   ```bash
   source ~/.bash_aliases
   ```

## Contact

If you have any questions, feel free to message me on Twitter/X: [@LanceTreyark](https://twitter.com/LanceTreyark)

Lance
