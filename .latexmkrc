# 设置 XeLaTeX 作为 PDF 生成引擎，synctex 启用文件定位功能，nonstopmode 遇到错误继续编译
$pdflatex = 'xelatex -synctex=1 -interaction=nonstopmode %O %S';
$latex = 'xelatex -synctex=1 -interaction=nonstopmode %O %S';

# 设置输出模式为 PDF（1=PDF，0=DVI）
$pdf_mode = 1;

# 设置默认编译的主文件
@default_files = ('main.tex');

# 设置清理时需要删除的临时文件类型
# %R 表示与主文件同名但不同扩展名的文件
$clean_ext .= '%R.aux %R.dvi %R.log %R.out %R.bbl %R.blg';
push @extra_clean_files, 'contents/*.aux', 'contents/*.bbl', 'contents/*.blg';

# 强制运行 BibTeX，即使文档中没有引用
# 值为 2 表示总是运行，1 表示只在有引用时运行，0 表示不运行
$bibtex_use = 2;

# 设置最大编译循环次数，确保交叉引用和目录都能正确生成
$max_repeat = 3;