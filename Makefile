info:
	echo "make update_readme - update README.md"
	echo "make update_phony  - update .PHONY in Makefile"

.SILENT:

.PHONY: info update_readme update_phony

update_readme:
	scripts/update_readme

update_phony:
	scripts/update_phony
