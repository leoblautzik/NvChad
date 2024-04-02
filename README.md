# NeoVim vesión NvChad + leoblautzik 
## listo para c, c++, go, python y algo de java.

1- Instalar una nerd font y configurar la terminal para que use esa font, yo uso Alacritty con "JetBrainsMono Nerd Font". Se descarga de https://www.nerdfonts.com/ En Arch se instala con pacman:  "sudo pacman -S ttf-jetbrains-mono-nerd"

2- Obviamente, instalar neovim. En Arch "sudo pacman -S neovim", en las basadas en debian hay que usar la appimage de neovim.  Sino, googlear. 

3- Clonar mi repo tuneado:  
"git clone https://github.com/leoblautzik/NvChad.git ~/.config/nvim"
	Ejecutar nvim y se comenzarán a instalar todos los plugins. Salir y volver a entrar, no debería haber errores. Caso contrario hacer paso 4 y volver a intentar. 

4- Ejecutar en terminal (solo para go): 
```
go install github.com/segmentio/golines@latest
go install github.com/incu6us/goimports-reviser/v3@latest
go install mvdan.cc/gofumpt@latest
```

5- Dentro de nvim (Mason)
```
// Para go
    :MasonInstall gopls golines goimports-reviser gofumpt gotests
// Para c cpp
    :MasonInstall clangd clang-format codelldb
// Para python
    :MasonInstall mypy pyright black
```
6- Dentro de nvim (TreeSitter)
```:TSInstall go c cpp python rust java```

7- Para tener un IDE de lrpm, usar neovim dentro de tmux con tmux-navigator.
Link a mi tmux.conf: https://github.com/leoblautzik/tmux-nas.git

Basado en: https://youtu.be/i04sSQjd-qo?si=RXfuhSCDqWDqcf-N con algunos plugin extra como folke/noise y neotest.


