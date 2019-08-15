Shader "Hekelele2/BlendTest" {
Properties{
		_MainTex ("Texture", 2D) = "black" {}
	}
	SubShader{
		Tags{
			"Queue"="Transparent"
		}
		Cull Off
		Blend One One
		Pass{
			SetTexture[_MainTex]{combine texture} 
		}

	}

}