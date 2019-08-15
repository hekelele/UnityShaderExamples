Shader "Hekelele2/MyPBRStencil" {
Properties{
		_Color("Color", Color) = (1,1,1,1)
		_MetallicTex("Metallic Texture", 2D) = "metallic" {}
		_Metallic("Metallic", Range(0,1)) = 0.5
		_EmissionMulti("Emission", Range(0,3)) = 0.5
		_EmissionColor("Emission Color", Color) = (1,1,1,1)

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
		#pragma surface surf Standard

		float4 _Color;
		sampler2D _MetallicTex;
		fixed _Metallic;
		half _EmissionMulti;
		float4 _EmissionColor;

		struct Input {
			float2 uv_MetallicTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o) {
			o.Albedo = _Color.rgb;
			o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex);
			o.Metallic = _Metallic;

			o.Emission = (tex2D(_MetallicTex,IN.uv_MetallicTex) * _EmissionColor * _EmissionMulti).rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"

}
