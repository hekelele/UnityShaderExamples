Shader "Hekelele4/VertexExtruding"
{
	Properties
    {
        _MainTex ("main texture", 2D) = "white"{}
        _Amount ("scale amount", Range(-1,1)) = 0
    }

    SubShader
    {
    	CGPROGRAM
    		#pragma surface surf Lambert vertex:vert

    		struct Input{
    			float2 uv_MainTex;
    		};

    		struct appdata{
    			float4 vertex: POSITION;
    			float3 normal: NORMAL;
    			float4 texcoord: TEXCOORD0;
    		};

    		sampler2D _MainTex;
    		float _Amount;

    		void vert(inout appdata v){
    			v.vertex.xyz += v.normal * _Amount;
    		}

    		void surf(Input IN, inout SurfaceOutput o){
    			o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
    		}

    	ENDCG
    }
    Fallback "Diffuse"
}