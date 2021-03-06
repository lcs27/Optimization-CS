%% Language Configuration
\RequirePackage[utf8]{inputenc}%For French accents
\RequirePackage[T1]{fontenc}%For French babel
\RequirePackage{ifthen}
\newboolean{@english}
\DeclareOption{french}{
  \setboolean{@english}{false}
}
\DeclareOption{english}{
  \setboolean{@english}{true}
}
\ExecuteOptions{french}
\ProcessOptions
\LoadClass[a4paper,twoside,12pt]{article}

\ifthenelse{\boolean{@english}}{\RequirePackage[main=english,french]{babel}}{\RequirePackage[main=french,english]{babel}} 
%--------------------- Packages ------------------------%
%% Page
\RequirePackage{geometry}
\geometry{a4paper,left=2.54cm,right=2.54cm,top=3.18cm,bottom=3.18cm}
\RequirePackage{titlesec}   %Margin

%% Bibliography & Reference
\RequirePackage{natbib} %Bibliography
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{url} % Use url as reference


%% Graph & Color
\RequirePackage{graphicx} %use graph format
\RequirePackage[justification=centering]{caption} %Graph caption
\RequirePackage{subcaption} %Graph sub-caption
\RequirePackage{float} %Graph Placement
\RequirePackage{epstopdf} %Convert EPS to PDF
\RequirePackage{xcolor} 


%% Table
\RequirePackage{diagbox} %Diagonal in tables
\RequirePackage{multirow} %Multirows


%% Programming Language
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\RequirePackage{listings}
\lstdefinestyle{MATLAB}{language=Matlab,
    frame=shadowbox,
    backgroundcolor=\color{backcolour},     
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}

\lstdefinestyle{Python}{
    language=Python,
    backgroundcolor=\color{white},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}

\lstdefinestyle{Cpp}{
    language=C++,
    backgroundcolor=\color{white},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
} 

\lstdefinestyle{TeX}{
    language=TeX,
    backgroundcolor=\color{white},    
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
} 

%---------------------Footer & Graph---------------%
\newcommand{\InsertLogo}{    
    \begin{figure}[ht]
        \centering
            \includegraphics[height=3cm,keepaspectratio]{logos/margin.png}
    \end{figure}
}

\newcommand{\InsertSmallLogo}{
    \begin{picture}(2,3)
    \put(260,0){\includegraphics[height=3cm]{logos/margin.png}}
    \end{picture}
}
\newcommand{\MakeSimpleTitle}{
    \let\newtitle\@title
    \let\newauthor\@author
    \let\newdate\@date
    \maketitle
    
    
}


\newcommand{\MakeCompletTitle}{
    \thispagestyle{empty}
    \InsertLogo
    \let\newtitle\@title
    \let\newauthor\@author
    \let\newdate\@date
    \begin{center}
        \vspace{5cm}%Espace de 1cm
        \huge{\textbf{\@title}}\par
        \vspace{1.5cm}%Espace de 1cm
        \Large{\@author}\par
        \vspace{1cm}%Espace de 1cm
        \Large{\@date}\par
        \vspace{1cm}%Espace de 1cm
    \end{center}
    \newpage
}

\newcommand{\MakeContentTitle}{
    \thispagestyle{empty}
    \InsertLogo
    \let\newtitle\@title
    \let\newauthor\@author
    \let\newdate\@date
    \begin{center}
        \vspace{5cm}%Espace de 1cm
        \huge{\textbf{\@title}}\par
        \vspace{1.5cm}%Espace de 1cm
        \Large{\@author}\par
        \vspace{1cm}%Espace de 1cm
        \Large{\@date}\par
        \vspace{1cm}%Espace de 1cm
    \end{center}
    \tableofcontents
    \newpage
}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[RE,LO]{\includegraphics[height=1cm,keepaspectratio]{logos/margin.png}}
\fancyhead[CE,CO]{\newtitle}
\fancyhead[LE,RO]{\newauthor}
\fancyfoot[CE,CO]{\thepage}





%---------------- Self-defined Command--------------------%



%% Theorems
\newtheorem{proposition}{
    \ifthenelse{\boolean{@english}}{Proposition}{Proposition}
}[section]
\newtheorem{lemma}{
    \ifthenelse{\boolean{@english}}{Lemma}{Lemme}
}[section]
\newtheorem{theorem}{
    \ifthenelse{\boolean{@english}}{Theorem}{Théorème}
}[section]
\newtheorem{remark}{
    \ifthenelse{\boolean{@english}}{Remark}{Remarque}
}[section]

%% Simple Image Insert
\newcommand{\InsertFigure}[4]{
\begin{figure}[ht]
\centering
\includegraphics[scale=#2]{#1}
\caption{#3}
\label{fig: #4}
\end{figure}
}