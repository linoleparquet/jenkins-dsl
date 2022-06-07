sudo apt update
sudo apt upgrade
sudo apt install \
       	vim \
	unzip \
       	terminator \ # Set CopyOnSelect
	vagrant \
	npm \
	python3-pip \
	unrar

sudo apt remove thunderbird
snap install onlyoffice-desktopeditors
sudo snap install intellij-idea-community --classic


#install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
	   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
	     $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose


# install kvm
sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
sudo apt-get install virt-manager


# install minikube
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube config set driver kvm2

# install k9s
curl -sS https://webinstall.dev/k9s | bash


# install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc


# install terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install terraform 


# install vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code
# Preferences:

# terminal.integrated.copyOnSelection, editor.formatOnSave window.openFoldersInNewWindow editor.defaultFormatter
# Ctrl+Shift+P + "Preferences: Open Settings -> Open Settings tab

# Modify shortcut: https://code.visualstudio.com/docs/getstarted/keybindings workbench.action.terminal.splitInstance -> Ctrl+Shift+E

# Install extensions: mhutchie.git-graph, esbenp.prettier-vscode 

# install spotify client
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get install spotify-client

# insert french accent keyboard
# https://romaricpascal.is/fr/posts/ecrire-francais-clavier-anglais-ubuntu/
sudo apt install gnome-tweaks

# configure linux dock
# https://ubunlog.com/en/how-to-turn-ubuntu-dock-into-a-real-dock/

# install Brave
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser


# skip grub configuration
# https://ubuntuhandbook.org/index.php/2020/06/hide-grub-boot-menu-ubuntu-20-04-lts/
sed -i s/GRUB_TIMEOUT=10/GRUB_TIMEOUT=0/g /etc/default/grub

# install orchis theme
git clone https://github.com/vinceliuice/Orchis-theme.git
./Orchis-theme/install.sh


# copy .bashrc .vimrc

# less syntax highlight
sudo apt install source-highlight
cat >> ~/.bashrc <<EOF

# Less: syntax highlight
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '
EOF


# vagrant autocompletion
vagrant autocomplete install --bash

