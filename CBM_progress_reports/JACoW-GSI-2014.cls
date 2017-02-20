%%
%% Modified JaCOW template for the GSI Scientific Report 2014
%% 8.1.2015
%%
% modified for GSI 11/2005 K. Schiebel - subsection
% modified for GSI 11/2006 K. Schiebel - list of authors
% modified for GSI 11/2010 K. Schiebel - Authors italic, PDF=A4
% modified for GSI 1/2015 K. Große
%
\def\fileversion{1.7 - modified for GSI}
\def\filedate{2010/11/16}
\def\docdate {2010/11/16}

\newlength{\dsep}
\newlength{\dwid}
\newlength{\dht}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JACoW-GSI-2014}[\filedate\space Version \fileversion]
%\DeclareOption{acus}
%   {\setlength{\dwid}{6mm}%
%    \setlength{\dht}{-18mm}
%    \setlength{\paperheight}{11in}
%    \setlength{\paperwidth}{8.5in}
%    \typeout{Setup for US LETTER PAPER}}
\DeclareOption{aca4}
   {\setlength{\dwid}{0mm}%
    \setlength{\dht}{0mm}
    \setlength{\paperheight}{297mm}
    \setlength{\paperwidth}{210mm}
    \typeout{Setup for A4 PAPER}}
\DeclareOption{a4paper}
   {\setlength{\dwid}{0mm}%
    \setlength{\dht}{0mm}
    \setlength{\paperheight}{297mm}
    \setlength{\paperwidth}{210mm}
    \typeout{Setup for A4 PAPER}}
\DeclareOption{boxit}
%%
%%  This option draws a box on the output text with the correct margins
%%
   {\special{!userdict begin /bop-hook{
         gsave
         newpath
         58 55 moveto
         58 737 lineto
         539 737 lineto
         539 55 lineto
         closepath
         stroke
         grestore
         }def end}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions
\LoadClass[10pt,a4paper]{article}                                        %2010 - A4

%%
%%  Using Times fonts produces a Uniform, compact document
%%  suitable for the Acrobat Software and printable anywhere.
%%
%%  In a 'modern' TeX installation
%%  e.g TeXLive Version 3 or later (more information on the JACo Website)
%%  one can use the following command
%%

\renewcommand{\rmdefault}{ptm}

%%
%%  Older installations may require
%%              \RequirePackage{times}
%%
\typeout{------------------------------------------------------------------------}
\typeout{LaTeX2e Class file for Accelerator Conference publication for LaTeX2e users}
\typeout{ }
\typeout{Use the boxit option to draw a box on page showing the correct margins}
\typeout{ }
\typeout{Itemize, Enumerate and Description environments are compact versions}
\typeout{------------------------------------------------------------------------}
\typeout{ }

%
% DIMENSION OF TEXT:

\setlength{\textheight}{241mm}
\setlength{\textwidth}{170mm}
%\setlength{\topmargin}{23mm}
\setlength{\topmargin}{14mm}                    %nach oben verschoben
\addtolength{\topmargin}{\dht}
\setlength{\oddsidemargin}{20mm}
\setlength{\evensidemargin}{20mm}
\setlength{\columnsep}{5mm}


\hoffset -25.4mm
\voffset -25.4mm

\columnseprule 0pt      %    Width of rule between columns.

% Use Michel Goossens' dense lists
% Prevent infinite loops

\let\Otemize =\itemize
\let\Onumerate =\enumerate
\let\Oescription =\description
% Zero the vertical spacing parameters
\def\Nospacing{\itemsep=0pt\topsep=0pt\partopsep=0pt\parskip=0pt\parsep=0pt}
% Redefine the environments in terms of the original values
\newenvironment{Itemize}{\Otemize\Nospacing}{\endlist}
\newenvironment{Enumerate}{\Onumerate\Nospacing}{\endlist}
\newenvironment{Description}{\Oescription\Nospacing}{\endlist}

\renewcommand{\topfraction}{.95}
\renewcommand{\bottomfraction}{.95}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.8}

\def\@oddhead{}\def\@evenhead{}
\def\@oddfoot{}
\def\@evenfoot{\@oddfoot}

%-----------------------------------------------------------------------
% We acknowledge the borrowing of the clever part of
% Steven Gildea's definition of \section
% from geophysi.sty.
%
% \section is tricky because we want to both support \section* and have
% the section title uppercased.

\def\section{\secdef\@sectionb\@sections}
\def\@sectionb[#1]#2{\@sections{#2}}
%\def\@sections#1{\@startsection {section}{1}{\z@}                  Original
%                {2.8ex plus 0.8ex minus .1ex}{1.5ex plus .2ex}
%                {\large\bf\boldmath\centering}{\uppercase{#1}}}
\def\@sections#1{\@startsection {section}{1}{\z@}                   %no uppercase
                {2.8ex plus 0.8ex minus .1ex}{1.5ex plus .2ex}
                {\large\bf\boldmath\centering}{#1}}
% Should there be any problem with this, we can revert to the following
% but then the onus is on the user to type the argument of \section in
% uppercase in the input file.
%
%\def\section{\@startsection {section}{1}{\z@}{2.8ex plus 0.8ex minus.1ex}
%                          {1.5ex plus .2ex}{\large\bf\boldmath\centering}}

\def\subsection{\@startsection{subsection}{2}{\z@}{2.6ex plus .8ex minus
   .17ex}{1.2ex plus .17ex}{\large\it\centering}}
\def\subsubsection{\@startsection{subsubsection}{3}{\parindent}
 {2.5ex plus .7ex minus .17ex}{-1em}{\normalsize\bf}}
\def\paragraph{\@startsection
     {paragraph}{4}{\z@}{2.5ex plus .7ex minus .17ex}{-1em}{\normalsize\it}}
\def\subparagraph{\@startsection
     {subparagraph}{4}{\parindent}{2.25ex plus .7ex minus
     .17ex}{-1em}{\normalsize\bf}}

\setcounter{secnumdepth}{0}

% This definition of \maketitle taken from article.sty, and has been
% somewhat modified.

\def\maketitle{\par
 \begingroup
   \def\thefootnote{\fnsymbol{footnote}}
   \def\@makefnmark{\hbox
       to 5pt{$^{\@thefnmark}$\hss}}
   \twocolumn[\@maketitle]
   \@thanks
 \endgroup
 \setcounter{footnote}{0}
 \let\maketitle\relax
 \let\@maketitle\relax
 \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\thanks\relax}

\newlength{\titleblockheight}       % so user can change it if need be
\setlength{\titleblockheight}{3.5cm}


\def\@maketitle{\vbox to \titleblockheight {\hsize\textwidth
  \linewidth\hsize \vskip 3pt \centering
  {\Large\bf \@title \par}
  \vskip 2em                % Vertical space after title.
  {\large\begin{tabular}[t]{@{}c@{}}\@author \end{tabular}\par}
  \vfil}}


% The \copyrightspace command is used to produce a blank space in the first
% column where a copyright notice may go.  It works by producing a
% blank footnote of the appropriate size.  Note that it should appear
% after any \footnote commands that produce footnotes for the first
% column.   Adjusted to leave just 1cm.

\def\copyrightspace{\footnotetext[0]{\mbox{}\vrule height 1cm width 0pt}}

\def\abstract{\subsection*{Abstract}}
\def\endabstract{\par}

% Redefine to use smaller fonts
\def\thebibliography#1{\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
%  \section*{REFERENCES\@mkboth
  \section*{References\@mkboth                                  %no uppercase
%  {REFERENCES}{REFERENCES}}\small\list
  {References}{References}}\small\list                          %no uppercase
  {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumi}}
    \def\newblock{\hskip .11em plus .33em minus .07em}
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax}

\let\endthebibliography=\endlist

\twocolumn
\sloppy
\parindent 1em
\leftmargini 2em
\leftmargin\leftmargini
\leftmarginv .5em
\leftmarginvi .5em
\flushbottom

{\catcode`\%=12 \gdef\pscomment{% }}
\special{!\pscomment DocumentClass: JACoW-GSI-2014.cls}

%    ****************************************
%    *           authblk.sty                *
%    ****************************************
%
%%
%% This is file `authblk.sty',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% authblk.dtx  (with options: `package')
%% =============================================
%% IMPORTANT NOTICE:
%%
%% This program can be redistributed and/or modified under the terms
%% of the LaTeX Project Public License Distributed from CTAN
%% archives in directory macros/latex/base/lppl.txt; either
%% version 1 of the License, or any later version.
%%
%% This is a generated file.
%% It may not be distributed without the original source file authblk.dtx.
%%
%% Full documentation can be obtained by LaTeXing that original file.
%% Only a few abbreviated comments remain here to describe the usage.
%% =============================================
%% Copyright 1997-1999 Patrick W Daly
%% Max-Planck-Institut f\"ur Aeronomie
%% Max-Planck-Str. 2
%% D-37191 Katlenburg-Lindau
%% Germany
%% E-mail: daly@linmpi.mpg.de
%\NeedsTeXFormat{LaTeX2e}[1995/06/01]
%\ProvidesPackage{authblk}
%          [2001/02/27 1.3 (PWD)]
 %-------------------------------------------------------------------
 % NOTICE:
 % This file may be used for non-profit purposes.
 % It may not be distributed in exchange for money,
 %   other than distribution costs.
 %
 % The author provides it `as is' and does not guarantee it in any way.
 %
%% authblk coding copyright (C) 1997 Patrick W. Daly
 % Max-Planck-Institut f\"ur Aeronomie
 % Max-Planck-Str. 2
 % D-37191 Katlenburg-Lindau
 % Germany
 %
 % E-mail: daly@linmpi.mpg.de
 %-----------------------------------------------------------
 % Author/Affiliation Blocks
 % A LaTeX2e package to redefine the \author command to work as normal or
 % to allow a footnote style of author/affiliation input.
 %
 % Three methods of input:
 %  1. Standard LaTeX
 %     \author{Name1//Affil1 /and Name2 and Name3//Affil2 . . .}
 % (use \authorcr, not \\, to force new line within the author text)
 %  2. Automatic mode (selects modes 1 or 3 depending on number of affiliations)
 %     \author{Name1}
 %     \affil{Affil1}
 %     \author{Name2}
 %     \author{Name3}
 %     \affil{Affil2}
 %     . . .
 %  3. Footnotes explicitly
 %     \author[*]{Name1}
 %     \author[**]{Name2}
 %     \author[**]{Name3}
 %     \affil[*]{Affil1}
 %     \affil[**]{Affil2}
 %     . . .
 % See documentation in authblk.dtx for further configuration possibilities.
 %-----------------------------------------------------------
%\newcommand\Authfont{\normalfont}
\newcommand\Authfont{\itshape}                     % 2010 - kursiv
\newcommand\Affilfont{\normalfont}
\newcommand\Authsep{, }
\newcommand\Authands{, and }
\newcommand\Authand{ and }
\newlength{\affilsep}\setlength{\affilsep}{1em}
\newlength{\@affilsep}
\newcounter{Maxaffil}
\setcounter{Maxaffil}{2}
%\DeclareOption{blocks}{\setcounter{Maxaffil}{\maxdimen}}
%\DeclareOption{noblocks}{\setcounter{Maxaffil}{0}}
%\DeclareOption{max2}{\setcounter{Maxaffil}{2}}
%\DeclareOption{max3}{\setcounter{Maxaffil}{3}}
%\DeclareOption{max4}{\setcounter{Maxaffil}{4}}
%\DeclareOption{max5}{\setcounter{Maxaffil}{5}}
%\DeclareOption{max6}{\setcounter{Maxaffil}{6}}
%\DeclareOption{auth-sc}{\renewcommand\Authfont{\scshape}}
%\DeclareOption{auth-sc-lg}{\renewcommand\Authfont{\large\scshape}}
%\DeclareOption{auth-lg}{\renewcommand\Authfont{\large}}
%\DeclareOption{affil-sl}{\renewcommand\Affilfont{\slshape}}
%\DeclareOption{affil-it}{\renewcommand\Affilfont{\itshape}}
%\DeclareOption{german}{\renewcommand\Authand{, und }%
%                       \renewcommand\Authands{, und }}
\ProcessOptions
\newcounter{authors}
\newcounter{affil}
\newif\ifnewaffil \newaffiltrue
\newcommand\AB@authnote[1]{\textsuperscript{\normalfont#1}}
\newcommand\AB@affilnote[1]{\textsuperscript{\normalfont#1}}
\providecommand\textsuperscript[1]{$^{#1}$}
\newcommand\AB@blk@and{\protect\Authfont\protect\AB@setsep}
\newcommand\AB@pand{\protect\and \protect\Authfont \protect\AB@setsep}
\@namedef{@sep1}{}
\@namedef{@sep2}{\Authand}
\newcommand\AB@affilsep{\protect\Affilfont}
\newcommand\AB@affilsepx{\protect\\\protect\Affilfont}
\newcommand\AB@setsep{\setlength{\@affilsep}{\affilsep}}
\newcommand\AB@resetsep{\setlength{\@affilsep}{\z@}}
\newcommand\AB@authlist{}
\newcommand\AB@affillist{}
\newcommand\AB@authors{}
\newcommand\AB@empty{}
\xdef\AB@author{\noexpand\AB@blk@and\@author}
\renewcommand\author[2][]%
      {\ifnewaffil\addtocounter{affil}{1}%
       \edef\AB@thenote{\arabic{affil}}\fi
      \if\relax#1\relax\def\AB@note{\AB@thenote}\else\def\AB@note{#1}%
        \setcounter{Maxaffil}{0}\fi
      \ifnum\value{authors}>1\relax
      \@namedef{@sep\number\c@authors}{\Authsep}\fi
      \addtocounter{authors}{1}%
      \begingroup
          \let\protect\@unexpandable@protect \let\and\AB@pand
          \def\thanks{\protect\thanks}\def\footnote{\protect\footnote}%
         \@temptokena=\expandafter{\AB@authors}%
         {\def\\{\protect\\[\@affilsep]\protect\Affilfont
              \protect\AB@resetsep}%
              \xdef\AB@author{\AB@blk@and#2}%
       \ifnewaffil\gdef\AB@las{}\gdef\AB@lasx{\protect\Authand}\gdef\AB@as{}%
           \xdef\AB@authors{\the\@temptokena\AB@blk@and}%
       \else
          \xdef\AB@authors{\the\@temptokena\AB@as\AB@au@str}%
          \global\let\AB@las\AB@lasx\gdef\AB@lasx{\protect\Authands}%
          \gdef\AB@as{\Authsep}%
       \fi
       \gdef\AB@au@str{#2}}%
         \@temptokena=\expandafter{\AB@authlist}%
         \let\\=\authorcr
         \xdef\AB@authlist{\the\@temptokena
           \protect\@nameuse{@sep\number\c@authors}%
           \protect\Authfont#2\AB@authnote{\AB@note}}%
      \endgroup
      \ifnum\value{authors}>2\relax
      \@namedef{@sep\number\c@authors}{\Authands}\fi
      \newaffilfalse
}
\newcommand\authorcr{\protect\\ \protect\Authfont \protect\AB@setsep}%
\newcommand\affil[2][]%
   {\newaffiltrue\let\AB@blk@and\AB@pand
      \if\relax#1\relax\def\AB@note{\AB@thenote}\else\def\AB@note{#1}%
        \setcounter{Maxaffil}{0}\fi
      \begingroup
        \let\protect\@unexpandable@protect
        \def\thanks{\protect\thanks}\def\footnote{\protect\footnote}%
        \@temptokena=\expandafter{\AB@authors}%
        {\def\\{\protect\\\protect\Affilfont}\xdef\AB@temp{#2}}%
         \xdef\AB@authors{\the\@temptokena\AB@las\AB@au@str
         \protect\\[\affilsep]
         \protect\Affilfont\AB@temp}%
         \gdef\AB@las{}\gdef\AB@au@str{}%
        {\def\\{, \ignorespaces}\xdef\AB@temp{#2}}%
        \@temptokena=\expandafter{\AB@affillist}%
        \xdef\AB@affillist{\the\@temptokena \AB@affilsep
          \AB@affilnote{\AB@note}\protect\Affilfont\AB@temp}%
      \endgroup
       \let\AB@affilsep\AB@affilsepx
}
\def\@author{}
\renewcommand\@author{\ifx\AB@affillist\AB@empty\AB@author\else
      \ifnum\value{affil}>\value{Maxaffil}\def\rlap##1{##1}%
    \AB@authlist\\[\affilsep]\AB@affillist
    \else  \AB@authors\fi\fi}
\let\AB@maketitle=\maketitle
\def\maketitle
  {{\renewenvironment{tabular}[2][]{\begin{center}}
                                   {\end{center}}
  \AB@maketitle}}
%%
%% <<<<< End of generated file <<<<<<
%%
%% End of file `authblk.sty'.
%    ****************************************
%    *  GSI-Anpassungen für authblk.sty    *
%    ****************************************
%
\renewcommand\Affilfont{\normalfont\fontsize{10}{12}\selectfont}   %2010
\renewcommand\AB@affilsepx{; \protect\ \protect\Affilfont}
\setcounter{Maxaffil}{1}
\setlength{\affilsep}{0.3em}
\ExecuteOptions{aca4}                                              %2010
%\boldmath

%-----------------------------------------------------------------------
