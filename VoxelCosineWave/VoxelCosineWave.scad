numberOfCubesInRow = 41; //uneven only
cubesPerPixel = 2;
gridSize = floor(numberOfCubesInRow/2);
Amplitude = 8;
overLap = 0.05/cubesPerPixel;

function graph(x, y) =
	Amplitude* (1.1 + sin(5*x)*sin(5*y));
	
function graph(x, y) =
	5 * Amplitude* (1.1 + cos(15*x)*cos(15*y)) * 1/norm([x,y,5]);


for(i=[-gridSize:gridSize]) {
    for(j=[-gridSize:gridSize]) {
		for(k = [0 : cubesPerPixel - 1]) {
			for (l = [0 : cubesPerPixel - 1]) { 
				let (subi = i + k/cubesPerPixel)
				let (subj = j + l/cubesPerPixel)
				color( [0.5+sin(10*i)/2, 0.5+sin(10*j)/2, 0.5+sin(10*(i+j))/2])
				translate( [subi - 0.5 - overLap, subj - 0.5 - overLap, 0])
				  cube(size = [1/cubesPerPixel + 2*overLap, 1/cubesPerPixel + 2*overLap, graph(subi,subj)]);
			}
		}
    }
}