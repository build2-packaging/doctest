./: {*/ -build/} manifest

tests/: install = false

upstream/
{
  ./: doc/ doc{*.md LICENSE.txt}
  doc/
  {
    install.subdirs = true
    ./: doc{**}
  }
}