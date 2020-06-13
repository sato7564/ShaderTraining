using UnityEngine;
using System.Collections;

public class Wipe : MonoBehaviour
{

	public Material wipeCircle;

	void OnRenderImage(RenderTexture src, RenderTexture dest)
	{
		Graphics.Blit(src, dest, wipeCircle);
	}
}