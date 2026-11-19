///////////////////////////////////////////////////////////////////////////////
// Baton attachment for 3rd person
///////////////////////////////////////////////////////////////////////////////
class DustersAttachment extends FistsAttachment;

var DustersSecondAttachment TwinDusters;

function PostBeginPlay()
{
	TwinDusters = Spawn(Class'DustersSecondAttachment');
	Instigator.AttachToBone(TwinDusters, 'MALE01 L Hand');

	Super.PostBeginPlay();
}

event Destroyed()
{
	if( TwinDusters != None )
	{
		Instigator.DetachFromBone(TwinDusters);
		TwinDusters.Destroy();
		TwinDusters = None;
	}
	
	Super.Destroyed();
}


// Decompiled with UE Explorer.
defaultproperties
{
    WeapClass=Class'DustersWeapon'
    DrawType=2
    RelativeRotation=(Pitch=0,Yaw=0,Roll=32768)
    Mesh=SkeletalMesh'ED_Weapons.Dusters3rdMesh'
    DrawScale=0.9500000
}