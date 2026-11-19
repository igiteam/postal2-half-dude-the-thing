class LPKillObjective extends Actor
    abstract
    nativereplication
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPPawn PawnToKill[2097153];
var(0.25_Pct) /*0x9AE30000-0x00000400*/ private const export @NULL ObjectiveComponent[589825];

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x2D
    if(VarName == 'PawnToKill')
    {
        SetPawnToKill(PawnToKill);        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
    //return;    
}

simulated function SetPawnToKill()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], LPPC;

    PawnToKill = P;
    LPPC = LPPlayerController(Class'Engine.UIInteraction'.static.GetLocalPlayer(0).Actor);
    // End:0xB0
    if((LPPC != none) && PawnToKill != none)
    {
        LPPC.myLPHUD.CreateKillObjective(self);
    }
    TriggerEventClass(Class'LPSeqEvent_ObjectiveBegin', self);
    //return;    
}

function ExternalTriggerEvent()
{
    local /*0x97E50000-0x00000000*/ private class EventClassToTrigger[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(EventInstigator == none)
    {
        EventInstigator = self;
    }
    return TriggerEventClass(EventClassToTrigger, EventInstigator);
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPObjectiveComponentKill'Default__LPKillObjective.ObjectiveComp'
    begin object name=ObjectiveComp class=Class'LPObjectiveComponentKill'
    end object
    ObjectiveComponent=ObjectiveComp
    Components[0]=ObjectiveComp
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
    bAlwaysRelevant=true
    SupportedEvents=/* Array type was not detected. */
}