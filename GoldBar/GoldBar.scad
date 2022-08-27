topW = 55;
bottomW = 80;
height = 30;
bottomL= 150;
topL = 120;
bevel = 5;
textExtrude = 3;
mainCaptionHeights = [topW / 7, topW / 5, topW / 6];
subCaptionHeights = [topW / 7, topW / 7];

module gold() {
	color("gold") linear_extrude(height, scale = [topW / bottomW, topL / bottomL]) minkowski()
	{
	  square([bottomW - 2*bevel, bottomL - 2*bevel], center = true);
	  circle(r = bevel);
	}
}

module goldTextTop() {
	translate([0, mainCaptionHeights[1] * 1.1 + mainCaptionHeights[2] * 1.5, height - textExtrude]) linear_extrude(textExtrude * 2) resize([topW * 0.4, mainCaptionHeights[0]]) text("FINE", halign = "center", valign = "center", font = "Comfortaa:style=Bold");
	
	translate([0, mainCaptionHeights[2] * 1.5, height - textExtrude]) linear_extrude(textExtrude * 2) resize([topW * 0.9, mainCaptionHeights[1]]) text("PLASTIC", halign = "center", valign = "center", font="Righteous:style=Regular", spacing = 1.2);
	
	translate([0, 0, height - textExtrude]) linear_extrude(textExtrude * 2) resize([topW * 0.4, mainCaptionHeights[2]]) text("999.9", halign = "center", valign = "center", font = "Bungee:style=Regular");
}

module goldTextBottom() {
	translate([0, -topL/2 + subCaptionHeights[1], 0]) {
	translate([0, subCaptionHeights[1] * 1.5, height - textExtrude]) linear_extrude(textExtrude * 2) resize([topW * 0.6, subCaptionHeights[0]]) text("NET WT", halign = "center", valign = "bottom", font="Comfortaa:style=Bold");
	
	translate([0, 0, height - textExtrude]) linear_extrude(textExtrude * 2) resize([topW * 0.4, subCaptionHeights[1]]) text("50g", halign = "center", valign = "bottom", font = "Bungee:style=Regular");
	}
}

difference() {
	gold(); 
	goldTextTop();
	goldTextBottom();
}
