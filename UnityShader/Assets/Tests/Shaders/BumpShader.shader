Shader "Hekelele/BumpSahder" {
	
	Properties {
	     _myDiffuse ("Diffuse Texture", 2D) = "white" {}
	     _myBump ("Bump Texture", 2D) = "bump" {}
	     _myRange ("Bump Range", Range(0,5)) = 1
	     _myScale("Texture Bump Scale", Range( 0.5, 2)) = 1
	}
	
	SubShader {
		
		CGPROGRAM
			#pragma surface surf Lambert

			sampler2D _myDiffuse;
			sampler2D _myBump;
			half _myRange;
			half _myScale;

			struct Input {
				float2 uv_myDiffuse;
				float2 uv_myBump;
			};
			
			void surf (Input IN, inout SurfaceOutput o){
			    o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse*_myScale).rgb;
            	o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump*_myScale));
            	o.Normal *= float3(_myRange,_myRange,1);
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}