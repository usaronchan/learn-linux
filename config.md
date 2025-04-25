## Config files

### Git

- `~/.gitconfig`: Git 的配置文件

### Vim

- `~/.vimrc`: Vim 的配置文件

## SSH

- `.ssh/config`: SSH 的配置文件
- `known_hosts`: 是做服务器认证的，当使用 SSH 连接到一个新的服务器的时候，SSH 会让你确认服务器的信息（域名、IP、公钥），然后写进 known_hosts 里，以后再次连到这个服务器就不用确认了。如果信息改变了（通常是公钥改变了），就会提示你服务器信息变了，你可以把它从 kown_hosts 里删除，然后重新确认。
- `authorized_keys`: 该文件用于保存其他主机的公钥。

### Others

- `.editorconfig`: 控制该目录下不同文件类型的缩进设置等编码设置
- `.gitignore`: Git 在当前目录下要忽略跟踪的文件
