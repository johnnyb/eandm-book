#!/usr/bin/env ruby
# AboutAuthors.tex
# Acknowledgements.tex
# TitlePages.tex

chapters = [
'Bartlett1',
'Bartlett2',
'Ewert',
'Hall',
'Halsmer',
'Holloway',
'Introduction',
'Mignea1',
'Mignea2',
'Mignea3',
'Sich'
]
chapters = ["Halsmer"]

chapters.each do |chap|
	puts "Chapter #{chap}"
	cwrap = "#{chap}Wrapper"
	cwrapt = "#{cwrap}.tex"
	`cp Wrapper.tmpl #{cwrapt}`
	`perl -pi -e s!FILE!#{chap}!gsi #{cwrapt}`
	`pdflatex #{cwrap}`
	`bibtex #{cwrap}`
	#`pdflatex #{cwrap}`
	#`pdflatex #{cwrap}`
	#`pdflatex #{cwrap}`
	`htlatex #{cwrapt} xhtml`
end
