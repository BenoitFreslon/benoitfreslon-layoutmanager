package  
{
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class Assets 
	{
		// Embed the Atlas XML
		[Embed( source="../../demo/assets/atlas.xml",mimeType="application/octet-stream" )]
		static public const AtlasXml : Class;
		
		// Embed the Atlas Texture:
		[Embed( source="../../demo/assets/atlas.png" )]
		static public const AtlasTexture : Class;
		
	}

}