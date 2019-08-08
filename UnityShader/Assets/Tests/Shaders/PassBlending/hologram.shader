Shader "Hekelele2/hologram" {
Properties{
		_RimColor ("Rim Color", Color) = (1,1,1,1)
	    _RimPower ("Rim Power", Range(0.5,8.0)) = 3.0
	}
	SubShader{
		Tags{
			"Queue"="Transparent"
		}
		
		CGPROGRAM
		#pragma surface surf Lambert alpha:fade

		fixed4 _RimColor;
	    half _RimPower;

		struct Input {
			float3 viewDir;
		};

		void surf(Input IN, inout SurfaceOutput o) {
			half rim = 1.0 - saturate(dot(normalize(IN.viewDir),o.Normal));
			o.Emission = pow(rim,_RimPower) * _RimColor.rgb;
			o.Alpha = pow(rim,_RimPower);
		}
		ENDCG
	}
	FallBack "Diffuse"

}