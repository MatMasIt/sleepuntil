all: sleepuntil.0.1-1_all.deb

sleepuntil.0.1-1_all.deb: deb/usr/share/man/man1/sleepuntil.1.gz deb/usr/bin/sleepuntil deb/DEBIAN/control deb/usr/share/doc/sleepuntil/copyright deb/usr/share/doc/sleepuntil/changelog.gz
	dpkg-deb --root-owner-group --build deb sleepuntil.0.1-1_all.deb 
	lintian sleepuntil.0.1-1_all.deb 

deb/usr/share/man/man1/sleepuntil.1.gz: sleepuntil.1
	mkdir -p deb/usr/share/man/man1
	gzip -n -9 -k  sleepuntil.1
	mv sleepuntil.1.gz deb/usr/share/man/man1/sleepuntil.1.gz

deb/usr/bin/sleepuntil: sleepuntil
	mkdir -p deb/usr/bin/	
	cp sleepuntil deb/usr/bin/sleepuntil

deb/usr/share/doc/sleepuntil/copyright: COPYRIGHT
	mkdir -p deb/usr/share/doc/sleepuntil
	cp COPYRIGHT deb/usr/share/doc/sleepuntil/copyright

deb/usr/share/doc/sleepuntil/changelog.gz: CHANGELOG
	mkdir -p deb/usr/share/doc/sleepuntil
	gzip -n -9 -k CHANGELOG
	mv CHANGELOG.gz deb/usr/share/doc/sleepuntil/changelog.gz

clean:
	rm -rf deb/usr

