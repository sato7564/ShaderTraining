Shader "Unlit / outline"
{
    SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 100

        //少し膨らます
        Pass
        {
            //裏面のみの描画を指定
            Cull Front

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag  

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            v2f vert(appdata v)
            {
                v2f o;
                //ローカル座標でモデルを膨張してから
                v.vertex += float4(v.normal*0.04f,0);
                //頂点座標をワールド座標に変換
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }
            //黒色でべた塗
            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 col = fixed4(0.1,0.1,0.1,1);
                return col;
            }
            ENDCG
        }


        //普通に表示する（トゥーンシェーダーを適用）
                Pass
    {
        Cull Back

        CGPROGRAM
        #pragma vertex vert
        #pragma fragment frag

        #include "UnityCG.cginc"

        struct appdata
        {
            float4 vertex : POSITION;
            float3 normal : NORMAL;
        };

        struct v2f
        {
            float4 vertex : SV_POSITION;
            float3 normal : NORMAL;
        };

        v2f vert(appdata v)
        {
            v2f o;
            o.vertex = UnityObjectToClipPos(v.vertex);
            o.normal = UnityObjectToWorldNormal(v.normal);
            return o;
        }

        fixed4 frag(v2f i) : SV_Target
        {
            half nl = max(0, dot(i.normal, _WorldSpaceLightPos0.xyz));
            if (nl <= 0.01f) nl = 0.1f;
            else if (nl <= 0.3f) nl = 0.3f;
            else nl = 1.0f;
            fixed4 col = fixed4(nl, nl, nl, 1);
            return col;
        }
        ENDCG

    }
    }
}