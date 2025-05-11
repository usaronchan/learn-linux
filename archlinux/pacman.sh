
# 安装软件。如果有多个软件包，空格分隔
pacman -S <xxxxx>
# 先从远程仓库下载软件包的数据库，再安装软件
pacman -Sy <xxxxx>
# 输出操作信息后安装
pacman -Sv <xxxxx>
# 只下载软件包，但不安装
pacman -Sw <xxxxx>
# 安装本地软件包
pacman -U <xxxxx>.pkg.tar.gz
# 升级整个系统
pacman -Syu
# 清理未安装的软件包文件
pacman -Sc
# 清理所有已安装的软件包和缓存
pacman -Scc


# 只卸载软件不卸载依赖的组件
pacman -R <xxxxx>
# 卸载软件并输出卸载信息
pacman -Rv <xxxxx>
# 卸载软件，并同时卸载该软件的依赖组件
pacman -Rs <xxxxx>
# 卸载软件，并卸载依赖该软件的程序
pacman -Rsc <xxxxx>
# 卸载软件，同时卸载不被任何软件所依赖的组件
pacman -Ru <xxxxx>
# 删除软件包并删除相应的配置文件
pacman -Rn
# 彻底删除。删除软件包和无用的依赖，以及相应的配置文件
pacman -Rsn


# 在仓库搜索包含关键字的软件包
pacman -Ss <xxxxx>
# 显示软件仓库所有软件的列表
pacman -Sl


# 软件包的查询
# 查看某个软件是否已安装
pacman -Q <xxxxx>
# 列出所有已安装的软件包
pacman -Qe
# 列出所有已安装的软件包的详细信息
pacman -Qi
# 搜索已安装的软件包
pacman -Qs <xxxxx>
# 列出可升级的软件包
pacman -Qu
# 列出已安装的软件列表中不被其他组件依赖的软件
pacman -Qt
# 列出软件包所有文件安装路径
pacman -Ql
# 列出所有软件包。-Q查询本地，-q省略版本号
pacman -Qq
# 列出所有显式安装。-e显式安装，-n忽略外部AUR
pacman -Qqen
# 列出自动安装的包。-d依赖项
pacman -Qqd


# Print installed package to txt file
pacman -Qqen > pkglist.txt
# To install package via txt file
pacman -S - < pkglist.txt

