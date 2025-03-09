# 设置 XeLaTeX 作为 PDF 生成引擎，synctex 启用文件定位功能，nonstopmode 遇到错误继续编译
$pdflatex = 'xelatex -synctex=1 -interaction=nonstopmode %O %S';
$latex = 'xelatex -synctex=1 -interaction=nonstopmode %O %S';

# 设置输出模式为 PDF（1=PDF，0=DVI）
$pdf_mode = 1;

# 创建从 .aux 文件到 .bbl 文件的自定义依赖关系
# 参数含义：源文件扩展名，目标文件扩展名，必须总是执行标志，处理函数名
add_cus_dep('aux', 'bbl', 0, 'mybibtex');

# 为特定章节文件处理参考文献的自定义函数
sub mybibtex {
    my $base = shift;  # 获取文件基本名（不含扩展名）
    # 仅处理文献综述和开题报告章节的参考文献
    if ($base eq 'contents/survey' || $base eq 'contents/report') {
        system("bibtex $base");
    }
}

# 设置默认编译的主文件
@default_files = ('main.tex');

# 设置清理时需要删除的临时文件类型
# %R 表示与主文件同名但不同扩展名的文件
$clean_ext .= '%R.aux %R.dvi %R.log %R.out %R.bbl %R.blg';

# 强制运行 BibTeX，即使文档中没有引用
# 值为 2 表示总是运行，1 表示只在有引用时运行，0 表示不运行
$bibtex_use = 2;

# 设置最大编译循环次数，确保交叉引用和目录都能正确生成
$max_repeat = 3;