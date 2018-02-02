## percol

**Maintainer:** [@robturtle](https://github.com/robturtle)

It provides two functionalties that allows you search history and resume
background jobs with interatively incremental searching utility powered by
percol.

### Usage

1. Use `Ctrl-R` to search the history.

  ![interactively search history](https://www.dropbox.com/s/2ke80q5uswz7sqf/percol.plugin1.gif?raw=1)
  
1. Use `Ctrl-T` to switch to another git branch

1. User `Ctrl-H` to search aliases

1. Use `Ctrl-U` to rollback specific migration

2. Use `Ctrl-Q` to resume background jobs.

  ![interactively resume background jbos](https://www.dropbox.com/s/u5t5l7jeznv06y8/percol.plugin2.gif?raw=1)

### Installation

0. [Install percol](https://github.com/mooz/percol) by running the following:

  ```
  pip install percol
  ```

1. Clone the repository into your custom folder. Assuming your custom folder is
   at `~/.oh-my-zsh/custom`
    
  ```
  mkdir -p ~/.oh-my-zsh/custom/plugins
  git clone https://github.com/robturtle/percol.plugin.zsh.git ~/.oh-my-zsh/custom/plugins/percol
  ```

2. Enable the plugin by adding it to your `plugins` definition in `~/.zshrc`.

  ```
  plugins=(percol)
  ```
