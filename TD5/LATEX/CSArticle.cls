\RequirePackage[utf8]{inputenc}%For French accents
\RequirePackage[T1]{fontenc}%For French babel
\RequirePackage{ifthen}
\newboolean{@CSenglish}
\DeclareOption{french}{
  \setboolean{@CSenglish}{false}
}
\DeclareOption{english}{
  \setboolean{@CSenglish}{true}
}
\ProcessOptions
\ifthenelse{\boolean{@CSenglish}}{\LoadClass[english]{LCSArticle}}{\LoadClass[french]{LCSArticle}}
\fancyhead[RE,LO]{\includegraphics[height=1cm,keepaspectratio]{logos/CS.png}}

\renewcommand{\InsertLogo}{    
    \begin{figure}[ht]
        \centering
            \includegraphics[height=3cm,keepaspectratio]{logos/CS.png}
    \end{figure}}

\renewcommand{\InsertSmallLogo}{
    \begin{picture}(2,3)
    \put(-70,-20){\includegraphics[scale=0.4]{logos/CS.png}}
    \end{picture}
}