#!/bin/bash

function gap() {
for ((i = 0; i <= $1; i++)); do
echo ''
done
}

echo 'You will need sudo acess to run this script'
sudo -v
echo 'systools setup tool'
echo 'Note: this setup tool only works on Debian-based systems.'
read -p "Do you want to proceed? [y/n]: " proceed_y_n

if [ "$proceed_y_n" == "y" ]; then
    echo 'proceeding with setup...'
else
    echo "Exiting..."
    sleep 0.13
    echo "Exited the program with exit code: 0"
    exit 0
fi

gap 0
sleep 0.6
echo 'setting up commands please wait...'
gap 1
#creates the command fot 'systools' (prints version information)
echo 'creating the systools command in /usr/local/bin/systools'
echo -e '#!/bin/bash\necho "systools Beta 0.1 Developer Setup."\necho "shell $SHELL"\necho "kernel: linux kernal"' > systools
chmod +x systools
sudo mv systools /usr/local/bin/systools
# creates the command for 'termres' (cds to ~, clears and prints a welcome message)
echo 'creating the alias used for letting isolated shells effect directories'
echo "alias ShellSetRoot='cd ~'" >> ~/.bashrc
source ~/.bashrc
echo -e '#!/bin/bash\ncd ~\nclear\necho ""\necho "Hello $(whoami)!"\necho ""' | sudo tee /usr/local/bin/termres > /dev/null
sudo chmod +x /usr/local/bin/termres
sudo mv termres /usr/local/bin/termres
# creates the command for 'sysls' (advanced ls command)
echo 'creating the sysls command in /usr/local/bin/sysls'
echo -e '#!/bin/bash\nls -Al1hS' > sysls
chmod +x sysls
sudo mv sysls /usr/local/bin/sysls
#Creates the command for 'systools-help' (lists commands in information about systools)
echo 'creating the help command in /usr/local/bin/systools-help'
echo -e '#!/bin/bash\necho "Systools Help Version: 1.0"\necho "Commands:"\necho "c - a command that functions as an abbreviation of the clear command in linux."' >> systools-help
echo -e 'echo "sysfo - lists system information about cpu and pci, as well as runs neofetch for other information."' >> systools-help
echo -e 'echo "sysfix - runs an update wipe of sorts on the system upgrading and updating packages and cleans the local repository of pkg files"' >> systools-help
echo -e 'echo "sysrm - removes all commands installed from systools, aswell as itself, note: does not remove the systools installer, that must be done manually"' >> systools-help
echo -e 'echo "sysls - prints all hidden and non-hidden files in your current directory. in readable format. sorted by file size with timestamps and permissions."' >> systools-help
echo -e 'echo "systools - prints some about systools information, used as a way to check if systools in setup."' >> systools-help
echo -e 'echo "sysrl - reloads systools by removing all commands and running the systools setup tool again."' >> systools-help
echo -e 'echo "termres - clears the terminal, cds to ~ and prints a welcome message to the current user."' >> systools-help
chmod +x systools-help
sudo mv systools-help /usr/local/bin/systools-help
# Creates the command for 'c' (clear abbreviation)
echo 'creating the c command in /usr/local/bin/c'
echo -e '#!/bin/bash\nclear' > c
chmod +x c
sudo mv c /usr/local/bin/c
# Creates the command for 'sysfo' (echos an unholy amount of system information to terminal)
echo 'creating the sysfo command in /usr/local/bin/sysfo'
echo -e '#!/bin/bash\necho "Listing system information..."\nsleep 0.7\necho ""\nlscpu\necho ""\nlspci\necho ""\nlsblk\nneofetch' > sysfo
chmod +x sysfo
sudo mv sysfo /usr/local/bin/sysfo
# Creates the command for sysfix
echo 'creating the sysfix command in /usr/local/bin/sysfix'
echo -e '#!/bin/bash\nsudo apt update\nsudo apt upgrade\nsudo apt full-upgrade\nsudo apt clean' > sysfix
chmod +x sysfix
sudo mv sysfix /usr/local/bin/sysfix
# creates the command for 'sysrm'
echo 'creating the sysrm command in /usr/local/bin/sysrm'
echo -e '#!/bin/bash\necho "removing command: c..."\nsudo rm /usr/local/bin/c\necho "removing command: sysfo..."\nsudo rm /usr/local/bin/sysfo' > sysrm
echo -e 'echo "removing command: sysfix..."\nsudo rm /usr/local/bin/sysfix\necho "removing command: systools-help..."' >> sysrm
echo -e 'sudo rm /usr/local/bin/systools-help\necho "removing command: sysrm..."\nsudo rm -- "$0"\necho "removing command: sysls..."' >> sysrm
echo -e 'sudo rm /usr/local/bin/sysls\necho "removing command: systools..."\nsudo rm /usr/local/bin/systools' >> sysrm
echo -e 'echo "removing command: termres..."\nsudo rm /usr/local/bin/termres' >> sysrm
chmod +x sysrm
sudo mv sysrm /usr/local/bin/sysrm
gap 1
echo 'Setup Complete. Run "systools-help" to view a list of commands.'
gap 1
