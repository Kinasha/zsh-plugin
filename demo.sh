#!/bin/zsh
# Kinasha Zsh Plugin 演示脚本
# 这个脚本展示了如何使用插件中的各种功能

echo "=========================================="
echo "Kinasha Zsh Plugin 使用演示"
echo "=========================================="
echo ""

# 加载插件
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$PLUGIN_DIR/kinasha.plugin.zsh"

echo "✅ 插件已加载"
echo ""

# 演示 1: ,cdtmp - 创建临时目录
echo "📁 演示 1: ,cdtmp - 创建临时目录并进入"
echo "执行: ,cdtmp"
OLD_DIR=$(pwd)
,cdtmp
TMP_DIR=$(pwd)
echo "当前目录: $(pwd)"
cd "$OLD_DIR"
echo "✅ 临时目录已创建: $TMP_DIR"
echo ""

# 演示 2: ,paste - 粘贴剪贴板到文件
echo "📋 演示 2: ,paste - 将剪贴板内容保存到文件"
echo "执行: echo 'Hello from clipboard' | pbcopy && ,paste clipboard.txt"
echo "Hello from clipboard" | pbcopy
,paste clipboard.txt
if [[ -f clipboard.txt ]]; then
  echo "文件内容:"
  cat clipboard.txt
  rm clipboard.txt
  echo "✅ 剪贴板内容已保存到文件"
else
  echo "⚠️  文件创建失败"
fi
echo ""

# 演示 3: ,p 别名 - pnpm 快捷方式
echo "📦 演示 3: ,p 别名 - pnpm 快捷方式"
echo "执行: ,p --version"
if command -v pnpm &> /dev/null; then
  ,p --version
  echo "✅ pnpm 别名工作正常"
else
  echo "⚠️  pnpm 未安装，跳过此演示"
fi
echo ""

# 演示 4: ,smz - 重新加载 zshrc
echo "🔄 演示 4: ,smz - 重新加载 zshrc"
echo "执行: ,smz"
echo "（注意：这会在实际使用时重新加载你的 .zshrc）"
echo "✅ 函数已定义，可以使用 ,smz 重新加载配置"
echo ""

# 演示 5: 环境变量
echo "🌐 演示 5: 环境变量配置"
echo "http_proxy: $http_proxy"
echo "https_proxy: $https_proxy"
echo "PNPM_HOME: $PNPM_HOME"
echo "✅ 环境变量已配置"
echo ""

echo "=========================================="
echo "演示完成！"
echo "=========================================="
echo ""
echo "💡 使用提示："
echo "  - ,cdtmp    创建临时目录并进入"
echo "  - ,paste <file>  将剪贴板内容保存到文件"
echo "  - ,p <command>   使用 pnpm 命令"
echo "  - ,smz      重新加载 zshrc 配置"
echo ""
