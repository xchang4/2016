%%% Document class for CS20 in-class problems

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs20inclass}[2016/1/22 1.0 (TS)]

%%% Create some appropriately named counters.
\newcounter{Problem}
\newcounter{Subproblem}[Problem]   % WITHIN problem: reset when
                   % *problem* is
\newcounter{Subsolution}[Problem]
\newcounter{SubproblemX}
\newcounter{SubsolutionX}
\newcommand{\nextproblem}[1]{\setcounter{Problem}{#1}}


%%% Generic header.  This gets redefined if the 'ps' or 'solution' options
%%% are specified.
\newcommand{\header}[1]
{
   \begin{center}
   {\large \bf Harvard University}\\
   {\bf Computer Science 20}\\

   \medskip
   {\bf #1}
   \end{center}
}

%%% Specify the author.
\renewcommand{\author}[1]
{
   \vspace{-0.2in}
   \begin{center}
   \it Questions and comments to #1.
   \end{center}
}

%%% Make a "problem*" environment
\newenvironment{problem*}[1]
{ % On entering environment.  
   \bigskip
   \begin{center}
   PROBLEM \mbox{#1}
   \end{center}
   \begin{small} 
   \begin{sf} 
   \begin{quote}
}
{ % On leaving environment.
   \end{quote}
   \end{sf}
   \end{small}
}

%%% Make a "problem" environment.
\newenvironment{problem}[0]
{ % On entering environment.
   \stepcounter{Problem}
   \begin{problem*}[\arabic{Problem}]
}
{ % On leaving environment.
   \end{problem*}
}



\DeclareOption{solution}{
   %% Set up for solutions
   \renewcommand{\header}[2]         % 2 ARGUMENTS: ps #, date
   {                     
    \setlength{\parskip}{0.0in}      % Use late date NONE for no lateness.
    \begin{center}
    {\large \bf Harvard University}\\
    {\bf Computer Science 20}\\
   
    \medskip
    {\bf In-Class Problems #1}\\
   
    \medskip
    {\sf
     #2
     } % end of \sf
     \end{center}
    }      % end definition of \header
   
     \renewcommand{\problem}
   {
    \stepcounter{Problem}      % gets set to 0 because of Problem's WITHIN
    \begin{center}
    \vspace{15pt}
    PROBLEM \arabic{Problem}
    \end{center}
   }
   
   \newcommand{\subproblem}         % NO ARGUMENTS
   {
    \p
    \stepcounter{Subproblem}
    {\sf (\ifthenelse{\value{Subproblem}<27}{\Alph{Subproblem}}%
    {\setcounter{SubproblemX}{\value{Subproblem}}%
    \addtocounter{SubproblemX}{-26}\Alph{SubproblemX}%
        \Alph{SubproblemX}})}
   }

   \newcommand{\subsolution}         % NO ARGUMENTS
   {
    \p
    \stepcounter{Subsolution}
    {\sf (\ifthenelse{\value{Subsolution}<27}{\Alph{Subsolution}}%
    {\setcounter{SubsolutionX}{\value{Subsolution}}%
    \addtocounter{SubsolutionX}{-26}\Alph{SubsolutionX}%
        \Alph{SubsolutionX}})}
   }
}

%%% Pass remaining options (and 11pt) to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*

%%% Load the article class, and select the amssymb, and
%%% latexsym packages.
\LoadClass[11pt]{article}
\RequirePackage{amssymb}
\RequirePackage{epsfig}
\RequirePackage{latexsym}
\RequirePackage{ifthen}
\RequirePackage{amsmath}
\RequirePackage{url}
\RequirePackage{xspace}

%%% LaTeX macros
\newcommand{\textref}[1]{{\sf [#1] }}
\newcommand{\LP}{L\&P }
\newcommand{\lpref}[1]{\textref{\LP #1}}
\newcommand{\tab}{\hspace*{0.5in}}      % * forces spaces
\newcommand{\p}{{\ \setlength{\parskip}{0.0in} \\}}
\newcommand{\vareps}{\varepsilon}

%%% Page margins
\topmargin 0pt
\advance \topmargin by -\headheight
\advance \topmargin by -\headsep
     
\textheight 8.9in
     
\oddsidemargin 0pt
\evensidemargin \oddsidemargin
\marginparwidth 0.5in
     
\textwidth 6.5in
     
% Sans-serif comments...
\newenvironment{comment}{\setlength\parindent{0.25in}\sf}{\vspace{1pc}}

% Solution environment
\newenvironment{solution}
{
   \vspace{1em}
   \noindent {\bf Solution.}\\
}
{}