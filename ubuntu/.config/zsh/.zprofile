# Add Golang to the PATH
export PATH=$PATH:/usr/local/go/bin

# Add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# This script is designed to check if the current environment is running on a WSL
# and, if so, ensure that the Docker service is running
if grep -q "microsoft" /proc/version > /dev/null 2>&1; then
    if service docker status 2>&1 | grep -q "is not running"; then
        wsl.exe --distribution "${WSL_DISTRO_NAME}" --user root \
            --exec /usr/sbin/service docker start > /dev/null 2>&1
    fi
fi
