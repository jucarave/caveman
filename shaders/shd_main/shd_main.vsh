attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;

uniform mat4 uMMatrix;

varying float vLightWeight;
varying vec4 vColor;

void main() {
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position, 1.0);
	
	vec3 lclNormal =  normalize((uMMatrix * vec4(in_Normal, 0.0)).xyz);
	
	vec3 lDir = normalize(vec3(1.0, 1.0, 1.0));
	vLightWeight = max(dot(lclNormal, lDir), 0.2);
	
	vColor = in_Colour;
}
