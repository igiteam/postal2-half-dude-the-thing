class ScriptedTexture extends TextureRenderTarget2D
    hidecategories(Object,Texture);

var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsUpdate[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bSkipNextClear[536870913];
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __Render__Delegate;

delegate Render()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609];

    //return;    
}

defaultproperties
{
    bNeedsUpdate=true
    AddressX=TextureAddress.TA_Clamp
    AddressY=TextureAddress.TA_Clamp
    bNeedsTwoCopies=false
}