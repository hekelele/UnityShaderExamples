Shader "Hekelele/RimShader" {
	
	Properties {
	     _RimColour ("Rim Colour", Color) = (1,1,1,1)
	     _RimPower ("Rim Power", Range(0.5,8.0)) = 3.0
	}
	
	SubShader {
		
		CGPROGRAM
			#pragma surface surf Lambert

			fixed4 _RimColour;
			half _RimPower;

			struct Input {
				float3 viewDir;
			};
			
			void surf (Input IN, inout SurfaceOutput o){
			    half rim = 1.0 - saturate(dot(normalize(IN.viewDir),o.Normal));
			    o.Emission = pow(rim,_RimPower) * _RimColour.rgb;
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}