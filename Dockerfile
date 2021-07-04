FROM debian
MAINTAINER APN
RUN apt-get update -y -qq && apt-get install -y -qq latexmk texlive-full texlive-generic-extra texlive-formats-extra texlive-fonts-extra texlive-science aspell aspell-en aspell-de texlive-bibtex-extra biber texlive-latex-extra python-pygments && apt-get clean
