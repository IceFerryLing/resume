# hitsz-cv-chinese

## 说明

这是一个哈工深中文简历 LaTeX 模板。仓库中的 `main.tex` 是可公开提交的模板文件，不包含个人信息；个人简历内容请放在本地文件 `main.local.tex` 中。

## 文件结构

- `main.tex`：公开模板文件，使用占位内容。
- `main.local.tex`：本地个人简历文件，已加入 `.gitignore`，不会提交到仓库。
- `settings.tex`：版式、字体、颜色和宏定义配置。
- `images/`：页眉、页脚、校徽、照片等图片资源。
- `buildpdf.ps1`：PowerShell 编译脚本。

## 使用说明

1. 克隆本仓库：

   ```bash
   git clone <your-repo-url>
   ```

   没有 Git 的同学可以直接下载 zip 文件，解压后使用。

2. 安装依赖：

   需要使用 XeLaTeX 编译。Windows/Linux 用户可以安装 TeX Live 或 MiKTeX，macOS 用户可以安装 MacTeX。

3. 创建本地个人版本：

   ```powershell
   Copy-Item main.tex main.local.tex
   ```

   然后在 `main.local.tex` 中填写个人信息、教育背景、项目经历、竞赛经历、技能和荣誉。若需要个人照片，可以替换或引用 `images/avatar.png`。

4. 编译简历：

   编译脚本会编译 `main.tex` 生成 `main.pdf`，并在编译成功后自动删除辅助文件。

   ```powershell
   .\buildpdf.ps1
   ```

   指定编译次数：

   ```powershell
   .\buildpdf.ps1 -Runs 2
   ```

5. 查看结果：

   - 生成的 PDF 文件为 `main.pdf`。

## 隐私说明

请不要把真实姓名、手机号、邮箱、照片、成绩排名等个人信息写入 `main.tex`。需要保存个人内容时，只修改 `main.local.tex`。

## 致谢

本模板基于[西北工业大学中文 CV 模板](https://www.overleaf.com/latex/templates/npu-cv/mncqzxhvfzrx)和[北京邮电大学 BUPT 简历模板](https://github.com/Yokumii/BUPT-CV-Template)进行调整，感谢两个模板的作者。
