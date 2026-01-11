# Kinasha's Zsh Plugin

Personal zsh plugin with useful functions and aliases.

## 功能特性

### 自定义函数

- **`,cdtmp`** - 创建一个带时间戳的临时目录并自动进入
  ```bash
  ,cdtmp  # 创建 /tmp/20240101120000 并 cd 进入
  ```

- **`,smz`** - 重新加载 zshrc 配置文件
  ```bash
  ,smz  # 等同于 source ~/.zshrc
  ```

- **`,paste <file>`** - 将剪贴板内容保存到文件（macOS）
  ```bash
  ,paste output.txt  # 将剪贴板内容保存到 output.txt
  ```

### 别名

- **`,p`** - pnpm 的快捷别名
  ```bash
  ,p install  # 等同于 pnpm install
  ```

### 环境配置

- **代理设置** - 自动配置 `http_proxy` 和 `https_proxy`（如果未设置）
- **pnpm 支持** - 自动配置 pnpm 的路径和环境变量

## 安装

### 方式一：使用安装脚本（推荐）

```bash
# 进入插件目录
cd /path/to/zsh-plugin

# 运行安装脚本
./install.sh
```

安装脚本会自动检测你的 zsh 配置并安装插件。

### 方式二：Oh My Zsh 用户

1. **将插件复制到 Oh My Zsh 插件目录：**
   ```bash
   # 如果使用默认配置
   cp -r /path/to/zsh-plugin ~/.oh-my-zsh/custom/plugins/kinasha
   
   # 或者使用软链接（推荐，方便更新）
   ln -s /path/to/zsh-plugin ~/.oh-my-zsh/custom/plugins/kinasha
   ```

2. **在 `~/.zshrc` 中添加插件：**
   ```zsh
   plugins=(git kinasha)
   ```

3. **重新加载配置：**
   ```bash
   source ~/.zshrc
   ```

### 方式三：手动安装（不使用 Oh My Zsh）

在 `~/.zshrc` 文件末尾添加：

```zsh
source /path/to/zsh-plugin/kinasha.plugin.zsh
```

然后运行：
```bash
source ~/.zshrc
```

## 使用示例

运行演示脚本查看所有功能：

```bash
./demo.sh
```

## 配置

### 自定义代理设置

如果你想覆盖默认的代理设置，可以在加载插件之前设置环境变量：

```zsh
export http_proxy=http://your-proxy:port
export https_proxy=$http_proxy
source ~/.zshrc
```

### 启用 fnm 支持

如果需要 fnm (Fast Node Manager) 支持，可以取消注释插件文件中的相关行，或者在你的 `.zshrc` 中添加：

```zsh
eval "$(fnm env --use-on-cd --shell zsh)"
```

## 许可证

MIT

## 贡献

欢迎提交 Issue 和 Pull Request！
