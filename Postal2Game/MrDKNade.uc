//=============================================================================
// MrDTNade.
// xPatch Edit: Removed unnecessary stuff
//=============================================================================
class MrDKNade extends Actor
    placeable;
 
var MeshAnimation MyAnims;
var bool bInitialized;
var float FreezeFrame;

simulated event Tick(float Delta)
{
	//log(Self@"Tick("$Delta$")");
	if (bInitialized)
		Disable('Tick');
	else
		Initialize();
}

simulated function Initialize()
{
	//log(Self@"Initialize()");
	LinkSkelAnim(MyAnims);
	PlayIdleAnim();
	bInitialized=True;
}

function PlayIdleAnim()
{
	// You know what... let's freeze it 
	// Krotchy doll being "alive" looks freaky as heck.
	// Plus it clips through the pin... bleh.
//	LoopAnim('s_base1');
	PlayAnim('s_base1');
	FreezeAnimAt(FreezeFrame);
}


// Decompiled with UE Explorer.
defaultproperties
{
    MyAnims=MeshAnimation'P2R_Anims_D.Weapons.animKrotchy'
    FreezeFrame=7.0000000
    bClientAnim=true
    RemoteRole=0
    DrawType=2
    Mesh=SkeletalMesh'P2R_Anims_D.Weapons.Krotchy'
    DrawScale=0.1550000
    bBlockZeroExtentTraces=false
    bBlockNonZeroExtentTraces=false
}