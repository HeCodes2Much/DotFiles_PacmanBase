<div align="justify">
<div align="center">

```ocaml
The-Repo-Club's Dotfiles
```

<br>

<p align="center">
  <img src="https://raw.githubusercontent.com/JotaRandom/archlinux-artwork/master/logos/archlinux-grad1-light.svg" width="500px" alt="Arch logo"/>
</p>

<br>

```ocaml
Arch / Linux / AUR
```

</div>

<p align="center">
  <img src="https://img.shields.io/badge/Maintained-Yes-green?color=red&style=flat-square">
  <img src="https://img.shields.io/github/last-commit/The-Repo-Club/DotFiles?color=red&style=flat-square">
  <img src="https://img.shields.io/github/repo-size/The-Repo-Club/DotFiles?color=red&style=flat-square">
  <img src="https://img.shields.io/github/license/The-Repo-Club/DotFiles?color=red&style=flat-square">
  <img src="https://img.shields.io/github/issues/The-Repo-Club/DotFiles?color=red&style=flat-square">
  <img src="https://img.shields.io/github/stars/The-Repo-Club/DotFiles?color=red&style=flat-square">
  <img src="https://img.shields.io/github/forks/The-Repo-Club/DotFiles?color=red&style=flat-square">
  <img src="https://img.shields.io/github/commit-activity/m/The-Repo-Club/DotFiles?color=red&style=flat-square">
</p>

<table align="center">
  <tr>
    <th align="center">
      <sup><sub>:warning: WARNING :warning:</sub></sup>
    </th>
  </tr>
  <tr>
    <td align="center">
        <sup><sub><samp>It worked perfectly on my machine, but I can't guarantee it will work on your machine</samp></sub></sup>
    </td>
  </tr>
  <tr>
    <td align="center">
      <a href="https://archlinux.org/">
        <sup><sub><samp>Powered by Arch/Linux x86_64</samp></sub></sup>
      </a>
    </td>
  </tr>
</table>


## Getting Started

To clone and manage your dotfiles using a bare Git repository, follow these steps:

### 1. Clone the Repository

Clone the repository into a `dotfiles` directory in your home directory:

```sh
git clone --bare git@github.com:HeCodes2Much/DotFiles_PacmanBase.git $HOME/.dotfiles
```

### 2. Define an Alias

Define an alias to simplify Git commands for managing your dotfiles:

```sh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

### 3. Checkout the Repository

Checkout the actual content from the repository to your home directory:

```sh
dotfiles checkout
```

If you encounter errors because some files already exist, back them up or remove them before retrying the checkout command.

### 4. Configure Git to Ignore Untracked Files

Configure the repository to not show untracked files to keep your home directory clean:

```sh
dotfiles config --local status.showUntrackedFiles no
```

## Usage

With the alias defined, you can now manage your dotfiles using standard Git commands prefixed with `dotfiles`.

### Examples:

- Add a file:

  ```sh
  dotfiles add .vimrc
  ```

- Commit changes:

  ```sh
  dotfiles commit -m "Add vim configuration"
  ```

- Push changes:

  ```sh
  dotfiles push
  ```

- Pull changes:

  ```sh
  dotfiles pull
  ```

## Customization

You can customize this setup to include additional files or directories by adding them to the repository and committing the changes.

## Backup and Restore

To backup your dotfiles, simply push your changes to the remote repository. To restore them on a new machine, follow the cloning and checkout steps above.

## Additional Resources

- [Dotfiles Git Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)
- [Managing Dotfiles with Git](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
