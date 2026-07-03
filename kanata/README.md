# Install the rust language
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

---

# Install the build-essential library
## Debian / Ubuntu
```sh
sudo apt update && sudo apt install build-essential
```

## Arch Linux
```sh
sudo pacman -S base-devel
```

---

# Go to a working directory
```sh
cd /tmp
git clone https://github.com/jtroo/kanata.git
cd kanata
```

# Build the release binary
```sh
cargo build --release
```

# The binary is now at target/release/kanata
## Verify it works
```sh
./target/release/kanata --version
```

# Install the binary system wide
```sh
sudo cp target/release/kanata /usr/local/bin
sudo chmod +x /usr/local/bin/kanata
```

# Optional: also link into your local cargo bin for convenience
```sh
ln -sf /usr/local/bin/kanata ~/.cargo/bin/kanata
```

# Check that running the binary by full path works
```sh
/usr/local/bin/kanata --version
```

# Link the kanata.service file system wide
```sh
ln -s /path/to/kanata.service /etc/systemd/system/
```

# Create the kanata config directory
```sh
mkdir -p ~/.config/kanata
```

# Link the config.kbd file into the kanata config directory
```sh
ln -s /path/to/config.kbd /home/<username>/.config/kanata/
```

# Enable and start the service
```sh
sudo systemctl daemon-reload
sudo systemctl enable kanata.service
sudo systemctl start kanata.service
```

# Check its status
```sh
sudo systemctl status kanata.service
journalctl -u kanata.service -f  # live logs
```
