# HOME 目录：每一个 Linux 操作用户在 Linux 系统的个人账户目录。路径在 /home/(用户名)。相当于 Windows 里的 user 用户目录

# Linux 系统中可以配置多个用户，配置多个用户组，同一个用户可以加入多个用户组。Linux 的权限管控级别有 2 个级别，分别是针对用户的权限控制和针对用户组的权限控制（以下操作均需要 root 用户）

# 用户组管理
# 创建用户组
groupadd 用户组名
# 删除用户组
groupdel 用户组名
# 创建用户。-g指定用户组（已经存在的），若不指定-g，则会创建同名的组并自动加入。-d指定HOME路径，不指定默认在/home/(用户名)
useradd [-g -d] 用户名
# 删除用户。-r删除HOME目录，不使用-r则会保留HOME目录
userdel [-r] 用户名
# 查看用户所属组。不输入用户名，则默认查看自身
id [用户名]
# 修改用户所属组
usermod -aG 用户组 用户名
# 查看当前系统中有哪些用户
getent passwd
# 查看当前系统中有哪些用户组
getent group


# 进入root用户（需要输入密码），不带用户名默认切换到root用户
su - root
su
# 切换到chanzz用户（从root用户切换到任何用户都不需要输入密码，因为root用户是超级管理员用户）
su chanzz
# 退出用户（也可以使用快捷键 Ctrl+d）
exit
# sudo。为普通命令授权，临时以root身份执行（即为这一条命令赋予root权限）
sudo 其他命令
# 要为普通用户配置sudo认证
su
visudo
echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# ls 列出目录下的内容（也就是文件夹和文件），并显示权限信息
# 以平铺的形式列出当前工作目录下的内容
ls
# 查看根目录的全部文件
ls /
# 可以查看目录下的隐藏内容（只要以.开头的，就会自动隐藏）
ls -a
# 以竖向列表的形式来展示内容，还有更多的相关信息（直接ls是以横向平铺的形式来展示内容）
ls -l
# 可以搭配使用（以下的命令是等价的）
ls -l -a
ls -a -l
ls -al
ls -la
# -h 可以列出K,M,G，也就是可以查看文件大小单位KB,MB,GB (必须与-l搭配进行使用)
ls -lh
ls -hl
# 全部搭配使用(顺序是无所谓的)
ls -lah
ls -l -a -h


# 使用以下命令后在命令行会出现以下信息
ls -l
# 第一列是权限信息（一共有十位字母）
# 第一位（也就是标识最前面）-文件，d 文件夹，l 软链接（不要通过文件的后缀名进行判断）

# r,w,x,- 分别代表可读权限（查看内容），可写权限（创建、改名、删除等修改操作），可执行权限（可以作为程序执行，也就是可切换工作目录到该文件夹），无权限
# 第一块（2,3,4 位）代表所属用户权限；第二块（5,6,7 位）代表所属用户组权限；第三块（8,9,10 位）代表其他用户权限

# chmod 修改文件、文件夹的权限信息（也就是授权）只有所属用户和 root 用户可以进行授权操作
chmod [-R] 权限 文件或文件夹。-R对文件夹内的所有内容应用同样的操作
# u表示user所属用户权限，g表示group所属用户组权限，o表示other其他用户权限
# 将文件的权限修改成rwxr-x--x
chmod u=rwx,g=rx,o=x test.txt
# 将文件夹以及文件夹内的所有内容的权限修改成rwxr-x--x
chmod -R u=rwx,g=rx,o=x test

# 也可以通过数字来表示权限

# 0：没有任何权限
# 1：仅有x权限
# 2：仅有w权限
# 3：有wx权限
# 4：仅有r权限
# 5：有rx权限
# 6：有rw权限
# 7：有rwx权限（即全部权限）

# 以下两个命令等价
chmod u=rwx,g=rx,o=x test.txt
chmod 751 test.txt

# chown 修改文件、文件夹的所属用户和用户组（仅 root 用户才能用，因为只有 root 拥有所有用户的权限）
# 正所谓，“拥有 不代表 可以授权(给其他用户)”
chown [-R] [用户]:[用户组] 文件或文件夹
# 修改文件所属用户为chanzz
chown chanzz test.txt
# 修改文件所属用户组为chanzz
chown :chanzz test.txt
# 修改文件所属用户为chanzz，所属用户组为chanzz
chown chanzz:chanzz test.txt
# 修改文件夹以及文件夹内的所有内容的所属用户为chanzz
chown -R chanzz test

# cd 切换工作目录
# 切换到根目录
cd /
# 切换到用户的HOME目录
cd
# 查看当前工作目录
pwd
# 可以用绝对路径，也可以使用相对路径。比如/home/chanzz
# 绝对路径是以根目录为起点，路径需要填写完整的绝对路径
cd home
cd chanzz
# 相对路径是以当前目录为起点，路径填写简短的文件夹名即可
cd /home/chanzz

# 特殊路径符：(.) (..) (~)
# 当前目录 .（一般是结合相对路径使用）
cd ./chanzz
cd /home/chanzz
# 上一级目录 ..
# 返回上一级目录（用得比较多）
cd ..
# 返回上两级目录
cd ../..
# HOME目录 ~（也是结合相对路径使用）
cd ~/Desktop
cd /home/chanzz/Desktop
# 返回HOME目录的第二种表示（用得不多，一般用第一种命令表示更多）
cd ~

# mkdir 创建新的目录（文件夹）。语法跟 cd 的路径表示一模一样
# -p可以自动创建不存在的父目录，用于创建多层级的目录
# 如果math和test本身不存在，不使用-p会报错（因为没有该文件夹），使用-p后可以自动创建math/test的父目录
mkdir -p math/test/demo
# 创建文件夹需要修改权限，请确保在 HOME 目录操作，涉及到权限问题，HOME 外无法成功执行

# touch 创建文件。绝对路径、相对路径、特殊路径符均可使用
# 创建test.txt文件
touch test.txt

# cat 查看文件内容（一次性全部在命令行显示出来）

# more 查看文件内容（支持翻页）
# 空格翻页。或者通过上下键进行控制切换页面
# q 退出查看

# cp 复制文件或文件夹
# -r。用于复制文件夹使用，表示递归（也就是说，复制文件夹要使用-r的选项）
# 第一个参数math是需要复制的文件夹（已经存在的），第二个参数math2是要复制到的文件夹（可以不存在，cp可以自动创建不存在的文件夹）
cp -r math math2

# mv 移动文件或文件夹。也具备改名的效果
# 第一个参数math是需要移动的文件夹（已经存在的），第二个参数math2是要移动到的文件夹（如果目标不存在，则进行改名，以确保目标存在）。其实可以理解为mv就是cp后再删除原路径的内容
mv math math2

# rm 删除文件、文件夹
# rm可以一次性删除多个目标
rm test.txt test2.txt
# -r。同cp命令的选项一样，表示递归，用于删除文件夹
rm -r math
# -f强制删除，也就是不会弹出确认信息。只用root用户才会用提示信息，普通用户没有提示信息的
rm -f test.txt
# 支持通配符*
# 表示名字以test开头的内容
test*
# 表示名字以test结尾的内容
*test
# 表示名字包含test的内容
*test*

###千万不要在root用户下使用###
rm -rf /
rm -rf /*
# 以上命令表示删除整个根目录的内容

# which 查看命令所在的程序文件在哪里
# 查看cd
which cd

which pwd
which touch
which mkdir
which cp
which mv
which which

# find 查找文件
# find 起始路径 -name "被查找的文件名"
# 在根目录搜索文件名是test的文件
find / -name "test"
# 也可以和rm一样使用通配符
# 在根目录搜索文件名是以test开头的文件
find / -name "test*"

# find 起始路径 -size +|-n[kMG]。k是小写，M,G是大写
# 查找小于10KB的文件
find / -size -10k
# 查找大于100MB的文件
find / -size +100M
# 查找大于1GB的文件
find / -size +1G

# echo 在命令行中输出指定内容
# echo "输出的内容"
echo "Hello Linux"
# 反引号`需要执行的命令`
# 将pwd作为命令去执行，而不是普通的字符
echo `pwd`

# 重定向符
# > 覆盖写入符号右侧指定的文件中（也就是会覆盖以前的内容）
echo "Hello Linux" > test.txt
# >> 追加写入符号右侧指定的文件中（追加写到原本内容的末尾）
echo "Hello Linux" >> test.txt
# 将ls的结果写入文件
ls > test.txt
ls / >> test.txt

# 输出工作目录到文件中
echo "我的工作目录是:`pwd`" > work.txt

# tail 可以查看文件尾部的内容，跟踪文件的最新更改
# tail [-f -num] 路径。-f表示持续跟踪，-num查看尾部多少行，不写默认10行
# 查看文件尾部5行内容
tail -5 test.txt
# 持续跟踪动态日志
tail -f log

# grep 从文件中通过关键字过滤文件行
# grep [-n] "关键字" 文件路径。-n显示行号，关键字若带有空格或其他特殊符号，使用""将关键字括起来。文件路径可以作为管道符的内容输入
grep -n "Linux" test.txt

# wc 做数量统计
# wc [-c -m -l -w] 文件路径。-c统计bytes数量（也就是字节数，文件大小），-m统计字符数量，-l统计行数，-w统计单词数量
wc test.txt
# 比如输出 2 11 59 test.txt
# 也就是说test.txt文件中有2行，11个单词，59个字节（文件大小为59k）

# 管道符：|。将管道符左边的结果，作为右边的命令进行输入
# 查看test.txt内容并检索（过滤）包含Linux的行
cat test.txt | grep "Linux"
# 查看当前目录下的内容并检索出包含test的内容
ls | grep "test"
# 统计目录下的文件数（这里一定要按照列表进行展开）
ls -l /home | wc -l
# 统计文件中带有Linux关键字的有几行
cat test.txt | grep Linux | wc -l
# 统计文件中带有Linux关键字的有几个单词
cat test.txt | grep Linux | wc -w

# vi/vim 编辑器，是 Linux 系统中最经典的文本编辑器。vim 是 vi 的加强版本，兼容 vi 的所有指令，不仅能编辑文本，还具有 shell 程序编辑的功能，可以不同颜色的字体来辨别语法的正确性。这里更推荐大家直接使用neovim
# vim 文件路径。如果文件不存在，会自动创建新文件并编辑
vim test.txt
# 具体操作请移步 vim 的操作

# history 查看历史输入过的命令。多用于复制粘贴用的，也就相当于剪贴板的作用
history

# 查看历史中输入过的cd命令
history | grep cd

# 自动执行上一次匹配前缀的命令（比如最近的命令中有python）
![命令前缀]
!py

# 创建软链接。相当于 Windows 系统中的快捷方式
# -s创建软链接，参数1是被链接的文件或文件夹，参数2是要链接到的目的地
ln -s 参数1 参数2

# date 在命令行中查看系统的时间
# -d按照给定的字符串显示日期，一般用于日期计算
date [-d] "[+格式化字符串]"
# 格式化字符串有：
%Y 年
%y 年份后两位数字
%m 月份
%d 日
%H 小时
%M 分钟
%S 秒
%s 时间戳


# 查看本机 ip 地址
sudo apt -y install net-tools
ifconfig

# 127.0.0.1代表本机ip

# 主机名
# 查看主机名
hostname

# ping 检查指定的网络服务器是否是可以连通的
# -c检查的次数，不使用-c选项，将无限次持续检查
ping [-c num] ip或主机名

# wget 非交互式下载器，可以在命令行内下载网络文件
# -b后台下载，也就是不会在前台显示下载进度
wget [-b] url

# curl 发送 http 网络请求，可用于：下载文件、获取信息等
# -O用于下载
curl [-O] url

# Debian 和 Ubuntu 都是用 apt 包管理器对.deb 安装包进行安装
# 安装软件需要root权限，-y就是自动确认，无须手动确认。install安装，remove卸载，search搜索
sudo apt [-y] [install | remove | search] 软件名称

# 压缩解压
# tar
# -c压缩模式，-v显示过程（进度条），-x解压模式，-f要压缩（解压）的文件（必须在最后一个），-z是gzip模式（一般要放最前面），-C解压的地方（用于解压模式）
tar [-c -v -x -f -z -C] 参数1 参数2 ...

# 常用的组合
# 仅打包
tar -cvf test.tar 1.txt 2.txt 3.txt
# 打包并压缩
tar -zcvf test.tar.gz 1.txt 2.txt 3.txt
# 解压
tar -xvf test.tar
tar -xvf test.tar -C /home/test
tar -zxvf test.tar.gz -C /home/test

# zip，unzip
# 被压缩的内容包含文件夹就要使用-r
zip [-r] 参数1 参数2 ...
# 将a.txt b.txt c.txt压缩到test.zip
zip test.zip a.txt b.txt c.txt
# 将a.txt b.txt c.txt文件和math test文件夹压缩到test.zip
zip test.zip a.txt b.txt c.txt math test

# -d就是解压的位置，同tar的-C
unzip [-d] 参数
# 解压到当前目录
unzip test.zip
# 解压到指定目录
unzip test.zip -d /home/a

# passwd设置密码（如果原本存在密码，那就是修改密码）

# set
# 查询系统中的所有变量，包括用户变量和环境变量
set
# 命令执行前会把命令先输出一次
set -x

# env
# 只能查询环境变量
env









