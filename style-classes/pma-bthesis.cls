% ******************************************************* %
%   Клас для написання бакалаврських атестаційних робіт   %
%   Автори: Тавров Д. Ю., Борисенко П. Б., Дутчак І. О.   %
%   Допомогав: Пєшков А. Г.                               %
% ******************************************************* %

% Доступні актуальні команди: TODO
% - \maketitlepage
% успадковані від класу pmabasic:
% - \annotation{заголовок}
% - \tableofcontents
% - \shortings
% - \intro
% - \conclusions
% - \begin{thebibliography} .. \end{thebibliography}

% 1. Ідентифікація класу
\ProvidesClass{pma-bthesis}[2025/06/30 v1.4.0 Клас для написання бакалаврських атестаційних робіт за ДСТУ 3008:2015 та вимогами кафедри ПМА ФПМ КПІ]
\NeedsTeXFormat{LaTeX2e} % потрібний формат

% 2. Завантаження батьківського класу
\LoadClass{pma-base}

% \maketitlepage[1] --- команда для титульного аркушу
\define@boolkey[pma]{Title}{authorIsFemale}[true]{}  % стать студента
\define@cmdkey[pma]{Title}{headOfDepartment}{} % завідувач кафедри
\define@cmdkey[pma]{Title}{program}{}          % назва програми
\define@cmdkey[pma]{Title}{specialty}{}        % назва спеціальності

\define@cmdkey[pma]{Title}{theme}{\def\theme{#1}} % тема роботи

% студент
\define@cmdkey[pma]{Title}{group}{}  % група
\define@cmdkey[pma]{Title}{author}{} % ПІБ

% регалії надаються у формі "посада, науковий степінь, вчене звання"
% керівник
\define@cmdkey[pma]{Title}{supervisorTitles}{\def\supervisorTitles{#1}} % регалії
\define@cmdkey[pma]{Title}{supervisor}{\def\supervisor{#1}}             % ПІБ

% консультант з нормоконтролю
\define@cmdkey[pma]{Title}{normConsultantTitles}{} % регалії
\define@cmdkey[pma]{Title}{normConsultant}{}       % ПІБ

% рецензент
\define@cmdkey[pma]{Title}{reviewerTitles}{} % регалії
\define@cmdkey[pma]{Title}{reviewer}{}       % ПІБ

% консультант (необов'язково)
\define@cmdkey[pma]{Title}{consultantIntro}{}  % розділи, з якими допомагав консультант
\define@cmdkey[pma]{Title}{consultantTitles}{} % регалії
\define@cmdkey[pma]{Title}{consultant}{}       % ПІБ

% year --- рік подання роботи --- успадковано від pma-base

\newcommand{\maketitlepage}[1]{
    \setkeys[pma]{Title}{%
        headOfDepartment = {Данило ТАВРОВ},%
        program = {Наука про дані та математичне моделювання},%
        specialty = {113~\inquot{Прикладна математика}},%
        authorIsFemale = {false},%
        consultantIntro = {},%
        #1}
    \ifpma@Title@authorIsFemale
        \newcommand{\stud@nom@end}{ка}
        \newcommand{\stud@dat@end}{ці}
    \else
        \newcommand{\stud@nom@end}{}
        \newcommand{\stud@dat@end}{у}
    \fi
    \newcommand{\Student@nom}{Студент\stud@nom@end}
    \newcommand{\student@nom}{студент\stud@nom@end}
    \newcommand{\student@dat}{студент\stud@dat@end}
    \begin{titlepage@base}
        \begingroup\setstretch{1}
            \vfill
            \begin{halfwidthtable}
                \inquot{До захисту допущено}\\
                Завідувач кафедри\\
                \signplace{} \cmdpma@Title@headOfDepartment\\
                \inquot{\_\_\_} \signplace{} \cmdpma@Title@year~р.
            \end{halfwidthtable}

            \vfill
            \textbf{\uppercase{Дипломна робота}}

            \textbf{на здобуття ступеня бакалавра}

            \textbf{за освітньо-професійною програмою \inquot{\cmdpma@Title@program}}

            \textbf{спеціальності \cmdpma@Title@specialty}

            \textbf{на тему: \inquot{\cmdpma@Title@theme}}

            \vfill
            \begingroup\raggedright
                Виконав:

                \student@nom{} IV курсу, групи \cmdpma@Title@group

                \cmdpma@Title@author\hfill\signplace\hspace{2cm}

                \vfill
                Керівник:

                \cmdpma@Title@supervisorTitles

                \cmdpma@Title@supervisor\hfill\signplace\hspace{2cm}

                \ifx\cmdpma@Title@consultantIntro\empty\else
                    \vfill
                    \cmdpma@Title@consultantIntro{}:

                    \cmdpma@Title@consultantTitles

                    \cmdpma@Title@consultant\hfill\signplace\hspace{2cm}
                \fi

                \vfill
                Консультант з нормоконтролю:

                \cmdpma@Title@normConsultantTitles

                \cmdpma@Title@normConsultant\hfill\signplace\hspace{2cm}

                \vfill
                Рецензент:

                \cmdpma@Title@reviewerTitles

                \cmdpma@Title@reviewer\hfill\signplace\hspace{2cm}

                \vfill
                \begin{halfwidthtable}
                    Засвідчую, що в цій дипломній роботі немає запозичень із праць інших авторів без відповідних посилань.\\
                    \Student@nom{}~\signplace{}
                \end{halfwidthtable}
            \endgroup
        \endgroup

        \vfill
    \end{titlepage@base}
}
% завдання на дипломну роботу
\newenvironment{assignment}[3]{%
    \setlength{\parindent}{0cm}
    \begingroup\centering
        \vspace*{-48pt}% (2pt + 18pt) (header) + 2em
        \textbf{Національний технічний університет України}

        \textbf{\inquot{Київський політехнічний інститут імені Ігоря Сікорського}}

        \textbf{Факультет прикладної математики}

        \textbf{Кафедра прикладної математики}

        \begingroup\raggedright
            Рівень вищої освіти --- перший (бакалаврський)

            Спеціальність --- \cmdpma@Title@specialty{}

            Освітньо-професійна програма~\inquot{\cmdpma@Title@program}

        \endgroup

        \vspace{0.5em}
        \begin{halfwidthtable}
            ЗАТВЕРДЖУЮ\\
            Завідувач кафедри\\
            \signplace{} \cmdpma@Title@headOfDepartment\\
            \inquot{\_\_\_} \signplace{} \cmdpma@Title@year~р.
        \end{halfwidthtable}

        \vspace{0.5em}
        \textbf{\MakeUppercase{Завдання}}

        \textbf{на дипломну роботу \student@dat}

        #1

    \endgroup
    \def\assignment@sign@stud{#2}
    \def\assignment@sign@cur{#3}
    \begin{list}{\arabic{enumi}.~}{
        \usecounter{enumi}
        \setlength{\topsep}{0em}
        \setlength{\parsep}{0em}
        \setlength{\parskip}{0em}
        \setlength{\itemsep}{0em}
        \setlength{\labelsep}{0em}
        \setlength{\partopsep}{0em}
        \setlength{\leftmargin}{0em}
        \setlength{\itemindent}{0em}
        \setlength{\labelwidth}{0em}
        \setlength{\rightmargin}{0em}
    }
}{%
    \end{list}
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}l@{}}
        \Student@nom & \signplace{}~\assignment@sign@stud\\
        Керівник роботи & \signplace{}~\assignment@sign@cur
    \end{tabular*}
    \setlength{\parindent}{1.25cm}
}

\newenvironment{consultants}[1][|L{5.75cm}|L{5.3cm}|C{2.5cm}|C{2.5cm}|]{%
    Консультанти розділів роботи

    \begingroup\centering
        \begin{longtable}{#1}
            \hline
            \multirow{3}{5.75cm}{\centering Розділ} &
            \multirow{3}{5.3cm}{\centering Прізвище, ініціали та посада консультанта} &
            \multicolumn{2}{c|}{Підпис, дата}\\\cline{3-4}
            && завдання видав & завдання прийняв\\\hline
            \endfirsthead
            \hline
            \multirow{3}{5.75cm}{\centering Розділ} &
            \multirow{3}{5.3cm}{\centering Прізвище, ініціали та посада консультанта} &
            \multicolumn{2}{c|}{Підпис, дата}\\\cline{3-4}
            && завдання видав & завдання прийняв\\\hline
            \endhead
            \hline
            \endfoot%
}{\end{longtable}\endgroup}

\newenvironment{calenderplan}[1][|C{0.7cm}|L{9.3cm}|C{4cm}|c|]{%
    \begingroup\centering
        Календарний план
        \begin{longtable}{#1}
            \hline № з/п &
            {\centering Назва етапу виконання\par дипломної роботи\par} &
            Термін виконання етапу роботи &
            {\centering Примітка}\\\hline
            \endfirsthead
            \kill
            \hline № з/п &
            {\centering Назва етапу виконання\par дипломної роботи\par} &
            Термін виконання етапу роботи &
            {\centering Примітка}\\\hline
            \endhead
            \hline
            \endfoot%
}{\end{longtable}\endgroup}