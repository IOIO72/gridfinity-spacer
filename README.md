# Gridfinity Spacer Generator

by IOIO72 aka Tamio Patrick Honma (https://honma.de)

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Licence. To view a copy of this licence, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

## Description

Create spacers to fit the [Gridfinity base](https://than.gs/m/60925) into drawers, containers and the like.
You can either print and assemble the spacers separately from the Gridfinity base or digitally merge the two in the slicer.

## Basic use

1. enter the values for the width and length of your Gridfinity base plate.
2. enter the measured mm values of the available space.
3. create your spacer plate and print it.
   1. load the file *Gridfinity Spacer.scad* into [OpenSCAD](https://openscad.org/).
   2. open the customizer in the menu *Window → Customizer*.
   3. render the customized spacer plate via the key *F6* or menu *Design → Render*.
   4. export the render via the key F7 or menu *File → Export → Export STL*.


## Advanced options

- Align the base plate on the spacer plate.
- Set alignment offsets to the edge of the spacer plate.
- Define the thickness of the spacer plate.
- Define the shape of the corners.

## Tips

Tips for the slicer:

- If the result is too large for your print bed, use your slicer to cut the model.
- Beforehand, you can merge the spacer plate with the Gridfinity base plate in the slicer.

Tips for customizers:

- If you print the spacer plate separately and the base plate does not fit into the spacer plate, use the “Spacer tolerance” option and increase its value in the customizer.
- To test the tolerances, you can print a very thin version of the spacer plate by setting the “Spacer thickness” to one or two print layer heights (e.g. 0.2 mm).

