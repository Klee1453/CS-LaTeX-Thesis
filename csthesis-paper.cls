\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csthesis-paper}[2025/05/04 v1.0 ZJUCS Undergraduate Thesis Class]

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
\newcommand{\submitdate}{在主文件设置提交日期} % 提交日期

% === 页面设置 ===
% 纸张大小：A4
% 页面边距：左 2.5cm；右 2cm；上 2.5cm；下 2cm；装订线 0cm
\RequirePackage{geometry}	
\geometry{inner=2.5cm, outer=2cm, top=2.5cm, bottom=2cm, bindingoffset=0cm}
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
% 一级标题：三号仿宋加粗
\titleformat{\section}[block]
{\CJKfamily{fs}\zihao{3}\bfseries}
{\arabic{section}.}{0.5em}{}
% 二级标题：小三号仿宋加粗
\titleformat{\subsection}[block]
{\CJKfamily{fs}\zihao{-3}\bfseries}
{\arabic{section}.\arabic{subsection}.}{0.5em}{}
% 三级标题：四号仿宋加粗
\titleformat{\subsubsection}[block]
{\CJKfamily{fs}\zihao{4}\bfseries}
{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{0.5em}{}
% 四级标题：四号仿宋加粗
\titleformat{\paragraph}[block]
{\CJKfamily{fs}\zihao{4}\bfseries}
{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}{0.5em}{}
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
\RequirePackage{subcaption}
\RequirePackage{caption}
\RequirePackage{float}
% \captionsetup{labelsep=quad,labelfont=bf,font=singlespacing}
% \renewcommand{\thefigure}{\arabic{subsection}.\arabic{figure}}
% \renewcommand{\theequation}{\arabic{subsection}.\arabic{equation}}  % 公式的编号格式
% 插入表格宏包
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{array}
\renewcommand{\thetable}{\arabic{subsection}.\arabic{table}}
\RequirePackage{enumerate}

% 插入公式
\RequirePackage{amsmath}
\RequirePackage{indentfirst}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{caption}

% 设置图、表标题格式
\DeclareCaptionFont{zjucap}{\CJKfamily{Songti}\zihao{5}\bfseries}
\captionsetup{
  font={zjucap,singlespacing},  % 宋体五号加粗单倍行距
  labelsep=quad,      			% 标签与文字之间使用空格
  labelfont=bf,       			% 标签文字加粗
  textfont=bf,        			% 说明文字加粗
}
% 设置算法标题格式
\captionsetup[algorithm]{
  font={zjucap,singlespacing},  % 宋体五号加粗单倍行距
  labelsep=quad,                 % 标签与文字之间使用空格
  labelfont=bf,                  % 标签文字加粗
  textfont=bf,                   % 说明文字加粗
}

% 设置图、表、算法标题字体
\renewcommand{\figurename}{\imageortable\bfseries 图}
\renewcommand{\tablename}{\imageortable\bfseries 表}
\renewcommand{\ALG@name}{\imageortable\bfseries 算法}

% 设置表格中文字采用五号宋体，行距为单倍行间距
\RequirePackage{etoolbox}
\AtBeginEnvironment{tabular}{\ifcover\else\CJKfamily{Songti}\zihao{5}\renewcommand{\arraystretch}{1.66}\fi}
\AtBeginEnvironment{tabularx}{\ifcover\else\CJKfamily{Songti}\zihao{5}\renewcommand{\arraystretch}{1.66}\fi}
\AtBeginEnvironment{longtable}{\ifcover\else\CJKfamily{Songti}\zihao{5}\renewcommand{\arraystretch}{1.66}\fi}

% 封面使用的表格为特例（正常情况下，你不应该主动修改 cover.tex），使用一个布尔开关来控制
\newif\ifcover
\coverfalse
% 定义封面环境
\newenvironment{coverpage}{%
  \covertrue  % 进入封面环境
  % 其他封面设置...
  \pagestyle{empty}
}{%
  \coverfalse  % 离开封面环境
  % 其他封面结束设置...
  \null\cleardoublepage
}

% 设置图表公式算法与下文空一行
% \AtEndEnvironment{figure}{\vspace{\baselineskip}}
% \AtEndEnvironment{table}{\vspace{\baselineskip}}
% \AtEndEnvironment{equation}{\vspace{\baselineskip}}
% \AtEndEnvironment{algorithm}{\vspace{\baselineskip}}

% 设置目录
\RequirePackage{titletoc}
\setcounter{tocdepth}{3}
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
\renewcommand{\theparagraph}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}
\titlecontents{section}[1.17em]{\CJKfamily{Heiti}\zihao{-4}}{\contentslabel{1.17em}}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{subsection}[3.5em]{\zihao{-4}}{\contentslabel{2em}}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{subsubsection}[5.5em]{\zihao{-4}}{\contentslabel{2.83em}}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{paragraph}[6.5em]{\zihao{-4}}{\contentslabel{3.67em}}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage}

% 用于无编号的特殊条目的目录样式
% 这个样式与 section 类似，但没有编号空间，且起始位置与 section 的编号对齐
\titlecontents{noindentsection}[0em]			% 缩进 0em
  {\CJKfamily{Heiti}\zihao{-4}}      			% 与 section 相同的格式
  {}                                 			% 没有编号
  {}                                 			% 没有编号
  {\titlerule*[0.5pc]{$\cdot$}\contentspage} 	% 与 section 相同的页码格式

\newcommand{\addNoindentTocEntry}[1]{%
  \phantomsection % 创建超链接锚点
  \addcontentsline{toc}{noindentsection}{#1} % 使用自定义的 specialsection 类型
}

% 超链接
% colorlinks=true 超链接以颜色表示 false 超链接以方框框出
% linkcolor 指定颜色
% urlcolor 指定url链接的颜色
% CJKbookmarks 让链接支持中文
\RequirePackage[colorlinks=true,linkcolor=black,citecolor=black,urlcolor=black,CJKbookmarks=true]{hyperref}
\newcommand{\myeqref}[1]{式 (\ref{#1})}
\newcommand{\mytabref}[1]{表 \ref{#1}}
\newcommand{\myfigref}[1]{图 \ref{#1}}
\newcommand{\myalgref}[1]{算法 \ref{#1}}
% 设置页眉页脚
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancypagestyle{Index}{
	\setcounter{page}{1}\pagenumbering{Roman}
	\fancyhead[LO]{}
	\fancyhead[RO]{\header \stutitle}
	\fancyhead[LE]{\header 浙江大学本科生毕业论文（设计）}
	\fancyhead[RE]{}
	\fancyfoot[C]{\zihao{-5} \thepage}
}
\fancypagestyle{Content}{
	\setcounter{page}{1}\pagenumbering{arabic}
	\fancyhead[LO]{}
	\fancyhead[RO]{\header \stutitle}
	\fancyhead[LE]{\header 浙江大学本科生毕业论文（设计）}
	\fancyhead[RE]{}
	\fancyfoot[C]{\zihao{-5} \thepage}
}

\numberwithin{equation}{section} % 将公式编号与章节关联
\numberwithin{figure}{section} % 图的编号与章节关联
\numberwithin{table}{section}  % 表的编号与章节关联
\numberwithin{algorithm}{section} % 算法的编号与章节关联
\renewcommand{\contentsname}{\vspace{-\baselineskip}} % 这条命令可以控制引入编译的各子文件是否参与编译	

% 阻止页面底部自动对齐
\raggedbottom

% 定义封装的任务书要求环境
\newenvironment{requirementtext}
{%
  \begin{textblock}{155}(34.5,58.5)
    \CJKfamily{fs}\zihao{4}\bfseries
    \linespread{1.8}\selectfont
}%
{%
  \end{textblock}
}

% 定义用于控制论文密级的布尔开关
% 这个开关可以在主文件中设置
\newif\ifSecretPaper \SecretPaperfalse
\newcommand{\SetSecretPaperTrue}{\SecretPapertrue}
\newcommand{\SetSecretPaperFalse}{\SecretPaperfalse}
