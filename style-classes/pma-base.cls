% ******************************************************* %
%   Базовий клас для написання звітів                     %
%   Автори: Тавров Д. Ю., Борисенко П. Б., Дутчак І. О.   %
%   Допомагав: Пєшков А. Г.                               %
% ******************************************************* %

%% Відомі баги:
%% - таблиця, що іде першою на новій сторінці, відступає від верхнього поля на 1.5em

%% 1. Ідентифікація класу та необхідний формат %
\ProvidesClass{pma-base}[2025/06/05 v1.0.0 Клас для написання звітів за ДСТУ 3008:2015 та вимогами кафедри ПМА ФПМ КПІ]
\NeedsTeXFormat{LaTeX2e}

%% 2. Завантаження батьківського класу
\LoadClass[a4paper,14pt]{extreport}

%% 3. Завантаження необхідних пакетів
% Мовні пакети
\RequirePackage{fontspec} % підтримка шрифтів
\RequirePackage[english,ukrainian]{babel} % багатомовне верстання
\IfFontExistsTF{Times New Roman}{%
    \setmainfont{Times New Roman}
    \setsansfont{Arial}
    \setmonofont{Courier New}
}{%
    \setmainfont{Liberation Serif}
    \setsansfont{Liberation Sans}
    \setmonofont{Liberation Mono}
}
%% polyglossia
% \RequirePackage{polyglossia} % багатомовне верстання
% \setmainlanguage[numerals=cyrillic-alph]{ukrainian}
% \setotherlanguage{english}
% \newfontfamily\cyrillicfontrm{Times New Roman}
% \newfontfamily\cyrillicfontsf{Arial}
% \newfontfamily\cyrillicfonttt{Courier New} % TODO Liberation switch

%% legacy
% \RequirePackage{cmap}% для кодування шрифтів у pdf
% \RequirePackage[T2A]{fontenc} % пакет для підтримки кирилічних шрифтів
% \RequirePackage[utf8]{inputenc} % пакет для підтримки кодування utf8
% \RequirePackage[russian,ukrainian]{babel} % пакет для підтримки української та російської мов
% \RequirePackage{pscyr} % пакет із гарними кирилічними шрифтами
% \RequirePackage{mathtext} % потрібні символи в режимі математичних формул

% Математичні пакети
\RequirePackage{amssymb,amsfonts,amsmath,amsthm} % потрібні символи в режимі математичних формул
% \RequirePackage{textcomp} % потрібні символи в режимі математичних формул
\RequirePackage{upgreek} % пакет для прямих грецьких літер

% Графічні пакети
\RequirePackage{graphicx} % основний пакет для вставки графіки
\RequirePackage{subfig} % пакет для вставки підрисунків
\RequirePackage{flafter} % пакет гарантує, що рисунок чи таблиця ніколи не з'являться раніше посилання на самих себе
\RequirePackage{caption} % пакет для персоналізації заголовків рисунків та таблиць
\RequirePackage{longtable} % пакет для довгих таблиць
\RequirePackage{multirow} % пакет для об'єднання рядків/стовпців таблиці
\RequirePackage{array} % пакет для вирівнювання всередині таблиці
\RequirePackage{float} % специфікатор "H" для float-середовищ

% Пакети для форматування відступів та полів
\RequirePackage[ % пакет для налаштування геометрії сторінок
    includehead, % врахувати рівень верхньої нумерації ("хедер") у розмірі сторінки
    headsep=2pt, % невеликий відступ між рівнем нумерації та наповненням сторінки
    headheight=18pt, % висота хедеру
    footskip=0pt, % видалення відступу знизу сторінки
    vmargin=2cm, % вертикальні поля
    left=2cm, % ліве поле
    right=1cm % праве поле
]{geometry}
\RequirePackage{indentfirst} % відступ для першого рядка абзацу
\RequirePackage{hanging} % відступ для всіх інших рядків абзацу
\RequirePackage[shortlabels]{enumitem} % пакет для форматування списків
\RequirePackage{setspace} % пакет для задання міжрядкового інтервалу
\RequirePackage{fancyhdr} % пакет потрібний для виставлення позиції номеру сторінки
\RequirePackage{etoolbox} % пакет для прибирання висячого відступу в бібліографії та прописування умовних відстаней між заголовками

% Cтилі заголовків, змісту та структурних елементів
\RequirePackage[rm,small,raggedright]{titlesec} % пакет для ручного керування стилем заголовків
\RequirePackage[titles,subfigure]{tocloft} % пакет для ручного керування стилем змісту
\RequirePackage{url} % пакет для коректного представлення інтернет-посилань у "Переліку посилань"
\RequirePackage{icomma} % пакет для нормальних пробілів після ком у десяткових дробах
\RequirePackage{listings} % пакет для форматування вихідних кодів
\RequirePackage{xkeyval} % пакет для параметричних команд
\RequirePackage[hidelinks]{hyperref} % пакет для гіперпосилань у документі
\RequirePackage{verbatim} % пакет для кодів програм

%% 4. Основна частина
\newcommand{\setfontsize}[1]{\fontsize{#1}{#1}\selectfont} % команда для задавання розміру шрифту
% команда для створення ненумерованого структурного елементу, що показується в змісті
\newcommand{\uchapter}[1]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}
\newcommand{\inquot}[1]{\guillemotleft#1\guillemotright} % команда для французьких кутових лапок
% \renewcommand{\rmdefault}{ftm} % задаємо шрифт за промовчанням --- "Times New Roman" із пакету pscyr TODO для олдів

\fancypagestyle{empty}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}}

\fancypagestyle{plain}{% задамо стиль сторінки для позиції номеру сторінки
    \fancyhf{}% скидання стандартного стилю
    \rhead{\thepage}% номер справа зверху
    \renewcommand{\headrulewidth}{0pt}% нульова висота лінійок у хедері/футері
    \renewcommand{\footrulewidth}{0pt}}
\linespread{1.5} % міжрядковий інтервал
\setlength{\parindent}{1.25cm} % задаємо відступ першого рядка абзацу (5 знаків, або 1,25 см)
\urlstyle{same} % текст гіперпосилань буде того ж шрифту, що й основний текст
% команди для заборони розриву формул у небажаному місці
\binoppenalty=10000
\relpenalty=10000
% команди для заборони використання перенесень
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

% наводимо номер сторінки починаючи зі змісту
\preto{\tableofcontents}{\pagestyle{plain}}

% ------------------- %
% Налаштування змісту %
% ------------------- %
% додаємо нумерацію для підпунктів
\setcounter{secnumdepth}{3}
% задаємо відстань між точками
\renewcommand{\cftchapdotsep}{1}
\renewcommand{\cftsecdotsep}{1}
\renewcommand{\cftsubsecdotsep}{1}
\cftsetpnumwidth{1em} % задаємо розмір поля, що виділяється під номер сторінки
\setlength\cftbeforechapskip{0pt} % задамо відстані між рядками в змісті

% займемося розділами
\renewcommand{\cftchapaftersnum}{} % що буде писатися після номеру розділу (нічого)
\renewcommand{\cftchapindent}{0cm} % відступ номера розділу від лівого краю
\renewcommand{\cftchapnumwidth}{1em} % розмір поля, що виділяється під номер розділу
\renewcommand{\cftchappagefont}{\mdseries} % стиль номеру сторінки (звичайний, 14pt)
\renewcommand{\cftchapfont}{\mdseries} % стиль заголовку (звичайний)
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}} % чим заповнювати проміжок від заголовку до номеру сторінки (точками)

% тепер займемося підрозділами
\renewcommand{\cftsecaftersnum}{} % що буде писатися після номеру підрозділу (нічого)
\renewcommand{\cftsecindent}{1em} % відступ номера підрозділу від лівого краю
\renewcommand{\cftsecnumwidth}{2em} % розмір поля, що виділяється під номер підрозділу
\renewcommand{\cftsecpagefont}{\mdseries} % стиль номеру сторінки (звичайний, 14pt)
\renewcommand{\cftsecfont}{\mdseries} % стиль заголовку (звичайний)
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}} % чим заповнювати проміжок від заголовку до номеру сторінки (точками)

% тепер займемося пунктами
\renewcommand{\cftsubsecaftersnum}{} % що буде писатися після номеру пункту (нічого)
\renewcommand{\cftsubsecindent}{3em} % відступ номера пункту від лівого краю
\renewcommand{\cftsubsecnumwidth}{2.5em} % розмір поля, що виділяється під номер пункту
\renewcommand{\cftsubsecpagefont}{\mdseries} % стиль номеру сторінки (звичайний, 14pt)
\renewcommand{\cftsubsecfont}{\mdseries} % стиль заголовку (звичайний)
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftsubsecdotsep}} % чим заповнювати проміжок від заголовку до номеру сторінки (точками)

% ------------- %
%   Заголовки   %
% ------------- %
%%% структурні елементи, розділи --- напівжирний, великими літерами, посередині рядка
\titleformat{\chapter}
            {\centering\normalsize\MakeUppercase} % указуємо формат назви (відцентрована, заголовними літерами)
            {\hspace{1.25cm}\thechapter} % номер без крапки
            {0.5em} % відстань між номером і назвою
            {}
%%% підрозділи, пункти, підпункти --- звичайний шрифт
\titleformat{\section}[block]
            {\normalsize}
            {\hspace{1.25cm}\thesection} % абзацний відступ, номер без крапки
            {0.5em}
            {}
\titleformat{\subsection}[block]
            {\normalsize}
            {\hspace{1.25cm}\thesubsection}
            {0.5em}
            {}
\titleformat{\subsubsection}[block]
            {\normalsize}
            {\hspace{1.25cm}\thesubsubsection}
            {0.5em}
            {}

% Відступи
% структурні елементи та розділи --- 2 міжрядкові інтервали знизу
% підрозділи, пункти та підпункти --- 2 міжрядкові інтервали зверху та знизу
\titlespacing{\chapter}{0pt}{-2em}{3em}
\titlespacing{\section}{0pt}{3em}{3em}
\titlespacing{\subsection}{0pt}{3em}{3em}
\titlespacing{\subsubsection}{0pt}{3em}{3em}

% між двома заголовками різних рівнів повинна бути звичайна відстань (видаляємо 2 рядки місця)
\preto\section{\ifnum\value{section}=0\addvspace{-3em}\fi}
\preto\subsection{\ifnum\value{subsection}=0\addvspace{-3em}\fi}
\preto\subsubsection{\ifnum\value{subsubsection}=0\addvspace{-3em}\fi}

%% Рисунки, таблиці, формули, списки та лістинги
% Налаштування назв
\DeclareCaptionLabelFormat{tablecap}{Таблиця #2} % стандартний формат "Табл." не влаштовує
\DeclareCaptionLabelFormat{figurecap}{Рисунок #2} % стандартний формат "Рис." не влаштовує
\DeclareCaptionFormat{listing}{Лістинг файлу #3} % стандартний формат "Listing" не влаштовує
\renewcommand{\theequation}{\thechapter.\arabic{equation}} % змінюємо формат нумерації формул
\renewcommand{\thesubfigure}{\alph{subfigure}} % замінюємо латинські літери на кириличні в підрисунках

% Налаштування стилів назв
\DeclareCaptionLabelSeparator{emdash}{ --- }
\captionsetup[table]{% таблиці
    font={stretch=1.5},
    margin=1.25cm,
    labelsep=emdash,
    aboveskip=3pt,
    belowskip=18pt,
    labelformat=tablecap,
    justification=justified,
    singlelinecheck=false,
}
\captionsetup[figure]{% рисунки
    font={stretch=1.5},
    labelsep=emdash,
    labelformat=figurecap,
    justification=centering,
}
\captionsetup[lstlisting]{% лістинги
    font={stretch=1.5},
    format=listing,
    margin=0pt,
    aboveskip=0pt,
    singlelinecheck=false,
}

% додаємо відступи у один рядок між зображеннями, таблицями тощо.
\setlength{\textfloatsep}{1.5em}
\setlength{\intextsep}{1.5em}
\setlength{\floatsep}{1.5em}

% TODO чи треба узагальнювати?
% % підганяємо висоту рядка в таблицях, ...
% \preto\longtable{\renewcommand{\arraystretch}{1.5}}
% % ...матрицях у формулах...
% \preto\env@matrix{\renewcommand{\arraystretch}{0.6}}
% % ... та системах рівнянь
% \preto\cases{\renewcommand{\arraystretch}{0.6}}

\let\oldtable\table
\let\endoldtable\endtable
% Нове оточення для довгих таблиць
\renewenvironment{table}[4]{%
    \par\begingroup\centering
        \begin{longtable}{#1}
        \kill
        \caption{#2}\label{#3}\\
        #4
        \endfirsthead
        \kill
        \caption*{Продовження таблиці \thetable}\\
        #4
        \endhead
        \hline
        \endfoot
}{\end{longtable}\endgroup}

% Додаткові стилі для вирівнювання колонок в таблицях, приклад: C{3cm}
\@ifpackageloaded{array}{ % TODO ми реквайримо пакет, можна прибрати if
    \newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash}p{#1}}
    \newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash}p{#1}}
    \newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash}p{#1}}
}{}

% Пропуск рядка до та після формули <https://tex.stackexchange.com/a/47776>
\appto{\normalsize}{%
    \setlength{\belowdisplayskip}{21pt}%
    \setlength{\abovedisplayskip}{21pt}%
    \setlength{\belowdisplayshortskip}{21pt}%
    \setlength{\abovedisplayshortskip}{21pt}%
}

% Виправляємо помилки з апострофами в формулах
\def\latex@@rquote{^\bgroup\prim@s}
\let\hang@@h@ngrquote\h@ngrquote
\renewcommand{\h@ngrquote}{%
\relax\ifmmode
    \expandafter\latex@@rquote
\else
    \expandafter\hang@@h@ngrquote
\fi}

% задамо оновлені списки з правильними відступами
\setlist[itemize,enumerate]{partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, leftmargin=0pt}
\setlist[itemize,1]{label=---,itemindent=1.7cm}
\setlist[itemize,2]{label=---,itemindent=2.25cm}

\setlist[enumerate,1]{label=\alph*), itemindent=1.9cm} % TODO refs (ref = ...)
\setlist[enumerate,2]{label=\arabic*), itemindent=3.2cm}
\setlist[enumerate,3]{label=---, itemindent=4cm}
% TODO порахувати виступи для [itemize,3]... [itemize,4]... та [enumerate,4]...

% eqdesc --- оточення для пояснень до формул та рівнянь
\newcommand{\@makeeqdesclabel}[1]{%
    \if\theenumi0\relax{}де\stepcounter{enumi}\else\phantom{де}\fi~#1~}
\newenvironment{eqdesc}{%
    \par
    \begin{list}{\empty}{%
        \usecounter{enumi}
        \setlength{\parskip}{0cm}
        \setlength{\labelwidth}{0cm}
        \setlength{\labelsep}{0cm}
        \setlength{\itemsep}{0cm}
        \setlength{\topsep}{0cm}
        \setlength{\parsep}{0cm}
        \setlength{\partopsep}{0cm}
        \setlength{\leftmargin}{0cm}
        \let\makelabel=\@makeeqdesclabel}
}{\end{list}}

%% Лістинги
% Редагуємо стиль тіла лістингів + TODO: +doc(\lstset,\lstinputlisting) + виправити відступи до заголовків
\lstdefinestyle{thelisting}{
    basicstyle=\ttfamily\setfontsize{8pt},
    breakatwhitespace=false,
    breaklines=true,
    captionpos=t,
    keepspaces=true,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    lineskip=0pt,
    aboveskip=21pt,
    belowskip=21pt
}
\lstset{style=thelisting}

%% Розділи та структурні елементи
%% Анотації
\newcommand{\annotation}[1]{\chapter*{#1}\thispagestyle{empty}} % команда для анотації

% Додаємо автоматичний підрахунок елементів роботи для анотацій <https://tex.stackexchange.com/a/55583>
\newcounter{totfigures}
\newcounter{tottables}
\newcounter{totappendices}
\newcounter{totcitations}
\newcounter{totpages}

\providecommand\@totfig{0}
\providecommand\@tottab{0}
\providecommand\@totapp{0}
\providecommand\@totcit{0}
\providecommand\@totpages{0}
\ExplSyntaxOn
\newcommand{\@@countercases}[4]{
    \ifnum\int_mod:nn{#1}{10}=0\relax#4%
    \else
        \ifnum\int_mod:nn{#1}{10}=1\relax#2%
        \else
            \ifnum\int_mod:nn{#1}{10}<5\relax#3\else#4\fi
        \fi
    \fi
}
\newcommand{\@countercases}[4]{
    #1~%
    \ifnum\int_mod:nn{#1}{100}<10\relax
        \@@countercases{#1}{#2}{#3}{#4}%
    \else
        \ifnum\int_mod:nn{#1}{100}>20\relax
            \@@countercases{#1}{#2}{#3}{#4}%
        \else
            #4%
        \fi
    \fi
}
\ExplSyntaxOff
\newcommand{\totfig}[3]{\@countercases{\@totfig}{#1}{#2}{#3}}
\newcommand{\tottab}[3]{\@countercases{\@tottab}{#1}{#2}{#3}}
\newcommand{\totapp}[3]{\@countercases{\@totapp}{#1}{#2}{#3}}
\newcommand{\totcit}[3]{\@countercases{\@totcit}{#1}{#2}{#3}}
\newcommand{\totpages}[3]{\@countercases{\@totpages}{#1}{#2}{#3}}

\newtoggle{ismainpart} % визначаємо флаги для контролю підрахунку
\newtoggle{isappendix}
\preto{\bibitem}{\stepcounter{totcitations}} % рахуємо кількість джерел
\pretocmd{\chapter}{%
    \iftoggle{isappendix}{\stepcounter{totappendices}}{} % рахуємо кількість додатків
    \iftoggle{ismainpart}{%
        \addtocounter{totfigures}{\value{figure}} % додаємо кількості рисунків та таблиць
        \addtocounter{tottables}{\value{table}}
    }{}
    \setcounter{figure}{0}
    \setcounter{table}{0}
}{}{}
\AtEndDocument{% в кінці документу записуємо значення до .aux, щоб використати при наступній компіляції
    \addtocounter{totfigures}{\value{figure}}%
    \addtocounter{tottables}{\value{table}}%
    \immediate\write\@mainaux{%
        \string\gdef\string\@totfig{\number\value{totfigures}}%
        \string\gdef\string\@tottab{\number\value{tottables}}%
        \string\gdef\string\@totapp{\number\value{totappendices}}%
        \string\gdef\string\@totcit{\number\value{totcitations}}%
        \string\gdef\string\@totpages{\number\value{totpages}}%
    }%
}

%% Структурні елементи "Перелік умовних позначень...", "Вступ" та "Висновки"
% Додаємо окремі команди
\newcommand{\shortings}{\uchapter{Перелік умовних позначень, скорочень і термінів}}
\newcommand{\intro}{\uchapter{Вступ}\toggletrue{ismainpart}}
\newcommand{\conclusions}{\uchapter{Висновки}}

%% Перелік посилань
% Змінюємо заголовок та додаємо до змісту
\pretocmd{\bibliography}{\renewcommand{\bibname}{Перелік посилань}}{}{}
\apptocmd{\bibliography}{\addcontentsline{toc}{chapter}{Перелік посилань}}{}{}

% Змінюємо формат номеру для переліку посилань (число + крапка)
\renewcommand{\@biblabel}[1]{#1.}

% Наведемо порядок із відступами до елементів та між елементами переліку
\patchcmd{\thebibliography}
         {\advance\leftmargin\labelsep}
         {\leftmargin=0pt\itemindent=1.25cm%
          \advance\itemindent\labelsep\advance\itemindent\labelwidth%
}{}{}
\apptocmd{\thebibliography}{\parskip=0pt\itemsep=0pt}{}{}

% Змінюємо параметри форматування
\newcommand*{\DSTUAllowNamesAnd}{0} % забороняємо "та" у переліку авторів
\newcommand*{\DSTUResponsibilityName}[2]{#2} % зворотній порядок: ініціали/ім'я
\ProvideTextCommandDefault{\cyrdash}{\textendash} % перезаписуємо формат символу дефіса
\newcommand*{\DSTUAllowBibDash}{1} % вмикаємо короткі тире між фрагментами

%% Додатки
% Змінюємо формат виведення заголовків
\appto{\appendix}{
    \def\@chapter[#1]#2{% змінюємо визначення з extreport.cls
        \refstepcounter{chapter}%
        \typeout{\@chapapp\space\thechapter.}%
        \addcontentsline{toc}{chapter}{Додаток~\thechapter~#1}%
        \chaptermark{#1}%
        \begingroup\centering
            \MakeUppercase{Додаток~\thechapter}

            #1\par
        \endgroup
        \@afterheading%
        \vspace{2em}%
    }
    \addtocounter{totpages}{\number\thepage}
    \togglefalse{ismainpart}
    \toggletrue{isappendix}
}

% базове оточення для титульного аркушу
\define@cmdkey[pma]{Title}{year}{}            % рік
\define@boolkey[pma]{Title}{ministry}[true]{} % чи наводити рядок з МОН

\newenvironment{titlepage@base}{%
    \pagestyle{empty}
    \begingroup\centering
        \setlength{\parindent}{0pt}
        \vspace*{-48pt}% (2+18)pt (header) + 28pt (2em)
        \ifpma@Title@ministry
            \MakeUppercase{\textbf{Міністерство освіти і науки України}}

        \fi
        \textbf{\MakeUppercase{Національний технічний університет України}}

        \textbf{\inquot{\MakeUppercase{Київський політехнічний інститут\\імені Ігоря Сікорського}}}

        \textbf{Факультет прикладної математики}

        \textbf{Кафедра прикладної математики}

}{
    Київ --- \cmdpma@Title@year

    \endgroup
    \clearpage
}

\newenvironment{halfwidthtable}{%
    \hspace{0.5\textwidth}\begin{tabular}{@{}L{0.5\textwidth}@{}}
}{%
    \end{tabular}}

% команда для місць для підпису TODO параметр для перемикання видимості?
\newcommand{\signplace}{\_\_\_\_\_\_\_\_\_\_\_\_}
% команда для місць під дату
\newcommand{\dateplaceholder}{\inquot{\_\_}~\_\_\_\_\_\_\_\_~р.}