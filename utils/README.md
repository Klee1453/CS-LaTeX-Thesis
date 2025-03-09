# cut.py

从 pdf 中提取指定页，输出到新的 pdf 文件。

使用方法：

- 提取第一页：`python cut.py input.pdf output.pdf`
- 提取最后一页：`python cut.py --last input.pdf output.pdf`
- 提取指定页码：`python cut.py --page=3 input.pdf output.pdf`

输出路径 `output.pdf` 可以省略，默认为 `input_page_x.pdf`。