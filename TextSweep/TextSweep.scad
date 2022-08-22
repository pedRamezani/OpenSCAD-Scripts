/* [Text and Font] */
//This is the text for the nametag. You have to be careful with characters, which go under the baseline like p and q (try to increase the baseline value)
text = "HelloThere";
//The font to use. You can open the fontlist in the help menu and copy your fontstring there.
fontString = "Consolas:style=Bold";
//Spacing of text. USe it when the text looks weird.
spacing = 1;
//This is the height of the biggest character. It also determines the z-height.
size = 100;
//This is the exrusion angle. I only tested 90 degrees, but other values can also be used
angle = 90;
//This determines how much space there is under the extruded text.
baseline = 10;

/* [Base] */
//Check if you want a baseplate
plate = true;
//The height of the baseplate
plateHeight = 20;
//How much space there is on the outside of the baseplate.
plateBorder = 10;
//Check if you want to use the hull of your text as a base and dont check if you just want a rounded square base
plateHull = true;
//Check if you want to include the baseline in the base
includeBaselineInBase = false;

sizeX = len(text) * size * 0.8;

module CustomText() {
	text(text, halign = "center", spacing = spacing, size = size, font = fontString);
}

module Base() {
	if (plateHull) {
		linear_extrude(plateHeight + 0.1) offset(r = plateBorder) hull() {
			translate([0, baseline, 0]) resize(newsize = [sizeX, size, 0])CustomText();
			if (includeBaselineInBase) {
				translate([-sizeX / 2, 0, 0]) square([sizeX, size]);
			}
		}
	}
	else {
		frontOffset = includeBaselineInBase ? 0 : baseline;
		translate([-sizeX/2, frontOffset, 0]) minkowski() {
		  cube([sizeX, size + baseline - frontOffset, plateHeight / 2 + 0.05]);
		  cylinder(r = plateBorder, h = plateHeight / 2 + 0.05);
		}
	}
}

color(c = [0.4,0.8,0.4]) {

	translate([0,0, plate ? plateHeight : 0]) rotate([-90 + angle, 0, 0]) rotate([0,-90,0]) rotate_extrude(angle = angle, $fn = 100) {
		
		rotate([0,0,-90]) translate([0, baseline, 0]) resize(newsize = [sizeX, size, 0]) CustomText();
		
	}

	if (plate) {
		Base();
	}
}
