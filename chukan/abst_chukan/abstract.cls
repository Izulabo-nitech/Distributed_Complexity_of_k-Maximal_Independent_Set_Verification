% ���É��H�Ƒ�w��w�@�H�w�����ȏ��H�w��U�C�_�T�v�X�^�C��
% edited by kazuo KATO <kato@moss.elcom.nitech.ac.jp>
%           Satoshi Osuga <osuga@moss.elcom.nitech.ac.jp>
%           Atsushi Takagi <takagi@moss.elcom.nitech.ac.jp>
%
% �I���W�i��
% ���_�T�v.sty 11 Apr 88, last modified 2 Dec 88
%
% 2004/01/26 v0.01 soturonabst03.sty��ύX���č쐬
% �ȉ��C��{�ꂪ�X�V
% 2004/12/14 v1.00 �N���X�t�@�C���ɂ���abstract.cls�ɉ���
% 2004/12/17 v2.00 ���̑傫����s�̍�������ύX���Ă�����Ȃ��悤�ɂ���
% 2004/12/17 v2.10 \begin{�C�_�T�v}�`\end{�C�_�T�v}��s�v�ɂ���
% 2005/01/07 v3.00 \makeframe�Řg�����悤�ɂ����Cmaketitle�Ń^�C�g�����������ނ悤�ɂ����C2�y�[�W�ڈȍ~���쐬�\�ɂ���(�g��Ȃ�����)
% 2005 02/01 v3.10 \maketitle��tabularx�����g���悤�ɕύX ���̑��ׂ������C�A�E�g����(takagi)
% 2005 02/01 v4.00 \maketitle��d�C���H�w��U�p������H�w��U�p�ɕύX
%
%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{abstract}
  [2004/01/07 v3.00 for abstract of master's thesis]
\LoadClass[10pt,a4paper,oneside,notitlepage,twocolumn]{jarticle}

\usepackage{multirow}
\usepackage{tabularx}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% �p���ݒ�
\voffset -1in
\hoffset -1in

%�s�̍���
\renewcommand{\baselinestretch}{1.05}

%��}�[�W��
\topmargin .04\paperheight

%��̌r���Ɩ{���Ƃ̊�
\headsep .01\paperheight

%�{���̍���
\textheight \paperheight
\advance\textheight by-\topmargin
\advance\textheight by-.06\paperheight %���}�[�W��

%���E�}�[�W��
\oddsidemargin .08\paperwidth
\evensidemargin \oddsidemargin

%�{���Ɖ��̌r���̊�
\newlength{\framesidesep}
\setlength{\framesidesep}{.02\textwidth}

%�{����
\textwidth \paperwidth
\advance\textwidth by-2\oddsidemargin %���̕� - ���E�̃}�[�W��

%���̑��F�X
%\marginparsep \z@
%\marginparwidth \z@
%\footskip \z@
%\marginparpush \z@
\parindent 1zw

\columnsep 1.2\columnsep

%�L���v�V�����̃t�H���g�T�C�Y
\def\captionfontsize{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ����(�p�����[�^)
\def\�C���N�x#1{\def\@�C���N�x{#1}} \def\@�C���N�x{}
\def\���#1{\def\@���{#1}} \def\@���{}
\def\������#1{\def\@������{#1}} \def\@������{}
\def\�w�Дԍ�#1{\def\@�w�Дԍ�{#1}} \def\@�w�Дԍ�{}
\def\����#1{\def\@����{#1}} \def\@����{}
\def\name#1{\def\@name{#1}} \def\@name{}
\newcount\@unt@
\newcount\@@unt@

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ������ӂ���C�C�_�T�v�X�^�C���J�n

\headheight \z@

%�O�g�̕����`
\newlength{\framewidth}
\setlength{\framewidth}{\textwidth}
\addtolength{\framewidth}{2\framesidesep}

%�O�g�̕`��
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

%�^�C�g��
% \TX@col@width ��X�̕�(tabularx.sty���Q��)
\def\maketitle{%
  \twocolumn[%
  \vspace{-\headsep}%
  \hspace{-\framesidesep}%
  \def\arraystretch{1.2}%
  \begin{tabularx}{\framewidth}{X|cc}
   \multicolumn{3}{c}{\large \bf �� �a \@�C���N�x �N �x \hspace{2zw} �C �m �_ �� �T �v} \\ \hline
   \multirow{2}{\TX@col@width}{\centering \@���} &     \hspace{1zw}\@������\hspace{1zw}         & \hspace{1zw}\@����\hspace{1zw} \\ \cline{2-3}
                                       & \hspace{1zw}{\bf No. }\@�w�Дԍ�\hspace{1zw} & \hspace{1zw}\@name\hspace{1zw} \\ \hline
  \end{tabularx}%
  \vspace{\headsep}%
  ]%
}

%--------------------------------------------------------------------
% section�Esubsection�Esubsubsection�Eparagraph�Esubparagraph
% �̉��s���Ȃǂ�ύX
% Cvs��1�s
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
% figure�Etable�Ecaption
%--------------------------------------------------------------------
% caption�̑O��̃X�y�[�X����������D
%\setlength{\abovecaptionskip}{-.5zh}
%\setlength{\belowcaptionskip}{-10zh}

% caption���Ē�`(�L���v�V�����̃t�H���g�T�C�Y�ύX�̂���)
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


% float ��
% �y�[�W�㕔���邢�͉����ɏo�͂����t���[�g�ƃt���[�g�̊Ԃ̋���
\setlength{\floatsep}{-1zh}
% �y�[�W�㕔�̃t���[�g�Ɩ{���A����і{���ƃy�[�W�����̃t���[�g�Ƃ̋���
\setlength{\textfloatsep}{-1zh}
% �y�[�W�̓r���ɏo�͂����t���[�g�Ƃ��̑O��̖{���Ƃ̋���
\setlength{\intextsep}{0zh}

\setlength{\tabcolsep}{.5zw}

%--------------------------------------------------------------------
% enumerate�Eitemize�Edescription�Ethebibliography �����Ē�`
%--------------------------------------------------------------------
%% �S��
%% �C���f���g�ʂ�ύX
%% �S�̂ɕς��̂ł�����Ƃ܂�������
\setlength{\leftmargini}{1.2zw}
%\setlength{\leftmarginii}{3zw}
%\setlength{\leftmarginiii}{4zw}

%% enumerate
%% topsep�Cpartopsep�Ŗ{����list���̊Ԋu��ύX
%% parskip�Citemsep�Cparsep�ō��ڊԂ̊Ԋu��ύX
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
			   \topsep\z@ \partopsep\z@           % �{����list���̊Ԋu��ύX
				 \parskip\z@ \itemsep\z@ \parsep\z@ % ���ڊԂ̊Ԋu��ύX
         \usecounter{\@enumctr}%
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

%% itemize
%% topsep�Cpartopsep�Ŗ{����list���̊Ԋu��ύX
%% parskip�Citemsep�Cparsep�ō��ڊԂ̊Ԋu��ύX
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
			   \topsep\z@ \partopsep\z@           % �{����list���̊Ԋu��ύX
				 \parskip\z@ \itemsep\z@ \parsep\z@ % ���ڊԂ̊Ԋu��ύX
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

%% description
%% topsep�Cpartopsep�Ŗ{����list���̊Ԋu��ύX
%% parskip�Citemsep�Cparsep�ō��ڊԂ̊Ԋu��ύX
\renewenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=1zw \itemsep\z@
     \listparindent\z@ \topskip\z@ \parskip\z@ \partopsep\z@
   \fi
	   \topsep\z@ \partopsep\z@           % �{����list���̊Ԋu��ύX
		 \parskip\z@ \itemsep\z@ \parsep\z@ % ���ڊԂ̊Ԋu��ύX
		 \let\makelabel\descriptionlabel}}{\endlist}


%% thebibliography
%% parskip�Citemsep�Cparsep�ō��ڊԂ̊Ԋu��ύX
\renewenvironment{thebibliography}[1]
{\section*{\refname\@mkboth{\refname}{\refname}}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep 
				 \parskip\z@ \itemsep.1zh \parsep\z@ %���ڊԂ̊Ԋu��ύX
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
% ���{��C�^���b�N�G���[�΍�
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
