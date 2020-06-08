Shader "Custom/sample"
{
    Properties
    {
        _BaseColor ("Base Color", Color) = (1,1,1,1)
        //_MainTex ("Albedo (RGB)", 2D) = "white" {}
        //_Glossiness ("Smoothness", Range(0,1)) = 0.5
        //_Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0
        sampler2D _MainTex;

        struct Input
        {
            //uv_MainTex→テクスチャのuv座標
            float2 uv_MainTex;
        };
        //half _Glossiness;
        //half _Metallic;
        fixed4 _BaseColor;
        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
           // fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            //Albedo...基本色
            o.Albedo = _BaseColor.rgb;
            //o.Metallic = _Metallic;
            //o.Smoothness = _Glossiness;
            //o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
