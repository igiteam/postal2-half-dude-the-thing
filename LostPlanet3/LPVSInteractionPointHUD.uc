class LPVSInteractionPointHUD extends LPNote
    hidecategories(AnimDependency,Navigation);

enum InteractionUIElementTypes
{
    EInteraction_GrabPoint,         // 0
    EInteraction_WeldPoint,         // 1
    EInteraction_DrillPoint,        // 2
    EInteraction_TaserPoint,        // 3
    EInteraction_MAX                // 4
};

struct CheckpointRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabled;

    structdefaultproperties
    {
        bEnabled=false
    }
};

var(0.25_Pct) /*0x8AD40000-0x00000000*/ private bool bEnabled[65537];
var(0.25_Pct) /*0x8AD40000-0x00000000*/ private bool bForceDisplayActive[65537];
var(0.25_Pct) /*0x8AD40000-0x00000000*/ private bool bForceDisplayInactive[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string InteractionPointModeString;
var(0.25_Pct) /*0x8AD40000-0x00000000*/ private byte UIElementType[65537];
var(0.25_Pct) /*0x8AD40000-0x00000400*/ private editfixedsize @NULL InputCallout[589825];
var(0.25_Pct) /*0x8AD40000-0x00000000*/ private float VisibilityDistance[65537];
var(0.25_Pct) /*0x8AD40000-0x00000000*/ private @NULL VSIP[65537];

simulated event PostBeginPlay()
{
    // End:0x2F
    if(VSIP != none)
    {
        VSIP.SetHUDIcon(self);
    }
    super.PostBeginPlay();
    //return;    
}

simulated function SetInteractionPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVSIP[8388609];

    // End:0x26
    if(VSIP != none)
    {
        // End:0x26
        if(VSIP != InVSIP)
        {
        }
    }
    VSIP = InVSIP;
    //return;    
}

simulated function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    //return;    
}

simulated function OnInteractionPointHUDForceActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bForceDisplayActive = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bForceDisplayActive = false;            
        }
        else
        {
            // End:0xDE
            if(Action.InputLinks[2].bHasImpulse)
            {
                bForceDisplayActive = !bForceDisplayActive;                
            }
            else
            {
                // End:0x125
                if(Action.InputLinks[3].bHasImpulse)
                {
                    bForceDisplayInactive = true;                    
                }
                else
                {
                    // End:0x16C
                    if(Action.InputLinks[4].bHasImpulse)
                    {
                        bForceDisplayInactive = false;                        
                    }
                    else
                    {
                        // End:0x1BB
                        if(Action.InputLinks[5].bHasImpulse)
                        {
                            bForceDisplayInactive = !bForceDisplayInactive;
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25165825];

    Record.bEnabled = bEnabled;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    bEnabled = Record.bEnabled;
    //return;    
}

defaultproperties
{
    InteractionPointModeString="normalGrab"
    VisibilityDistance=-1.0000000
    bStatic=false
}