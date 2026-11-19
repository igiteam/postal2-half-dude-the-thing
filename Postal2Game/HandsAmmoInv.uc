///////////////////////////////////////////////////////////////////////////////
// HandsAmmoInv
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
//	Hands ammo--nothing.
//
///////////////////////////////////////////////////////////////////////////////
class HandsAmmoInv extends InfiniteAmmoInv;

///////////////////////////////////////////////////////////////////////////////
function AddedToPawnInv(Pawn UsePawn, Controller UseCont)
{
	Super.AddedToPawnInv(UsePawn, UseCont);
	//log(self$" my ready "$bReadyForUse);
}


// Decompiled with UE Explorer.
defaultproperties
{
    Texture=Texture'HUDPack.Icons.icon_inv_emptyhands'
}