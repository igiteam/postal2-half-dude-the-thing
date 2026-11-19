//=============================================================================
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//=============================================================================
class RWSVince extends RWSStaff
	placeable;

// Vince needs to not use the turning anims when using these anims

simulated function PlayLaughingAnim()
{
	ChangePhysicsAnimUpdate(false);
	PlayAnim(GetAnimLaugh(), 1.0, 0.15);
}
simulated function PlayYourFiredAnim()
{
	ChangePhysicsAnimUpdate(false);
	PlayAnim('s_fired', 1.0, 0.15);
}


// Let his tag be 'RWSVince'

// Decompiled with UE Explorer.
defaultproperties
{
    HeadSkin=Texture'ChamelHeadSkins.Special.Vince'
    HeadMesh=SkeletalMesh'heads.AvgMale'
    bNoChamelBoltons=true
    DialogClass=Class'BasePeople.DialogVince'
    bPersistent=true
    bCanTeleportWithPlayer=false
    bKeepForMovie=true
    ControllerClass=Class'AIPack.VinceController'
    ActorID="Vince"
}