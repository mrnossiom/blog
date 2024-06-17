_default:
	@just --list --unsorted --list-heading '' --list-prefix '—— '

serve:
	zola serve --drafts

serve-local:
	zola serve --drafts -i 0.0.0.0 -p 4242 -u $HOSTNAME.local
