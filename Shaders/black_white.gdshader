shader_type canvas_item;   // Pour Sprite, TextureRect, etc.

uniform float grayscale_strength : hint_range(0.0, 1.0) = 0.0; // 0 = couleur, 1 = N&B

void fragment() {
    vec4 c = texture(TEXTURE, UV);               // Couleur d’origine

    // Calcul de la luminance (pondérations NTSC)
    float luma = dot(c.rgb, vec3(0.299, 0.587, 0.114));
    vec3 grey  = vec3(luma);                     // Couleur gris pur

    // On mélange la couleur d’origine avec le gris selon la force voulue
    COLOR = vec4(mix(c.rgb, grey, grayscale_strength), c.a); // Conserve l’alpha
}
