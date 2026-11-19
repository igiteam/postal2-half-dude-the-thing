class LPAIObjectiveAttackSentinel extends LPAIObjectiveAttackActor within LPAIControllerSentinel
    config(AI)
    hidecategories(Object,Object);

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xFD
    if(!Outer.DesignerForceBlockSearch)
    {
        // End:0x4A
        if(!Outer.bFinishedSearch)
        {
            return false;
        }
        // End:0x70
        if(Outer.Enemy == none)
        {
            return false;
        }
        // End:0xFD
        if(!Outer.DesignerInStealthMode && !Outer.CheckValidRangeToEnemy())
        {
            Outer.bFinishedSearch = false;
            Outer.Enemy = none;
            return false;
        }
    }
    return super.IsValid();
    //return ReturnValue;    
}

defaultproperties
{
    bRangedAttack=true
}