#version 330

in vec2 uv;
layout(location = 0) out vec4 color;

uniform sampler2D texDiffuse;
uniform vec4 vecTint;
uniform int iAlphaTest;

void main()
{
	  ivec2 size = textureSize(texDiffuse, 0);
		vec2 realuv = vec2(
		    uv.x / float(size.x),
		    uv.y / float(size.y));
		color = vecTint * texture(texDiffuse, realuv);
		if(iAlphaTest != 0 && color.a < 0.5) {
			  discard;
		}
}
