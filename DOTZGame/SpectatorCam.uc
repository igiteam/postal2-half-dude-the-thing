//=============================================================================
// SpectatorCam.
//=============================================================================
class SpectatorCam extends KeyPoint;

var() bool bSkipView; // spectators skip this camera when flipping through cams
var() float FadeOutTime;	// fade out time if used as EndCam


// Decompiled with UE Explorer.
defaultproperties
{
    FadeOutTime=5.0000000
    bClientAnim=true
    bDirectional=true
    Texture=Texture'Engine.S_Camera'
    CollisionRadius=20.0000000
    CollisionHeight=40.0000000
}