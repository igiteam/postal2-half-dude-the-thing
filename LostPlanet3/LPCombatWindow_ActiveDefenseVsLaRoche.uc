class LPCombatWindow_ActiveDefenseVsLaRoche extends LPCombatWindow_ActiveDefense
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x7CAB0000-0x00000000*/ private byte LaRocheStrikeAttempting[65537];
var(0.25_Pct) /*0x7CAB0000-0x00000000*/ private byte LaRocheStruggleModeAttempting[65537];

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL Performer[8388609], Target;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL larPawn;

    larPawn = LPAIPawnVsLaroche(Target);
    // End:0x63
    if(larPawn != none)
    {
        // End:0x63
        if(!larPawn.IsValidActiveCombatWindowForThisTypeOfStrike(LaRocheStrikeAttempting, LaRocheStruggleModeAttempting))
        {
            return false;
        }
    }
    return super(LPCombatWindow).IsValid(Performer, Target);
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPCombatWindow_ActiveDefenseVsLaRoche.EnabledForDifficulty0'
    begin object name=EnabledForDifficulty0
    end object
    EnabledForDifficulty=EnabledForDifficulty0
}