//=============================================================================
// InterpolationPoint.
// Used as destinations to move the camera to in Matinee scenes.
//=============================================================================
class InterpolationPoint extends Keypoint
	hidecategories(Collision,Lighting,LightColor,Karma,Force,Shadow,Sound)
	native;

#exec Texture Import File=Textures\matineecamera.bmp Name=S_Interp Mips=Off MASKED=1
#exec TEXTURE IMPORT File=Textures\InterpCamera_Tex.dds Name=InterpCamera_Tex
#exec NEW STATICMESH File=Models\InterpCamera_SM.ASE Name=InterpCamera_SM


// Decompiled with UE Explorer.
defaultproperties
{
    DrawType=8
    StaticMesh=StaticMesh'InterpCamera_SM'
    DrawScale=1.0000000
    Skins[0]=91
    bUnlit=true
    bDirectional=true
}