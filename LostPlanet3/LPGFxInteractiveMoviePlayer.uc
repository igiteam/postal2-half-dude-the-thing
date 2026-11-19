class LPGFxInteractiveMoviePlayer extends SPGFxMoviePlayer
    config(UI);

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL Player[9437185];

    super.Init(Player);
    SetExternalInterface(self);
    //return;    
}

simulated function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    UpdateMovie(DeltaTime);
    //return;    
}

simulated function BeginLocked()
{
    ActionScriptVoid("StartLocked");
    //return;    
}

simulated function BeginGame()
{
    ActionScriptVoid("Start");
    //return;    
}

simulated function InputDirection()
{
    local /*0x97E50000-0x00000000*/ private int iDirection[8388609];

    ActionScriptVoid("TestInput");
    //return;    
}

simulated function SetLaneSpeeds()
{
    local /*0x97E50000-0x00000000*/ private float A[8388609], B, C, D;

    ActionScriptVoid("SetLaneSpeeds");
    //return;    
}

simulated function SetLaneSpeedLevels()
{
    local /*0x97E50000-0x00000000*/ private float A[8388609], B, C, D;

    ActionScriptVoid("SetLaneSpeedLevels");
    //return;    
}

simulated function SetSpawnRates()
{
    local /*0x97E50000-0x00000000*/ private float A[8388609], B, C, D;

    ActionScriptVoid("SetSpawnRates");
    //return;    
}

simulated function SetLockLevels()
{
    local /*0x97E50000-0x00000000*/ private float A[8388609], B, C, D;

    ActionScriptVoid("SetLockLevels");
    //return;    
}

simulated function SetMaxMisses()
{
    local /*0x97E50000-0x00000000*/ private int misses[8388609];

    ActionScriptVoid("SetMaxMisses");
    //return;    
}

simulated function UpdateMovie()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    ActionScriptVoid("Tick");
    //return;    
}

simulated function OnSuccessOutro()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC, SM;

    LPC = LPPlayerController(GetPC());
    // End:0xE9
    if((LPC != none) && LPC.MySPPawn != none)
    {
        SM = LPSM_PlayerInteractionObject(LPC.MySPPawn.GetCurrentSpecialMoveInstance());
        // End:0xCA
        if(SM != none)
        {
            SM.CompleteInteraction();            
        }
        else
        {
            LPC.StartGeneralInteractionOperation();
        }
    }
    //return;    
}

simulated function OnFailureOutro()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = LPPlayerController(GetPC());
    // End:0x4B
    if(LPC != none)
    {
        LPC.StartGeneralInteractionOperation();
    }
    //return;    
}

simulated function OnLockedOutro()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = LPPlayerController(GetPC());
    // End:0x4B
    if(LPC != none)
    {
        LPC.StartGeneralInteractionOperation();
    }
    //return;    
}

simulated function PlaySoundEvent()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string EventName[8388609];

    PlaySoundFromTheme(name(EventName), 'Default');
    //return;    
}

defaultproperties
{
    bAllowInput=false
    bAllowFocus=false
}