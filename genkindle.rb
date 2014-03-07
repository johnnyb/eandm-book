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
 chapters = ["Ewert"]

chapters.each do |chap|
	puts "\n\n\n\n\nChapter #{chap}\n\n\n\n\n\n\n"
	cwrap = "#{chap}Wrapper"
	cwrapt = "#{cwrap}.tex"
	system("rm -R #{cwrap}*")
	system("cp Wrapper.tmpl #{cwrapt}")
	system("perl -pi -e s!FILE!#{chap}!gsi #{cwrapt}")
	puts "PDFing"
	system("pdflatex #{cwrap}")
	system("pdflatex #{cwrap}")
	puts "Bibtexing"
	system("bibtex #{cwrap}")
	system("pdflatex #{cwrap}")
	system("pdflatex #{cwrap}")
	system("pdflatex #{cwrap}")
	puts "htlatexing"
	system("htlatex #{cwrapt} xhtml")
end
