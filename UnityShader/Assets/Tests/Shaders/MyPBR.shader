Shader "Hekelele/MyPBR" {
Properties{
		_Color("Color", Color) = (1,1,1,1)
		_MetallicTex("Metallic Texture", 2D) = "metallic" {}
		_Metallic("Metallic", Range(0,1)) = 0.5
	}
	SubShader{
		Tags{
			"Queue"="Geometry"
		}

		CGPROGRAM
		#pragma surface surf Standard

		float4 _Color;
		sampler2D _MetallicTex;
		fixed _Metallic;

		struct Input {
			float2 uv_MetallicTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o) {
			o.Albedo = _Color.rgb;
			o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex);
			o.Metallic = _Metallic;
		}
		ENDCG
	}
	FallBack "Diffuse"

}
