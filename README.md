# KazeTeX — 刷题本 LaTeX 模板

基于 XeLaTeX + ctex 的刷题本模板。通过 `documentclass` 选项在 **A4 竖版**和**Pad 横版**之间切换。

## 快速开始

### A4 竖版（默认）

```latex
\documentclass{kazetex}

\title{高等数学习题集}
\author{风待桐叶}
\date{2026年5月}

\begin{document}
\maketitle
\tableofcontents
\newpage

\section{极限与连续}
\subsection{极限的计算}
\begin{problem}
  求极限 $\displaystyle\lim_{x\to 0}\frac{\sin x}{x}$。
\end{problem}
\end{document}
```

### Pad 横版（一页一题）

```latex
\documentclass[pad]{kazetex}

\title{高等数学习题集}
\author{风待桐叶}
\date{2026年5月}

\begin{document}
\maketitle

\section{极限与连续}
\subsection{极限的计算}
\begin{problem}
  求极限 $\displaystyle\lim_{x\to 0}\frac{\sin x}{x}$。
\end{problem}
\end{document}
```

编译：
```bash
xelatex demo-a4.tex
xelatex demo-a4.tex    # 两次生成目录
```

或使用 Makefile：
```bash
make a4    # 编译 A4 竖版
make pad   # 编译 Pad 横版
make all   # 全部编译
```

## 文档结构

| 命令 | 说明 |
|------|------|
| `\documentclass{kazetex}` | 默认 A4 竖版 |
| `\documentclass[pad]{kazetex}` | Pad 横版，一页一题 |
| `\section{名称}` | 单元标题（navy 色，带下划线） |
| `\subsection{名称}` | 子单元标题（浅 navy 色） |
| `\begin{problem} ... \end{problem}` | 题目，自动编号（如 题 2.3） |
| `\title{书名}` | 书名（封面主元素） |
| `\author{作者}` | 作者 |
| `\date{日期}` | 日期 |

## 封面设计

左右分区布局：左侧 navy 色带 + `\KazeTeX` 品牌标识，右侧书名为主元素，下方作者与日期。A4 和 Pad 两种模式统一采用此布局。

## 答案功能

本模板默认不包含答案功能。如需添加答案，推荐以下方案：

### 方案一：使用 answers 宏包

```latex
\usepackage{answers}
\Newassociation{sol}{Solution}{ans}
\newcommand{\answer}[1]{\begin{sol}#1\end{sol}}

\begin{document}
\Opensolutionfile{ans}

\section{极限}
\begin{problem}
  求 $\displaystyle\lim_{x\to 0}\frac{\sin x}{x}$。
\end{problem}
\answer{极限值为 1。}

\Closesolutionfile{ans}
\newpage
\section*{参考答案}
\input{ans}
\end{document}
```

### 方案二：手动分离文件

将题目和答案写在同一个 `.tex` 文件中，通过 `\ifdefined\printanswers` 控制是否输出答案。

### 方案三：使用 exam 文档类特性

切换 `documentclass` 并参考 `exam` 文档类的 `\printanswers` 机制。

## 文件说明

| 文件 | 用途 |
|------|------|
| `kazetex.cls` | 核心类文件（选项解析、载入包） |
| `kazetex-pagestyle.sty` | 页面布局、页眉页脚、封面、配色 |
| `kazetex-env.sty` | 题目环境、章节命令 |
| `demo-a4.tex` | A4 竖版示例 |
| `demo-pad.tex` | Pad 横版示例 |
| `Makefile` | 编译脚本 |

## 依赖

- XeLaTeX (TeX Live 2024+)
- ctex 宏包
- fancyhdr, titlesec, geometry, xcolor, amsmath, hyperref, tikz
