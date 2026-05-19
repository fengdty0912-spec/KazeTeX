\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kazetex}[2026/05/18 KazeTeX problem workbook template]

% ---- pad mode toggle ----
\newif\if@kazetex@pad
\@kazetex@padfalse
\DeclareOption{pad}{\@kazetex@padtrue}

% Pass unknown options to ctexart
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

% Load base class (zihao as class option only supports 5, -4, false in TL2026)
% Use \zihao command at begin document for pad mode larger font
\LoadClass[zihao=-4,a4paper]{ctexart}

% ---- required packages ----
\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{amsmath,amssymb}
\RequirePackage{hyperref}
\RequirePackage{graphicx}

% ---- colors (used by both sty files; define here for correct load order) ----
\definecolor{kazenavy}{HTML}{1a5276}
\definecolor{kazeteal}{HTML}{117a65}
\definecolor{kazenavylight}{HTML}{d4e6f1}
\definecolor{kazegray}{HTML}{95a5a6}

% ---- load internal style files ----
\RequirePackage{kazetex-env}
\RequirePackage{kazetex-pagestyle}

% ---- additional settings ----
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.5\baselineskip}

\AtBeginDocument{%
  \if@kazetex@pad\zihao{-3}\fi
  \pagestyle{kazeheadings}%
}
