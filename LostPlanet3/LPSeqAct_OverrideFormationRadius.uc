class LPSeqAct_OverrideFormationRadius extends SPSeqAct_OverrideFormationRadius
    forcescriptorder(true)
    hidecategories(Object);

enum EFormationType
{
    Formation_Packhunter,           // 0
    Formation_MAX                   // 1
};

var(0.25_Pct) /*0x82F20000-0x00000000*/ private byte FormationType[65537];

event Activated()
{
    switch(FormationType)
    {
        // End:0x2E
        case 0:
            ResourceName = 'PackHunterFormation';
            // End:0x47
            break;
        // End:0xFFFF
        default:
            ResourceName = 'Unknown';
            // End:0x47
            break;
            break;
    }
    //return;    
}

defaultproperties
{
    ObjName="Override the formation radius (LP)"
}