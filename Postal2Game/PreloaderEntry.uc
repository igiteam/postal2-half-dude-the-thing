///////////////////////////////////////////////////////////////////////////////
// PreLoaderEntry.uc
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// History:
//	10/16/02 MJR	Started.
//
///////////////////////////////////////////////////////////////////////////////
//
// This PreLoader is designed to be placed into the Entry map so it can
// preload objects that will be used throughout the entire game.  Anything
// loaded in Entry is never unloaded because Entry itself is never unloaded.
//
///////////////////////////////////////////////////////////////////////////////
class PreLoaderEntry extends PreLoader
	placeable;


///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts, enums...
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
// Default properties
//
// Most preloads can be handled here by simply referencing the item.
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    AutoLoads[0]=Class'Inventory.BatonWeapon'
    AutoLoads[1]=Class'Inventory.FootWeapon'
    AutoLoads[2]=Class'Inventory.GasCanWeapon'
    AutoLoads[3]=Class'Inventory.GrenadeWeapon'
    AutoLoads[4]=Class'Inventory.HandsWeapon'
    AutoLoads[5]=Class'Inventory.LauncherWeapon'
    AutoLoads[6]=Class'Inventory.MachineGunWeapon'
    AutoLoads[7]=Class'Inventory.MatchesWeapon'
    AutoLoads[8]=Class'Inventory.MolotovWeapon'
    AutoLoads[9]=Class'Inventory.NapalmWeapon'
    AutoLoads[10]=Class'Inventory.PistolWeapon'
    AutoLoads[11]=Class'Inventory.RifleWeapon'
    AutoLoads[12]=Class'Inventory.ScissorsWeapon'
    AutoLoads[13]=Class'Inventory.ShotGunWeapon'
    AutoLoads[14]=Class'Inventory.ShovelWeapon'
    AutoLoads[15]=Class'Inventory.ShockerWeapon'
    AutoLoads[16]=Class'Inventory.UrethraWeapon'
    AutoLoads[17]=Class'People.DogPawn'
    AutoLoads[18]=Class'People.CatPawn'
}