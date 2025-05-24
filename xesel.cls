%%%
%
% Copyright 2014 Danil Gulin
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
% http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Danil Gulin.
%
% This work consists of the file xesel.cls
%
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xesel}[2025/05/23 v1.1 Schematic Elements Listing]

% only xelatex (cyrillic strings)
\RequirePackage{ifxetex}
\RequireXeTeX

% setup base class
\LoadClass[a4paper]{article}

% setup geomtry
\RequirePackage{geometry}
\geometry{a4paper,noheadfoot,nomarginpar,top=2cm,bottom=2cm,inner=2cm,outer=.5cm}

% form drawing
\RequirePackage{atbegshi}
\RequirePackage{picture}

% content style
\RequirePackage{longtable}
\RequirePackage{array}

% fill form fields
\RequirePackage{rotating}

% enable free font sizing
\RequirePackage{lmodern}

% font size & style commands
\newcommand*{\XeselFontVv}{\fontsize{5mm}{5mm}\selectfont}
\newcommand*{\XeselFontVIIv}{\fontsize{7mm}{5mm}\selectfont}
\newcommand*{\XeselFontVIIvii}{\fontsize{7mm}{7mm}\selectfont}
\newcommand*{\XeselFontVIIviii}{\fontsize{7mm}{8mm}\selectfont}
\newcommand*{\XeselFontXx}{\fontsize{10mm}{10mm}\selectfont}

\newcommand*{\XeselFormFont}{\slshape\mdseries}
\newcommand*{\XeselDataFont}{\slshape\mdseries}

% data commands
\newcommand*{\Xesel@Designer}{}
\newcommand*{\Xesel@Checker}{}
\newcommand*{\Xesel@Inspector}{}
\newcommand*{\Xesel@Approver}{}
\newcommand*{\Xesel@ExtraState}{}
\newcommand*{\Xesel@ExtraName}{}

\newcommand*{\Xesel@DocNumber}{}
\newcommand*{\Xesel@DocName}{}
\newcommand*{\Xesel@Organisation}{}

% setup data
\newcommand*{\XeselDesignedBy} [1]{\renewcommand*{\Xesel@Designer}  {#1}}
\newcommand*{\XeselCheckedBy}  [1]{\renewcommand*{\Xesel@Checker}   {#1}}
\newcommand*{\XeselInspectedBy}[1]{\renewcommand*{\Xesel@Inspector} {#1}}
\newcommand*{\XeselApprovedBy} [1]{\renewcommand*{\Xesel@Approver}  {#1}}
\newcommand*{\XeselExtraPerson}[2]{\renewcommand*{\Xesel@ExtraState}{#1}\renewcommand*{\Xesel@ExtraName}{#2}}

\newcommand*{\XeselDocumentNumber}[1]{\renewcommand*{\Xesel@DocNumber}{#1}}
\newcommand*{\XeselDocumentName}[1]{\renewcommand*{\Xesel@DocName}{#1}}
\newcommand*{\XeselOrganisation}[1]{\renewcommand*{\Xesel@Organisation}{#1}}

\newcommand*{\XeselDocumentNameFont}{\XeselFontVIIv}
\newcommand*{\XeselDocumentNameSuffix}{\\{\XeselFontVv Перечень элементов}}

% entry commands
\newcommand*{\XeselEntry}[4]{#1 & #2 & #3 & #4 \\}
\newcommand*{\XeselHeader}[1]{& \multicolumn{1}{c}{\textbf{#1}} &&\\\nopagebreak}

% draw variables
\newlength{\ELHeight}
\newlength{\ELStampHeight}
\newcounter{ELLines}

% begin drawing
\AtBeginShipout{%
	\AtBeginShipoutUpperLeft{%
		\begin{picture}(0,0)(0,\paperheight)
			% draw border
			\linethickness{0.4mm}
			\put(20mm,5mm)  {\line(1,0){185mm}}
			\put(20mm,292mm){\line(1,0){185mm}}
			\put(20mm,5mm)  {\line(0,1){287mm}}
			\put(205mm,5mm) {\line(0,1){287mm}}
			\ifnum \thepage = 1
				\ELHeight=247mm
				\ELStampHeight=40mm
				\setcounter{ELLines}{28}
			\else
				\ELHeight=272mm
				\ELStampHeight=15mm
				\setcounter{ELLines}{31}
			\fi
			% draw extra fields
			\put(8mm,5mm){%
				\begin{picture}(0mm,0mm)
					% vertical lines
					\put(0mm,0mm){\line(0,1){145mm}}
					\put(5mm,0mm){\line(0,1){145mm}}
					% horisontal lines
					\put(0mm,  0mm){\line(1,0){12mm}}
					\put(0mm, 25mm){\line(1,0){12mm}}
					\put(0mm, 60mm){\line(1,0){12mm}}
					\put(0mm, 85mm){\line(1,0){12mm}}
					\put(0mm,110mm){\line(1,0){12mm}}
					\put(0mm,145mm){\line(1,0){12mm}}
					% text
					\put(-1mm,  0.5mm){\begin{sideways}\parbox[c][5mm][b]{24mm}{\centering\XeselFormFont\XeselFontVv Инв. № подл.}\end{sideways}}
					\put(-1mm, 25.5mm){\begin{sideways}\parbox[c][5mm][b]{34mm}{\centering\XeselFormFont\XeselFontVv Подп. и дата}\end{sideways}}
					\put(-1mm, 60.5mm){\begin{sideways}\parbox[c][5mm][b]{24mm}{\centering\XeselFormFont\XeselFontVv Взам. инв. №}\end{sideways}}
					\put(-1mm, 85.5mm){\begin{sideways}\parbox[c][5mm][b]{24mm}{\centering\XeselFormFont\XeselFontVv Инв. № дубл.}\end{sideways}}
					\put(-1mm,110.5mm){\begin{sideways}\parbox[c][5mm][b]{34mm}{\centering\XeselFormFont\XeselFontVv Подп. и дата}\end{sideways}}
				\end{picture}}
			% go to inframe drwing
			\put(20mm,5mm){%
				\begin{picture}(0mm,0mm)
					% draw table
					\put(20mm,\ELStampHeight) {\line(0,1){\ELHeight}}
					\put(130mm,\ELStampHeight){\line(0,1){\ELHeight}}
					\put(140mm,\ELStampHeight){\line(0,1){\ELHeight}}
					\put(0mm,272mm){\line(1,0){185mm}}
					\linethickness{0.2mm}
					\multiput(0,264mm)(0,-8mm){\arabic{ELLines}}{\line(1,0){185mm}}
					\linethickness{0.4mm}
					\put(  0mm,272mm){\parbox[b][15mm][c]{ 20mm}{\centering\XeselFormFont\XeselFontVIIv Поз. обозн.}}
					\put( 20mm,272mm){\parbox[b][15mm][c]{110mm}{\centering\XeselFormFont\XeselFontVIIvii Наименование}}
					\put(130mm,272mm){\parbox[b][15mm][c]{ 10mm}{\centering\XeselFormFont\XeselFontVIIvii Кол.}}
					\put(140mm,272mm){\parbox[b][15mm][c]{ 45mm}{\centering\XeselFormFont\XeselFontVIIvii Примечание}}
					%
					% draw stamp
					\put(0,\ELStampHeight){\line(1,0){185mm}}
					\ifnum \thepage = 1
					% vertical lines
						\put( 17mm,  0mm){\line(0,1){\ELStampHeight}}
						\put( 40mm,  0mm){\line(0,1){\ELStampHeight}}
						\put( 55mm,  0mm){\line(0,1){\ELStampHeight}}
						\put( 65mm,  0mm){\line(0,1){\ELStampHeight}}
						\put(  7mm, 25mm){\line(0,1){15mm}}
						\put(135mm,  0mm){\line(0,1){25mm}}
						\put(150mm, 15mm){\line(0,1){10mm}}
						\put(165mm, 15mm){\line(0,1){10mm}}
						\linethickness{0.2mm}
						\multiput(140mm, 15mm)(5mm,0mm){2}{\line(0,1){5mm}}
						\linethickness{0.4mm}
						% horisontal lines
						\put(  0mm, 25mm){\line(1,0){185mm}}
						\put(  0mm, 30mm){\line(1,0){65mm}}
						\multiput(135mm, 15mm)(0mm,5mm){2}{\line(1,0){50mm}}
						\linethickness{0.2mm}
						\multiput(0mm, 5mm)(0mm,5mm){4}{\line(1,0){65mm}}
						\put(0mm,35mm){\line(1,0){65mm}}
						\linethickness{0.4mm}
						% text
						\put( 0.5mm, 26mm){ \parbox[b][5mm][b]{ 6mm}{\centering\XeselFormFont\XeselFontVv Изм.}                    }
						\put( 7.5mm, 26mm){ \parbox[b][5mm][b]{ 9mm}{\centering\XeselFormFont\XeselFontVv Лист}                    }
						\put(17.5mm, 26mm){ \parbox[b][5mm][b]{22mm}{\centering\XeselFormFont\XeselFontVv №\ докум.}               }
						\put(40.5mm, 26mm){ \parbox[b][5mm][b]{14mm}{\centering\XeselFormFont\XeselFontVv Подп.}                   }
						\put(55.5mm, 26mm){ \parbox[b][5mm][b]{ 9mm}{\centering\XeselFormFont\XeselFontVv Дата}                    }
						%
						\put( 0.5mm, 21mm){ \parbox[b][5mm][b]{20mm}{\XeselFormFont\XeselFontVv Разраб.}                 }
						\put( 0.5mm, 16mm){ \parbox[b][5mm][b]{20mm}{\XeselFormFont\XeselFontVv Проверил}                }
						\put( 0.5mm,  6mm){ \parbox[b][5mm][b]{20mm}{\XeselFormFont\XeselFontVv Н. контр.}               }
						\put( 0.5mm,  1mm){ \parbox[b][5mm][b]{20mm}{\XeselFormFont\XeselFontVv Утв.}                    }
						%
						\put(135.5mm, 21mm){ \parbox[b][5mm][b]{14mm}{\centering\XeselFormFont\XeselFontVv Лит.}         }
						\put(150.5mm, 21mm){ \parbox[b][5mm][b]{14mm}{\centering\XeselFormFont\XeselFontVv Лист}         }
						\put(165.5mm, 21mm){ \parbox[b][5mm][b]{19mm}{\centering\XeselFormFont\XeselFontVv Листов}       }
						%
						\put(150.5mm, 16mm){ \parbox[b][5mm][b]{14mm}{\centering\XeselFormFont\XeselFontVv \thepage}           }
						\put(165.5mm, 16mm){ \parbox[b][5mm][b]{19mm}{\centering\XeselFormFont\XeselFontVv \pageref{xesel:\arabic{xesel}:lastpage}} }
						%
						\put(17.5mm, 21mm){ \parbox[b][5mm][b]{25mm}{\XeselFormFont\XeselFontVv\Xesel@Designer }}
						\put(17.5mm, 16mm){ \parbox[b][5mm][b]{25mm}{\XeselFormFont\XeselFontVv\Xesel@Checker  }}
						\put(17.5mm,  6mm){ \parbox[b][5mm][b]{25mm}{\XeselFormFont\XeselFontVv\Xesel@Inspector}}
						\put(17.5mm,  1mm){ \parbox[b][5mm][b]{25mm}{\XeselFormFont\XeselFontVv\Xesel@Approver }}
						%
						\put( 0.5mm,  11mm){ \parbox[b][5mm][b]{25mm}{\XeselFormFont\XeselFontVv\Xesel@ExtraState}}
						\put(17.5mm,  11mm){ \parbox[b][5mm][b]{25mm}{\XeselFormFont\XeselFontVv\Xesel@ExtraName }}
						%
						\put(  65mm,  25mm){ \parbox[b][15mm][c]{120mm}{\centering\XeselFormFont\XeselFontXx\Xesel@DocNumber}       }
						\put(  65mm,   0mm){ \parbox[b][25mm][c]{ 70mm}{\centering\XeselFormFont\XeselDocumentNameFont\Xesel@DocName\XeselDocumentNameSuffix}}
						\put( 135mm,   0mm){ \parbox[b][15mm][c]{ 50mm}{\centering\XeselFormFont\XeselFontVIIvii\Xesel@Organisation}}
					\else
						% vertical lines
						\put(  7mm, 0mm){\line(0,1){\ELStampHeight}}
						\put( 17mm, 0mm){\line(0,1){\ELStampHeight}}
						\put( 40mm, 0mm){\line(0,1){\ELStampHeight}}
						\put( 55mm, 0mm){\line(0,1){\ELStampHeight}}
						\put( 65mm, 0mm){\line(0,1){\ELStampHeight}}
						\put(175mm, 0mm){\line(0,1){\ELStampHeight}}
						% horisontal lines
						\put(0,     5mm){\line(1,0){65mm}}
						\put(175mm, 8mm){\line(1,0){10mm}}
						\linethickness{0.2mm}
						\put(0,    10mm){\line(1,0){65mm}}
						\linethickness{0.4mm}
						% draw text
						\put( 0.5mm, 1mm){ \parbox[b][5mm][b]{ 6mm}{\centering\XeselFormFont\XeselFontVv Изм.}                    }
						\put( 7.5mm, 1mm){ \parbox[b][5mm][b]{ 9mm}{\centering\XeselFormFont\XeselFontVv Лист}                    }
						\put(17.5mm, 1mm){ \parbox[b][5mm][b]{22mm}{\centering\XeselFormFont\XeselFontVv №\ докум.}               }
						\put(40.5mm, 1mm){ \parbox[b][5mm][b]{14mm}{\centering\XeselFormFont\XeselFontVv Подп.}                   }
						\put(55.5mm, 1mm){ \parbox[b][5mm][b]{ 9mm}{\centering\XeselFormFont\XeselFontVv Дата}                    }
						\put( 175mm, 9mm){ \parbox[b][7mm][b]{ 9mm}{\centering\XeselFormFont\XeselFontVv\centering Лист}          }
						\put( 175mm, 0mm){ \parbox[b][7mm][c]{ 9mm}{\centering\XeselFormFont\XeselFontVv\centering \arabic{page}} }
						% draw number
						\put(  65mm, 0mm){ \parbox[b][15mm][c]{110mm}{\centering\XeselFormFont\XeselFontXx \Xesel@DocNumber}}
					\fi
				\end{picture}}
		\end{picture}
	}%
}%

\pagestyle{empty}
\tabcolsep=1mm
\renewcommand*{\arraystretch}{1.0}
\setlength{\extrarowheight}{0mm}

% xesel environments counter
\newcounter{xesel}
\setcounter{xesel}{0}

% xesel environment
\newenvironment{xesel}{%
\stepcounter{xesel}
\setcounter{page}{1}
\enlargethispage{-24mm}
\XeselDataFont\XeselFontVIIviii
\begin{longtable}{>{\centering}p{18mm}p{108mm}>{\centering}p{8mm}p{43mm}}}{\label{xesel:\arabic{xesel}:lastpage}\end{longtable}}
