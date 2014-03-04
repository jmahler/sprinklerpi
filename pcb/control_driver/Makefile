
all: control_driver.zip

# Package up Gerbers for manufacturer
control_driver.zip:
	../package-gerbers.sh control_driver

# Remove Gerber generated files
clean:
	-rm -fr control_driver
	-rm -f control_driver.zip
