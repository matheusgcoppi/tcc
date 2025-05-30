% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Modelo UNIAVAN para Trabalhos Acadêmicos baseado em Modelo UFSC de 
% Alisson Lopes Furlani utilizando a classe abntex2
%
% Autor: Luiz Fernando Marquez Arruda
%
% Olá caro autor, segue aqui algumas orientações a respeito de como utilizar este 
% template.
%
% Todas as configurações a respeito de nome, curso, orientador e afins devem ser
% feitas no arquivo information.tex que se encontra na pasta setup. Assim, de forma
% automática, os nomes corretos irão aparecer em sua capa, contra-capa e afins.
%
% Todas as imagens devem submetidas para a pasta images.
%
% A lista de símbolos, siglas e acrônimos também está localizada na pasta setup e
% consta com alguns exemplos para lhe orientar a respeito de como incluir novos
% itens. Obs. os itens já listados podem ser apagados.
%
% De forma a não danificar a estruturação principal, as bibliotecas individuais
% utilizadas podem ser adicionadas no arquivo my_packages.tex localizado na pasta
% setup.
%
% Ao longo do documento você encontrará exemplos de como adicionar uma figura, uma
% tabela, fazer uma citação direta (longa e curta) e indireta.
%
% As listas e sumário são atualizados automaticamente.
% 
% Suas referencias devem ser colocadas no formato bibtex no arquivo references.bib
% na pasta raiz.
%
%                               Atualizações
%
%  04-03-22 - incorporada o pacote listings para inclusão
%             de arquivos de programação código c ou outras
%             linguagens no trabalho.
%
%  27-03-22 - ajuste do tamanho da fonte, alinhamento e 
%             posicionamento do caption da imagem
%
%  21-06-22 - Impressão da lista de simbolos
%
%  13-06-24 - Adição do GroovyScript como linguagem de programação
%
%
% Atenciosamente 
%
% Luiz Fernando M. Arruda -  13/06/2024

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------


\ProvidesClass{uniavan}[2024/06/09 V2.0]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions\relax

\LoadClass[
	% -- opções da classe memoir --
	%12pt,				% tamanho da fonte
	%openright,			% capítulos começam em pág ímpar (insere página vazia caso preciso)
	%oneside,			% para impressão no anverso. Oposto a twoside
	%twoside,
	a4paper,			% tamanho do papel. 
	% -- opções da classe abntex2 --
	%chapter=TITLE,		% títulos de capítulos convertidos em letras maiúsculas
	%section=TITLE,		% títulos de seções convertidos em letras maiúsculas
	%subsection=TITLE,	% títulos de subseções convertidos em letras maiúsculas
	%subsubsection=TITLE,% títulos de subsubseções convertidos em letras maiúsculas
	% -- opções do pacote babel --
	%english,			% idioma adicional para hifenização
	%french,			% idioma adicional para hifenização
	%spanish,			% idioma adicional para hifenização
	%brazil				% o último idioma é o principal do documento
	]{abntex2}

%--------------------------------------------------------------------------------------------------------
% PACKAGES Utilizados
%--------------------------------------------------------------------------------------------------------

\RequirePackage[T1]{fontenc}		% Selecao de codigos de fonte.
\RequirePackage{helvet}
\RequirePackage[utf8]{inputenc}		% Codificacao do documento (conversão automática dos acentos)
\RequirePackage{indentfirst}		% Indenta o primeiro parágrafo de cada seção.
\RequirePackage{color}				% Controle das cores
\RequirePackage{graphicx}			% Inclusão de gráficos
\RequirePackage[factor=1100,stretch=10,shrink=10]{microtype} 			% para melhorias de justificação
\RequirePackage{pdfpages} 			% Incluir páginas em PDF
\RequirePackage{textcase}
\RequirePackage{csquotes}
\RequirePackage[size=footnotesize]{caption} 			% necessário para longtable e alinhamento do caption*
\captionsetup{singlelinecheck=off,
              justification=raggedright}

\RequirePackage{longtable}
\RequirePackage[%
	toc=false,
	subentrycounter,
	seeautonumberlist,
	nonumberlist,
	nogroupskip,
	nomain,
	shortcuts,   % criação de atalhos
	acronym,  % criação de acrônimos  	
	translate=babel, % Faz o papel de \providetranslation
	nopostdot  % Não é colocado ponto ao final da entrada
]{glossaries-extra}
% Fonte helvética (e epigrafica para letras gregas) para matemática
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{icomma}

\RequirePackage{colortbl} % colorir tabelas
\RequirePackage{multirow} %c manuseio de tabelas
\RequirePackage[table]{xcolor} % colorir tabelas
\RequirePackage{upgreek} % colocar X na tabela
\RequirePackage{hyphenat} % permitir não separação de silabas 
\RequirePackage{quoting} % permite ajustar margem a direita para epigrafe

\RequirePackage{subcaption} % permitir mais de uma figura

\renewcommand{\familydefault}{epigrafica} 
\RequirePackage[italic,defaultmathsizes,LGRgreek,itgreek]{mathastext}%eulergreek
\renewcommand{\familydefault}{\sfdefault}
\Mathastext
\RequirePackage{bm}

%--------------------------------------------------------------------------------------------------------
% Packages para Referências Bibliográficas
%--------------------------------------------------------------------------------------------------------
\RequirePackage[backend=biber,style=abnt,repeatfields,maxbibnames=9,maxcitenames=3,uniquelist=false, uniquename=full]{biblatex}
\RequirePackage{url}
% Ajusta espaçamento entre referências
\setlength\bibitemsep{\baselineskip}
% Ajusta textos
\DeclareFieldFormat{url}{\bibstring{urlfrom}\addcolon\addspace\url{#1}}
\DefineBibliographyStrings{brazil}{%
	sineloco     = {\mkbibemph{S\adddot l\adddot}},%
	sinenomine   = {\mkbibemph{s\adddot n\adddot}},%
	andothers    = {\mkbibemph{et\addabbrvspace al\adddot}},%
	involumes    = {\mkbibemph{In}},%
	in           = {\mkbibemph{In}},%
	inseries     = {\mkbibemph{In}}
}

% Ajusta citação do mesmo autor e ano (repete ano junto com etiqueta, ao contratio de somente apresentar etiqueta)
\renewbibmacro*{cite}{% >>>3
\iffieldundef{shorthand}%
{\ifthenelse{\ifnameundef{labelname}\OR\iffieldundef{labelyear}}%
	{\usebibmacro{cite:label}%
		\setunit{\printdelim{nonameyeardelim}}%
		\usebibmacro{cite:labeldate+extradate}%
		\usebibmacro{cite:reinit}}%
	{\iffieldequals{namehash}{\cbx@lasthash}%
		{\ifthenelse{\iffieldequals{labelyear}{\cbx@lastyear}\AND%
				\(\value{multicitecount}=0\OR\iffieldundef{postnote}\)}%
			{\setunit{\compcitedelim}%\setunit{\addcomma}% CHANGED
				\usebibmacro{cite:labeldate+extradate}}%\usebibmacro{cite:extradate}}% CHANGED
			{\setunit{\compcitedelim}%
				\usebibmacro{cite:labeldate+extradate}%
				\savefield{labelyear}{\cbx@lastyear}}}%
		{% Use `bibhyperref` for the `labelname`
			\printtext[bibhyperref]{\printnames{labelname}}%
			\setunit{\printdelim{nameyeardelim}}%
			\usebibmacro{cite:labeldate+extradate}%
			\savefield{namehash}{\cbx@lasthash}%
			\savefield{labelyear}{\cbx@lastyear}}}}%
{\usebibmacro{cite:shorthand}%
	\usebibmacro{cite:reinit}}%
\setunit{\multicitedelim}}% <<<3

%--------------------------------------------------------------------------------------------------------
% Packages para código fonte
%--------------------------------------------------------------------------------------------------------
\RequirePackage{listings}
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
\definecolor{darkgreen}{rgb}{0.0, 0.5, 0.0}

\lstset{ 
    backgroundcolor=\color{white},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}; should come as last argument
    %basicstyle=\footnotesize,        % the size of the fonts that are used for the code
    basicstyle=\small,
    breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
    breaklines=true,                 % sets automatic line breaking
    postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space},
    captionpos=b,                    % sets the caption-position to bottom
    commentstyle=\color{mygreen},    % comment style
    deletekeywords={...},            % if you want to delete keywords from the given language
    escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
    extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
    firstnumber=1,                   % start line enumeration with line 0
    %frame=single,	                 % adds a frame around the code
    frame=lines,	                 % adds a frame around the code
    keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
    keywordstyle=\color{blue},       % keyword style
    morekeywords={*,...},            % if you want to add more keywords to the set
    numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
    numbersep=5pt,                   % how far the line-numbers are from the code
    numberstyle=\small\color{black}, % the style that is used for the line-numbers
    rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
    showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
    showstringspaces=false,          % underline spaces within strings only
    showtabs=false,                  % show tabs within strings adding particular underscores
    stepnumber=1,                    % the step between two line-numbers. If it's 1, each line will be numbered
    stringstyle=\color{mymauve},     % string literal style
    tabsize=2,	                     % sets default tabsize to 2 spaces
    title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title
}

\lstset{literate=
  {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
  {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
  {à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
  {À}{{\`A}}1 {È}{{\`E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
  {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
  {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
  {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
  {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
  {ã}{{\~a}}1 {ẽ}{{\~e}}1 {ĩ}{{\~i}}1 {õ}{{\~o}}1 {ũ}{{\~u}}1
  {Ã}{{\~A}}1 {Ẽ}{{\~E}}1 {Ĩ}{{\~I}}1 {Õ}{{\~O}}1 {Ũ}{{\~U}}1
  {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
  {ű}{{\H{u}}}1 {Ű}{{\H{U}}}1 {ő}{{\H{o}}}1 {Ő}{{\H{O}}}1
  {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {Ø}{{\O}}1 {å}{{\r a}}1 {Å}{{\r A}}1
  {€}{{\euro}}1 {£}{{\pounds}}1 {«}{{\guillemotleft}}1
  {»}{{\guillemotright}}1 {ñ}{{\~n}}1 {Ñ}{{\~N}}1 {¿}{{?`}}1 {¡}{{!`}}1 
}

% Define Groovy Script language for listings
\lstdefinelanguage{GroovyScript}{
    keywords={as, assert, break, case, catch, class, const, continue, def, default, do, else, enum, extends, false, finally, for, goto, if, implements, import, in, instanceof, interface, new, null, package, return, super, switch, this, throw, throws, trait, true, try, while, abstract, static, volatile, transient, synchronized, native, with},
    keywordstyle=\color{blue}\bfseries,
    ndkeywords={String, Integer, Boolean, List, Map, Set, void, println},
    ndkeywordstyle=\color{purple}\bfseries,
    sensitive=true,
    comment=[l]{//},
    morecomment=[s]{/*}{*/},
    commentstyle=\color{darkgreen}\ttfamily,
    stringstyle=\color{red}\ttfamily,
    morestring=[b]',
    morestring=[b]",
}

% Define JSON language for listings
\lstdefinelanguage{json}{
	showstringspaces=false,
    breaklines=true,
    literate=
     *{0}{{{\color{blue}0}}}{1}
      {1}{{{\color{blue}1}}}{1}
      {2}{{{\color{blue}2}}}{1}
      {3}{{{\color{blue}3}}}{1}
      {4}{{{\color{blue}4}}}{1}
      {5}{{{\color{blue}5}}}{1}
      {6}{{{\color{blue}6}}}{1}
      {7}{{{\color{blue}7}}}{1}
      {8}{{{\color{blue}8}}}{1}
      {9}{{{\color{blue}9}}}{1}
      {:}{{{\color{darkgreen}{:}}}}{1}
      {,}{{{\color{darkgreen}{,}}}}{1}
      {\{}{{{\color{red}{\{}}}}{1}
      {\}}{{{\color{red}{\}}}}}{1}
      {[}{{{\color{red}{[}}}}{1}
      {]}{{{\color{red}{]}}}}{1},
}

\renewcommand{\lstlistingname}{Código-Fonte}% Listing -> Código-Fonte
\renewcommand{\lstlistlistingname}{Lista de Códigos-Fonte}% List of Listings -> Lista de Códigos-Fonte

%--------------------------------------------------------------------------------------------------------
% Criação de Comandos
%--------------------------------------------------------------------------------------------------------
% Só dá entrada na lista. Ainda não funciona com o limarka
\newcommand{\siglalista}[2]{\newacronym{#1}{#1}{#2}} 

\newglossary{simbolos}{simbolos}{sbl}{simbolos}

% Só dá entrada na lista. Ainda não funciona com o limarka
\newcommand{\simbololista}[3]{\newglossaryentry{#1}{%
		type=simbolos, 
		name=#2, 
		description=#3}}


\newglossary{glossario}{glossario}{glo}{glossario}		
\newcommand{\glossariolista}[2]{\newglossaryentry{#1}{%
		type=glossario, 
		name=#1, 
		description=#2}}

% imrpime lista de siglas ordenado alfabeticamente
\newcommand{\imprimirlistadesiglas}{%
	\pdfbookmark[0]{\listadesiglasname}{acn}	
	\printnoidxglossary[
	style=mylong1,
	type=acronym,
	sort=letter,
	title={\listadesiglasname}
	]
	\cleardoublepage
}

% imprime lista de figuras
\newcommand{\imprimrilistadefiguras}{%
	\pdfbookmark[0]{\listfigurename}{lof}
	\listoffigures*
	\cleardoublepage
}

% imprime lista de quadros
\newcommand{\imprimirlistadequadros}{%
	\pdfbookmark[0]{\listofquadrosname}{loq}
	\listofquadros*
	\cleardoublepage
}

% imprime lista de tabelas
\newcommand{\imprimirlistadetabelas}{%
	\pdfbookmark[0]{\listtablename}{lot}	
	\listoftables*
	\cleardoublepage
}

% imprime lista de símbolos na ordem em que aparece no texto
\newcommand{\imprimirlistadesimbolos}{%
	\pdfbookmark[0]{\listadesimbolosname}{sbl}
	\printnoidxglossary[
	style=mylong2,
	type=simbolos, 
	sort=use,
	title={\listadesimbolosname}
	]
	\cleardoublepage
}

%imprime sumario
\newcommand{\imprimirsumario}{%
    \pdfbookmark[0]{\contentsname}{toc}
	\tableofcontents*
	\cleardoublepage
}

% imprime glossário
\newcommand{\imprimirglossario}{
	\cleardoublepage
	\pdfbookmark[0]{\glossaryname}{glo}	
	\printnoidxglossary[
	style=mylong1,
	type=glossario, 
	sort=use,
	title={\glossaryname}
	]
}

% Faz SECTION maíusculo inclusive no sumário
\makeatletter
\let\oldcontentsline\contentsline
\def\contentsline#1#2{%
	\expandafter\ifx\csname l@#1\endcsname\l@section
	\expandafter\@firstoftwo
	\else
	\expandafter\@secondoftwo
	\fi
	{%
		\oldcontentsline{#1}{\MakeTextUppercase{#2}}%
	}{%
		\oldcontentsline{#1}{#2}%
	}%
}
\makeatother

% Cria comandos
\newcommand{\ifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}
\newcommand{\ifnotdefined}[3]{\ifdefined #1 #3 \else #2 \fi}

% Comandos de entrada de dados
\providecommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\imprimirsubtitulo}{#1}}

\providecommand{\imprimircurso}{}
\newcommand{\curso}[1]{\renewcommand{\imprimircurso}{#1}}

\providecommand{\imprimirformacao}{}
\newcommand{\formacao}[1]{\renewcommand{\imprimirformacao}{#1}}

\providecommand{\imprimirnivel}{}
\newcommand{\nivel}[1]{\renewcommand{\imprimirnivel}{#1}}

\providecommand{\imprimirarea}{}
\newcommand{\area}[1]{\renewcommand{\imprimirarea}{#1}}

\providecommand{\imprimirinstituicaosigla}{}
\newcommand{\instituicaosigla}[1]{\renewcommand{\imprimirinstituicaosigla}{#1}}
\providecommand{\imprimirano}{}
\newcommand{\ano}[1]{\renewcommand{\imprimirano}{#1}}

\newcommand{\coordenadorname}{Coordenador}
\providecommand{\imprimircoordenadorRotulo}{}
\providecommand{\imprimircoordenador}{}
\newcommand{\coordenador}[2][\coordenadorname]%
{\renewcommand{\imprimircoordenadorRotulo}{#1}%
	\renewcommand{\imprimircoordenador}{#2}}

% --- 
% Sumários
% --- 
\setlength{\cftbeforechapterskip}{0pt}

\renewcommand{\cftpartfont}{\ABNTEXpartfont}
\renewcommand{\cftpartpagefont}{\cftpartfont}

\renewcommand{\cftchapterfont}{\ABNTEXchapterfont}
\renewcommand{\cftchapterpagefont}{\cftchapterfont}

\renewcommand{\cftsectionfont}{\ABNTEXsectionfont}
\renewcommand{\cftsectionpagefont}{\cftsectionfont}

\renewcommand{\cftsubsectionfont}{\ABNTEXsubsectionfont}
\renewcommand{\cftsubsectionpagefont}{\cftsubsectionfont}

\renewcommand{\cftsubsubsectionfont}{\ABNTEXsubsubsectionfont}
\renewcommand{\cftsubsubsectionpagefont}{\cftsubsubsectionfont}

\renewcommand{\cftparagraphfont}{\ABNTEXsubsubsubsectionfont}
\renewcommand{\cftparagraphpagefont}{\cftparagraphfont}
% --- 

% ---
% Impressão da Capa
% ---
\renewcommand{\imprimircapa}
{%
	\begin{capa}%
		\OnehalfSpacing
		\centering   
		\includegraphics[width=7.5cm,keepaspectratio]{setup/logo.png}\par%     
		\MakeTextUppercase{\textbf{\imprimirautor}}\par%
		\vspace*{13\baselineskip}
		\MakeTextUppercase{\textbf{\imprimirtitulo}}
		\ifnotempty{\imprimirsubtitulo}{\MakeTextUppercase{\textbf{:~\imprimirsubtitulo}}}\par% 
		\vfill
		{%
			\imprimirlocal\par%
			\imprimirano\par%
		}
	\end{capa}
} 
% ---

% --- 
% Reformata Folha de Rosto
% --- 
\makeatletter
\renewcommand{\folhaderostocontent}
{%
	\OnehalfSpacing
	\centering   
	\vbox to 10cm{%12
		\MakeTextUppercase{\textbf{\imprimirautor}}\par% 
		\vspace*{\fill}
		\MakeTextUppercase{\textbf{\imprimirtitulo}}%
		\abntex@ifnotempty{\imprimirsubtitulo}{:~\MakeTextUppercase{\textbf{\imprimirsubtitulo}}}\par% 
	}
	\vspace*{\fill}
	\abntex@ifnotempty{\imprimirpreambulo}{%
		\begin{adjustwidth*}{8cm}{}             
			{\footnotesize
				\begin{SingleSpace}
				    \imprimirpreambulo
				    \newline
				    \newline
				    \newline%
					\imprimirorientadorRotulo:~\imprimirorientador\newline%
					\abntex@ifnotempty{\imprimircoorientador}{\imprimircoorientadorRotulo:~\imprimircoorientador}%
				\end{SingleSpace}%
			}
		\end{adjustwidth*}
	}
	\vspace*{\fill}
	\imprimirlocal\par% 
	\imprimirano            
}
\makeatother
% ---

% Cria comando para referenciar Anexo automaticamente \refanexo
\newcommand{\refanexo}[1]{\hyperref[#1]{Anexo~\ref{#1}}}


%-------------------------------------------------------------------------------------------------------
% Configurações Gerais
%--------------------------------------------------------------------------------------------------------

%--
%hyphenation
%--
\hyphenation{UNIAVAN}
\hyphenation{AVANTIS}
% ---

% inclusão do acento
\DeclareUnicodeCharacter{0301}{\'{e}}


% Muda equação para 'Equação (n)'
\counterwithout{equation}{chapter}
\let\origtheequation\theequation
\makeatletter
\def\tagform@#1{\maketag@@@{\ignorespaces#1\unskip\@@italiccorr}}
\makeatother
\renewcommand{\theequation}{(\origtheequation)}
\providecommand*{\equationautorefnameplural}{Equações}

% Fix large symbols 
\DeclareSymbolFont{largesymbols}{OMX}{helvet}{m}{n}
\DeclareMathAccent{\wideparen}{\mathord}{largesymbols}{"F3} 

% Ajuste do tamanho das fontes matemáticas
\DeclareMathSizes{12}{12}{10}{7}

% Retira o espaço do pacote glossaries
\renewcommand{\glossarypreamble}{\vspace{-0.2cm}} 

% Criação de estilo
\newglossarystyle{mylong1}{% modificado de https://tex.stackexchange.com/a/166209/151962
	\setglossarystyle{long}%
	\renewenvironment{theglossary}%
	{\begin{longtable*}[l]{@{}p{\dimexpr 3.0cm-\tabcolsep}p{0.78\hsize}}}% <-- change the value here
		{\end{longtable*}}%
}

% Só um pequeno recuo em relação ao primeiro
\newglossarystyle{mylong2}{% modificado de https://tex.stackexchange.com/a/166209/151962
	\setglossarystyle{long}%
	\renewenvironment{theglossary}%
	{\begin{longtable*}[l]{@{}p{\dimexpr 2.0cm-\tabcolsep}p{0.86\hsize}}}% <-- change the value here
		{\end{longtable*}}%
}

\addto\captionsbrazil{
	%% ajusta nomes padroes do babel
	\renewcommand{\bibname}{Referências}
	\renewcommand{\indexname}{Índice}
	\renewcommand{\listfigurename}{Lista de ilustrações}
	\renewcommand{\listtablename}{Lista de tabelas}
	\renewcommand{\orientadorname}{Orientador}
	\renewcommand{\coorientadorname}{Coorientador}
	%% ajusta nomes usados com a macro \autoref
	\renewcommand{\pageautorefname}{página}
	\renewcommand{\sectionautorefname}{Seção}
	\renewcommand{\subsectionautorefname}{Seção}
	\renewcommand{\paragraphautorefname}{Seção}
	\renewcommand{\subsubsectionautorefname}{Seção}
}

% ---
% Posiciona figuras e tabelas no topo da página quando adicionadas sozinhas
% em um página em branco. Ver https://github.com/abntex/abntex2/issues/170
% ---
\makeatletter
\setlength{\@fptop}{5pt} % Set distance from top of page to first float
\makeatother
% ---

% ---
% Possibilita criação de Quadros e Lista de quadros.
% Ver https://github.com/abntex/abntex2/issues/176
% ---
\newcommand{\quadroname}{Quadro}
\newcommand{\listofquadrosname}{Lista de quadros}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}
% configurações para atender às regras da ABNT
\setfloatadjustment{quadro}{\centering}
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space} 
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}
\setfloatlocations{quadro}{hbtp} % Ver https://github.com/abntex/abntex2/issues/176
% ---

% --- 
% Espaçamentos entre linhas e parágrafos 
% --- 
% O tamanho do parágrafo é dado por:
\setlength{\parindent}{1.25cm}
% Controle do espaçamento entre um parágrafo e outro:
\setlength{\parskip}{0.0cm}  % tente também \onelineskip
% Espaçamento depois do título
\setlength{\afterchapskip}{\onelineskip}%{11pt}%{0.38cm}
% Recuo citação 
\setlength{\ABNTEXcitacaorecuo}{3cm} %4, mas abntex2 está somando 1cm 
% --- 

% --- 
% Fontes dos títulos e seções
% --- 
% Fonte padrão utilizada no texto
%%\renewcommand{\normalsize}{\fontsize{12pt}{16pt}\selectfont}
\renewcommand{\familydefault}{\sfdefault}
% Fontes padroes de chapter, part, section, subsection e subsubsection
\renewcommand{\ABNTEXchapterfont}{\sffamily\fontseries{bx}\fontshape{n}\selectfont}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize\selectfont}

\renewcommand{\ABNTEXpartfont}{\sffamily\fontseries{bx}\fontshape{n}\selectfont}
\renewcommand{\ABNTEXpartfontsize}{\Huge\selectfont}

\renewcommand{\ABNTEXsectionfont}{\sffamily\fontseries{bm}\fontshape{n}\selectfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize\selectfont}

\renewcommand{\ABNTEXsubsectionfont}{\sffamily\fontseries{bx}\fontshape{n}\selectfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize\selectfont}
\renewcommand{\ABNTEXsubsubsectionfont}{\sffamily\fontseries{m}\fontshape{n}\selectfont}

\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize\selectfont}
\renewcommand{\ABNTEXsubsubsubsectionfont}{\sffamily\fontseries{m}\fontshape{it}\selectfont}

\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize\selectfont}
\renewcommand{\ABNTEXfontereduzida}{\footnotesize\selectfont}

% Tamanho da fonte para a epígrafe
\expandafter\def\expandafter\epigrafe\expandafter{\epigrafe\ABNTEXfontereduzida}

% ajusta espaçamento das listas itemize e enumerate
\setitemize{topsep=0pt,itemsep=0pt,leftmargin=\parindent+\labelwidth-\labelsep}
\setenumerate{topsep=0pt,itemsep=0pt,leftmargin=\parindent+\labelwidth-\labelsep}

% define a macro \Autoref to allow multiple references to be passed to \autoref
\makeatletter
\newcommand\Autoref[1]{\@first@ref#1,@}
\def\@throw@dot#1.#2@{#1}% discard everything after the dot
\def\@set@refname#1{%    % set \@refname to autoefname+s using \getrefbykeydefault
	\edef\@tmp{\getrefbykeydefault{#1}{anchor}{}}%
	\xdef\@tmp{\expandafter\@throw@dot\@tmp.@}%
	\ltx@IfUndefined{\@tmp autorefnameplural}%
	{\def\@refname{\@nameuse{\@tmp autorefname}s}}%
	{\def\@refname{\@nameuse{\@tmp autorefnameplural}}}%
}
\def\@first@ref#1,#2{%
	\ifx#2@\autoref{#1}\let\@nextref\@gobble% only one ref, revert to normal \autoref
	\else%
	\@set@refname{#1}%  set \@refname to autoref name
	\@refname~\ref{#1}% add autoefname and first reference
	\let\@nextref\@next@ref% push processing to \@next@ref
	\fi%
	\@nextref#2%
}
\def\@next@ref#1,#2{%
	\ifx#2@ e~\ref{#1}\let\@nextref\@gobble% at end: print e+\ref and stop
	\else, \ref{#1}% print  ,+\ref and continue
	\fi%
	\@nextref#2%
}
\makeatother

% Define comandos para tabelas que permite ajustar o tamanho da coluna e manter alinhamento C, R ou L
%\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\centering\let\arraybackslash}m{#1}}
\newcolumntype{R}[1]{>{\RaggedLeft\let\arraybackslash}m{#1}}
\newcolumntype{L}[1]{>{\RaggedRight\let\arraybackslash}m{#1}}

% ---
% Filtering and Mapping Bibliographies
% ---
\DeclareSourcemap{
	\maps[datatype=bibtex]{
		% remove fields that are always useless
		\map{
			\step[fieldset=abstract, null]
			\step[fieldset=pagetotal, null]
			\step[fieldset=doi, null]
		}
		% remove URLs for types that are primarily printed
		\map{
			\pernottype{software}
			\pernottype{online}
			\pernottype{report}
			\pernottype{techreport}
			\pernottype{standard}
			\pernottype{manual}
			\pernottype{misc}
			\step[fieldset=url, null]
			\step[fieldset=urldate, null]
		}
		\map{
			\pertype{inproceedings}
			% remove mostly redundant conference information
			%\step[fieldset=venue, null]
			%\step[fieldset=eventdate, null]
			%\step[fieldset=eventtitle, null]
			% do not show ISBN for proceedings
			\step[fieldset=isbn, null]
			% Citavi bug
			%\step[fieldset=volume, null]
		}
	}
}

\RequirePackage{float} % posicionamento fixo

% ---
% FIM DAS CUSTOMIZAÇÕES PARA o CENTRO UNIVERSITÁRIO AVANTIS
% ---