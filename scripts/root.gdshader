shader_type canvas_item;

void fragment() {
	COLOR.rgb = vec3(1.0) - round(distance(UV, vec2(0.5))+.02);
	COLOR.a = 1.0 - round(distance(UV, vec2(0.5)));
}
