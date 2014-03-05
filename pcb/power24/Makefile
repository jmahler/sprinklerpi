
all: power24.zip

# Package up Gerbers for manufacturer
power24.zip: power24-F_Cu.gtl
	../package-gerbers.sh power24

# Remove package
clean:
	-rm -fr power24
	-rm -f power24.zip
