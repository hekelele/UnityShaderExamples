Shader "Hekelele2/Wall"{
	Properties{
		_MainTex ("Diffuse", 2D) = "white" {}
		_Color("Main color",Color) = (1,1,1,1)
	}

	SubShader{
		Tags{"Queue"="Geometry"}

		Stencil{
			Ref 1
			Comp notequal
			Pass keep
		}

		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;
		float4 _Color;

		struct Input{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o){
			//fixed4 c = tex2D(_MainTex,IN.uv_MainTex);
			o.Albedo = _Color.rgb;
		}
		ENDCG
	}

	FallBack "Diffuse"
}