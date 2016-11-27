attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;

uniform mat4 uMMatrix;
uniform mat4 uLightView;
uniform mat4 uLightProj;
uniform vec3 uLightDirection;

varying float vLightWeight;
varying vec4 vColor;
varying vec4 vLightPosition;
varying vec2 vLightScreen;

void main() {
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position, 1.0);
	
	vec3 lclNormal =  normalize((uMMatrix * vec4(in_Normal, 0.0)).xyz);
	
	vLightWeight = max(dot(lclNormal, -uLightDirection), 0.0);
	
	vColor = in_Colour;
	vLightPosition = uLightView * vec4(in_Position, 1.0);
	
	vLightScreen = (uLightProj * uLightView * vec4(in_Position, 1.0)).xy;
	vLightScreen = (vLightScreen + vec2(1.0)) / 2.0;
	vLightScreen.y = 1.0 - vLightScreen.y;
}
