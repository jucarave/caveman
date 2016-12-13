/// @description Checks if there is collision between 2 bounding boxes
/// @param box1
/// @param box2

var bbox1 = argument[0],
	bbox2 = argument[1];
	
if (bbox2[3] < bbox1[0]){ return false; }
if (bbox2[4] < bbox1[1]){ return false; }
if (bbox2[5] < bbox1[2]){ return false; }

if (bbox1[3] < bbox2[0]){ return false; }
if (bbox1[4] < bbox2[1]){ return false; }
if (bbox1[5] < bbox2[2]){ return false; }

return true;