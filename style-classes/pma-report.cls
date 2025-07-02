% ******************************************************* %
%   Клас для написання магістерських дисертацій           %
%   Автори: Тавров Д. Ю., Борисенко П. Б., Дутчак І. О.   %
%   Допомогав: Пєшков А. Г.                               %
% ******************************************************* %

% 1. Ідентифікація класу
\ProvidesClass{pma-report}[2025/06/30 v1.4.0 Клас для написання бакалаврських атестаційних робіт за ДСТУ 3008:2015 та вимогами кафедри ПМА ФПМ КПІ]
\NeedsTeXFormat{LaTeX2e} % потрібний формат

% 2. Завантаження батьківського класу
\LoadClass{pma-base}

% Команда для титульного аркушу
\define@cmdkey[pma]{Title}{title}[]{}
\define@cmdkey[pma]{Title}{type}[лабораторну]{}
\define@cmdkey[pma]{Title}{numero}[]{}
\define@cmdkey[pma]{Title}{subject}{}
\define@cmdkey[pma]{Title}{theme}[]{}
\define@cmdkey[pma]{Title}{variant}[]{}

\renewenvironment{titlepage}[1]{
    \setkeys*[pma]{Title}{title,type,numero,theme,variant,ministry=false,#1}
    \begin{titlepage@base}
        \vfill
        \ifx\cmdpma@Title@title\empty
            \textbf{\uppercase{Звіт}}

            про \cmdpma@Title@type\space роботу
        \else
            \cmdpma@Title@title
        \fi
        \ifx\cmdpma@Title@numero\empty
        \else
            \ifx\cmdpma@Title@title\empty\else\space\fi №\cmdpma@Title@numero
        \fi

        з дисципліни

        \inquot{\cmdpma@Title@subject}

        \ifx\cmdpma@Title@theme\empty
        \else
            на тему

            \inquot{\MakeUppercase{\cmdpma@Title@theme}}
        \fi

        \ifx\cmdpma@Title@variant\empty
        \else
            варіант \cmdpma@Title@variant
        \fi

        \vfill
        \begin{halfwidthtable}
}{
        \end{halfwidthtable}

    \vfill
    \end{titlepage@base}
}