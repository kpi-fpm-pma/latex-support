% ********** ���� ��� ��������� ������������ ������� **********
% *********  �� ����������� ������ ������� ��������� **********
% ***** ������: ������ �. �., ��������� �. �., ������ �. �. ****

% 1. ������������ ����
\ProvidesClass{bachelor_thesis}[2015/12/24 v3.0 ���� ��� ��������� ������������ �������]
\NeedsTeXFormat{LaTeX2e} % �������� ������

% 2. ����������� "����������� ����"
\LoadClass[a4paper,14pt,ukrainian,oneside]{extreport}


% 3. ����������� ������
% ����� ������
\RequirePackage{cmap}% ��� ��������� ������ � pdf
\RequirePackage[T2A]{fontenc} % ����� ��� �������� ��������� ������
\RequirePackage[cp1251]{inputenc} % ����� ��� �������� Windows'�������� ��������� cp1251
\RequirePackage[russian,ukrainian]{babel} % ����� ��� �������� ��������� �� �������� ���
\RequirePackage{pscyr} % ����� �� ������� ���������� ��������
\RequirePackage{mathtext} % ������� ������� � ����� ������������ ������
\RequirePackage{amssymb,amsfonts,amsmath,amsthm} % ������� ������� � ����� ������������ ������
\RequirePackage{textcomp} % ������� ������� � ����� ������������ ������
\RequirePackage{upgreek} % ����� ��� ������ �������� ����

% �������� ������
\RequirePackage{graphicx} % �������� ����� ��� ������� �������
\RequirePackage{subfig} % ����� ��� ������� ���������
\RequirePackage{flafter} % ����� �������, �� ������� �� ������� ������ �� �'�������� ������ ��������� �� ����� ����
\RequirePackage{caption} % ����� ��� ������������� ��������� ������� �� �������
\RequirePackage{xtab} % ����� ��� ������ �������
\RequirePackage{longtable} % ����� ��� ������ �������
\RequirePackage{multirow} % ����� ��� ��'������� ����� �������
\RequirePackage{array} % ����� ��� ����������� ��������� �������

% ������ ��� ������������ ������� �� ����
\RequirePackage[includehead, headsep=0pt, footskip=0pt, top=2cm, bottom=2cm, left=2cm, right=1cm]{geometry} % ������ ���� �������
\RequirePackage{indentfirst} % ������ ��� ������� ����� ������
\RequirePackage{hanging} % ������ ��� ��� ����� ����� ������
\RequirePackage[shortlabels]{enumitem}	% ����� ��� ������������ ������
\RequirePackage{setspace}	% ����� ��� ����, ��� ����� ���� ������ ���������� ��������
\RequirePackage{fancyhdr} % ����� �������� ��� ����������� ������� ������ �������
\RequirePackage{etoolbox} % ����� ��� ���������� �������� ������� � ���������� �� ������������ ������� �������� �� �����������

% ���� ��������� �� �����
\RequirePackage[rm,small,raggedright]{titlesec} % ����� ��� ������� ��������� ������ ���������
\RequirePackage[titles,subfigure]{tocloft} % ����� ��� ������� ��������� ������ �����

% ����� ��� ���������� ������������� ��������-�������� � "������� ��������"
\RequirePackage{url}

% ����� ��� ���������� ������ ���� ��� � ���������� ������
\RequirePackage{icomma}

% ����� ��� ����������� ������������ �������� ����
\RequirePackage{listings}

% ����� ��� ������������� ������
\RequirePackage{xkeyval}

% ����� ��� ������������ � ����
\RequirePackage[hidelinks]{hyperref}

% ����� ��� ���� �������
\RequirePackage{verbatim}


% 4. ������� �������
\frenchspacing
\doublespacing % �������� "1,5" �� �������

\renewcommand{\rmdefault}{ftm} % ������ ����� �� ������������ --- "Times New Roman" �� ������ pscyr

\newcommand{\setfontsize}[1]{\fontsize{#1pt}{#1pt}\selectfont} % ������� ��� ��������� ������ ������
\newcommand{\invcommas}[1]{\guillemotleft #1\guillemotright} % ������� ��� ����������� ������� �����

% ����� ������������ ���� ���� � ������, �� � �������� �����
\urlstyle{same}

% ����� ������� ��� ������� ������ �������
\fancypagestyle{plain}{
    \fancyhf{}
    \rhead{\thepage}
		\renewcommand{\headrulewidth}{0pt}
		\renewcommand{\footrulewidth}{0pt}
}

% ������� ��� �������� ������� ������ � ���������� ����
\binoppenalty=10000
\relpenalty=10000

% ������� ��� �������� ������������ ����������
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

% ������� ��� ��������� �������������� ������, ���� ��� �� ����� ���������� � ����
\newcommand{\uchapter}[1]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}} 

% ��� ��������� ������ ����������� ������� \uchapter
\newcommand{\intro}{\uchapter{�����}}

% ��� ��������� �������� ����������� ������� \uchapter
\newcommand{\conclusions}{\uchapter{��������}}

% ��� ��������� ������� ������� ��������� ����������� ������� \shortings
\newcommand{\shortings}{\uchapter{������ ������� ���������, ��������� � �������}}

% ����� ������� ��� ��������� �������
\newcounter{appendnum}
\newcommand{\append}[1]{
\setcounter{chapter}{0}
\setcounter{figure}{0}
\setcounter{table}{0}
\setcounter{section}{0}
\setcounter{subsection}{0}
\titleformat{\chapter}{\centering\normalsize}{\hspace{1cm}\thechapter}{0.5em}{}
\chapter*{������� \Asbuk{appendnum}\\#1}
\addcontentsline{toc}{chapter}{������� \Asbuk{appendnum}\ #1}
\addvspace{-28pt}
\preto\section{%
	\ifnum\value{section}=0\addvspace{0pt}\fi%
}
\renewcommand{\thefigure}{\Asbuk{appendnum}.\arabic{figure}}
\renewcommand{\thetable}{\Asbuk{appendnum}.\arabic{table}}
\renewcommand{\thesection}{\Asbuk{appendnum}.\arabic{section}}
\renewcommand{\thesubsection}{\Asbuk{appendnum}.\arabic{section}.\arabic{subsection}}
}
% ��������� ���������� ����� � ���������� �������
\pretocmd\append{
	\stepcounter{appendnum}
	\ifnum\Asbuk{appendnum}=� \stepcounter{appendnum}\fi
	\ifnum\Asbuk{appendnum}=� \stepcounter{appendnum}\fi
	\ifnum\Asbuk{appendnum}=� \stepcounter{appendnum}\fi
	\ifnum\Asbuk{appendnum}=� \stepcounter{appendnum}\fi
	\ifnum\Asbuk{appendnum}=� \stepcounter{appendnum}\fi
	\ifnum\Asbuk{appendnum}=� \stepcounter{appendnum}\fi
	\ifnum\Asbuk{appendnum}=� \stepcounter{appendnum}\fi
	\ifnum\Asbuk{appendnum}=� \stepcounter{appendnum}\fi
	\ifnum\Asbuk{appendnum}=� \stepcounter{appendnum}\fi
}{}{}

% ������ �������� ���� ���������
% �������� --- ��� ������
\titleformat{\chapter} % �������, �� ���������� ���� �����
			{\centering\normalsize\MakeUppercase} % ������� ������ ����� ("�� �����")
			{\hspace{1cm}\thechapter} % ������� ������ ������ ������: �� ���� ������ �����, ��� ������
			{0.5em} % ������� �� ������� � ������
			{} % �����, �� ������ ����
	
% ����� --- ��� ��������
\titleformat{\section}[block] % �������, �� ���������� ���� �������
			{\normalsize} % ������� ������ ����� (������)
			{\hspace{1.25cm}\thesection} % ������� ������ ������ ������: �� ���� ������ �����, ��� ������
			{0.5em} % ������� �� ������� � ������
			{} % �����, �� ������ ����

% ����� --- ��� �������� �� ������� ����
\titleformat{\subsection}[block] % �������, �� ���������� ���� ������� �������� ����
			{\normalsize} % ������� ������ ����� (������)
			{\hspace{1.25cm}\thesubsection} % ������� ������ ������ ������: �� ���� ������ �����, ��� ������
			{0.5em} % ������� �� ������� � ������
			{} % �����, �� ������ ����
			
% ����� ������ ������� ��� ��������� ������
\titlespacing{\chapter} % �������, �� ���������� ���� �����
			{0pt} % ������ ����
			{-28pt} % ������ ������ (����)
			{48pt} % ������ ����� (2 �����)

% ����� ������ ������� ��� ��������� ��������			
\titlespacing{\section} % �������, �� ���������� ���� �������
			{0pt} % ������ ����
			{48pt} % ������ ������ (2 �����)
			{48pt} % ������ ����� (2 �����)
			
% ����� ������ ������� ��� ��������� ������
\titlespacing{\subsection} % �������, �� ���������� ���� �����
			{0pt} % ������ ����
			{48pt} % ������ ������ (2 �����)
			{48pt} % ������ ����� (2 �����)

% ����� ������� ���, ��� �� ����� ����������� ���� �������� �������
\preto\section{%
	\ifnum\value{section}=0\addvspace{-48pt}\fi%
}

\preto\subsection{%
	\ifnum\value{subsection}=0\addvspace{-48pt}\fi%
}
			
% ����������� ����
\makeatletter
\renewcommand{\tableofcontents}{
	\clearpage
	\thispagestyle{plain}

	\begin{center}
	  \MakeUppercase{����}
	\end{center}
	
	\addvspace{42pt}
	
	\@starttoc{toc}
}
\makeatother

% ������� ������ ��������� ������
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

% ������ �������� ������, � ����������� ���������
% ����������� ������� ����
\AddEnumerateCounter{\asbuk}{\@asbuk}{\cyrm}
\setlist[itemize,1]{label=-, partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=1.7cm, leftmargin=0pt}
\setlist[itemize,2]{label=-, partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=2.25cm, leftmargin=0pt}
\setlist[enumerate,1]{label=\asbuk*), partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=1.9cm, leftmargin=0pt}
\setlist[enumerate,2]{label=\arabic*), partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=2.6cm, leftmargin=0pt}

% ����� ��������� ������
% ������ ������� �� �������
\renewcommand{\cftchapdotsep}{1}
\renewcommand{\cftsecdotsep}{1}
\renewcommand{\cftsubsecdotsep}{1}

% ������ ����� ����, �� ���������� �� ����� �������
\cftsetpnumwidth{1em}

% ������ ������� �� ������� � ����
\setlength\cftbeforechapskip{0pt}

% ��������� ��������
\renewcommand{\cftchapaftersnum}{} % �� ���� �������� ���� ������ ������ (������)
\renewcommand{\cftchapindent}{0cm} % ������ ������ ������ �� ����� ����
\renewcommand{\cftchapnumwidth}{1em} % ����� ����, �� ���������� �� ����� ������
\renewcommand{\cftchappagefont}{\mdseries} % ����� ������ ������� (���������, 14pt)
\renewcommand{\cftchapfont}{\mdseries} % ����� ��������� (���������)
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}} % ��� ����������� ������� �� ��������� �� ������ ������� (�������)

% ����� ��������� ����������
\renewcommand{\cftsecaftersnum}{} % �� ���� �������� ���� ������ �������� (������)
\renewcommand{\cftsecindent}{1em} % ������ ������ �������� �� ����� ����
\renewcommand{\cftsecnumwidth}{2em} % ����� ����, �� ���������� �� ����� ��������
\renewcommand{\cftsecpagefont}{\mdseries} % ����� ������ ������� (���������, 14pt)
\renewcommand{\cftsecfont}{\mdseries} % ����� ��������� (���������)
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}} % ��� ����������� ������� �� ��������� �� ������ ������� (�������)

% ����� ��������� ��������
\renewcommand{\cftsubsecaftersnum}{} % �� ���� �������� ���� ������ ������ (������)
\renewcommand{\cftsubsecindent}{3em} % ������ ������ ������ �� ����� ����
\renewcommand{\cftsubsecnumwidth}{2.5em} % ����� ����, �� ���������� �� ����� ������
\renewcommand{\cftsubsecpagefont}{\mdseries} % ����� ������ ������� (���������, 14pt)
\renewcommand{\cftsubsecfont}{\mdseries} % ����� ��������� (���������)
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftsubsecdotsep}} % ��� ����������� ������� �� ��������� �� ������ ������� (�������)

% ��������� �������, ������� � �������
\DeclareCaptionLabelFormat{tablecap}{������� #2} % ������ �� ������������ "����." �� ��������
\DeclareCaptionLabelFormat{figurecap}{������� #2} % ������ �� ������������ "���." �� ��������
\DeclareCaptionFormat{listing}{˳����� ����� #3} % ������ �� ������������ "Listing" �� ��������

\captionsetup[table]{margin=0pt,singlelinecheck=false, justification=justified, labelsep=endash, labelformat=tablecap, font = {stretch = 1.5}, belowskip=18pt, aboveskip=3pt} % ������ ��� �������
\captionsetup[figure]{justification=centering, labelsep=endash, labelformat=figurecap, font = {stretch = 1.5}} % ������ ��� �������
\captionsetup[lstlisting]{margin=0pt, format=listing, singlelinecheck=false, font = {stretch = 1.5}} % ������ ��� �������

\setlength{\textfloatsep}{21pt}
\setlength{\intextsep}{21pt}

% �������, �� ����� �������� ����� �� �������� � ����������
\renewcommand{\thesubfigure}{\asbuk{subfigure}}

% ���� �������� ��� ������ �������
\renewenvironment{table}[4]{
	\begingroup\centering
	\setlength{\LTpre}{-14pt}
  \setlength{\LTpost}{14pt}
  \setlength{\LTcapwidth}{0pt}
  \begin{longtable}{#1}
		\kill
		\caption{#2}\label{#3}\\
		#4
		\endfirsthead
		\kill
		\caption*{����������� ������� \thetable}\\
		#4
		\endhead
		\hline
		\endfoot
}
	{%
	\end{longtable}
	\endgroup	
}

% �������� ������� �� ��������� � ����������
\patchcmd{\thebibliography}
  {\advance\leftmargin\labelsep}
  {\leftmargin=0pt\itemindent=1.9cm\advance\itemindent\labelsep}
  {}{}

% ������� ������ ������ ��� ������� �������� (����� + ������)
\makeatletter
\renewcommand{\@biblabel}[1]{#1.}
\makeatother

% ������� ���������� ��������, ������� ������� ������ ������ �������� � ����
\let\tempbib\thebibliography
\let\tempbibend\endthebibliography
\renewenvironment{thebibliography}{
	\renewcommand{\bibname}{����˲� ��������}% ������� ���������
	\tempbib{99.}% ����������� �������� ����� ������� --- 99
	% ��� �������� ������� �� ���������
	\setlength\partopsep{0pt}
	\setlength\parskip{0pt}
	\setlength\parsep{0pt}
	\setlength\topsep{0pt}
	\setlength\itemsep{0pt}
	\addcontentsline{toc}{chapter}{������ ��������}% ������ � ����
	}
	{
	\tempbibend
}

% ���������� ������� ��� ������� �������
\newcommand{\listing}[2]{\singlespacing\lstinputlisting[language=C++, basicstyle=\tiny, breaklines=true, caption={#1}]{#2}\doublespacing}

% ��� ������� ��� ��������
% ����� ������
\newcommand{\abstractUkr}{\chapter*{�����ֲ�}\thispagestyle{empty}\renewcommand{\arraystretch}{1.5}\setfontsize{14}}
\newcommand{\abstractEng}{\chapter*{ABSTRACT}\thispagestyle{empty}\renewcommand{\arraystretch}{1.5}\setfontsize{14}}

% ���� ������� ��� ���������� ������
% \maketitlepage{params}, �� params --- �� �������� ������ ���� "��������={��������}"
% StudentName --- ϲ� ��������
% StudentMale --- ����� �������� (true, ���� ������, false --- ���� ����)
% StudentGroup --- ����� ��������
% ThesisTitle --- ���� ������ (��� �����)
% Advisor --- ������, �������� ������, ����� ������, �������, �������� �������� ������
% Reviewer --- ������, �������� ������, ����� ������, �������, �������� ����������
% ConsultantChapter --- ����� ������, ���� ������������ �����������
% Consultant --- ������, �������� ������, ����� ������, �������, �������� ������������
% ConsultantChapterSecond --- ����� ������, ���� ������������ ������ �����������
% ConsultantSecond --- ������, �������� ������, ����� ������, �������, �������� ������� ������������
% Year --- �� ������� ������
\makeatletter
\define@cmdkey[Thesis]{Title}{StudentName}{}
\define@boolkey[Thesis]{Title}{StudentMale}{}
\define@cmdkey[Thesis]{Title}{StudentGroup}{}
\define@cmdkey[Thesis]{Title}{ThesisTitle}{}
\define@cmdkey[Thesis]{Title}{Advisor}{}
\define@cmdkey[Thesis]{Title}{Reviewer}{}
\define@cmdkey[Thesis]{Title}{ConsultantChapter}{}
\define@cmdkey[Thesis]{Title}{Consultant}{}
\define@cmdkey[Thesis]{Title}{ConsultantChapterSecond}{}
\define@cmdkey[Thesis]{Title}{ConsultantSecond}{}
\define@cmdkey[Thesis]{Title}{Year}{}
\newcommand{\maketitlepage}[1]{
	  \setkeys[Thesis]{Title}{#1}
	  \thispagestyle{empty}
	  \setlength{\parindent}{0cm}
		\begingroup\centering % �����������
			\setfontsize{14}
			\textbf{\MakeUppercase{������������ ��������� ����������� ������}}
			
			\textbf{\MakeUppercase{\guillemotleft �������� ������������ ��������}}
			
			\textbf{\MakeUppercase{����� ����� ѳ���������\guillemotright}}

			\textbf{��������� ��������� ����������}
			
			\textbf{������� ��������� ����������}
		
		\endgroup
		
		\addvspace{14pt}
		
		\setlength\parindent{10cm}
			{\renewcommand{\arraystretch}{0.8}
		  \begin{tabular}{l}
				\invcommas{�� ������� ��������} \\
				�������� �������\\
				\_\_\_\_\_\_\_\_\_\_\_\_\_~�.~�.~������ \\
				\invcommas{\_\_\_\_}~\_\_\_\_\_\_\_\_\_\_\_\_\_~\cmdThesis@Title@Year\ �. \\
			\end{tabular}}
		\setlength\parindent{0cm}
			
		\addvspace{14pt}
			
		\setfontsize{20}
		\centerline{\textbf{�������� ������}}
		
		\setfontsize{14}
		\centerline{\textbf{�� �������� ������� ���������}}
		
		\addvspace{6pt}
		
		� ������� ��������� 6.040301 \invcommas{��������� ����������}

		\begin{singlespace}
			�� ����: \cmdThesis@Title@ThesisTitle
		\end{singlespace}
		
		\addvspace{14pt}
		
		\ifThesis@Title@StudentMale
			�������: �������
		\else
			��������: ���������
		\fi
  	IV �����, ����� {\cmdThesis@Title@StudentGroup} 
		
		{\renewcommand{\arraystretch}{1.0}
		 \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}>{\raggedright}p{4.6cm}>{\raggedright}p{8.25cm}l}
			& \cmdThesis@Title@StudentName &\_\_\_\_\_\_\_\_\_\_\_\_\_\\
			������� & \cmdThesis@Title@Advisor & \_\_\_\_\_\_\_\_\_\_\_\_\_\\
			\ifundef{\cmdThesis@Title@ConsultantChapter}{\relax}%
				{����������� \cmdThesis@Title@ConsultantChapter & \cmdThesis@Title@Consultant & \_\_\_\_\_\_\_\_\_\_\_\_\_\\}
			\ifundef{\cmdThesis@Title@ConsultantChapterSecond}{\relax}%
				{����������� \cmdThesis@Title@ConsultantChapterSecond & \cmdThesis@Title@ConsultantSecond & \_\_\_\_\_\_\_\_\_\_\_\_\_\\}
			����������� �� ������������� & �������~�������� ���������~�.~�. & \_\_\_\_\_\_\_\_\_\_\_\_\_\\
			��������� & \cmdThesis@Title@Reviewer & \_\_\_\_\_\_\_\_\_\_\_\_\_\\
		 \end{tabular*}}
		
		\vfill
		
		\begin{singlespace}
			\setlength\parindent{8cm}
				\begin{tabular}{l}
					��������, �� � ��� ��������� �����\\
					���� ���������� �� ����� ����� ������\\
					��� ��������� ��������.\\
					\ifThesis@Title@StudentMale
						�������
					\else
						���������
					\fi
					~\_\_\_\_\_\_\_\_\_\_\_\_\_
				\end{tabular}
			\setlength\parindent{0cm}
		\end{singlespace}
			
		\vfill
		
		\begingroup\centering
			��� --- \cmdThesis@Title@Year
			
		\endgroup
		
		\clearpage % �������� � ���� �������

		\setcounter{page}{2} % ����� ������� ���� 2
}
		
% ���� ������� ��� �������� ��������
% \assignment{params}, �� params --- �� �������� ������ ���� "��������={��������}"
%	StudentName --- ϲ� �������� � �������� ������
% StudentMale --- ����� �������� (true, ���� ������, false --- ���� ����)
%	ThesisTitle --- ���� ������ (��� �����)
%	Advisor --- ϲ�, �������� ������, ����� ������ ��������
%	Order --- ���� �� ����� ������
%	ApplicationDate --- 2. ����� ������� ��������� ������
%	InputData --- 3. ������� ���� �� ������
%	Contents --- 4. ���� ������
%	Graphics --- 5. ������ �������������� �������� 
% 6. ������������ ������ ������
% ConsultantChapter --- ����� ������, ���� ������������ �����������
% Consultant --- �������, �������� �� ������ ������������
% ConsultantChapterSecond --- ����� ������, ���� ������������ ������ �����������
% ConsultantSecond --- �������, �������� �� ������ ������� ������������
%	AssignmentDate --- 6(7). ���� ������ ��������
%	Calendar --- �������� ������� ������� � ����������� ������
% ������ ����� ������� ������� ���� ������:
% #1 & #2 & #3 & \\
% �� #1 --- ����� �/�
% #2 --- ����� ��������
% #3 --- ����� ��������� ��������
% ���� ������� �����, ���� ����������, ������� �� �������� �����
% �������� \hline
%	StudentNameShort --- �������� �� ������� �������� 
%	AdvisorNameShort --- �������� �� ������� ��������
% Year --- �� ������������ ��������
\makeatletter
\define@cmdkey[Thesis]{Assignment}{StudentName}{}
\define@boolkey[Thesis]{Assignment}{StudentMale}{}
\define@cmdkey[Thesis]{Assignment}{ThesisTitle}{}
\define@cmdkey[Thesis]{Assignment}{Advisor}{}
\define@cmdkey[Thesis]{Assignment}{Order}{}
\define@cmdkey[Thesis]{Assignment}{ApplicationDate}{}
\define@cmdkey[Thesis]{Assignment}{InputData}{}
\define@cmdkey[Thesis]{Assignment}{Contents}{}
\define@cmdkey[Thesis]{Assignment}{Graphics}{}
\define@cmdkey[Thesis]{Assignment}{ConsultantChapter}{}
\define@cmdkey[Thesis]{Assignment}{Consultant}{}
\define@cmdkey[Thesis]{Assignment}{ConsultantChapterSecond}{}
\define@cmdkey[Thesis]{Assignment}{ConsultantSecond}{}
\define@cmdkey[Thesis]{Assignment}{AssignmentDate}{}
\define@cmdkey[Thesis]{Assignment}{Calendar}{}
\define@cmdkey[Thesis]{Assignment}{StudentNameShort}{}
\define@cmdkey[Thesis]{Assignment}{AdvisorNameShort}{}
\define@cmdkey[Thesis]{Assignment}{Year}{}
\newcommand{\assignment}[1]{
	  \setkeys[Thesis]{Assignment}{#1}
	  \pagestyle{empty}
	  \setlength{\parindent}{0cm}
		\begingroup\centering % �����������
			\textbf{������������ ��������� ����������� ������}
			
			\textbf{\guillemotleft �������� ������������ ��������}
			
			\textbf{����� ����� ѳ���������\guillemotright}
		
		\endgroup

			��������� ��������� ����������
			
			������� ��������� ����������
			
			г���� ���� ����� --- ������ (�������������)
			
			������ ��������� 6.040301 \invcommas{��������� ����������}
			
			\addvspace{14pt} % ��������� ������
			
			\setlength\parindent{10cm}
			{\renewcommand{\arraystretch}{0.8}
				\begin{tabular}{l}
					\MakeUppercase{����������} \\
					�������� �������\\
					\_\_\_\_\_\_\_\_\_\_\_\_\_~�.~�.~������ \\
					\invcommas{\_\_\_\_}~\_\_\_\_\_\_\_\_\_\_\_\_\_~\cmdThesis@Assignment@Year\ �. \\
				\end{tabular}}
			\setlength\parindent{0cm}

			\addvspace{28pt} % ��������� ������
			
		\begingroup\centering
			\textbf{\MakeUppercase{��������}}

			\textbf{�� �������� ������} 
			\ifThesis@Assignment@StudentMale
				\textbf{��������}
			\else
				\textbf{���������}
			\fi

			\cmdThesis@Assignment@StudentName
			
		\endgroup

		1.~���� ������: \invcommas{\cmdThesis@Assignment@ThesisTitle},

		������� ������ \cmdThesis@Assignment@Advisor,

		����������� ������� �� ������������ �� 	\cmdThesis@Assignment@Order.

		2.~����� ������� \ifThesis@Assignment@StudentMale
			���������
		\else
			����������
		\fi ������:			\cmdThesis@Assignment@ApplicationDate.

		3.~������� ���� �� ������: \cmdThesis@Assignment@InputData.

		4.~���� ������: \cmdThesis@Assignment@Contents.

		5.~������ �������������� ��������: \cmdThesis@Assignment@Graphics.

		\ifundef{\cmdThesis@Assignment@ConsultantChapter}{6.~���� ������ ��������: \cmdThesis@Assignment@AssignmentDate}%
			{\begin{samepage}
					6.~������������ ������ ������:

					\setfontsize{12}
					\begin{center}
					\renewcommand{\arraystretch}{1.2}
					\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}|>{\raggedright}p{5.7cm}|>{\raggedright}p{5.7cm}|c|c|@{\extracolsep{\fill}}}
						\hline
						\multirow{3}{*}{\parbox[t]{5.7cm}{\centering{} �����}} & \multirow{3}{*}{\parbox[t]{5.7cm}{\centering{} �������, �������� �� ������ ������������}} & \multicolumn{2}{c|}{ϳ����, ����} \\
						\cline{3-4}
						&  & \parbox[t]{5.6em}{\centering{}��������\\�����} & \parbox[t]{5.6em}{\centering{}��������\\�������} \\
						\hline
						\cmdThesis@Assignment@ConsultantChapter & \cmdThesis@Assignment@Consultant & & \\
						\ifundef{\cmdThesis@Assignment@ConsultantChapterSecond}{\hline}%
							{\hline
							\cmdThesis@Assignment@ConsultantChapterSecond & \cmdThesis@Assignment@ConsultantSecond & & \\
							\hline}
					\end{tabular*}
					\end{center}
				\end{samepage}
				
				\setfontsize{14}
				
				7.~���� ������ ��������: \cmdThesis@Assignment@AssignmentDate
			}

		\addvspace{14pt}

		\begingroup\centering
			����������� ����

			\setfontsize{12}

			\renewcommand{\arraystretch}{1.1}
			\setlength{\LTleft}{0pt}
			\setlength{\LTright}{0pt}
			\setlength{\LTcapwidth}{0pt}
			\begin{longtable}{@{\extracolsep{\fill}}|c|>{\raggedright}p{8cm}|c|c|@{\extracolsep{\fill}}}
				\kill
				\hline
				\multirow{2}{*}{\No\ �/�} & \multirow{2}{*}{\parbox[t]{8cm}{\centering ����� ����� ���������\\�������� ������}} & \multirow{2}{*}{\parbox[t]{8em}{\centering{}����� ���������\\����� ������}} & \multirow{2}{*}{\parbox[t]{5em}{\centering{}�������}} \\
				& & & \\
				\hline
				\endfirsthead
				\kill
				\hline
				\multirow{2}{*}{\No\ �/�} & \multirow{2}{*}{\parbox[t]{8cm}{\centering{}����� ����� ���������\\�������� ������}} & \multirow{2}{*}{\parbox[t]{8em}{\centering{}����� ���������\\����� ������}} & \multirow{2}{*}{\parbox[t]{5em}{\centering{}�������}} \\
				& & & \\
				\hline
				\endhead
				\hline
				\endfoot
				\cmdThesis@Assignment@Calendar
			\end{longtable}
		\endgroup
		
		\setfontsize{14}
		
		\renewcommand{\arraystretch}{1.1}
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lrl}
			\ifThesis@Assignment@StudentMale
				�������
			\else
				���������
			\fi
			&  \_\_\_\_\_\_\_\_\_\_\_\_\_ & \cmdThesis@Assignment@StudentNameShort \\
			������� ������ & \_\_\_\_\_\_\_\_\_\_\_\_\_ & \cmdThesis@Assignment@AdvisorNameShort \\
		\end{tabular*}

		\clearpage

		\pagestyle{plain}

		\setlength{\parindent}{1.25cm} % ������ ������ ������� ����� ������ (5 �����, ��� 1,25 ��)
		
		% ������� ����� �� �� ���� �������
		\setlength{\belowdisplayskip}{21pt}
		\setlength{\abovedisplayskip}{21pt}
		\setlength{\belowdisplayshortskip}{21pt}
		\setlength{\abovedisplayshortskip}{21pt}
}
\makeatother

% ����������� ������� � ����������� � ��������
\makeatletter
\def\latex@@rquote{^\bgroup\prim@s} 
\let\hang@@h@ngrquote\h@ngrquote
\renewcommand{\h@ngrquote}{
	\relax\ifmmode
		\expandafter\latex@@rquote
	\else
		\expandafter\hang@@h@ngrquote
	\fi}
\makeatother