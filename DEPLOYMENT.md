# 自建服务器部署

本网站是纯静态 HTML/CSS，不需要 Node.js、数据库或后端进程。推荐使用 Ubuntu、Nginx 和 Let's Encrypt。

## 1. 推荐：服务器直接克隆

在域名 DNS 中新增一条 `A` 记录，例如：

```text
support.example.com -> 你的服务器公网 IPv4 地址
```

登录服务器后执行：

```bash
sudo mkdir -p /opt
cd /opt
sudo git clone https://github.com/crayhuang/smart_planner_support.io.git
cd smart_planner_support.io
sudo ./scripts/server-setup.sh support.example.com
```

脚本会安装并启动 Nginx，自动以当前仓库目录作为网站根目录。将 `support.example.com` 替换成真实域名。

DNS 生效后申请 HTTPS：

```bash
sudo apt-get install -y certbot python3-certbot-nginx
sudo certbot --nginx -d support.example.com
```

以后更新官网内容时，在服务器仓库目录执行：

```bash
cd /opt/smart_planner_support.io
./scripts/server-update.sh
```

Nginx 直接读取静态文件，因此更新后无需重启服务。

## 2. 可选：从本地 rsync 发布

在此仓库根目录执行：

```bash
cp .env.deploy.example .env.deploy
```

编辑 `.env.deploy`：

```bash
SITE_HOST=你的服务器域名或IP
SITE_USER=smartplanner
SITE_PORT=22
SITE_DIR=/var/www/smart-planner
SITE_SSH_KEY=$HOME/.ssh/smart-planner_ed25519
```

`.env.deploy` 已被 Git 忽略，不能提交私钥或服务器密码。

## 3. 发布网站

首次先预演，确认变更文件：

```bash
./scripts/deploy.sh
```

确认无误后发布：

```bash
./scripts/deploy.sh --deploy
```

脚本使用 `rsync --delete`，因此服务器网站目录应只存放这个站点的文件。不要将其他网站或手工文件放入 `/var/www/smart-planner`。

## 4. 验证

```bash
curl -I https://support.example.com/
curl -I https://support.example.com/privacy-policy-zh.html
```

在 App Store Connect 中更新为你的 HTTPS 地址，例如：

```text
Support URL: https://support.example.com/
Privacy Policy: https://support.example.com/privacy-policy.html
```
