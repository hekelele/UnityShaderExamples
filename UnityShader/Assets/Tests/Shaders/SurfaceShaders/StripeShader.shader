Shader "Hekelele/StripeShader" {
	
	Properties {
	    _StripeColour1 ("Stripe Colour 1", Color) = (1,1,1,1)
	    _StripeColour2 ("Stripe Colour 2", Color) = (1,1,1,1)
	    _RimLimit ("Rim Limit", Range(0,1)) = 0.5
	    _StripeWidth ("Stripe Width", Range(0.01,1)) = 0.1
	}
	
	SubShader {
		
		CGPROGRAM
			#pragma surface surf Lambert
			sampler2D _MainTex;
			fixed4 _StripeColour1;
			fixed4 _StripeColour2;
			half _RimLimit;
			half _StripeWidth;

			struct Input {
				float2 uv_MainTex;
				float3 viewDir;
				float3 worldPos;
			};
			
			void surf (Input IN, inout SurfaceOutput o){
			    half rim = 1.0 - saturate(dot(normalize(IN.viewDir),o.Normal));
			    rim = rim>_RimLimit?1:0;
			    half multiplier = 1/_StripeWidth * 0.5;
			    o.Emission = frac(IN.worldPos.x * multiplier ) >0.5 ? _StripeColour1*rim: _StripeColour2*rim;
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}