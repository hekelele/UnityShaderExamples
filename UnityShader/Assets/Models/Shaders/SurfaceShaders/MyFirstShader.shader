Shader "Hekelele/HelloShader" {
	
	Properties {
	     _myColour ("Example Colour", Color) = (1,1,1,1)
	     _myTexture ("Example Texture", 2D) = "white" {}
	     _myEmissionTexture ("Example Emission Texture", 2D) = "white" {}
	     _myRange ("Example Range", Range(0,5)) = 1
	     _myRange2 ("Example Range2", Range(0,5)) = 1
	}
	
	SubShader {
		
		CGPROGRAM
			#pragma surface surf Lambert

			fixed4 _myColour;
			sampler2D _myTexture;
			sampler2D _myEmissionTexture;
			half _myRange;
			half _myRange2;

			struct Input {
				float2 uv_myTexture;
				float2 uv_myEmissionTexture;
			};
			
			void surf (Input IN, inout SurfaceOutput o){
			    o.Albedo = (tex2D(_myTexture, IN.uv_myTexture) * _myRange).rgb;
            	o.Emission = (tex2D(_myEmissionTexture, IN.uv_myEmissionTexture) * _myRange2).rgb;
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}