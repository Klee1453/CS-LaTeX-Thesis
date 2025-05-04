# `cut.py`

这是一个 Python 脚本，用于从 PDF 文件中提取指定范围的页面，并将提取的页面保存到一个新的 PDF 文件中。

## 功能

*   从输入的 PDF 文件中提取一个连续的页面范围。
*   将提取的页面保存到一个新的 PDF 文件中，新文件名在原文件名后附加 `_cut`。
*   通过命令行参数接收输入文件路径、起始页码和结束页码。
*   包含基本的错误处理，例如文件不存在、无效页码等。

## 依赖

*   Python 3
*   PyPDF2

你可以使用 pip 安装 PyPDF2：

```bash
pip install PyPDF2
```

## 用法

在终端中运行脚本，并提供必要的参数：

```bash
python pdf_cutter.py <input_pdf_path> <start_page> <end_page>
```

**参数说明:**

*   `<input_pdf_path>`: 要处理的输入 PDF 文件的路径。
*   `<start_page>`: 要提取的起始页码（从 1 开始计数，包含此页）。
*   `<end_page>`: 要提取的结束页码（包含此页）。

## 示例

假设你有一个名为 `document.pdf` 的文件，你想提取第 2 页到第 5 页：

```bash
python pdf_cutter.py document.pdf 2 5
```

脚本将创建一个名为 `document_cut.pdf` 的新文件，其中包含原文件 `document.pdf` 的第 [2,5] 页。