attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;

uniform vec3 uPosition;

varying vec4 vPosition;

void main() {
	vec4 nPos = vec4(in_Position + uPosition, 1.0);
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * nPos;
    vPosition = gm_Matrices[MATRIX_WORLD_VIEW] * nPos;
}
