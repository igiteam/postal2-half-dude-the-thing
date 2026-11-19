//=============================================================================
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//=============================================================================
class AWRWSVince extends AWRWSStaff
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


// Let his tag be 'AWRWSVince'


// Decompiled with UE Explorer.
defaultproperties
{
    HeadSkin=Texture'ChamelHeadSkins.Special.Vince'
    HeadMesh=SkeletalMesh'heads.AvgMale'
    WeapChangeDist=200.0000000
    DialogClass=Class'AWDialogVince'
    BaseEquipment=/* Array type was not detected. */
    bPersistent=true
    bCanTeleportWithPlayer=false
    bKeepForMovie=true
    ActorID="Vince"
}