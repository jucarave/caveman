uniform sampler2D uShadowMap;

varying float vLightWeight;
varying vec4 vColor;
varying vec4 vLightPosition;
varying vec2 vLightScreen;

void main() {
	float lightWeight = vLightWeight;
	
	if (lightWeight > 0.0) {
		float shadowDepth = texture2D(uShadowMap, vLightScreen).r;
		float pixelDepth = 1.0 - ((vLightPosition.z / vLightPosition.w) * 0.01);
		
		if (pixelDepth < shadowDepth - 0.005){
			lightWeight = 0.0;
		}
	}
	
	lightWeight = max(lightWeight, 0.1);
	
    gl_FragColor = vec4(vColor.rgb * lightWeight, 1.0);
}
