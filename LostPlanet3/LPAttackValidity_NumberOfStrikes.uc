class LPAttackValidity_NumberOfStrikes extends LPAttackValidity
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x7C3E0000-0x00000000*/ private int RequiredNumberOfStrikes[65537];

simulated function IsValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPAIControllerAct1Boss(InController).NumberOfStrikesPerformed >= RequiredNumberOfStrikes;
    //return ReturnValue;    
}

defaultproperties
{
    RequiredNumberOfStrikes=1
}