uniform sampler2D uShadowMap;

varying float vLightWeight;
varying vec4 vColor;
varying vec4 vLightPosition;
varying vec2 vLightScreen;

void main() {
	float lightWeight = vLightWeight;
	
	//gl_FragColor = vec4(vColor.rgb * lightWeight, 1.0);
	
	if (lightWeight > 0.0) {
		float shadowDepth = texture2D(uShadowMap, vLightScreen).r;
		float pixelDepth = 1.0 - ((vLightPosition.z / vLightPosition.w) * 0.008);
		
		if (pixelDepth < shadowDepth - 0.003){
			lightWeight = 0.0;
		}
		
		//gl_FragColor = vec4(pixelDepth, pixelDepth, pixelDepth, 1.0);
	}
	
	lightWeight = max(lightWeight, 0.1);
	
    gl_FragColor = vec4(vColor.rgb * lightWeight, 1.0);
}
