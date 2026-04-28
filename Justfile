_default:
	@just --list --unsorted --list-heading '' --list-prefix '—— '

# Serve on localhost:1111
serve *args:
	zola serve --drafts {{args}}

# Serve on <hostname>:<port>
serve-network hostname port *args:
	zola serve --drafts -i 0.0.0.0 -p {{port}} -u {{hostname}} {{args}}

render-documents *args:
	@typst compile private/resume-en.typ public/resume-milo_moisson.pdf
	@typst compile private/resume-fr.typ public/cv-milo_moisson.pdf
