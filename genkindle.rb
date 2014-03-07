#!/usr/bin/env ruby
# AboutAuthors.tex
# Acknowledgements.tex
# TitlePages.tex

chapters = [
'AboutAuthors',
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
# chapters = ["Bartlett1"]

chapters.each do |chap|
	puts "Chapter #{chap}"
	cwrap = "#{chap}Wrapper"
	cwrapt = "#{cwrap}.tex"
	system("cp Wrapper.tmpl #{cwrapt}")
	system("perl -pi -e s!FILE!#{chap}!gsi #{cwrapt}")
	puts "PDFing"
	system("pdflatex #{cwrap}")
	puts "Bibtexing"
	system("bibtex #{cwrap}")
	#`pdflatex #{cwrap}`
	#`pdflatex #{cwrap}`
	#`pdflatex #{cwrap}`
	puts "htlatexing"
	system("htlatex #{cwrapt} xhtml")
end
