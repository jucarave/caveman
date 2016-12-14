precision mediump float;

uniform sampler2D uShadowMap;
uniform vec3 uPlayerPosition;

varying float vLightWeight;
varying vec3 vPosition;
varying vec4 vColor;
varying vec4 vLightPosition;
varying vec2 vLightScreen;

void main() {
	float lightWeight = vLightWeight;
	float distant = length(vPosition - uPlayerPosition);
	
	if (lightWeight > 0.0) {
		float shadowDepth = texture2D(uShadowMap, vLightScreen).r;
		if (shadowDepth > 0.0) {
			if (vLightScreen.x >= 0.0 && vLightScreen.x < 1.0 && vLightScreen.y >= 0.0 && vLightScreen.y < 1.0){
				//float pixelDepth = 1.0 - ((vLightPosition.z / vLightPosition.w) * 0.005);
				float pixelDepth = 1.0 - vLightPosition.z / vLightPosition.w;
			
				if (pixelDepth < shadowDepth - 0.003){
					lightWeight *= 0.5 * (distant / 50.0);
				}
			}
		}
	}
	
	float fog = clamp(1.0 - (120.0 - distant) / (30.0), 0.0, 1.0);
	//float fog = clamp(1.0 - (120.0 - vPosition.z) / (30.0), 0.0, 1.0);
	
	lightWeight = max(lightWeight, 0.2);
	
	vec3 col = vColor.rgb * lightWeight;
	col = mix(col, vec3(1.0), fog);
	
    gl_FragColor = vec4(col, 1.0);
}
