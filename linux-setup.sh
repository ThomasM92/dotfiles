#!/bin/bash

# echo -ne "[#####################]\r"

clear() {
	printf "\r\033[2K"
}

printf "Setup [--------------------] | git"
# sudo apt install git -y

clear
printf "Setup [■-------------------] | starship"
#{
	# curl -sS https://starship.rs/install.sh | sh -s -- -y
	# echo '\neval "$(starship init bash)"' >> .bashrc
#} >/dev/null 2>&1

clear
printf "Setup [■■------------------] | exa"
# {
	# sudo apt install exa -y
	# echo '\nalias ls="exa -l"' >> .bashrc
	# echo 'alias lsa="exa -la"' >> .bashrc
# } >/dev/null 2>&1

clear
printf "Setup [■■■-----------------] | fzf"
#{
	#sudo apt install fzf -y
	#echo 'export FZF_DEFAULT_OPTS="' >> .bashrc
	#echo '	--color=fg:#908caa,bg:#191724,hl:#ebbcba' >> .bashrc
	#echo '	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba' >> .bashrc
	#echo '	--color=border:#403d52,header:#31748f,gutter:#191724' >> .bashrc
	#echo '	--color=spinner:#f6c177,info:#9ccfd8' >> .bashrc
	#echo '	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"' >> .bashrc
	#echo 'export BAT_THEME="ansi"' >> .bashrc
	#echo 'alias f='fd -t f . $HOME | fzf --layout=reverse --info=inline --border --margin=1 --padding=1 --preview "batcat -n --color=always {}" | xargs -r nvim'' >> .bashrc
	#echo 'alias d='cd $(fd -t d . $HOME | fzf --height=50% --layout=reverse --info=inline --border --margin=1 --padding=1)'' >> .bashrc
#} >/dev/null 2>&1

clear
printf "Setup [■■■■----------------] | neovim"
#{
	# curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
	# tar xzf nvim-linux64.tar.gz
	# sudo cp -r nvim-linux64/bin/nvim /usr/bin/nvim # neovim binary
	# sudo cp -r nvim-linux64/share/nvim/runtime /usr/local/share/nvim # neovim runtime

	#/usr/bin/nvim
	
	# todo: create symbolic link
	# sudo add-apt-repository ppa:neovim-ppa/stable -y
	# sudo apt update -y
	# sudo apt install neovim -y
#} >/dev/null 2>&1

clear
printf "Setup [■■■■■---------------] | rust"
#{
	# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
#} >/dev/null 2>&1

clear
printf "Setup [■■■■■■--------------] | fd 🦀"
#{
	# cargo install fd-find
#} >/dev/null 2>&1

clear
printf "Setup [■■■■■■■-------------] | ripgrep 🦀"
{
	# cargo install ripgrep
} >/dev/null 2>&1

clear
printf "Setup [■■■■■■■■------------] | gitui 🦀"
{
	# todo: crate symbolic link
	# cargo install --locked gitui
} >/dev/null 2>&1

clear
printf "Setup [■■■■■■■■■-----------] | tokei 🦀"
{
	# cargo install tokei
} >/dev/null 2>&1

clear
printf "Setup [■■■■■■■■■■----------] | toipe 🦀"
{
	# cargo install toipe
} >/dev/null 2>&1

clear
printf "Setup [■■■■■■■■■■■---------] | bat 🦀"
{
	# cargo install --locked bat
} >/dev/null 2>&1

clear
printf "Setup [■■■■■■■■■■■■--------] | zellij 🦀"
{
	# todo: create symbolic link
	# cargo install --locked zellij
} >/dev/null 2>&1

clear
printf "Setup [■■■■■■■■■■■■■-------] | hyperfine 🦀"
{
	# cargo install --locked hyperfine
} >/dev/null 2>&1

clear
printf "Setup [■■■■■■■■■■■■■■------] | atac 🦀"
{
	# cargo install atac
} >/dev/null 2>&1

clear
printf "Setup [■■■■■■■■■■■■■■■-----] | nvm"
{
	# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
	# echo 'export NVM_DIR="$HOME/.nvm"' >> .bashrc
	# echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> .bashrc
	# echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> .bashrc
} >/dev/null 2>&1

clear
printf "Setup [■■■■■■■■■■■■■■■■----] | node 20 lts (via nvm)"
{
	# may need to restart term???
	# nvm install 20
} >/dev/null 2>&1
# js formater (prettier) ??

# docker

clear
printf "Setup [■■■■■■■■■■■■■■■■■---] | dotfiles"
{
	#sudo git clone https://github.com/ThomasM92/dotfiles.git
	# ln -s ~/dotfiles/nvim ~/.config/nvim
	# ln -s ~/dotfiles/gitui ~/.config/gitui
	# ln -s ~/dotfiles/zellij ~/.config/zellij
} >/dev/null 2>&1

# crate symbolic link for nvim, gitui, zellij, atac, terminal, etc ??
# ln -s "/what" "/where/"

clear
printf "Setup [■■■■■■■■■■■■■■■■■---] | gh"
{
	# sudo apt-get install gh
} >/dev/null 2>&1

# git-graph # https://github.com/mlange-42/git-graph
# go
# jqp

clear
printf "Setup [■■■■■■■■■■■■■■■■■■--] | brave"
{
	# sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	# echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	# sudo apt update
	# sudo apt install brave-browser
} >/dev/null 2>&1

clear
printf "Setup [■■■■■■■■■■■■■■■■■■■-] | wmctrl"
{
	# sudo apt-get install wmctrl -y
} >/dev/null 2>&1

clear
printf "Setup [■■■■■■■■■■■■■■■■■■■■] | DONE ✅"
