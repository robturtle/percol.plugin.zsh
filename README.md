## percol

**Maintainer:** [@robturtle](https://github.com/robturtle)

It provides two functionalties that allows you search history and resume
background jobs with interatively incremental searching utility powered by
percol.

### Installation

0. Clone the repository into your custom folder. Assuming your custom folder is
   at `~/.oh-my-zsh/custom`
    
  ```
  mkdir -p ~/.oh-my-zsh/custom/plugins
  git clone https://github.com/robturtle/percol.plugin.zsh.git ~/.oh-my-zsh/custom/plugins/percol
  ```

1. Enable the plugin by adding it to your `plugins` definition in `~/.zshrc`.

  ```
  plugins=(percol)
  ```

2. [Install percol](https://github.com/mooz/percol) by running the following:

  ```
  pip install percol
  ```

### Key Bindings

1. Use `Ctrl-R` to search the history.

2. Use `Ctrl-Q` to resume background jobs.
