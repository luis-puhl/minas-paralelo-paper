%% ufscar.cls, 
%% Este arquivo foi modificado de:
%% eesc.cls, v1.0 athila
%% Copyright 2013 by Athila e Monaro
%========================================================================
% Identificação
%========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ufscar}%[2020/01/ v1.0 Classe Tese CCET - Teses CEntro de Ciências Exatas e de Tecnologia]

%========================================================================
% Declaração de opções
%========================================================================
% Opções:
% 	tesedr:     Formata documento para tese de doutorado
%	qualidr:    Formata documento para qualificação de doutorado
% 	dissertmst: Formata documento para dissertação de mestrado
% 	qualimst:   Formata documento para qualificação de mestrado
% -----------------------------------------------------------------------
\DeclareOption{tesedr}{
\def\@tipotrabalho{Tese}
\def\@worktype{Ph.D. Thesis}
\def\@nivelPos{Doutor}
\def\@niveltrabalho{tese}
}

\DeclareOption{qualidr}{
\def\@tipotrabalho{Qualificação de doutorado}
\def\@worktype{Ph.D. Thesis}
\def\@nivelPos{Doutor}
\def\@niveltrabalho{tese}
}

\DeclareOption{dissertmst}{
\def\@tipotrabalho{Dissertação}
\def\@worktype{Master Thesis}
\def\@nivelPos{Mestre}
\def\@niveltrabalho{dissertação}
}

\DeclareOption{qualimst}{
\def\@tipotrabalho{Qualificação de mestrado}
\def\@worktype{Master Thesis}
\def\@nivelPos{Mestre}
\def\@niveltrabalho{dissertação}
}




\ProcessOptions\relax

%=========================================================================
% Herança da classe `abntex2' e inclusão de pacotes e arquivos necessários
%=========================================================================
% \LoadClass[a4paper,12pt,twoside,openright]{abntex2}
\LoadClass[a4paper,12pt,oneside]{abntex2}

%=========================================================================
% Herança da classe `abntex2' e inclusão de pacotes e arquivos necessários
%=========================================================================
\RequirePackage{ae}
% \RequirePackage[T1]{fontenc}
% \RequirePackage{fontenc}
% \RequirePackage[latin1]{inputenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[alf,abnt-emphasize=bf,abnt-repeated-author-omit=yes,abnt-year-extra-label=yes]{abntex2cite}	% Citações padrão ABNT
% abnt-year-extra-label=yes causa warning para overleaf com TeX Live version = 2020
\RequirePackage{color}	% Controle das cores
\RequirePackage{pifont}
\RequirePackage{lastpage}
\RequirePackage{pdfpages}
\RequirePackage{calc,graphicx}
\RequirePackage{etoolbox}
% \RequirePackage{algorithm,algorithmic}
\RequirePackage{nomencl}


\counterwithout{equation}{chapter}
\setsecnumdepth{subsubsection}
\settocdepth{subsection}

\newsubfloat{figure}





% ---
% Configurações de aparência do PDF final

% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

% informações do PDF
\hypersetup{
     	%backref=true,
     	%pagebackref=true,
		%bookmarks=true,         		% show bookmarks bar?
%  		pdftitle={\imprimirtitulo}, 
% 		pdfauthor={\imprimirautor},
    	pdfsubject={\imprimirpreambulo},
		pdfkeywords={PALAVRAS}{CHAVES}{abnt}{abntex}{abntex2},
	    pdfproducer={LaTeX with abnTeX2}, 	% producer of the document
	   % pdfcreator={\imprimirautor},
    	colorlinks=true,       		% false: boxed links; true: colored links
    	linkcolor=black,          	% color of internal links
    	citecolor=black,        		% color of links to bibliography
    	filecolor=magenta,      		% color of file links
		urlcolor=black,
		bookmarksdepth=4
}
% ---
\newcommand{\rev}[1]{\textcolor{red}{[#1]}}
\renewcommand{\labelitemi}{\ding{111}}

% Comandos de dados - título do documento em português e inglês
\providecommand{\imprimirtitulo}{}
\newcommand{\@engtitle}{}
\renewcommand{\titulo}[2]{\title{#1}\renewcommand{\imprimirtitulo}{#1} \renewcommand{\@engtitle}{#2}}

% Comandos de dados - autor e autorbib
\newcommand{\@authorbib}{}
\providecommand{\imprimirautor}{}
% \renewcommand{\autor}[2]{\author{#1}\renewcommand{\imprimirautor}{#1} \renewcommand{\@authorbib}{#2}}
\renewcommand{\autor}[2]{\author{#1}\renewcommand{\imprimirautor}{#1} \renewcommand{\@authorbib}{#2}\newcommand{\authorbib}{#2}}

% --------------------------------
% Definição Geral

\renewcommand{\maketitle}{%
	% Capa
	\imprimircapa
	\imprimirfolhaderosto{}
}

%========================================================================
% Definição da capa, folha de rosto e folha de aprovação.
%========================================================================
% --- Definições de comprimento
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{120mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{120mm}

\newcommand{\@universidade}{}
\newcommand{\@universidadesigla}{}
\newcommand{\universidade}[2]{\renewcommand{\@universidade}{#1}\renewcommand{\@universidadesigla}{#2}}

\newcommand{\@centro}{}
\newcommand{\@centrosigla}{}
\newcommand{\centro}[2]{\renewcommand{\@centro}{#1}\renewcommand{\@centrosigla}{#2}}

\newcommand{\@departamento}{}
\newcommand{\@departamentosigla}{}
\newcommand{\departamento}[2]{\renewcommand{\@departamento}{#1}\renewcommand{\@departamentosigla}{#2}}

\newcommand{\@programa}{}
\newcommand{\@programasigla}{}
\newcommand{\programa}[2]{\renewcommand{\@programa}{#1}\renewcommand{\@programasigla}{#2}}

\newcommand{\@curso}{}
\newcommand{\curso}[1]{\renewcommand{\@curso}{#1}}


\instituicao
{%
	\@universidade~--~\@universidadesigla
	\par
	\@centro~--~\@centrosigla
	\par
	\@departamento~--~\@departamentosigla
	\par
	\@programa~--~\@programasigla
}

\preambulo{
	\@tipotrabalho~apresentada ao~\@programa~
	do~\@centro~da \@universidade, como parte dos requisitos para a obtenção do título de \@nivelPos~em \@curso.
}

% ---
% Impressão da Capa
\renewcommand{\imprimircapa}{%
	\thispagestyle{empty}
	\noindent
  	\begin{capa}%
    	\center
    	\parbox[b]{\textwidth}
	{
		\centering
		\vbox to \titlepagewinvoffset
		{
			\scshape\imprimirinstituicao
			\vfill
			\@formataautorcapa
			\@formatatitulocapa
		}
	}
	
	\vfill
  	\centerline{\imprimirlocal}
	\centerline{\imprimirdata}
    
  	\end{capa}
}

\def\@formataautorcapa{%

	\parbox[b]{\titlepagewinwidth}
	{%
		\centering\vbox to \titlepagewinheight
		{%
			\vspace*{\fill}
				{\Large\textbf{\imprimirautor}}
      		\vspace*{\fill}
    		}
   	}

}

\def\@formatatitulocapa{%

	\parbox[b]{\titlepagewinwidth}
	{%
		\centering\vbox to \titlepagewinheight
		{%
			\vspace*{\fill}
      			{\Large{\textbf{\imprimirtitulo}}\par}
			\vspace*{\fill}
    		}
   	}

}
% ---


% ---
% Conteudo padrao da Folha de Rosto

% Comandos de dados - Área de concentração
\providecommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\title{#1}\renewcommand{\imprimirareaconcentracao}{Área de concentração: #1}}

\makeatletter

\renewcommand{\folhaderostocontent}{


\newlength{\tampar}
\setlength{\tampar}{0.5\textwidth}
\newlength{\tamconcetracao}
\settowidth{\tamconcetracao}{\imprimirareaconcentracao}
\newlength{\tamorientador}
\settowidth{\tamorientador}{\imprimirorientadorRotulo~\imprimirorientador}
\newlength{\tamcoorientador}
\settowidth{\tamcoorientador}{\imprimircoorientadorRotulo~\imprimircoorientador}

\ifthenelse{\lengthtest{\tamconcetracao > \tampar}}{\setlength{\tampar}{\the\tamconcetracao}}{}
\ifthenelse{\lengthtest{\tamorientador>\tampar}}{\setlength{\tampar}{\the\tamorientador}}{}
\ifthenelse{\lengthtest{\tamcoorientador>\tampar}}{\setlength{\tampar}{\the\tamcoorientador}}{}


  \begin{center}

	
    \@formataautorcapa

    \@formatatitulocapa

    \abntex@ifnotempty{\imprimirpreambulo}
    {%
  		\hspace*{\fill}
  		\makebox[\tampar][l]
  		{%
    			\parbox[b]{\tampar}
    			{
    				\imprimirpreambulo\\
    				\par\imprimirareaconcentracao\\

    {\imprimirorientadorRotulo~\imprimirorientador\par}
    \abntex@ifnotempty{\imprimircoorientador}{%
       {\imprimircoorientadorRotulo~\imprimircoorientador}%
    }%
    			}
    		}
    		\vfill
    }%

  	\centerline{\imprimirlocal}
	\centerline{\imprimirdata}
	{
	}
  \end{center}
}
% ---


% ---
% Dedicatória
% ---
\newcommand{\imprimirdedicatoria}[1]{
	\begin{dedicatoria}
   		\vspace*{\fill}
   		\centering
   		\noindent
   		\textit{#1}
   		\vspace*{\fill}
	\end{dedicatoria}
}
% ---

% ---
% Agradecimentos
% ---
\newcommand{\imprimiragradecimentos}[1]{
	\begin{agradecimentos}
		#1
	\end{agradecimentos}
}
% ---

% ---
% Epígrafe
% ---
\newcommand{\imprimirepigrafe}[1]{
\begin{epigrafe}
    \vspace*{\fill}
	\begin{flushright}
		\textit{#1}
	\end{flushright}
\end{epigrafe}
}
% ---


%========================================================================
% Listas e Sumário
%========================================================================

% ---
% Lista de ilustrações
% ---
\newcommand{\listailustracoes}{
	\pdfbookmark[0]{\listfigurename}{lof}
	\listoffigures*
	\cleardoublepage
}
% ---

% ---
% Lista de tabelas
% ---
\newcommand{\listatabelas}{
	\pdfbookmark[0]{\listtablename}{lot}
	\listoftables*
	\cleardoublepage
}
% ---

% ---
% Lista de abreviaturas
% ---
\newcommand{\listasiglas}[1]{
	\thispagestyle{empty}
	\pagestyle{empty}
	\pdfbookmark[0]{Lista de siglas}{Lista de siglas} 
	\chapter*{Lista de siglas}
	\input{#1}
	\cleardoublepage
}

% ---
% Lista de algoritmos
% ---
% \floatname{algorithm}{Algoritmo}
% \renewcommand{\listalgorithmname}{Lista de algoritmos}
% \newcommand{\cftalgorithmname}{\algorithmname\space} 
% \newcommand{\listaalgoritmos}{
% 	\pdfbookmark[0]{\listalgorithmname}{loa}
% 	\thispagestyle{empty}
% 	\pagestyle{empty}
% 	\listofalgorithms
% 	\cleardoublepage
% }
\newcommand{\listaAlgoritmos}{
	% \thispagestyle{empty}
	% \pagestyle{empty}
	\pdfbookmark[0]{Lista de algoritmos}{Lista de algoritmos} 
	% \chapter*{Lista de algoritmos}
	% \input{#1}
	\listofalgorithms
	\cleardoublepage
}

% ---
% Lista de símbolos
% ---
\renewcommand{\nompreamble}{\thispagestyle{empty}}
\renewcommand\nomname{Lista de símbolos}
\newcommand{\listasimbolos}{
	\thispagestyle{empty}
	\pagestyle{empty}
	\makenomenclature
	\pdfbookmark[0]{\nomname}{los}
	\printnomenclature
	\cleardoublepage
}
% ---

% ---
% Sumário
% ---
\newcommand{\sumario}{%
	\chapter*{\contentsname}
	\pdfbookmark[0]{\contentsname}{toc}
	\thispagestyle{empty}
	\pagestyle{empty}
	\@starttoc{toc}
	\cleardoublepage}
% ---

%========================================================================
% Resumo e Abstract
%========================================================================

% ---
% Resumo
% ---
\renewenvironment{resumo}[1]
{%
	\gdef\@abstractkw{#1}
	\chapter*{Resumo}\par%
% 	\pdfbookmark[0]{Resumo}{Resumo} 
% 	\@authorbib~ \textbf{\imprimirtitulo}. \pageref{LastPage}~p.~\@tipotrabalho~ -- ~Centro de Ciências Exatas e de Tecnologia, Universidade Federal de São Carlos, \imprimirdata.\par\vspace{6ex}
}%	
{
   	\par\vspace{2ex}
   	\vspace{0.5cm}
   	\noindent\textbf{Palavras-chave:} \@abstractkw.
	\thispagestyle{empty}
	\cleardoublepage
}

% ---

% ---
% Abstract
% ---
\renewenvironment{abstract}[1]
{%
	\gdef\@abstractkw{#1}
	\chapter*{Abstract}\par%
% 	\pdfbookmark[0]{Abstract}{Abstract} 
% 	\@authorbib~ \textbf{\@engtitle}. \pageref{LastPage}~p.~\@worktype~ -- ~Exact Sciences and Technology, Federal University of São Carlos, \imprimirdata.\par\vspace{6ex}
}%	
{
   	\par\vspace{2ex}
   	\vspace{0.5cm}
   	\noindent\textbf{Keywords:} \@abstractkw.
	\thispagestyle{empty}
	\cleardoublepage
}
% ---

%=======================================================================
% Ajuste do cabeçalho e rodapé
%=======================================================================

\makepagestyle{ufscarchaplast}
\makeevenhead{ufscarchaplast}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{ufscarchaplast}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{ufscarchaplast}{\textwidth}{\normalrulethickness}


\makepagestyle{ufscarpartlast}
\makeoddhead{ufscarpartlast}{}{}{\ABNTEXfontereduzida\thepage}
\makeevenhead{ufscarpartlast}{\ABNTEXfontereduzida\thepage}{}{}


\renewcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}% customizing chapter pagestyle
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual} 


\renewcommand{\textual}{%
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
  \aliaspagestyle{cleared}{ufscarchaplast}
  \aliaspagestyle{part}{ufscarchaplast}
  \nouppercaseheads
}% Configura layout para elementos pós-textuais

\renewcommand{\postextual}{
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}
  \aliaspagestyle{cleared}{ufscarchaplast}
  \aliaspagestyle{part}{ufscarpartlast}
\aliaspagestyle{afterpart}{ufscarpartlast}

}
\renewcommand{\backmatter}{\postextual}

% ---

%=========================================================================
% Nomes Constantes
%=========================================================================
%\renewcommand{\chaptername}{Capítulo}
%\renewcommand{\partname}{Parte}

%=========================================================================
% Configurações
%=========================================================================
% --- 
% Mais exemplos https://ctan.math.illinois.edu/info/MemoirChapStyles/MemoirChapStyles.pdf
% \chapterstyle{madsen}
%\chapterstyle{default}
\chapterstyle{ger}
%\chapterstyle{bianchi}
%\chapterstyle{chappell}

% --- 
\renewcommand*{\figureautorefname}{Figura}
\renewcommand*\footnoteautorefname{Nota de Rodapé}%
\renewcommand*\itemautorefname{Item}%
\renewcommand*\tableautorefname{Tabela}%
\renewcommand*\partautorefname{Parte}%
\renewcommand*\appendixautorefname{Apêndice}%
\renewcommand*\chapterautorefname{Capítulo}%
\renewcommand*\sectionautorefname{Seção}%
\renewcommand*\subsectionautorefname{Subseção}%
\renewcommand*\subsubsectionautorefname{Subseção}%
\renewcommand*\paragraphautorefname{Parágrafo}%
\renewcommand*\subparagraphautorefname{Subparágrafo}%
\renewcommand*\FancyVerbLineautorefname{Linha}%
\renewcommand*\theoremautorefname{Teorema}%
\renewcommand*\pageautorefname{Página}%
% --- 


% ---
% Fonte padrão section, subsection e subsubsection
\renewcommand{\ABNTEXchapterfont}{\huge\bfseries}

% Tipo de trabalho para classe abntex2 (ficha catalográfica)
% ---
\tipotrabalho{\@tipotrabalho}

% --- 
% Espaçamentos entre linhas e parágrafos 
% --- 

%%% O tamanho do parágrafo é dado por:
%\setlength{\parindent}{0.5cm}

% Controle do espaçamento entre um parágrafo e outro:
%\setlength{\parskip}{0.2cm}  % tente também \onelineskip
