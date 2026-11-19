class LPGFxUIElementGameMessageStruggleStickRight extends LPGFxUIElementGameMessageStruggle;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HolderMoveStickXMC;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super.Init(MP);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;

    bShouldBeActive = super.Update(DeltaTime);
    // End:0x77
    if(bShouldBeActive)
    {
        // End:0x77
        if(HolderMoveStickXMC == none)
        {
            HolderMoveStickXMC = useStatusMC.GetObject(buttonHolderClipName);
            MoveDirection();
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function MoveDirection()
{
    MoveRight();
    //return;    
}

function MoveLeft()
{
    // End:0x38
    if(useStatusMC != none)
    {
        HolderMoveStickXMC.ActionScriptVoid("MoveLeft");
    }
    //return;    
}

function MoveRight()
{
    // End:0x39
    if(useStatusMC != none)
    {
        HolderMoveStickXMC.ActionScriptVoid("MoveRight");
    }
    //return;    
}

defaultproperties
{
    useStatusModeFrameName="moveStickX"
}