CC := pdflatex -shell-escape

all:
	${CC} delivery.tex

clean:
	find . -regextype posix-awk -regex "(.*.aux|.*.out|.*.pdf|.*.log|.*.listing|.*.cmx|.*.enx|.*.exx|.*.idx|.*.toc)" -type f -delete
	find . -name "_minted-*" -type d -exec rm -r "{}" \;
