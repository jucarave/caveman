uniform sampler2D uShadowMap;
uniform vec3 uPlayerPosition;

varying float vLightWeight;
varying vec3 vPosition;
varying vec4 vColor;
varying vec4 vLightPosition;
varying vec2 vLightScreen;

void main() {
	float lightWeight = vLightWeight;
	
	if (vLightScreen.x >= 0.0 && vLightScreen.x < 1.0 && vLightScreen.y >= 0.0 && vLightScreen.y < 1.0){
		float shadowDepth = texture2D(uShadowMap, vLightScreen).r;
		float pixelDepth = 1.0 - ((vLightPosition.z / vLightPosition.w) * 0.003);
		
		if (pixelDepth < shadowDepth - 0.003){
			lightWeight = 0.0;
		}
	}
	
	float fog = clamp(1.0 - (100.0 - length(vPosition - uPlayerPosition)) / (20.0), 0.0, 1.0);
	
	lightWeight = max(lightWeight, 0.1);
	
	vec3 col = vColor.rgb * lightWeight;
	col = mix(col, vec3(1.0), fog);
	
    gl_FragColor = vec4(col, 1.0);
}
