class InventoryAttachment extends Actor
	native
	nativereplication;

function InitFor(Inventory I)
{
	SetDrawScale(I.ThirdPersonScale);
	if ( I.ThirdPersonMesh != None )
		LinkMesh(I.ThirdPersonMesh);
	else if ( I.ThirdPersonStaticMesh != None )
	{
		SetStaticMesh(I.ThirdPersonStaticMesh);
		SetDrawType(DT_StaticMesh);
		SetDrawScale(DrawScale);
	}
	Instigator = I.Instigator;
}
		

// Decompiled with UE Explorer.
defaultproperties
{
    bAcceptsProjectors=true
    RemoteRole=2
    DrawType=2
    bUseLightingFromBase=true
    CullDistance=5000.0000000
}