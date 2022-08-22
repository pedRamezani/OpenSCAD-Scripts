distanceFactor = 2;
rotationFactor = 6;
maxCubeSize = 100;
steps = 1.5;
cutOffSizeFactor = 1.5;
baseCylinderHeight = 20;
CylinderBottomOffset = 10;
CylinderTopOffset = 0;
baseLayerHeight = 5;

translate([0,0,maxCubeSize * -cutOffSizeFactor*0.5 + baseCylinderHeight + baseLayerHeight]) difference() {
	rotate([0,90,0]) translate([-(distanceFactor + 0.5)*maxCubeSize,0,0]) for (x = [3 : steps : maxCubeSize]) 
	translate([distanceFactor*x, 0, 0]) rotate([rotationFactor*x,0,0]) cube(x,center = true);

	cube([maxCubeSize*2, maxCubeSize*2, maxCubeSize * cutOffSizeFactor],center = true);
}

translate([0,0,baseLayerHeight]) cylinder(baseCylinderHeight, maxCubeSize / 1.41 + CylinderBottomOffset, maxCubeSize / 1.41 + CylinderTopOffset);

cylinder(baseLayerHeight, maxCubeSize / 1.41 + CylinderBottomOffset, maxCubeSize / 1.41 + CylinderBottomOffset);
