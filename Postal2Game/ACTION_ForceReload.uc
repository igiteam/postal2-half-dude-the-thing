///////////////////////////////////////////////////////////////////////////////
// ACTION_ForceReload.uc
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
// This action causes a reload, the same way as if a player were dead and he pressed the spacebar
//
///////////////////////////////////////////////////////////////////////////////
class ACTION_ForceReload extends P2ScriptedAction;

function bool InitActionFor(ScriptedController C)
{
	P2GameInfoSingle(C.Level.Game).LoadMostRecentGame();
	return false;
}


// Decompiled with UE Explorer.
defaultproperties
{
    ActionString="Force reload"
    bRequiresValidGameInfo=true
}