all: slides.pdf

slides.pdf: slides.md
	pandoc -i -s -o slides.pdf slides.md -t beamer -V theme=Warsaw --slide-level=2
