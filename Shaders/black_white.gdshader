shader_type canvas_item;

/* Variable partagée — DOIT exister dans Project Settings → Rendering → Global Variables */
global uniform float bw_amount_global : hint_range(0.0, 1.0) = 0.0;

void fragment() {
    vec4 tex  = texture(TEXTURE, UV);

    float luma = dot(tex.rgb, vec3(0.299, 0.587, 0.114));
    vec3 grey  = vec3(luma);

    COLOR = vec4(mix(tex.rgb, grey, bw_amount_global), tex.a);
}
