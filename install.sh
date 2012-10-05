#primero instalamos oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

if [ -d ~/.macarena ]
then
  echo "\033[0;33mYa tienes macarena instalada"
  exit
fi

echo "\033[0;34mClonando la Macarena\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/Astrata/macarena.git ~/.macarena || {
  echo "no tienes git instalado"
  exit
}

#cambiamos el .zshrc
echo "source ~/.macarena/zsh" >> ~/.zshrc

#vim
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]
then
  cp ~/.vimrc ~/.vimrc.pre-macarena;
  rm ~/.vimrc;
fi
cp ~/.macarena/vimrc ~/.vimrc


#top
if [ -f ~/.toprc ] || [ -h ~/.toprc ]
then
  cp ~/.toprc ~/.toprc.pre-macarena;
  rm ~/.toprc;
fi
cp ~/.macarena/toprc ~/.toprc

#instalamos zsh source highlight
mkdir -p ~/.oh-my-zsh/custom/plugins

hash git >/dev/null && /usr/bin/env git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins || {
  echo "no tienes git instalado"
  exit
}
sed -ie 's/plugins=(\(.*\))/plugins=(\1 zsh-syntax-highlighting)/' ~/.zshrc


echo 'source ~/.macarena/aliases' >> ~/.zshrc


echo "\n\n \033[0;32m....tu cuerpo ya tiene alegría Macarena.\033[0m"
/usr/bin/env zsh
source ~/.zshrc
