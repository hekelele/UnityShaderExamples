Shader "Hekelele3/UV_Painter"
{
	Properties
    {
        uv_color ("uv color", COLOR) = (1,1,1,1)
    }

	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			float4 uv_color;

			struct appdata
			{
				float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float4 color : COLOR;
			};

			v2f vert(appdata v)
			{
				v2f o = (v2f)0;
				fixed blend = 2;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.color.rgb = uv_color*v.uv.x;
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				fixed4 col = i.color;
				return col;
			}
			ENDCG
		}
	}

}