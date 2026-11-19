class LPAnimNodeSequenceBlendByAimProfile extends SPAnimNodeSequenceBlendByAimProfile
    hidecategories(Object,Object,Object,Animations);

var(0.25_Pct) /*0x7BBB0000-0x00000000*/ private name ForcedAimContext[65537];
var(0.25_Pct) /*0x7BBB0000-0x00000000*/ private bool MatchBlendTimeToParentBlendByAimState[65537];

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

defaultproperties
{
    MatchBlendTimeToParentBlendByAimState=true
    bSynchronizeNodesInEditor=true
}