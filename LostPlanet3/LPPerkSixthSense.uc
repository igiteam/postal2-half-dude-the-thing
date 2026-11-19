class LPPerkSixthSense extends LPPerkAbility;

struct native SixthSenseTag
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TagPRI;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TaggerPRI;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TagTimeRemaining;

    structdefaultproperties
    {
        TagPRI=none
        TaggerPRI=none
        TagTimeRemaining=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SenseTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TagCandidate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SixthSenseTags[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TagTimer;

// Export ULPPerkSixthSense::execAddTag(FFrame&, void* const)
native function AddTag()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], Tagger;
    local /*0x97E50000-0x00000000*/ private float TagDuration[8388609];


}

// Export ULPPerkSixthSense::execIsTagged(FFrame&, void* const)
native function IsTagged()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPerkSixthSense::execIsTaggedPRI(FFrame&, void* const)
native function IsTaggedPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPerkSixthSense::execGetTagger(FFrame&, void* const)
native function GetTagger()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetPRI[8388609], ReturnValue;


}

event UpdateTags()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xD0 [Loop If]
    if(I < SixthSenseTags.Length)
    {
        SixthSenseTags[I].TagTimeRemaining -= SenseTuneData.UpdateRate;
        // End:0xC2
        if(SixthSenseTags[I].TagTimeRemaining <= float(0))
        {
            SixthSenseTags.RemoveItem(SixthSenseTags[I]);            
            I--;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

defaultproperties
{
    PerkName="SixthSense"
    PerkType=EPerkType.PerkType_AbilityPassive
    PerkIndex=EPerks.EPERK_SIXTHSENSE
    HUDIconName="iconSixthSense"
    FriendlyName="6th Sense"
    Description="Ability that warns when foes are aiming at you.  Also allows you to \"Mark\" enemies by aiming at them!"
}