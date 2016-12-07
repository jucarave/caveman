/// @description Checks if there is a collision between the bounding boxes of the two instances
/// @param instance_1
/// @param instance_2

var ins_1 = argument[0],
	ins_2 = argument[1],
	bbox1 = [
		ins_1.x + ins_1.bounding_box[0],
		ins_1.y + ins_1.bounding_box[1],
		ins_1.z + ins_1.bounding_box[2],
		ins_1.x + ins_1.bounding_box[3],
		ins_1.y + ins_1.bounding_box[4],
		ins_1.z + ins_1.bounding_box[5]
	],
	bbox2 = [
		ins_2.x + ins_2.bounding_box[0],
		ins_2.y + ins_2.bounding_box[1],
		ins_2.z + ins_2.bounding_box[2],
		ins_2.x + ins_2.bounding_box[3],
		ins_2.y + ins_2.bounding_box[4],
		ins_2.z + ins_2.bounding_box[5]
	];
	
if (bbox2[3] < bbox1[0]){ return false; }
if (bbox2[4] < bbox1[1]){ return false; }
if (bbox2[5] < bbox1[2]){ return false; }

if (bbox1[3] < bbox2[0]){ return false; }
if (bbox1[4] < bbox2[1]){ return false; }
if (bbox1[5] < bbox2[2]){ return false; }

return true;