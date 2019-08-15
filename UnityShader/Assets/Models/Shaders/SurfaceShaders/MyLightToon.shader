Shader "Hekelele/MyLightToon" {
Properties{
		_Color("Color", Color) = (1,1,1,1)
		_RampTex("Ramp Texture", 2D) = "white"{}
	}

	SubShader{
		Tags{
			"Queue"="Geometry"
		}

		CGPROGRAM
		#pragma surface surf KLightToonRamp


		float4 _Color;
		sampler2D _RampTex;

		float4 LightingKLightToonRamp (SurfaceOutput s, half3 lightDir, half atten){
			float diff = dot(s.Normal,lightDir);
			float h = diff * 0.5 +0.5;
			float2 rh = h;
			float3 ramp = tex2D(_RampTex, rh).rgb;

			float4 c;
			c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
			c.a = s.Alpha;
			return c;
		}

		struct Input {
			float2 uv_RampTex;
		};

		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = _Color.rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"

}