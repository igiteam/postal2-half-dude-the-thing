class AnimationCompressionAlgorithm extends Object
    abstract
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Description;
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsSkeleton;
var(*) /*0x35EA0000-0x00000000*/ private byte TranslationCompressionFormat;
var(*) /*0x029A0000-0x00000000*/ private byte RotationCompressionFormat[65537];

defaultproperties
{
    Description="None"
    RotationCompressionFormat=AnimationCompressionFormat.ACF_Float96NoW
}