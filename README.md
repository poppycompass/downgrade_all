All package downgrader for Arch Linux
==============

Save installed packages and versions, and restore all packages to saved ones in case of problems.

# Functoin
There is two functions.

1. Save packages and version in your environments.
2. If you have some problems, return packages when the system is working without problems.

# How to use

## Save
Run `save_pkglist.sh` on your Arch Linux that is working without problems.

	$ downgrade_all/save_pkglist.sh

	package file: pkg20171010.list
	Please wait...
	Done!
	1333/1333 packages are saved correctly!

After execution, "pkg(saved date).list" is created.
Package names that could not be saved are saved in `not_found(saved date).list`.

## Recover

	$ downgrade_all/recover_pkg.sh pkg20171010.list

	Recover from pkg20171010.list
	Please wait...
	Done!

## License

This tool is released under the [GPL license](COPYING)

## Author

poppycompass (t0g0v31dk at gmail dot com)
