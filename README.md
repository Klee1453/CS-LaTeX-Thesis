# CS-LaTeX-Thesis

浙江大学计算机学院毕业论文 LaTeX 模板。

另可参见：[浙江大学计算机学院毕业论文文献综述和开题报告 LaTeX 模板](https://github.com/Klee1453/CS-LaTeX-MidTerm)。

使用本仓库编译出的文档样例可见 `main.pdf`。这是在[【生成用于装订的完整论文】](#生成用于装订的完整论文)预设下编译出的样例。

主题内容参考[信电学院本科生毕业论文（设计）中期检查报告LaTeX模板](https://github.com/SuperbRa1n/ISEE_LaTeX_Mid-term)，本仓库针对格式要求进行了一些改动，并作了一些简单的封装。

## 使用方法

1. 在 `main.tex` 中填写论文题目、作者等文档信息，并根据需要设置论文的密级。
2. 在 `contents/acknowledge.tex` 中填写致谢部分。
3. 在 `contents/abstract-cn.tex` 中填写论文的中文摘要及关键词。
4. 在 `contents/abstract-en.tex` 中填写论文的英文摘要及关键词。
5. 在 `contents/thesis.tex` 中填写论文的正文内容。
    - 在 `reference/thesis-refs.bib` 中填写论文的参考文献。
6. 如果需要，在 `contents/appendix.tex` 中填写附录内容。
    - 如果你不希望包含附录，你需要在 `main.tex` 中注释掉 `\input{contents/appendix}` 这一行。
7. 在 `contents/cv.tex` 中填写作者的个人履历（作者简历）。
8. 在 `contents/requirement.tex` 中填写指导教师对毕业论文（设计）的进度安排及任务要求，即本科生毕业论文（设计）任务书。
9.  参考[下一节内容](#编译文档)编译文档。

此外，在不同使用场景下，你可能需要对 `main.tex` 中的一些行进行注释或取消注释。

一共有三行需要视情况被注释或取消注释，分别是：

- 任务书 `\input{contents/requirement}`：本科生毕业论文（设计）任务书。
- 考核表 `\input{contents/assessment}`：本科生毕业论文（设计）考核表。
- 第二部分 `\input{contents/part2}`：装订论文时需要的第二部分内容，即文献综述和开题报告。

以下是具体说明：

### 生成上传到 `csugrs` 系统上的论文

在 `main.tex` 中，上面提到的三行都需要处于被注释的状态，即：

```latex
% \input{contents/requirement}
% \input{contents/assessment}
% \input{contents/part2}
```

### 生成答辩用的论文（默认）

在 `main.tex` 中，第二部分需要处于被注释的状态，即：

```latex
\input{contents/requirement}
\input{contents/assessment}
% \input{contents/part2}
```

### 生成用于装订的完整论文

在 `main.tex` 中，上面提到的三行都需要处于取消注释的状态，即：

```latex
\input{contents/requirement}
\input{contents/assessment}
\input{contents/part2}
```

此外，你需要将编译好的文献综述和开题报告 PDF 文件放在 `mid` 目录下，并保持文件名为 `main.pdf`。

然后，修改 `contents/part2.tex` 中的目录项，根据实际情况修改目录项中的页码。

理论上，本模板不要求一定与我的[浙江大学计算机学院毕业论文文献综述和开题报告 LaTeX 模板](https://github.com/Klee1453/CS-LaTeX-MidTerm)搭配使用。~~但是这种处理目录的方式非常不优雅，并且第二部分的所有目录项都不支持超链接。~~

## 编译文档

### 使用 VSCode 插件 LaTeX Workshop

本仓库配置了 LaTeX Workshop 插件的工作区配置，提供三个编译配方：

- `XeLaTeX`：使用 XeLaTeX 编译文档一次，这是默认的编译配方，在保存文档时自动触发。
- `xe-bib-xe-xe`：按照 XeLaTeX -> BibTeX -> XeLaTeX -> XeLaTeX 的顺序编译文档。这会完整生成参考文献和目录，适合最终生成 PDF。
- `Clean`：清理所有中间产物（仅限 Windows 系统）。

如果 `thesis.tex` 中没有引用任何参考文献，需要在文档中手动添加 `\nocite{*}` 以免参考文献为空导致 BibTeX 编译失败。这种情况下，也可以选择下面的[手动编译](#手动编译)方法。

如果想要修改保存文档时自动触发的编译行为，可以修改 `.vscode/settings.json` 文件中的 `latex-workshop.latex.recipe.default` 配置项。

### 手动编译

使用 xe-bib-xe-xe 的编译链编译文档：

```bash
xelatex main.tex
bibtex ./contents/thesis
xelatex main.tex
xelatex main.tex
```

如果在 `thesis.tex` 中没有引用参考文献，需要省略对应的 `bibtex` 命令。

### 使用 LaTexMK

编译文档：

```bash
latexmk
```

清理中间产物：

```bash
latexmk -c
```

清理中间产物和生成的 PDF：

```bash
latexmk -C
```

## 注意事项

本模板没有统一设置【图、表与下文空一行】的格式，这是因为这样会使得当多张图和表被放置在一起时，它们之间会出现过大的空隙，从而影响排版效果。
如果有些图、表、公式和算法和上下文之间的间距过小，你可以手动地在它们之前和之后添加 `\vspace{\baselineskip}` 来调整它们与上下文的间距。
如果你需要统一设置【图、表与下文空一行】的格式，则需要在 `csthesis-paper.cls` 中搜索【设置图表公式算法与上下文空一行】注释，然后取消注释它后面的代码片段。
如果这样做了，你可以手动地在连续的图、表、公式和算法之间添加 `\vspace{-2\baselineskip}` 来调整它们之间的间距。

