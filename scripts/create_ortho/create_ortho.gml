var width = argument[0],
	height = argument[1],
	near = argument[2],
	far = argument[3];
	
	
var A = 2 / width,
	B = 2 / height,
	C = 1 / (far - near),
	F = -near / (far - near);
	
return [
	A, 0, 0, 0,
	0, B, 0, 0,
	0, 0, C, 0,
	0, 0, F, 1
];