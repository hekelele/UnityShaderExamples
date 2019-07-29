Shader "Hekelele/HelloShader" {
	
	Properties {
	     _myColour ("Example Colour", Color) = (1,1,1,1)
	     _myTexture ("Example Texture", 2D) = "white" {}
	     _myRange ("Example Range", Range(0,5)) = 1
	     _myEmission ("Example Emission", Color) = (1,1,1,1)
	     _myNormal ("Example Normal", Color) = (1,1,1,1)
	}
	
	SubShader {
		
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input {
				float2 uv_myTexture;
			};

			fixed4 _myColour;
			half _myRange;
			fixed4 _myEmission;
			fixed4 _myNormal;
			sampler2D _myTexture;
			
			void surf (Input IN, inout SurfaceOutput o){
			    o.Albedo = (tex2D(_myTexture, IN.uv_myTexture) * _myRange).rgb;
			    o.Emission = _myEmission.rgb;
			    o.Normal = _myNormal.rgb;
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}