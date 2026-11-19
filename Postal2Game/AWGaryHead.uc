//=============================================================================
// AWGaryHead
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
//=============================================================================
class AWGaryHead extends AWHead
	placeable;

var float spinheadtime;
var float spinspeed;
var float toolheadtime;
var float activetime;
var float activerand;
var rotator StartRotation;	// starting relative rotation

///////////////////////////////////////////////////////////////////////////////
// Rotate around slowly
///////////////////////////////////////////////////////////////////////////////
state SpinHead
{
	function Tick(float DeltaTime)
	{
		local rotator userot;
		userot = RelativeRotation;
		userot.Pitch = userot.Pitch + spinspeed*DeltaTime;

		SetRelativeRotation(userot);
	}
Begin:
	Sleep(spinheadtime);
	GotoState('Active');
}

///////////////////////////////////////////////////////////////////////////////
// pick random rotations for head to go to 
///////////////////////////////////////////////////////////////////////////////
state ToolHead
{
	function Tick(float DeltaTime)
	{
		local rotator userot;
		userot = RelativeRotation;
		userot.Pitch = FRand()*65535;

		SetRelativeRotation(userot);
	}
Begin:
	Sleep(toolheadtime);
	GotoState('Active');
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto state Active
{
	function BeginState()
	{
		SetRelativeRotation(StartRotation);
	}
Begin:
	Sleep(activetime + FRand()*activerand);
	if(FRand() < 0.5)
		GotoState('SpinHead');
	else
		GotoState('ToolHead');
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////


// Decompiled with UE Explorer.
defaultproperties
{
    spinheadtime=6.5000000
    SpinSpeed=10000.0000000
    toolheadtime=1.5000000
    activetime=5.0000000
    activerand=5.0000000
    StartRotation=(Pitch=0,Yaw=-16384,Roll=16384)
}