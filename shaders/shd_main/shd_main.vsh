attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;

uniform mat4 uMMatrix;
uniform mat4 uLightView;
uniform mat4 uLightProj;
uniform vec3 uLightDirection;
uniform vec3 uPosition;

varying float vLightWeight;
varying vec3 vPosition;
varying vec4 vColor;
varying vec4 vLightPosition;
varying vec2 vLightScreen;

void main() {
	vec4 nPos = vec4(in_Position + uPosition, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * nPos;
	
	vec3 lclNormal =  normalize((uMMatrix * vec4(in_Normal, 0.0)).xyz);
	
	vLightWeight = max(dot(lclNormal, -uLightDirection), 0.0);
	
	vPosition = (uMMatrix * nPos).xyz;
	
	vColor = in_Colour;
	vLightPosition = uLightView * nPos;
	
	vLightScreen = (uLightProj * uLightView * nPos).xy;
	vLightScreen = (vLightScreen + vec2(1.0)) / 2.0;
	vLightScreen.y = 1.0 - vLightScreen.y;
}
