
/*
Gridfinity Spacer Generator

by IOIO72 aka Tamio Patrick Honma (https://honma.de)

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Licence. To view a copy of this licence, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.


Description:

Create spacers to fit the Gridfinity base into drawers, containers and the like.
You can either print and assemble the spacers separately from the Gridfinity base or digitally merge the two in the slicer.


Basic use:

1. enter the values for the width and length of your Gridfinity base plate.
2. enter the measured mm values of the available space.
3. create your spacer plate and print it.
  1. load the file *Gridfinity Spacer.scad* into OpenSCAD.
  2. open the customizer in the menu *Window → Customizer*.
  3. render the customized spacer plate via the key *F6* or menu *Design → Render*.
  4. export the render via the key F7 or menu *File → Export → Export STL*.


Advanced options:

- Align the base plate on the spacer plate.
- Set alignment offsets to the edge of the spacer plate.
- Define the thickness of the spacer plate.
- Define the shape of the corners.


Tips for the slicer:

- If the result is too large for your print bed, use your slicer to cut the model.
- Beforehand, you can merge the spacer plate with the Gridfinity base plate in the slicer.


Tips for customizers:

- If you print the spacer plate separately and the base plate does not fit into the spacer plate, use the “Spacer tolerance” option and increase its value in the customizer.
- To test the tolerances, you can print a very thin version of the spacer plate by setting the “Spacer thickness” to one or two print layer heights (e.g. 0.2 mm).

*/


/* [Hidden] */

// Fragments number
$fn=100; // [15:200]

// Gridfinity base size in mm
gridfinity_size=42;

// Gridfinity base plate corner diameter
gridfinity_corner_diameter=8;


/* [Gridfinity Base Plate] */

// Number of width grid segments
grid_width=5;

// Number of length grid segments
grid_length=4;


/* [Space] */

// Measured width in mm to be filled
space_width=250;

// Measured length in mm to be filled
space_length=200;

// Width alignment of the grid
width_alignment="center"; // [left, center, right]

// Length alignment of the grid
length_alignment="center"; // [front, center, back]

// Spacer thickness in mm (base plate thicknesses: 4:default, 5:magnet, 9.8:weighted)
spacer_thickness=2; // [0.1:0.1:10]

// Rounded base plate corners
rounded_base_plate_corners=true;

// Rounded spacer plate corners
rounded_spacer_plate_corners=true;


/* [Advanced Spacer Options] */

// Width offset in mm
width_offset=0;

// Length offset in mm
length_offset=0;

// Spacer inner tollerance in mm
spacer_tolerance=0.0; // [0:0.1:2]


/* [Hidden] */

spacer_plate_width=space_width - (rounded_spacer_plate_corners==true ? gridfinity_corner_diameter : 0);
spacer_plate_length=space_length - (rounded_spacer_plate_corners==true ? gridfinity_corner_diameter : 0);

grid_space_width=(grid_width * gridfinity_size) + (2 * spacer_tolerance) - (rounded_base_plate_corners==true ? gridfinity_corner_diameter : 0);
grid_space_length=(grid_length * gridfinity_size) + (2 * spacer_tolerance) - (rounded_base_plate_corners==true ? gridfinity_corner_diameter : 0);

shift_width_value=((space_width - grid_space_width - (rounded_base_plate_corners==true ? gridfinity_corner_diameter : 0)) / 2) - width_offset;
shift_length_value=((space_length - grid_space_length - (rounded_base_plate_corners==true ? gridfinity_corner_diameter : 0)) / 2) - length_offset;

shift_width=width_alignment=="left" ? shift_width_value * -1 : width_alignment=="right" ? shift_width_value : 0;
shift_length=length_alignment=="front" ? shift_length_value * -1 : length_alignment=="back" ? shift_length_value : 0;

linear_extrude(spacer_thickness) {
    difference() {
        minkowski() {
            if (rounded_spacer_plate_corners) circle(d=gridfinity_corner_diameter);
            square([spacer_plate_width, spacer_plate_length], true);
        }
        translate([shift_width, shift_length, 0]) {
            minkowski() {
                if (rounded_base_plate_corners) circle(d=gridfinity_corner_diameter);
                square([grid_space_width, grid_space_length], true);
            }
        }
    }
}
