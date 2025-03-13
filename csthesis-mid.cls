\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csthesis-mid}[2025/03/08 v1.0 CS Undergraduate Thesis Literature Review and Research Proposal Class]

\LoadClass[UTF8,a4paper,twoside]{article}

\RequirePackage[UTF8]{ctex}  % 加载ctex包，支持中文
\RequirePackage{pdfpages}
\RequirePackage{tocvsec2}

% 设置参考文献
% 引入natbib包，参考文献格式相关
\RequirePackage[sectionbib]{natbib}
\RequirePackage{chapterbib}
% 引入chapterbib包，可以分章节显示参考文献，且参考文献编号各自独立
% 参考文献格式
\RequirePackage{gbt7714}
% 封面信息
\newcommand{\stuname}{在主文件设置姓名} % 学生姓名
\newcommand{\stuid}{在主文件设置学号} % 学生学号
\newcommand{\teaname}{在主文件设置教师} % 指导教师
\newcommand{\stugrade}{在主文件设置年级} % 学生年级
\newcommand{\stumajor}{在主文件设置专业} % 学生专业
\newcommand{\stuclass}{在主文件设置班级} % 学生班级
\newcommand{\stucollege}{在主文件设置学院} % 学生所在学院
\newcommand{\stutitle}{在主文件设置毕设题目} % 毕设题目
\newcommand{\stuengtitlelineone}{Set the First Line of Your English Title in main.tex} % 毕设英文题目
\newcommand{\stuengtitlelinetwo}{Set the Second Line of Your English Title in main.tex}

% === 页面设置 ===
% 纸张大小：A4
% 页面边距：左 2.5cm；右 2cm；上 2.5cm；下 2cm；装订线 0cm
\RequirePackage{geometry}	
\geometry{inner=2.5cm, outer=2cm, top=2.5cm, bottom=2cm, bindingoffset=0cm}
\RequirePackage{subfigure}  % 导入subfigure宏包
% 设置首行缩进2字符
% 使用 \noindent 命令可以取消缩进
\RequirePackage{indentfirst}
\setlength{\parindent}{2em}

% === 绝对定位 ===
\RequirePackage[absolute]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}

% === pdf 背景 ===
\RequirePackage{pdfpages}

% 字体设置
\RequirePackage{fontspec}
\RequirePackage{amsfonts}
\RequirePackage{amsmath,amssymb,bm}
\RequirePackage{upgreek}
\RequirePackage{pifont}
\setmainfont[Path=fonts/, BoldFont=timesbd.ttf]{times.ttf}					% 缺省英文字体为Times New Roman
\setCJKmainfont[Path=fonts/, BoldFont=SimFangBold.ttf]{SimFang.ttf}			% 缺省中文字体为 仿宋
\setCJKfamilyfont{fs}[Path=fonts/, BoldFont=SimFangBold.ttf]{SimFang.ttf}
\newcommand{\zhengwen}{\CJKfamily{fs}\zihao{-4}}	% 正文字体 仿宋小4号
\setCJKfamilyfont{Heiti}[Path=fonts/, BoldFont=SimHeiBold.ttf]{SimHei.ttf}
\newcommand{\cover}{\CJKfamily{fs}\zihao{3}}
\setCJKfamilyfont{Songti}[Path=fonts/, BoldFont=SimSunBold.ttf]{SimSun.ttc}
\setCJKfamilyfont{Lishu}[Path=fonts/, BoldFont=lishu.ttf]{lishu.ttf}
\newcommand{\header}{\CJKfamily{Songti}\zihao{-5}}
\newcommand{\imageortable}{\CJKfamily{Songti}\zihao{5}}

% 行距设置
\RequirePackage{setspace}
\linespread{1.625}\selectfont		% 1.5倍字号，这与word中的1.5倍行距有一点差别

% 多级标题设置
\RequirePackage{titlesec}
\setcounter{secnumdepth}{4}		% 设置标题层次共4层
% 一级标题：三号仿宋加粗，居中
\titleformat{\section}[block]
{\CJKfamily{fs}\zihao{3}\bfseries\centering}
{\chinese{section}、}{0pt}{}
% 二级标题：小三号仿宋加粗
\titleformat{\subsection}[block]
{\CJKfamily{fs}\zihao{-3}\bfseries}
{\arabic{subsection}.}{0.5em}{}
% 三级标题：四号仿宋加粗
\titleformat{\subsubsection}[block]
{\CJKfamily{fs}\zihao{4}\bfseries}
{\arabic{subsection}.\arabic{subsubsection}}{0.5em}{}
% 四级标题：四号仿宋加粗
\titleformat{\paragraph}[block]
{\CJKfamily{fs}\zihao{4}\bfseries}
{\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}{0.5em}{}
% 设置段间距
\titlespacing{\section}{0pt}{12pt}{6pt}				% 标题1 段前12磅 段后6磅
\titlespacing{\subsection}{0pt}{13pt}{13pt}			% 标题2 段前13磅 段后13磅
\titlespacing{\subsubsection}{0pt}{13pt}{13pt}		% 标题3 段前13磅 段后13磅
\titlespacing{\paragraph}{0pt}{13pt}{13pt}			% 标题4 段前13磅 段后13磅

% 定义一个新的引用命令，自动将引用放到文本的上方
\newcommand{\upcite}[1]{\textsuperscript{\citep{#1}}}

% 插入图片宏包
% 多个浮动体连续排布用参数H进行固定，如下所示，不用H会出现难以预料的排布
% \begin{figure}[H]
% content...
% \end{figure}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{caption}
\RequirePackage{float}
\captionsetup{labelsep=quad,labelfont=bf,font=singlespacing}
% \renewcommand{\thefigure}{\arabic{subsection}.\arabic{figure}}
% \renewcommand{\theequation}{\arabic{subsection}.\arabic{equation}}  % 公式的编号格式
% 插入表格宏包
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{array}
\renewcommand{\thetable}{\arabic{subsection}.\arabic{table}}
\RequirePackage{enumerate}

\RequirePackage{caption}

% 设置图表标题字体

\renewcommand{\figurename}{\imageortable\bfseries 图}
\renewcommand{\tablename}{\imageortable\bfseries 表}

% 设置目录
\RequirePackage{titletoc}
\setcounter{tocdepth}{3}
\renewcommand{\thesection}{\CJKfamily{Heiti}\chinese{section}、}
\renewcommand{\thesubsection}{\arabic{subsection}.}
\renewcommand{\thesubsubsection}{\arabic{subsection}.\arabic{subsubsection}}
\renewcommand{\theparagraph}{\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}
\titlecontents{section}[2em]{\CJKfamily{Heiti}\zihao{-4}}{\contentslabel{2em}}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{subsection}[2.5em]{\zihao{-4}}{\contentslabel{1em}}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{subsubsection}[4.5em]{\zihao{-4}}{\contentslabel{1.83em}}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{paragraph}[5.5em]{\zihao{-4}}{\contentslabel{2.67em}}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
% 超链接
% colorlinks=true 超链接以颜色表示 false 超链接以方框框出
% linkcolor 指定颜色
% urlcolor 指定url链接的颜色
% CJKbookmarks 让链接支持中文
\RequirePackage[colorlinks=true,linkcolor=black,citecolor=black,urlcolor=black,CJKbookmarks=true]{hyperref}
\newcommand{\myeqref}[1]{式 (\ref{#1})}
\newcommand{\mytaref}[1]{表 \ref{#1}}
\newcommand{\myfiref}[1]{图 \ref{#1}}
% 修改 algorithm 环境的标题为“算法”
% 直接重新定义 algorithm 的标题为中文
% 设置页眉页脚
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancypagestyle{Index}{
	\setcounter{page}{1}\pagenumbering{Roman}
	\fancyhead[LO]{}
	\fancyhead[RO]{\header \stutitle}
	\fancyhead[LE]{\header 浙江大学本科生毕业论文（设计）}
	\fancyhead[RE]{}
	\fancyfoot[C]{} % 页脚不需要页码
}
\fancypagestyle{Content}{
	\setcounter{page}{1}\pagenumbering{arabic}
	\fancyhead[LO]{}
	\fancyhead[RO]{\header \stutitle}
	\fancyhead[LE]{\header 浙江大学本科生毕业论文（设计）}
	\fancyhead[RE]{}
	\fancyfoot[C]{\zihao{-5} \thepage}
}

% 插入公式
\RequirePackage{amsmath}
\RequirePackage{indentfirst}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}

\numberwithin{equation}{subsection} % 将公式编号与章节关联
\numberwithin{figure}{subsection} % 图的编号与章节关联
\numberwithin{table}{subsection}  % 表的编号与章节关联
\renewcommand{\contentsname}{\vspace{-\baselineskip}} % 这条命令可以控制引入编译的各子文件是否参与编译	

% 阻止页面底部自动对齐
\raggedbottom

% 定义封装的环境
\newenvironment{requirementtext}
{%
  \begin{textblock}{155}(34.5,58.5)
    \CJKfamily{fs}\zihao{4}\bfseries
    \linespread{1.8}\selectfont
}%
{%
  \end{textblock}
}