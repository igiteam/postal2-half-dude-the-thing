class TexEnvMap extends TexModifier
	editinlinenew
	native;


var() enum ETexEnvMapType
{
	EM_WorldSpace,
	EM_CameraSpace,
} EnvMapType;


// Decompiled with UE Explorer.
defaultproperties
{
    EnvMapType=1
    TexCoordCount=1
}