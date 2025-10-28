shader_type spatial;
render_mode diffuse_lambert;

uniform sampler2D grass_tex;

uniform sampler2D color;
uniform sampler2D details;
uniform sampler2D soil;


void fragment() {
	vec3 col = texture(color, UV).rgb;
	vec3 grass = texture(grass_tex, UV*60.0).rgb;
	float soil_fac = texture(soil, UV).r;
	vec3 terrain = mix(grass, vec3(1.0,0.9,0.8), clamp(soil_fac*1.6, 0.0, 1.0)).rgb;
	ALBEDO = terrain*col;
	float details_fac = texture(details, UV).r;
	ALBEDO = mix(ALBEDO, vec3(0.2,0.1,0.0), details_fac);
}
