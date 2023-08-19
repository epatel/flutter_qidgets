info:
	echo "make reset           - flutter clean ; flutter pub get"
	echo "make platforms       - flutter create . for ios and android"
	echo "make update_pubspec  - update pubspec.yaml"
	echo "make update_phony    - update .PHONY in Makefile"
	echo "make clean           - git clean -fdx"

.SILENT:

.PHONY: info reset update_pubspec update_phony

reset:
	flutter clean ; flutter pub get

platforms:
	flutter create --platforms ios,android .

# useful in actual project, example uses local package
update_pubspec:
	scripts/update_pubspec

update_phony:
	scripts/update_phony

clean:
	git clean -fdx
