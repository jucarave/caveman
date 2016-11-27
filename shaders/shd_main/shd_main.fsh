varying float vLightWeight;
varying vec4 vColor;

void main()
{
    gl_FragColor = vec4(vColor.rgb * vLightWeight, 1.0);
}
