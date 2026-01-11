#!/bin/zsh
# Kinasha Zsh Plugin 安装脚本

set -e

# 颜色定义
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 检查是否使用 -y 参数（自动确认）
AUTO_YES=false
if [[ "$1" == "-y" ]] || [[ "$1" == "--yes" ]]; then
  AUTO_YES=true
fi

echo "=========================================="
echo "Kinasha Zsh Plugin 安装程序"
echo "=========================================="
echo ""

# 检测 Oh My Zsh
if [[ -z "$ZSH" ]]; then
  echo "${YELLOW}⚠️  未检测到 Oh My Zsh${NC}"
  echo ""
  echo "检测到您没有使用 Oh My Zsh，将使用手动安装方式..."
  INSTALL_METHOD="manual"
else
  echo "${GREEN}✅ 检测到 Oh My Zsh: $ZSH${NC}"
  INSTALL_METHOD="ohmyzsh"
fi

# 获取当前脚本所在目录
PLUGIN_SOURCE_DIR="$(cd "$(dirname "${(%):-%x}")" && pwd)"

if [[ "$INSTALL_METHOD" == "ohmyzsh" ]]; then
  # Oh My Zsh 安装方式
  ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"
  PLUGIN_DIR="$ZSH_CUSTOM/plugins/kinasha"
  
  echo ""
  echo "安装路径: $PLUGIN_DIR"
  echo ""
  
  # 创建插件目录
  mkdir -p "$ZSH_CUSTOM/plugins"
  
  # 如果目录已存在，询问是否覆盖
  if [[ -d "$PLUGIN_DIR" ]]; then
    echo "${YELLOW}⚠️  插件目录已存在: $PLUGIN_DIR${NC}"
    
    if [[ "$AUTO_YES" == true ]]; then
      echo "自动覆盖模式，正在删除旧版本..."
      rm -rf "$PLUGIN_DIR"
    else
      read "REPLY?是否覆盖？(y/N): "
      echo
      if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "安装已取消"
        exit 0
      fi
      rm -rf "$PLUGIN_DIR"
    fi
  fi
  
  # 复制插件文件
  echo "正在复制插件文件..."
  cp -r "$PLUGIN_SOURCE_DIR" "$PLUGIN_DIR"
  
  echo ""
  echo "${GREEN}✅ 插件已安装到: $PLUGIN_DIR${NC}"
  echo ""
  echo "下一步："
  echo "1. 编辑 ~/.zshrc 文件"
  echo "2. 在 plugins=() 中添加 'kinasha'"
  echo "   例如: plugins=(git kinasha)"
  echo "3. 运行: source ~/.zshrc"
  echo ""
  echo "或者运行以下命令自动添加："
  echo "${YELLOW}sed -i '' 's/plugins=(git)/plugins=(git kinasha)/' ~/.zshrc${NC}"
  
else
  # 手动安装方式
  echo ""
  echo "手动安装方式："
  echo "在 ~/.zshrc 文件末尾添加以下行："
  echo ""
  echo "${GREEN}source $PLUGIN_SOURCE_DIR/kinasha.plugin.zsh${NC}"
  echo ""
  echo "然后运行: source ~/.zshrc"
fi

echo ""
echo "=========================================="
echo "安装完成！"
echo "=========================================="
