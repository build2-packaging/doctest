./: lib{doctest}: doctest/hxx{doctest}
{
  cxx.export.poptions = "-I$src_root"
}
hxx{*}: install.subdirs = true

./: tests/ manifest legal{LICENSE.txt}
tests/: install = false

# Install UPSTREAM.README.md as README.md
# and README.md as PACKAGE.README.md
# to make the package README.md the default
# for the build2 package repository web view.
#
./: doc{README.md UPSTREAM.README.md CHANGELOG.md}
doc{UPSTREAM.README.md}@./: install = doc/README.md
doc{README.md}@./: install = doc/PACKAGE.README.md

# For now, installation of documentation is disabled.
#
# ./: doc/markdown/doc{**.md}
