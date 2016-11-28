varying vec4 vPosition;

void main() {
	float depth = 1.0 - ((vPosition.z / vPosition.w) * 0.008);
	
    gl_FragColor = vec4(depth, depth, depth, 1.0);
}
