% create class "resume"
\ProvidesClass{resume}[Resume]

% font size and paper type
\LoadClass[7pt, a4paper]{article}

% remove paragraph indentation
\usepackage[parfill]{parskip}

% required for boldface (\bf and \bfseries) tabular columns
\usepackage{array}

% suppress page numbers
\pagestyle{empty}

%----------------------------------------------------------------------------------------
%	COMMANDS FOR PRINTING NAME
%----------------------------------------------------------------------------------------

% sets \@name to empty by default
\def \@name {}

% defines the \name command to set name
\def \name #1{
  \def \@name {#1}
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\namesize \bf \@name \hspace{0.5mm} \normalsize (He/Him)}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
% COMMANDS FOR PRINTING ADDRESSES
%----------------------------------------------------------------------------------------

% one, two or three address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% set default address separator to a diamond
\def \addressSep {$ \bullet $}

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addressone}{
    \def \@addressone {#1}
  }{
    \@ifundefined{@addresstwo}{
      \def \@addresstwo {#1}
    }{
      \@ifundefined{@addressthree}{
        \def \@addressthree {#1}
      }
    }
  }
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

%----------------------------------------------------------------------------------------
% COMMAND FOR PRINTING LINKS
%----------------------------------------------------------------------------------------

\newcommand{\link}[2]{
  \textcolor[RGB]{0, 0, 98}{\underline{\href{#1}{#2}}}
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

% save old \document command
\let\ori@document=\document
% ovewrite document
\renewcommand{\document}{
  % begin document using old \document command
  \ori@document
  % print the name specified with \name
  \printname
  % print addresses when defined
  \@ifundefined{@addressone}{}{
    \printaddress{\@addressone}
    \@ifundefined{@addresstwo}{}{
      \printaddress{\@addresstwo}
      \@ifundefined{@addressthree}{}{
        \printaddress{\@addressthree}
      }
    }
  }
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% defines the rSection environment for the large sections within the CV
% 1 input argument - section name
\newenvironment{rSection}[1]{
  % some space
  \sectionskip
  % section title
  \MakeUppercase{\bf #1}
  % some space
  \sectionlineskip
  % horizontal line
  \hrule
  % list for each individual item in the section
  \begin{list}{}{
    % margin within the section
    \setlength{\leftmargin}{0.1em}
  }
  \item[]
}{
  \end{list}
  \vspace{0.1em}
}

%----------------------------------------------------------------------------------------
% EDUCATION FORMATTING
%----------------------------------------------------------------------------------------

% defines the school environment for work experiences
% 5 input argument - school name, school status, from, to, description
\newenvironment{school}[6]{
  {\bf \large#1} \hfill {#2} \\
  {#3} \hfill {\small #4}-{\small#5}
  \begin{minipage}{6in}
    	\smallskip{#6}
  \end{minipage}
}


%----------------------------------------------------------------------------------------
%	EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

% defines the job environment for work experiences
% 6 input argument - job title, company name, location, from, to, description
\newenvironment{job}[6]{
  {\bf \large#1}  \hfill {#2} \\
  {#3}  \hfill {\small#4}-{\small#5}
  \begin{minipage}{6in}
   	 \smallskip {#6}
  \end{minipage}
}

%----------------------------------------------------------------------------------------
%	Project FORMATTING
%----------------------------------------------------------------------------------------

% defines the job environment for work experiences
% 6 input argument - job title, company name, location, from, to, description
\newenvironment{project}[4]{
  {\bf \normalsize #1} {\scriptsize #2} {\scriptsize #3}\\
  \begin{minipage}{6in}
   	 \smallskip {#4}
  \end{minipage}
}

%----------------------------------------------------------------------------------------
% AWARD FORMATTING
%----------------------------------------------------------------------------------------

% defines the award environment for work experiences
% 6 input argument - title, location, city, date, description
\newenvironment{award}[5]{
  {\bf #1} \ {\bf #2} \hfill {#3}
  \begin{minipage}{5.5in}
    \smallskip
    {#5}
  \end{minipage}
  \hfill {#4}
}

%----------------------------------------------------------------------------------------
% FONT SIZE & SKIP SIZE
%----------------------------------------------------------------------------------------

% Size of the name at the top of the document
\def \namesize {\huge}
% The space between the two address (or phone/email) lines
\def \addressskip {\smallskip}
% The space above the horizontal line for each section
\def \sectionlineskip {\medskip}
% The space after your name at the top
\def \nameskip {\medskip}
% The space after the heading section
\def \sectionskip {\medskip}
