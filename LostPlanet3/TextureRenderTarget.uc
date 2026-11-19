class TextureRenderTarget extends Texture
    abstract;

var(*) /*0x35EA0000-0x00000000*/ private bool bUpdateImmediate[536870913];
var(*) /*0x4C4E0000-0x00000000*/ private bool bNeedsTwoCopies[65537];
var(*) /*0x4C4E0000-0x00000000*/ private bool bRenderOnce[65537];
var(*) /*0x4C4E0000-0x00000000*/ private float TargetGamma[65537];

defaultproperties
{
    bNeedsTwoCopies=true
    CompressionNone=true
    NeverStream=true
    LODGroup=TextureGroup.TEXTUREGROUP_RenderTarget
}