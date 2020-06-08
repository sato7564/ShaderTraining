Shader "Custom/sample2"
{
	SubShader{
		//描画順
	Tags { "Queue" = "Transparent" }
	LOD 200

	CGPROGRAM

	#pragma surface surf Standard alpha:fade 
	#pragma target 3.0

	struct Input {
		float3 worldNormal;
		float3 viewDir;
	};

	//viewDir 視線ベクトル
	//worldNormal オブジェクトの法線ベクトル
	void surf(Input IN, inout SurfaceOutputStandard o) {
		o.Albedo = fixed4(1,1,1, 1);
		//視線ベクトルと法線ベクトルの内積
		float alpha = 1 - (abs(dot(IN.viewDir, IN.worldNormal)));
		o.Alpha = alpha*1.5f;
	}
	ENDCG
	}
		FallBack "Diffuse"
}