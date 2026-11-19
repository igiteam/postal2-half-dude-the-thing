class LPAttackValidity_NumberOfAttacks extends LPAttackValidity
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x7C3D0000-0x00000000*/ private int RequiredNumberOfAttacks[65537];

simulated function IsValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPAIControllerAct1Boss(InController).NumberOfAttacksPerformed >= RequiredNumberOfAttacks;
    //return ReturnValue;    
}

defaultproperties
{
    RequiredNumberOfAttacks=1
}