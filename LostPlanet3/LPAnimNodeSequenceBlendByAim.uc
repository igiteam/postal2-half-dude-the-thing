class LPAnimNodeSequenceBlendByAim extends SPAnimNodeSequenceBlendByAim
    hidecategories(Object,Object,Object,Animations);

var(0.25_Pct) /*0x2C250000-0x00000000*/ private name SocketToTrack[65537];
var(0.25_Pct) /*0x2C250000-0x00000000*/ private const @NULL CurrentAimRotator[536936449];
var(0.25_Pct) /*0x2C250000-0x00000000*/ private const float CurrentAimPitchAngle[536936449];
var(0.25_Pct) /*0x2C250000-0x00000000*/ private const float CurrentAimYawAngle[536936449];
var(0.25_Pct) /*0x7BBA0000-0x00000000*/ private byte AimZoneType[65537];
var(0.25_Pct) /*0x7BBA0000-0x00000000*/ private @NULL TimeToTraverseAimRange[65537];
var(0.25_Pct) /*0x7BBA0000-0x00000000*/ private name ForcedAimContext[65537];

event OnInit()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPawnOwner;

    LPPawnOwner = LPPawn(SkelComponent.Owner);
    // End:0x74
    if(LPPawnOwner != none)
    {
        LPPawnOwner.AimNodeInfo.bUsesAimNode = true;
    }
    //return;    
}

event ScriptGetAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPPawnOwner, NewAim;

    LPPawnOwner = LPPawn(SkelComponent.Owner);
    // End:0x19C
    if(LPPawnOwner != none)
    {
        NewAim = LPPawnOwner.GetAimForAimZone(AimZoneType, ForcedAimContext);
        // End:0x19C
        if(LPPawnOwner.IsUsingForcedAimZoneOfType(AimZoneType))
        {
            NewAim.X = LimitAimChange(NewAim.X, PreviousAim.X, TimeToTraverseAimRange.X);
            NewAim.Y = LimitAimChange(NewAim.Y, PreviousAim.Y, TimeToTraverseAimRange.Y);
        }
    }
    return NewAim;
    //return ReturnValue;    
}

function LimitAimChange()
{
    local /*0x97E50000-0x00000000*/ private float NewValue[8388609], PreviousValue, TimeToTraverse, ReturnValue, AimRate, MaxChange,
	    Delta;

    // End:0xEF
    if(TimeToTraverse > 0.0000000)
    {
        AimRate = 2.0000000 / TimeToTraverse;
        MaxChange = SkelComponent.Owner.WorldInfo.DeltaSeconds * AimRate;
        Delta = NewValue - PreviousValue;
        Delta = FClamp(Delta, -MaxChange, MaxChange);
        NewValue = PreviousValue + Delta;
    }
    return NewValue;
    //return ReturnValue;    
}

defaultproperties
{
    TimeToTraverseAimRange=(X=0.2000000,Y=0.2000000)
    bSynchronizeNodesInEditor=true
    bCallScriptEventOnInit=true
}