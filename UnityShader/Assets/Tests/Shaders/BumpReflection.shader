Shader "Hekelele/BumpReflSahder" {
	
	Properties {
	     _myBump ("Bump Texture", 2D) = "bump" {}
	     _myCube ("Cube Texture", CUBE) = "cube" {}
	     _bumpScale("Texture Bump Scale", Range( 0, 10)) = 1
	}
	
	SubShader {
		
		CGPROGRAM
			#pragma surface surf Lambert

			sampler2D _myBump;
			samplerCUBE _myCube;
			half _bumpScale;

			struct Input {
				float2 uv_myBump;
				float3 worldRefl; INTERNAL_DATA
			};
			
			void surf (Input IN, inout SurfaceOutput o){
			    o.Albedo = texCUBE(_myCube, WorldReflectionVector(IN, o.Normal)).rgb;
            	o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump));
            	o.Normal *= float3(_bumpScale,_bumpScale,1);
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}