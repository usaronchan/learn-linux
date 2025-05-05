## Linux 发行版

众所周知，我是从大学才开始接触 Linux 的。

以下是我使用过的 Linux 发行版，平台有 Win10 的 WSL2、虚拟机 VMware 上等

- Ubuntu。20.04 LTS, 22.04 LTS, 24.04 LTS
  - 也就是 Ubuntu 的长期维护版。Ubuntu 是比较适合新手的 Linux 发行版，也是 Linux 安装最广的发行版。如果你对 Linux 没有任何了解，推荐使用 Ubuntu，网上也有很多教程可以参考。
- Debian
  - Debian 几乎是比较稳定的系统。Ubuntu 就是在 Debian 基础上进一步开发的。十分推荐对 Ubuntu 熟悉的用户转过来。
- Kali Linux
  - 这不是一个正常用户使用的发行版。小孩子就不要学坏哦！
- Arch Linux
  - 这是一个最轻量的 Linux 发行版。依靠滚动更新，往往都能体验到最新的软件，但更新快也很容易出 bug。适合那些对 Linux 十分了解的用户使用
- Fedora
- NixOS

### Debian

- testing 介于 stable 和 unstable 之间，所以是推荐用户使用的最新版本

### Kali Linux

- installer 就是完整镜像
- purple 附加防御工具

## 关于 WSL2 和 VMware

我一开始是在 Win10 系统上的 WSL2 来使用 Linux 系统，不得不说 WSL2 确实对新手比较友好，但是它好像不是真正的 Linux 系统，因为我在升级 Linux 内核的时候发现，微软自己弄了一套给 WSL2 用的 Linux 内核（这也导致了 WSL2 的 Linux 内核版本远远落后于正常的 Linux 内核）在前段时间，我自己在我的 Win10 上装了 VMware（没错，也就是虚拟机）。

正所谓，不装不知道，我几乎折腾了两天才慢慢弄好 VMware 上的配置。不得不说，很多东西真的就是从 0 开始，几乎大大小小的坑自己都踩一遍，机器也因此重装了好几次。好在我不是用其他的发行版，Debian 入门对新手还是比较友好的了。
