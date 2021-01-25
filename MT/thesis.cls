%
% This is file `thesis.cls'.
%
% Copyright (c) 2021 Takamasa Naruse
%
% This file is part of the pLaTeX2e system.
% -------------------------------------------------------------
%
%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{thesis}[2021/01/06]
\LoadClassWithOptions{jreport}
%
%
%
\usepackage{color}
\usepackage{xparse}
%
%
% setting page layout
%
\setlength{\hoffset}{0pt}
%
% ページ数の位置が名工大の論文用紙とマッチするように調整した
\setlength{\voffset}{-10pt}
%
\setlength{\oddsidemargin}{22pt}
\setlength{\topmargin}{-42pt}
\setlength{\headheight}{12pt}
%
% 論文用紙の枠線からいい感じに距離をとった
\setlength{\headsep}{65pt}
%
% 論文用紙の枠線からいい感じに距離をとった
\setlength{\textheight}{675pt}
%
\setlength{\textwidth}{455pt}
\setlength{\marginparwidth}{60pt}
\setlength{\marginparsep}{0pt}
\setlength{\footskip}{30pt}
\setlength{\marginparpush}{7pt}
\setlength{\paperwidth}{597pt}
\setlength{\paperheight}{845pt}
%
% 文章の行間を22ptにした
\setlength{\baselineskip}{22pt}
%
\newcommand{\Hline}{\noalign{\hrule height1pt}}
\newcommand{\Vline}{@{~\vrule width1pt}}
%
%
% 深さ3まで番号をつける
%
\setcounter{secnumdepth}{3}
%
%
% 関連図書 -> 参考文献
%
\renewcommand{\bibname}{参考文献}
%
%
% ページ番号の設定(らしい)
%
\def\ps@headnombre{\let\@mkboth\@gobbletwo
    \let\ps@jpl@in\ps@headnombre
  \def\@evenhead{\thepage\hfil}%
%  \def\@oddhead{\hfil\thepage}%
  \def\@oddhead{\hfil\Large\thepage}%
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
%
\def\ps@myheadings{\let\@mkboth\@gobbletwo
    \let\ps@jpl@in\ps@headnombre
  \def\@evenhead{\thepage\hfil}%
%  \def\@oddhead{\hfil\thepage}%
  \def\@oddhead{\hfil\Large\thepage}%
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
%
%
% 章の最初の段落をインデントするように変更
%
\renewcommand{\chapter}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{jpl@in}%
  \global\@topnum\z@
%  \@afterindentfalse
  \@afterindenttrue%
  \secdef\@chapter\@schapter}
%
%
% `第?章 title'の間に改行をいれる
%
\def\@makechapterhead#1{\hbox{}%
% 見出しの高さを少し高くした
	\vskip1\Cvs
%%  \vskip2\Cvs
%%  \vskip3.1\Cvs
  {\parindent\z@
   \raggedright
   \reset@font\huge\bfseries
   \leavevmode
   \ifnum \c@secnumdepth >\m@ne
%     \setlength\@tempdima{\linewidth}%
%     \setbox\z@\hbox{\@chapapp\thechapter\@chappos\hskip1zw}%
%     \addtolength\@tempdima{-\wd\z@}%
%     \unhbox\z@\nobreak
%     \vtop{\hsize\@tempdima#1}%
     \setlength\@tempdima{\linewidth}%
     \setbox\z@\hbox{\@chapapp\thechapter\@chappos}%
     \unhbox\z@\nobreak
     \vskip1.2\Cvs
     \vtop{\hsize\@tempdima#1}%
   \else
     #1\relax
   \fi}\nobreak\vskip2.5\Cvs}
%
% 位置をちょい下に下げる
% \def\@makeschapterhead#1{\hbox{}%
% %  \vskip2\Cvs
%   \vskip3.8\Cvs
%   {\parindent\z@
%    \raggedright
%    \reset@font\huge\bfseries
%    \leavevmode
%    \setlength\@tempdima{\linewidth}%
%    \vtop{\hsize\@tempdima#1}}\vskip2.5\Cvs}
%
%
% titlepage(泉研究室用)
%
%\if@titlepage
\renewcommand{\maketitle}{
	\begin{titlepage}
	\renewcommand{\baselinestretch}{1}
		\begin{minipage}{15cm}
			\vspace{2cm}\mbox{\ \ }\\
			% 卒業年度の計算
			{\LARGE
			\ifnum \@tempcnta > 0
			\the\@tempcnta 年度 \\
			\else \ifx \@master \@degree
			\newcount\@gradyear
			\@gradyear = 0
			\advance \@gradyear \@enteryear
			\advance \@gradyear 1
			\the\@gradyear 年度 \\
			\else \ifx \@doctor \@degree
			\newcount\@gradyear
			\@gradyear = 0
			\advance \@gradyear \@enteryear
			\advance \@gradyear 2
			\the\@gradyear 年度 \\
			\else \ifx \@undergraduate \@degree
			\newcount\@gradyear
			\@gradyear = 0
			\advance \@gradyear \@enteryear
			\advance \@gradyear 3
			\the\@gradyear 年度 \\
			\else
			\textcolor{red}{20XX} 年度 \\
			\fi \fi \fi \fi
			}

			{\LARGE
			\ifx \@master \@degree
			修士論文
			\else \ifx \@doctor \@degree
			博士論文
			\else \ifx \@undergraduate \@degree
			卒業論文
			\else
			\textcolor{red}{宇宙論文}
			\fi \fi \fi
			}
			\vspace{10mm}
			\begin{center}
			\Huge\@papertitleJP \\
			\vspace{10mm}
			{\LARGE
			\ifx \@master \@degree
			\@papertitleEN
			\else \ifx \@doctor \@degree
			\@papertitleEN
			\else \ifx \@undergraduate \@degree

			\else
			\textcolor{red}{ERROR}
			\fi \fi \fi
			}
			{\large
			\ifx \@master \@degree
			%
			\else \ifx \@doctor \@degree
			%
			\else \ifx \@undergraduate \@degree
			%
			\else
			\textcolor{red}{!Error:master,doctor,undergraduateのどれかを指定してください} \\
			\fi \fi \fi
			}
			\end{center}
		\end{minipage}
		\begin{flushright}
		\vspace{\stretch{1}}
			\begin{minipage}{15cm}
				\begin{flushright}
					{\large
					\ifx \@master \@degree
					名古屋工業大学　大学院工学研究科　博士前期課程 \\
					\else \ifx \@doctor \@degree
					名古屋工業大学　大学院工学研究科　博士後期課程 \\
					\else \ifx \@undergraduate \@degree
					\ifx \@newcs \@program
					名古屋工業大学　高度工学教育課程　工学部第一部 \\
					\else \ifx \@ce \@program
					名古屋工業大学　創造工学教育課程 \\
					\else
					\textcolor{red}{Error} \\
					\fi \fi
					\else
					\textcolor{red}{!Error:master,doctor,undergraduateのどれかを指定してください} \\
					\fi \fi \fi
					}
					\vspace{4mm}
					{\large
					\ifx \@newcs \@program
					工学専攻　情報工学系プログラム \\
					\else \ifx \@cs \@program
					\ifx \@master \@degree
					情報工学専攻 \\
					\else \ifx \@doctor \@degree
					情報工学専攻 \\
					\else
					\textcolor{red}{Error} \\
					\fi \fi
					\else \ifx \@ce \@program
					\ifx \@master \@degree
					工学専攻　創造工学プログラム \\
					\else \ifx \@doctor \@degree
					\else \ifx \@undergraduate \@degree
					情報・社会コース \\
					\else
					\textcolor{red}{Error} \\
					\fi \fi \fi
					\else
					\textcolor{red}{!Error:newcs, cs, ceのどれかを指定してください} \\
					\fi \fi \fi
					}
					\vspace{4mm}
					\large \@labo 研究室所属\\
					\vspace{4mm}
					\large \the\@enteryear 年度入学 \\
					\vspace{4mm}
					\large 学生番号：\@studentID \ \ 氏名：\@name
				\end{flushright}
			\end{minipage}
		\end{flushright}
	\end{titlepage}
}
% \enteryearで\@tempcnta=0にしているので、\gradyearは\enteryearより下でせんげんしなければならない
\newcommand{\enteryear}[1]{\newcount\@enteryear \@enteryear = #1 \@tempcnta = 0}
\newcommand{\gradyear}[1]{\@tempcnta = #1}
\newcommand{\papertitleJP}[1]{\newcommand{\@papertitleJP}{#1}}
\newcommand{\papertitleEN}[1]{\newcommand{\@papertitleEN}{#1}}
\newcommand{\name}[1]{\newcommand{\@name}{#1}}
\newcommand{\labo}[1]{\newcommand{\@labo}{#1}}
\newcommand{\studentID}[1]{\newcommand{\@studentID}{#1}}
\newcommand{\degree}[1]{\newcommand{\@degree}{#1}}
\newcommand{\program}[1]{\newcommand{\@program}{#1}}
\newcommand{\@master}{master}
\newcommand{\@doctor}{doctor}
\newcommand{\@undergraduate}{undergraduate}
\newcommand{\@cs}{cs}
\newcommand{\@newcs}{newcs}
\newcommand{\@ce}{ce}
%
%
% 目次に謝辞や参考文献を表示する(だけど、目次に目次は表示したくない)
%
% \renewenvironment{thebibliography}[1]
% {\chapter*{\bibname}\@mkboth{\bibname}{\bibname}%
%    \addcontentsline{toc}{chapter}{\bibname}
%    \list{\@biblabel{\@arabic\c@enumiv}}%
%         {\settowidth\labelwidth{\@biblabel{#1}}%
%          \leftmargin\labelwidth
%          \advance\leftmargin\labelsep
%          \@openbib@code
%          \usecounter{enumiv}%
%          \let\p@enumiv\@empty
%          \renewcommand\theenumiv{\@arabic\c@enumiv}}%
%    \sloppy
%    \clubpenalty4000
%    \@clubpenalty\clubpenalty
%    \widowpenalty4000%
%    \sfcode`\.\@m}
%   {\def\@noitemerr
%     {\@latex@warning{Empty `thebibliography' environment}}%
% 	 \endlist}
%
% 最終的にhttps://python5.com/q/yvmpbpac を参考して解決
%
\let\oldchapter\chapter
\renewcommand{\tableofcontents}{%
\pagenumbering{roman}	% ページ番号をローマ数字で
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \oldchapter*{\contentsname
    \@mkboth{\contentsname}{\contentsname}% chapter* -> oldchapter*
  }\@starttoc{toc}%
	\if@restonecol\twocolumn\fi
}
\renewcommand{\listoffigures}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \oldchapter*{\listfigurename}% chapter* -> oldchapter*
  \@mkboth{\listfigurename}{\listfigurename}%
  \@starttoc{lof}%
  \if@restonecol\twocolumn\fi
}
\renewcommand{\listoftables}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \oldchapter*{\listtablename}% chapter* -> oldchapter*
  \@mkboth{\listtablename}{\listtablename}%
  \@starttoc{lot}%
  \if@restonecol\twocolumn\fi
}
\newcounter{@secnumdepth}
\RenewDocumentCommand{\chapter}{s o m}{%
	\IfBooleanTF{#1}
		{
		\setcounter{@secnumdepth}{\value{secnumdepth}} % Store secnumdepth
		\setcounter{secnumdepth}{-1}
		\oldchapter{#3}
		\setcounter{secnumdepth}{\value{@secnumdepth}}
		} % Restore secnumdepth
		{\IfValueTF{#2} % \chapter
			{\oldchapter[#2]{#3}} % \chapter[.]{..}
			{\oldchapter{#3}}} % \chapter{..}
}
%
%
% footnote.sty
% 
% footnote.sty 						  by taro & itoken
%
% 注釈番号を日本語化し，仕切り線を任意に調節するスタイルファイル
%
% なお，このスタイルファイルはieicej.styから引用しています．
%
\def\footnoterule{\kern-3\p@
 \hrule height .1mm width \columnwidth %（.4）デフォルトの仕切り線の長さ
 \kern 2.715\p@}

\long\def\@makefntext#1{% \footnotesize
 \parindent 1zw
 \noindent\hbox{\kern-.5zw
  （\@thefnmark{}）\kern-.5zw\makebox[1zw][c]{：}}#1}

\def\@makefnmark{\hbox{$^{\mbox{\tiny \kern-.5zw
  （\@thefnmark{}）\kern-.5zw}}$}}

\def\thefootnote{\arabic{footnote}}
%
% citesort.sty
% 
% citesort.sty                               by taro
%
% 参考文献番号の表記をかっこ良くするスタイルファイル
%
% 適用前 : 文献[1,4,5,6,7]によると・・・
% 適用後 : 文献[1],[4]～[7]によると・・・
%
% なお，このスタイルファイルはieicej.styから引用しています．
%
\newcount\@minsofar
\newcount\@min
\newcount\@cite@temp
\def\@citex[#1]#2{%
\if@filesw \immediate \write \@auxout {\string \citation {#2}}\fi
\@tempcntb\m@ne \let\@h@ld\relax \def\@citea{}%
\@min\m@ne%
\@cite{%
  \@for \@citeb:=#2\do {\@ifundefined {b@\@citeb}%
    {\@h@ld\@citea\@tempcntb\m@ne{\bf ?}%
    \@warning {Citation `\@citeb ' on page \thepage \space undefined}}%
{\@minsofar\z@ \@for \@scan@cites:=#2\do {%
  \@ifundefined{b@\@scan@cites}%
    {\@cite@temp\m@ne}
    {\@cite@temp\number\csname b@\@scan@cites \endcsname \relax}%% <
\ifnum\@cite@temp > \@min% select the next one to list
    \ifnum\@minsofar = \z@
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\else
    \ifnum\@cite@temp < \@minsofar %% >
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\fi\fi\fi}\@tempcnta\@min %% <
  \ifnum\@minsofar > \z@ % some more
    \advance\@tempcnta\@ne
    \@min\@minsofar
    \ifnum\@tempcnta=\@minsofar %   Number follows previous--hold on to it
      \ifx\@h@ld\relax
        \edef \@h@ld{\@citea\csname b@\@scan@copy\endcsname}%
      \else
       \edef\@h@ld{\ifmmode{]～[}\else]～[\fi\csname b@\@scan@copy\endcsname}%
      \fi
    \else \@h@ld\@citea\csname b@\@scan@copy\endcsname
          \let\@h@ld\relax
  \fi % no more
\fi}%
\def\@citea{],\penalty\@highpenalty\,[}}\@h@ld}{#1}}
%
%
% jdummy.def
%
\DeclareRelationFont{JY1}{mc}{it}{}{OT1}{cmr}{it}{}
\DeclareRelationFont{JT1}{mc}{it}{}{OT1}{cmr}{it}{}
\DeclareFontShape{JY1}{mc}{m}{it}{<5> <6> <7> <8> <9> <10> sgen*min
    <10.95><12><14.4><17.28><20.74><24.88> min10
    <-> min10}{}
\DeclareFontShape{JT1}{mc}{m}{it}{<5> <6> <7> <8> <9> <10> sgen*tmin
    <10.95><12><14.4><17.28><20.74><24.88> tmin10
    <-> tmin10}{}
\DeclareRelationFont{JY1}{mc}{sl}{}{OT1}{cmr}{sl}{}
\DeclareRelationFont{JT1}{mc}{sl}{}{OT1}{cmr}{sl}{}
\DeclareFontShape{JY1}{mc}{m}{sl}{<5> <6> <7> <8> <9> <10> sgen*min
    <10.95><12><14.4><17.28><20.74><24.88> min10
    <-> min10}{}
\DeclareFontShape{JT1}{mc}{m}{sl}{<5> <6> <7> <8> <9> <10> sgen*tmin
    <10.95><12><14.4><17.28><20.74><24.88> tmin10
    <-> tmin10}{}
\DeclareRelationFont{JY1}{mc}{sc}{}{OT1}{cmr}{sc}{}
\DeclareRelationFont{JT1}{mc}{sc}{}{OT1}{cmr}{sc}{}
\DeclareFontShape{JY1}{mc}{m}{sc}{<5> <6> <7> <8> <9> <10> sgen*min
    <10.95><12><14.4><17.28><20.74><24.88> min10
    <-> min10}{}
\DeclareFontShape{JT1}{mc}{m}{sc}{<5> <6> <7> <8> <9> <10> sgen*tmin
    <10.95><12><14.4><17.28><20.74><24.88> tmin10
    <-> tmin10}{}
\DeclareRelationFont{JY1}{gt}{it}{}{OT1}{cmbx}{it}{}
\DeclareRelationFont{JT1}{gt}{it}{}{OT1}{cmbx}{it}{}
\DeclareFontShape{JY1}{mc}{bx}{it}{<5> <6> <7> <8> <9> <10> sgen*goth
    <10.95><12><14.4><17.28><20.74><24.88> goth10
    <-> goth10}{}
\DeclareFontShape{JT1}{mc}{bx}{it}{<5> <6> <7> <8> <9> <10> sgen*tgoth
    <10.95><12><14.4><17.28><20.74><24.88> tgoth10
    <-> tgoth10}{}
\DeclareRelationFont{JY1}{gt}{sl}{}{OT1}{cmbx}{sl}{}
\DeclareRelationFont{JT1}{gt}{sl}{}{OT1}{cmbx}{sl}{}
\DeclareFontShape{JY1}{mc}{bx}{sl}{<5> <6> <7> <8> <9> <10> sgen*goth
    <10.95><12><14.4><17.28><20.74><24.88> goth10
    <-> goth10}{}
\DeclareFontShape{JT1}{mc}{bx}{sl}{<5> <6> <7> <8> <9> <10> sgen*tgoth
    <10.95><12><14.4><17.28><20.74><24.88> tgoth10
    <-> tgoth10}{}
\DeclareRelationFont{JY1}{gt}{sc}{}{OT1}{cmbx}{sc}{}
\DeclareRelationFont{JT1}{gt}{sc}{}{OT1}{cmbx}{sc}{}
\DeclareFontShape{JY1}{mc}{bx}{sc}{<5> <6> <7> <8> <9> <10> sgen*goth
    <10.95><12><14.4><17.28><20.74><24.88> goth10
    <-> goth10}{}
\DeclareFontShape{JT1}{mc}{bx}{sc}{<5> <6> <7> <8> <9> <10> sgen*tgoth
    <10.95><12><14.4><17.28><20.74><24.88> tgoth10
    <-> tgoth10}{}
\DeclareRelationFont{JY1}{gt}{it}{}{OT1}{cmr}{it}{}
\DeclareRelationFont{JT1}{gt}{it}{}{OT1}{cmr}{it}{}
\DeclareFontShape{JY1}{gt}{m}{it}{<5> <6> <7> <8> <9> <10> sgen*goth
    <10.95><12><14.4><17.28><20.74><24.88> goth10
    <-> goth10}{}
\DeclareFontShape{JT1}{gt}{m}{it}{<5> <6> <7> <8> <9> <10> sgen*tgoth
    <10.95><12><14.4><17.28><20.74><24.88> tgoth10
    <-> tgoth10}{}
%
\endinput
%%
%% End of file `thesis.cls'.