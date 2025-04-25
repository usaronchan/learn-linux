# 开机自启动
sudo systemctl enable cronie.service
# 启动
sudo systemctl start cronie.service

# 查看运行状态
sudo systemctl status cronie.service



# 列出当前的定时任务
crontab -l


