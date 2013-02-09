%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%             该宏包用于提供南京大学本科毕业设计模板
%                   基于 scart 宏包改进
%              基于 ctex 宏包 和 xelatex 编译器
%                 设计量量满足跨平台之需要
%         暂时只能提供少量自定义的符合本科毕设要求的排版效果
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NJUbachelor}[2013/02/09 V1.2 NJUbachelor Style for NJUers Created by Zlcao]

\newif\ifNJU@thesis
\DeclareOption{thesis}{\NJU@thesistrue}
\DeclareOption{design}{\NJU@thesisfalse}

\newif\ifNJU@oneside
\DeclareOption{oneside}{\NJU@onesidetrue}
\DeclareOption{twoside}{\NJU@onesidefalse}

\newif\ifNJU@pageheader
\DeclareOption{pageheader}{\NJU@pageheadertrue}
\DeclareOption{nopageheader}{\NJU@pageheaderfalse}

\newif\ifNJU@chapter
\DeclareOption{chapter}{\NJU@chaptertrue}
\DeclareOption{nochapter}{\NJU@chapterfalse}

\newif\ifNJU@longtitle
\DeclareOption{longtitle}{\NJU@longtitletrue}
\DeclareOption{shorttitle}{\NJU@longtitlefalse}

\newif\ifNJU@shortdepspe
\DeclareOption{shortdepspe}{\NJU@shortdepspetrue}
\DeclareOption{longdepspe}{\NJU@shortdepspefalse}

\newif\ifNJU@defaultmath\NJU@defaultmathfalse
\newif\ifNJU@mathptmx\NJU@mathptmxfalse
\newif\ifNJU@txfonts\NJU@txfontsfalse
\DeclareOption{defaultmath}{\NJU@defaultmathtrue}
\DeclareOption{mathptmx}{\NJU@mathptmxtrue}
\DeclareOption{txfonts}{\NJU@txfontstrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}

\ExecuteOptions{thesis,oneside,nopageheader,nochapter,longtitle,shortdepspe,defaultmath}
\ProcessOptions\relax

% 载入 ctex 文类
\ifNJU@chapter
  \ifNJU@oneside
    \LoadClass[oneside,UTF8,winfonts,a4paper,cs4size,fntef,fancyhdr]{ctexbook}
  \else
    \LoadClass[twoside,UTF8,winfonts,a4paper,cs4size,fntef,fancyhdr]{ctexbook}
  \fi
\else
  \LoadClass[UTF8,winfonts,a4paper,cs4size,fntef,fancyhdr]{ctexart}
\fi

\RequirePackage[left=3.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}   %页面设置

% 设置页眉页脚
\ifNJU@pageheader
  \pagestyle{fancy}
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \ifNJU@oneside
    \fancyhead[L]{\fangsong 南京大学本科毕业论文（设计）}
    \fancyhead[R]{\fangsong \leftmark}
  \else
    \fancyhead[EC]{\fangsong 南京大学本科毕业论文（设计）}
    \fancyhead[OC]{\fangsong \leftmark}
  \fi
\else \pagestyle{plain}
\fi

% pdf相关属性设置 设置行距
\AtBeginDocument{
\hypersetup{pdftitle={\NJU@ctitle/\NJU@etitle},
            pdfauthor={\NJU@cauthor/\NJU@eauthor},
            pdfsubject={南京大学本科毕业论文（设计）}, 
            pdfkeywords={\NJU@ckeywords/\NJU@ekeywords}}
\setlength{\baselineskip}{1.26\baselineskip}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                    载入相关宏包
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amsfonts,amssymb,bm} %数学相关宏包支持
\RequirePackage{stmaryrd} %数学字体宏包
\ifNJU@mathptmx       \RequirePackage{mathptmx}
\else\ifNJU@txfonts   \RequirePackage{txfonts}
\fi\fi
%\RequirePackage{mathspec}
%\RequirePackage{mathabx} %数学字体宏包

\RequirePackage{graphicx} %提供图形支持
\RequirePackage{picinpar} %图文混排
\RequirePackage{wrapfig} %图文混排 推荐使用
\RequirePackage{subfigure} %子图宏包

\RequirePackage{titletoc} %目录设置宏包
\RequirePackage[nottoc]{tocbibind} %加入目录条目 默认已加入参考文献 但不包含目录本身

\RequirePackage[table]{xcolor} %彩色支持

\RequirePackage{longtable} %长表格宏包
\RequirePackage{booktabs} %三线表格宏包
\RequirePackage{tabularx} %定宽度表格宏包
\RequirePackage{multirow} %跨行表格宏包

\RequirePackage{mhchem} %化学式宏包
\RequirePackage{chemfig} %化学式宏包

\RequirePackage[format=hang,font=small,justification=centering,labelfont=sf]{caption} %caption格式定制

%\RequirePackage[colorlinks,citecolor=blue,linkcolor=blue]{hyperref} %PDF标签支持
\RequirePackage[colorlinks,citecolor=black,linkcolor=black]{hyperref} %PDF标签支持
%\RequirePackage{ulem} %下划线宏包 由CJKfntef代替 在ctex的选项中调用
\RequirePackage{calc}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                    本宏包中用到的一些命令
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置列表环境
\newenvironment{Description}[1]{\begin{list}{}{%
  \renewcommand{\makelabel}[1]{##1}\settowidth\labelwidth{\makelabel{#1}}%
  \itemsep=0.5em\setlength{\leftmargin}{\labelwidth+\labelsep}}}{\end{list}}

% 清除双页
\let\NJU@cleardoublepage\cleardoublepage
\newcommand{\NJU@clearemptydoublepage}{%
  \clearpage{\pagestyle{empty}\NJU@cleardoublepage}}
\let\cleardoublepage\NJU@clearemptydoublepage

% 一种样式
\newcommand{\makesomething}[1]{%
  \begin{center}
    \zihao{3}\songti\bf #1
  \end{center}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                          字体设置
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ctex-xecjk-winfonts.def: Windows 的 xeCJK 字体设置，默认为六种中易字体
% vim:ft=tex

\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

\xeCJKsetup{AutoFakeSlant={true}}

\setCJKmainfont{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{FangSong}

\setCJKfamilyfont{zhsong}{SimSun}
\setCJKfamilyfont{zhhei}{SimHei}
\setCJKfamilyfont{zhkai}{KaiTi}
\setCJKfamilyfont{zhfs}{FangSong}
\setCJKfamilyfont{zhli}{LiSu}
\setCJKfamilyfont{zhyou}{YouYuan}
\setCJKfamilyfont{zhwei}{STXinwei}
\setCJKfamilyfont{zhxing}{STXingkai}
\setCJKfamilyfont{zhshu}{FZShuTi}
\setCJKfamilyfont{zhhu}{STHupo}
\setCJKfamilyfont{zhcai}{STCaiyun}

\providecommand*{\songti}{\CJKfamily{zhsong}} % 宋体
\providecommand*{\heiti}{\CJKfamily{zhhei}}   % 黑体
\providecommand*{\kaishu}{\CJKfamily{zhkai}}  % 楷书
\providecommand*{\fangsong}{\CJKfamily{zhfs}} % 仿宋
\providecommand*{\lishu}{\CJKfamily{zhli}}    % 隶书
\providecommand*{\youyuan}{\CJKfamily{zhyou}} % 幼圆
\providecommand*{\xinwei}{\CJKfamily{zhwei}}  % 新魏
\providecommand*{\xingkai}{\CJKfamily{zhxing}}% 行楷
\providecommand*{\shuti}{\CJKfamily{zhshu}}   % 舒体
\providecommand*{\hupo}{\CJKfamily{zhhu}}     % 琥珀
\providecommand*{\caiyun}{\CJKfamily{zhcai}}  % 彩云

%% 图表标题字体声明
%\DeclareCaptionFont{hei}{\heiti}
%\DeclareCaptionFont{fang}{\fangsong}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                    ctex中文格式
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\CTEXoptions[
%  contentsname={目录},listfigurename={插图},
%  listtablename={表格},figurename={图},
%  tablename={表},abstractname={},
%  indexname={索引},bibname={参考文献}]
\ifNJU@chapter
  \CTEXoptions[contentsname={目~~~录},indexname={索~~~引}]
\else
  \CTEXoptions[contentsname={\makesomething{目~~~录}},indexname={\makesomething{索~~~引}}]
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                     标题格式/目录标题格式
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\CTEXsetup[number=\arabic{chapter},titleformat={\zihao{3}\bf},%
           nameformat={\zihao{3}\bf},beforeskip={1.2em},afterskip={1.8em}]{chapter}
\CTEXsetup[format={\sf\zihao{4}}]{section}
\CTEXsetup[format={\sf\zihao{-4}}]{subsection}
\CTEXsetup[format={\sf\zihao{-4}}]{subsubsection}
\ifNJU@chapter
  \titlecontents{chapter}[4em]{\vspace{1.6em}\sf\zihao{4}}%
    {\contentslabel{4em}}{\hspace{-4em}}{\hfill\bf\contentspage}
\else
  \titlecontents{section}[1.5em]{\vspace{1.6em}\sf\zihao{4}}%
    {\contentslabel{1.5em}}{\hspace{-4em}}{\hfill\bf\contentspage}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                     中英文作者、标题等
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 年级
\def\NJU@grade{}
\newcommand{\grade}[1]{\def\NJU@grade{#1}}
% 学号
\def\NJU@sid{}
\newcommand{\sid}[1]{\def\NJU@sid{#1}}
% 姓名
\def\NJU@cauthor{}
\newcommand{\cauthor}[1]{\def\NJU@cauthor{#1}}
\def\NJU@eauthor{}
\newcommand{\eauthor}[1]{\def\NJU@eauthor{#1}}
% 标题
\def\NJU@ctitle{}
\newcommand{\ctitle}[1]{\def\NJU@ctitle{#1}}
\def\NJU@etitle{}
\newcommand{\etitle}[1]{\def\NJU@etitle{#1}}
% 导师
\def\NJU@cmentor{}
\newcommand{\cmentor}[1]{\def\NJU@cmentor{#1}}
\def\NJU@ementor{}
\newcommand{\ementor}[1]{\def\NJU@ementor{#1}}
% 导师职称
\def\NJU@cmentortitle{}
\newcommand{\cmentortitle}[1]{\def\NJU@cmentortitle{#1}}
\def\NJU@ementortitle{}
\newcommand{\ementortitle}[1]{\def\NJU@ementortitle{#1}}
% 院系
\def\NJU@cdepartment{}
\newcommand{\cdepartment}[1]{\def\NJU@cdepartment{#1}}
\def\NJU@edepartment{}
\newcommand{\edepartment}[1]{\def\NJU@edepartment{#1}}
% 专业
\def\NJU@cspecialization{}
\newcommand{\cspecialization}[1]{\def\NJU@cspecialization{#1}}
\def\NJU@especialization{}
\newcommand{\especialization}[1]{\def\NJU@especialization{#1}}
% 日期
\def\NJU@cdate{}
\newcommand{\cdate}[1]{\def\NJU@cdate{#1}}
\def\NJU@edate{}
\newcommand{\edate}[1]{\def\NJU@edate{#1}}
% 关键词
\def\NJU@ckeywords{}
\newcommand{\ckeywords}[1]{\def\NJU@ckeywords{#1}}
\def\NJU@ekeywords{}
\newcommand{\ekeywords}[1]{\def\NJU@ekeywords{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                       摘要环境设置
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeckeywords}{\zihao{4}%
  \begin{Description}{关键词:}
    \item[关键词:] \zihao{-4}\NJU@ckeywords
  \end{Description}}

\newcommand{\makeekeywords}{\zihao{4}%
  \begin{Description}{KEY WORDS:}
    \item[KEY WORDS:] \zihao{-4}\NJU@ekeywords
  \end{Description}}

\newenvironment{cabstract}{\newpage\thispagestyle{empty}%
  \begin{center}
    \bf\kaishu\zihao{-2}\uuline{南京大学本科生毕业论文（设计）中文摘要}
  \end{center}
  \vspace{0.5em}\kaishu\zihao{4}\noindent
  \begin{Description}{毕业论文题目:}
    \item[毕业论文题目:]
      \ifNJU@longtitle \uline{\NJU@ctitle\hfill}
      \else \uline{\hfill\NJU@ctitle\hfill}
      \fi
  \end{Description}
  \ifNJU@shortdepspe
    \makebox[18em]{%
      \uline{\hfill\NJU@cdepartment\hfill} 院系
      \uline{\hfill\NJU@cspecialization\hfill} 专业}
      \uline{\makebox[1.8em][c]{\NJU@grade}} 级
	  本科生姓名: \uline{\hfill{\NJU@cauthor}\hfill}\\[0.6em]
  \else
    \uline{\hfill\NJU@cdepartment\hfill} 院系
    \uline{\hfill\NJU@cspecialization\hfill} 专业\\[0.6em]
    \uline{\makebox[1.8em][c]{\NJU@grade}} 级
    本科生姓名: \uline{\hfill{\NJU@cauthor}\hfill}
  \fi
  指导教师（姓名、职称）: 
  \uline{\hfill{\NJU@cmentor\ \NJU@cmentortitle}\hfill}\\[0.6em]
  摘要: 
  
  \vspace{1em}\zihao{-4}}
  {\vfill\kaishu\makeckeywords\newpage\cleardoublepage}

\newenvironment{eabstract}{\newpage\thispagestyle{empty}%
  \begin{center}
    \bf\kaishu\zihao{-2}\uuline{南京大学本科生毕业论文（设计）英文摘要}
  \end{center}
  \vspace{0.5em}\zihao{4}\noindent
  \begin{Description}{THESIS:}
    \item[THESIS:] \NJU@etitle
    \item[DEPARTMENT:] \NJU@edepartment
    \item[SPECIALIZATION:] \NJU@especialization
    \item[UNDERGRADUATE:] \NJU@eauthor
    \item[MENTOR:] \NJU@ementortitle\ \NJU@ementor
    \item[ABSTRACT:]
  \end{Description}

  \vspace{1em}\zihao{-4}}
  {\vfill\makeekeywords\newpage\cleardoublepage}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                         标题页及标题
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Englishtitlepage % 这是以前课程论文的英文 titlepage
%\newcommand{\makeetitlepage}{\begin{titlepage}\begin{center}
%  \parbox[c][100mm][c]{\textwidth}{\huge \centering \NJU@etitle}\\[-36mm]
%  \Large A thesis presented by\\ \smallskip \NJU@eauthor \\
%  \bigskip	to\\	\bigskip \NJU@edepartment \\
%  in partial fulfillment of the requirements of the course\\ \textit{\NJU@ecourse}
%  \vfill \parbox[c][36mm][c]{\textwidth}{\centering \NJU@eschool \\ \NJU@edate}
%\end{center}\end{titlepage}}
%    Chinesetitlepage
\newcommand{\makectitlepage}{\thispagestyle{empty}%
  \begin{titlepage}\vspace{3em}
    \includegraphics[width=0.14\textwidth]{njulogos/njulogo.pdf}\vspace{2.6em}
    \begin{center}
      \includegraphics[width=0.5\textwidth]{njulogos/njuname.pdf}\\[2.8em]
      \zihao{1}\bf
      \ifNJU@thesis 本~~科~~毕~~业~~论~~文
      \else         本~~科~~毕~~业~~设~~计
      \fi
      \vfill
      \begin{minipage}{0.8\textwidth}
        \zihao{3}\rm\kaishu
        \begin{Description}{学生姓名}
          \item[\bf\kaishu 院~~~~~~~~系] \uline{\hfill\NJU@cdepartment\hfill}
          \item[\bf\kaishu 专~~~~~~~~业] \uline{\hfill\NJU@cspecialization\hfill}
          \item[\bf\kaishu 题~~~~~~~~目] 
            \ifNJU@longtitle \uline{\NJU@ctitle\hfill}
            \else \uline{\hfill\NJU@ctitle\hfill}
            \fi
          \item[\bf\kaishu 年~~~~~~~~级] \uline{\makebox[6em][c]{\NJU@grade}}
               {\bf\kaishu 学  ~~~   号} \uline{\hfill\NJU@sid\hfill}
          \item[\bf\kaishu 学生姓名]      \uline{\hfill\NJU@cauthor\hfill}
          \item[\bf\kaishu 指导老师]      \uline{\makebox[6em][c]{\NJU@cmentor}}
               {\bf\kaishu 职  ~~~   称}  \uline{\hfill\NJU@cmentortitle\hfill}
          \item[\bf\kaishu 提交日期]      \uline{\hfill\NJU@cdate\hfill}
        \end{Description}
      \end{minipage}
      \vfill
    \end{center}
  \end{titlepage}\cleardoublepage}

%    Chinesetitle
\ifNJU@chapter \newcommand{\makectitle}{}
\else
  \newcommand{\makectitle}
    {\makesomething{\qquad\\[0.6em]\NJU@ctitle\\[2.6em]}}
\fi

%\newcommand{\makectitle}{\chapter*{\NJU@ctitle}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                           常用命令
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\diff}{\mathrm{d}} %微分号
\newcommand{\scite}[1]{\ensuremath{^{{\scriptsize\cite{#1}}}}} %文献引用 右上角
\newcommand{\unit}[1]{\ensuremath{\,\mathrm{#1}}} %单位格式





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                         Change Log
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1.2
% ！ 封面毕业设计和毕业论文
% 可以选择是否是否支持 \chapter
% 页眉可随单双面打印自动调整样式
% 1.1
%
% 利用延迟命令将 pdf 属性设置移入宏包内
% 利用延迟命令将行距设置移入宏包内
% 更新了图表标题字体
% 开启中文斜体
% 可选择数学字体 默认 mathptmx txfonts
% 设置等宽字体 Courier New
% 增加页眉选项
%
% 更新了宏包 1.0 的发布日期

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                         Todo List
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
