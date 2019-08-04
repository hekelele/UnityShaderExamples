Shader "Hekelele2/transparent" {
Properties{
		_MainTex("main texture",2D) = "white"{}
	}
	SubShader{
		Tags{
			"Queue"="Transparent"
		}

		CGPROGRAM
		#pragma surface surf Lambert alpha:fade

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o) {
			float4 c = tex2D(_MainTex,IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a; 
		}
		ENDCG
	}
	FallBack "Diffuse"

}