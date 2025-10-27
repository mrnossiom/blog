_default:
	@just --list --unsorted --list-heading '' --list-prefix '—— '

# Serve on localhost:1111
serve *args:
	zola serve --drafts {{args}}

# Serve on <hostname>:<port>
serve-network hostname port *args:
	zola serve --drafts -i 0.0.0.0 -p {{port}} -u {{hostname}} {{args}}

render-cvs *args:
	@just render-cv private/cv-fr.odt static/
	@just render-cv private/cv-en.odt static/

render-cv input output-dir *args:
	soffice --convert-to 'pdf' --outdir {{output-dir}} {{input}} {{args}}
