Shader "Hekelele2/MyPBRSpecStencil" {
Properties{
		_Color("Color", Color) = (1,1,1,1)
		_MetallicTex("Metallic Texture", 2D) = "metallic" {}
		_Metallic("Metallic", Range(0,1)) = 0.5
		_SpecColor("Specular Color", Color) = (1,1,1,1)

		_SRef("Stencil Ref",Float) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)] _SComp("Stencil Comp",Float) = 8
		[Enum(UnityEngine.Rendering.StencilOp)] _SOp("Op",Float) = 2
	}
	SubShader{
		Tags{
			"Queue"="Geometry"
		}

		Stencil
		{
			Ref[_SRef]
			Comp[_SComp]
			Pass[_SOp]
		}

		CGPROGRAM
		#pragma surface surf StandardSpecular

		float4 _Color;
		sampler2D _MetallicTex;
		fixed _Metallic;

		struct Input {
			float2 uv_MetallicTex;
		};

		void surf(Input IN, inout SurfaceOutputStandardSpecular o) {
			o.Albedo = _Color.rgb;
			o.Smoothness = 1 - tex2D(_MetallicTex, IN.uv_MetallicTex);
			o.Specular = _SpecColor.rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"

}
