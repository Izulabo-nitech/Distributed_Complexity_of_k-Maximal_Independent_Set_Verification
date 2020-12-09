% 名古屋工業大学大学院工学研究科情報工学専攻修論概要スタイル
% edited by kazuo KATO <kato@moss.elcom.nitech.ac.jp>
%           Satoshi Osuga <osuga@moss.elcom.nitech.ac.jp>
%           Atsushi Takagi <takagi@moss.elcom.nitech.ac.jp>
%
% オリジナル
% 卒論概要.sty 11 Apr 88, last modified 2 Dec 88
%
% 2004/01/26 v0.01 soturonabst03.styを変更して作成
% 以下，大須賀が更新
% 2004/12/14 v1.00 クラスファイルにしてabstract.clsに改名
% 2004/12/17 v2.00 紙の大きさや行の高さ等を変更しても崩れないようにした
% 2004/12/17 v2.10 \begin{修論概要}～\end{修論概要}を不要にした
% 2005/01/07 v3.00 \makeframeで枠を作るようにした，maketitleでタイトルを書き込むようにした，2ページ目以降も作成可能にした(使わないけど)
% 2005 02/01 v3.10 \maketitleにtabularx環境を使うように変更 その他細かいレイアウト調整(takagi)
% 2005 02/01 v4.00 \maketitleを電気情報工学専攻用から情報工学専攻用に変更
%
%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{abstract}
  [2004/01/07 v3.00 for abstract of master's thesis]
\LoadClass[10pt,a4paper,oneside,notitlepage,twocolumn]{jarticle}

\usepackage{multirow}
\usepackage{tabularx}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 用紙設定
\voffset -1in
\hoffset -1in

%行の高さ
\renewcommand{\baselinestretch}{1.05}

%上マージン
\topmargin .04\paperheight

%上の罫線と本文との間
\headsep .01\paperheight

%本文の高さ
\textheight \paperheight
\advance\textheight by-\topmargin
\advance\textheight by-.06\paperheight %下マージン

%左右マージン
\oddsidemargin .08\paperwidth
\evensidemargin \oddsidemargin

%本文と横の罫線の間
\newlength{\framesidesep}
\setlength{\framesidesep}{.02\textwidth}

%本文幅
\textwidth \paperwidth
\advance\textwidth by-2\oddsidemargin %紙の幅 - 左右のマージン

%その他色々
%\marginparsep \z@
%\marginparwidth \z@
%\footskip \z@
%\marginparpush \z@
\parindent 1zw

\columnsep 1.2\columnsep

%キャプションのフォントサイズ
\def\captionfontsize{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 引数(パラメータ)
\def\修了年度#1{\def\@修了年度{#1}} \def\@修了年度{}
\def\題目#1{\def\@題目{#1}} \def\@題目{}
\def\研究室#1{\def\@研究室{#1}} \def\@研究室{}
\def\学籍番号#1{\def\@学籍番号{#1}} \def\@学籍番号{}
\def\氏名#1{\def\@氏名{#1}} \def\@氏名{}
\def\name#1{\def\@name{#1}} \def\@name{}
\newcount\@unt@
\newcount\@@unt@

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ここら辺から，修論概要スタイル開始

\headheight \z@

%外枠の幅を定義
\newlength{\framewidth}
\setlength{\framewidth}{\textwidth}
\addtolength{\framewidth}{2\framesidesep}

%外枠の描写
\pagestyle{empty}
\def\@oddhead{%
  \hspace{-\framesidesep}%
  \framebox[\framewidth]{
    \dimen0 1.01\textheight
    \advance\dimen0 \headsep
    \vbox to\dimen0{
    }%
  }%
}

%タイトル
% \TX@col@width はXの幅(tabularx.styを参照)
\def\maketitle{%
  \twocolumn[%
  \vspace{-\headsep}%
  \hspace{-\framesidesep}%
  \def\arraystretch{1.2}%
  \begin{tabularx}{\framewidth}{X|cc}
   \multicolumn{3}{c}{\large \bf 令 和 \@修了年度 年 度 \hspace{2zw} 修 士 論 文 概 要} \\ \hline
   \multirow{2}{\TX@col@width}{\centering \@題目} &     \hspace{1zw}\@研究室\hspace{1zw}         & \hspace{1zw}\@氏名\hspace{1zw} \\ \cline{2-3}
                                       & \hspace{1zw}{\bf No. }\@学籍番号\hspace{1zw} & \hspace{1zw}\@name\hspace{1zw} \\ \hline
  \end{tabularx}%
  \vspace{\headsep}%
  ]%
}

%--------------------------------------------------------------------
% section・subsection・subsubsection・paragraph・subparagraph
% の改行幅などを変更
% Cvsは1行
%--------------------------------------------------------------------
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
   {.01\Cvs}%
   {.01\Cvs}%
   {\reset@font\large\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
   {.01\Cvs}%
   {.01\Cvs}%
   {\reset@font\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
   {.1\Cvs}%
   {.1\Cvs}%
   {\reset@font\normalsize\bfseries}}
\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
   {.5ex}%
   {-1em}%
   {\reset@font\normalsize\bfseries}}
\renewcommand{\subparagraph}{\@startsection{subparagraph}{5}{\z@}%
   {.5ex}%
   {-1em}%
   {\reset@font\normalsize\bfseries}}

%--------------------------------------------------------------------
% figure・table・caption
%--------------------------------------------------------------------
% captionの前後のスペースを狭くする．
%\setlength{\abovecaptionskip}{-.5zh}
%\setlength{\belowcaptionskip}{-10zh}

% caption環境再定義(キャプションのフォントサイズ変更のため)
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\captionfontsize#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    \captionfontsize#1: #2\relax\par
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


% float 環境
% ページ上部あるいは下部に出力されるフロートとフロートの間の距離
\setlength{\floatsep}{-1zh}
% ページ上部のフロートと本文、および本文とページ下部のフロートとの距離
\setlength{\textfloatsep}{-1zh}
% ページの途中に出力されるフロートとその前後の本文との距離
\setlength{\intextsep}{0zh}

\setlength{\tabcolsep}{.5zw}

%--------------------------------------------------------------------
% enumerate・itemize・description・thebibliography 環境を再定義
%--------------------------------------------------------------------
%% 全体
%% インデント量を変更
%% 全体に変わるのでちょっとまずいかも
\setlength{\leftmargini}{1.2zw}
%\setlength{\leftmarginii}{3zw}
%\setlength{\leftmarginiii}{4zw}

%% enumerate
%% topsep，partopsepで本文とlist環境の間隔を変更
%% parskip，itemsep，parsepで項目間の間隔を変更
\setlength{\itemsep}{0pt}
\renewenvironment{enumerate}
  {\ifnum \@enumdepth >\thr@@\@toodeep
		\else\advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{%
      \iftdir
         \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
           \else\topsep\z@\fi
         \labelwidth1zw \labelsep.3zw
         \ifnum \@enumdepth=\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
      \fi
			   \topsep\z@ \partopsep\z@           % 本文とlist環境の間隔を変更
				 \parskip\z@ \itemsep\z@ \parsep\z@ % 項目間の間隔を変更
         \usecounter{\@enumctr}%
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

%% itemize
%% topsep，partopsepで本文とlist環境の間隔を変更
%% parskip，itemsep，parsepで項目間の間隔を変更
\renewenvironment{itemize}
  {\ifnum \@itemdepth >\thr@@\@toodeep\else 
   \advance\@itemdepth\@ne
   \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
   \expandafter
   \list{\csname \@itemitem\endcsname}{%
      \iftdir
         \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
           \else\topsep\z@\fi
         \labelwidth1zw \labelsep.3zw
         \ifnum \@itemdepth =\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
      \fi
			   \topsep\z@ \partopsep\z@           % 本文とlist環境の間隔を変更
				 \parskip\z@ \itemsep\z@ \parsep\z@ % 項目間の間隔を変更
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

%% description
%% topsep，partopsepで本文とlist環境の間隔を変更
%% parskip，itemsep，parsepで項目間の間隔を変更
\renewenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=1zw \itemsep\z@
     \listparindent\z@ \topskip\z@ \parskip\z@ \partopsep\z@
   \fi
	   \topsep\z@ \partopsep\z@           % 本文とlist環境の間隔を変更
		 \parskip\z@ \itemsep\z@ \parsep\z@ % 項目間の間隔を変更
		 \let\makelabel\descriptionlabel}}{\endlist}


%% thebibliography
%% parskip，itemsep，parsepで項目間の間隔を変更
\renewenvironment{thebibliography}[1]
{\section*{\refname\@mkboth{\refname}{\refname}}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep 
				 \parskip\z@ \itemsep.1zh \parsep\z@ %項目間の間隔を変更
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy
   \clubpenalty4000
   \@clubpenalty\clubpenalty
   \widowpenalty4000%
   \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}

%--------------------------------------------------------------------
% 日本語イタリックエラー対策
%--------------------------------------------------------------------
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
\endinput

