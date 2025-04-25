# 配置文件位置（推荐使用第一种方式）
# ~/.config/tmux/tmux.conf
# ~/.tmux.conf

# tmux下的所有命令都是在prefix键位下执行的

# 左右分屏
# <prefix> + %
# 上下分屏
# <prefix> + "
# 切换会话窗口
# <prefix> + 方向键


# 创建窗口
# <prefix> + c
# 切换窗口
# <prefix> + 编号
# 退出窗口（但没有关闭）
# <prefix> + d
# 关闭窗口
# <ctrl + d>


# 列出所有session
tmux ls

# 进入session
tmux attach -t <session名称>
# 如果session名称中有空格，需要用引号引起来
tmux attach -t "session 名称"
tmux a -t <编号>
# 如果只有一个session
tmux a

# 退出session 0
tmux kill-session -t 0

# 创建session
tmux new -s <session名称>

