# Smart Planner Support Pages

## 文件说明

本项目包含两个支持页面：

1. **support.html** - 英文版支持页面
2. **support-zh.html** - 简体中文版支持页面

## 功能特点

### 响应式设计
- 自适应移动端和桌面端
- 优化的移动浏览体验
- 适配不同屏幕尺寸

### 内容完整
- 应用介绍和功能说明
- 快速开始指南
- 常见问题解答（FAQ）
- 故障排除指南
- 联系方式和支持信息
- 隐私和安全说明
- 应用详细信息

### 双语支持
- 英文和简体中文版本
- 页面间可以相互切换
- 内容完全本地化

## 部署方式

### 方式 1：GitHub Pages（推荐）

1. 将文件上传到 GitHub 仓库
2. 在仓库设置中启用 GitHub Pages
3. 选择主分支作为源
4. 访问 URL：`https://[username].github.io/[repo-name]/support.html`

**App Store 配置：**
- Support URL: `https://[username].github.io/[repo-name]/support.html`
- Marketing URL: `https://[username].github.io/[repo-name]/support.html`

### 方式 2：Netlify

1. 注册 Netlify 账号
2. 拖拽文件到 Netlify Drop
3. 获得自动生成的 URL
4. 可选：配置自定义域名

**App Store 配置：**
- Support URL: `https://[your-site].netlify.app/support.html`

### 方式 3：Vercel

1. 注册 Vercel 账号
2. 导入 GitHub 仓库或上传文件
3. 自动部署
4. 可选：配置自定义域名

**App Store 配置：**
- Support URL: `https://[your-site].vercel.app/support.html`

### 方式 4：自己的服务器

1. 上传文件到服务器
2. 确保可以通过 HTTPS 访问
3. 配置正确的 MIME 类型

**App Store 配置：**
- Support URL: `https://yourdomain.com/support.html`

## App Store Connect 配置

### 1. 在 App Information 中设置

1. 登录 [App Store Connect](https://appstoreconnect.apple.com)
2. 选择你的应用
3. 进入 "App Information"
4. 找到 "Support URL" 字段
5. 输入你的支持页面 URL（必须是 HTTPS）
6. 可选：在 "Marketing URL" 中也填入相同 URL

### 2. URL 要求

- 必须使用 HTTPS 协议
- 必须可以公开访问
- 建议使用英文版作为主 URL
- 页面必须在审核时可访问

### 3. 测试

在提交审核前，请确保：
- [ ] URL 可以在浏览器中正常打开
- [ ] 在移动设备上显示正常
- [ ] 所有链接都可以正常工作
- [ ] 邮件链接可以正常打开邮件客户端
- [ ] 语言切换功能正常

## 自定义修改

### 修改联系邮箱

在两个 HTML 文件中搜索 `cray.huang@gmail.com` 并替换为你的邮箱。

### 修改应用信息

在 "App Information" 部分更新：
- App Name
- Bundle ID
- App Store ID
- Developer Name
- Category
- Requirements

### 修改颜色主题

在 `<style>` 标签中修改：

```css
/* 主色调 */
background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);

/* 链接颜色 */
color: #667eea;
```

### 添加更多 FAQ

在 FAQ 部分添加新的 `.faq-item`：

```html
<div class="faq-item">
    <div class="faq-question">问：你的问题？</div>
    <div class="faq-answer">答：你的答案。</div>
</div>
```

### 添加应用图标

替换 `.app-icon` 中的 emoji：

```html
<div class="app-icon">✨</div>
```

或者使用图片：

```html
<div class="app-icon">
    <img src="app-icon.png" alt="Smart Planner" style="width: 100%; height: 100%; border-radius: 22px;">
</div>
```

## 维护建议

### 定期更新

- 根据用户反馈更新 FAQ
- 添加新功能的说明
- 更新故障排除指南
- 保持联系方式最新

### 监控

- 使用 Google Analytics 跟踪访问
- 监控用户最常访问的部分
- 根据数据优化内容

### 版本控制

- 使用 Git 管理更改
- 为重大更新创建标签
- 保留历史版本备份

## 技术细节

### 浏览器兼容性

- Safari (iOS & macOS)
- Chrome
- Firefox
- Edge

### 性能优化

- 纯 HTML/CSS，无外部依赖
- 快速加载时间
- 优化的移动体验
- 无需 JavaScript

### SEO 优化

- 包含 meta description
- 语义化 HTML 标签
- 适当的标题层级
- 移动友好设计

## 常见问题

### Q: 为什么需要两个版本？

A: 为了提供更好的用户体验，我们为不同语言的用户提供本地化内容。用户可以根据需要切换语言。

### Q: 可以只使用一个页面吗？

A: 可以，但建议提供双语版本。你可以只上传英文版，但这可能影响中文用户的体验。

### Q: 如何添加更多语言？

A: 复制现有文件，翻译内容，并在语言切换部分添加新链接。

### Q: 需要定期更新吗？

A: 建议在应用有重大更新时同步更新支持页面，特别是新功能、定价变更或常见问题。

## 联系方式

如有问题或建议，请联系：
- Email: cray.huang@gmail.com

## 许可证

这些支持页面模板可以自由使用和修改。

---

**最后更新：** 2024年
**版本：** 1.0.0
