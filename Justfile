_default:
	@just --list --unsorted --list-heading '' --list-prefix '—— '

# Serve on localhost:1111
serve *args:
	zola serve --drafts {{args}}

# Serve on $HOSTNAME.local:4242
serve-network *args:
	zola serve --drafts -i 0.0.0.0 -p 4242 -u $HOSTNAME.local {{args}}

render-cvs *args:
	@just render-cv private/cv-fr.odt static/
	@just render-cv private/cv-en.odt static/

render-cv input output-dir *args:
	soffice --convert-to 'pdf' --outdir {{output-dir}} {{input}} {{args}}
