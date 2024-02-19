# octave-aerospace
Partial re-implementation of the MathWorks Aerospace Toolbox under the LGPL-2.1-or-later license. Intended for use with either GNU Octave or MATLAB on GNU/Linux, with possible support for other operating systems as well. Currently in pre-alpha.

This software is released under the terms of the GNU General Public License as published by the Free Software Foundation, either version 2.1 of the License, or (at your option) any later version. Copyright held by Joshua Call.

THIS SOFTWARE HAS NO WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE LIBRARY IS WITH YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

## Documentation
For all non-installation documentation, see the MathWorks' documentation for the Aerospace Toolbox. Any difference in behavior between this software and the MathWorks Aerospace Toolbox documentation should be considered a bug.

## Installing
In order to install this package from the GNU Octave command-line interface, you will need to have "mkoctfile." The GNU Octave FAQs states

```
If you really need to build Octave packages from source to install them, you'll need mkoctfile. Most distributions split Octave into several packages. The script mkoctfile is then part of a separate package:

Debian/Ubuntu: liboctave-dev
Fedora: octave-devel
```

After you have installed the appropriate package to get mkoctfile on your system, run the following commands from the GNU Octave interface to install octave-aerospace:

```
pkg install "https://github.com/JoshuaCall/octave-aerospace/raw/main/downloads/octave-aerospace.tar.gz"
pkg load octave-aerospace
```

Any time that you restart GNU Octave, the package will be unloaded. You will need to re-run the "pkg load octave-aerospace" command if you want to use the package.
