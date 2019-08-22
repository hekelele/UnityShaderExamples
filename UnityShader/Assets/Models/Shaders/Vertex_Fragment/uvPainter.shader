Shader "Hekelele3/UV_Painter"
{
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

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
				o.color.r = (-v.vertex.x + v.vertex.z + blend)/(10+blend);
				o.color.g = (-v.vertex.x - v.vertex.z + blend)/(10+blend);
				o.color.b = ( v.vertex.x + v.vertex.z + blend)/(10+blend);
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