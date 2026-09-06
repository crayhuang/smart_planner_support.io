# 自建服务器部署

本网站是纯静态 HTML/CSS，不需要 Node.js、数据库或后端进程。推荐使用 Ubuntu、Nginx、Let's Encrypt 和 SSH/rsync 部署。

## 1. 准备域名与服务器

在域名 DNS 中新增一条 `A` 记录，例如：

```text
support.example.com -> 你的服务器公网 IPv4 地址
```

登录服务器后执行：

```bash
sudo apt update
sudo apt install -y nginx rsync certbot python3-certbot-nginx
sudo adduser --disabled-password --gecos "" smartplanner
sudo mkdir -p /var/www/smart-planner
sudo chown -R smartplanner:smartplanner /var/www/smart-planner
```

将部署电脑的 SSH 公钥加入服务器 `smartplanner` 用户的 `~/.ssh/authorized_keys`。建议使用单独的部署密钥，而不是 root 账户。

## 2. 配置 Nginx

把 [deploy/nginx-smart-planner.conf](deploy/nginx-smart-planner.conf) 上传到服务器：

```bash
sudo cp nginx-smart-planner.conf /etc/nginx/sites-available/smart-planner
sudo ln -s /etc/nginx/sites-available/smart-planner /etc/nginx/sites-enabled/smart-planner
sudo nginx -t
sudo systemctl reload nginx
```

将配置中的 `support.example.com` 替换为你的真实域名，并确保 DNS 已解析后申请 HTTPS：

```bash
sudo certbot --nginx -d support.example.com
```

## 3. 配置本地部署参数

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

## 4. 发布网站

首次先预演，确认变更文件：

```bash
./scripts/deploy.sh
```

确认无误后发布：

```bash
./scripts/deploy.sh --deploy
```

脚本使用 `rsync --delete`，因此服务器网站目录应只存放这个站点的文件。不要将其他网站或手工文件放入 `/var/www/smart-planner`。

## 5. 验证

```bash
curl -I https://support.example.com/
curl -I https://support.example.com/privacy-policy-zh.html
```

在 App Store Connect 中更新为你的 HTTPS 地址，例如：

```text
Support URL: https://support.example.com/
Privacy Policy: https://support.example.com/privacy-policy.html
```

