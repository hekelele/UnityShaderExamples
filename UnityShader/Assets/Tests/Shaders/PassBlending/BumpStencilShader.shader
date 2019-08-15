Shader "Hekelele2/BumpStencillSahder" {
	
	Properties {
	    _myDiffuse ("Diffuse Texture", 2D) = "white" {}
	    _myBump ("Bump Texture", 2D) = "bump" {}
	    _bumpScale("Texture Bump Scale", Range( 0, 10)) = 1
	    _brightScale("Texture bright Scale", Range( 0, 10)) = 1

	    _SRef("Stencil Ref",Float) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)] _SComp("Stencil Comp",Float) = 8
		[Enum(UnityEngine.Rendering.StencilOp)] _SOp("Op",Float) = 2

	}
	
	SubShader {
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
			#pragma surface surf Lambert

			sampler2D _myDiffuse;
			sampler2D _myBump;
			half _myRange;
			half _bumpScale;
			half _brightScale;

			struct Input {
				float2 uv_myDiffuse;
				float2 uv_myBump;
			};
			
			void surf (Input IN, inout SurfaceOutput o){
			    o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse).rgb * _brightScale;
            	o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump));
            	o.Normal *= float3(_bumpScale,_bumpScale,1);
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}