class LPDamageReactionManagerPackHunter extends LPDamageReactionManagerAkrid
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPHPawn;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MyPHPawn = LPAIPawnPackHunter(inPawn);
    //return;    
}

function ServerCacheDamageAttributes()
{
    super.ServerCacheDamageAttributes();
    // End:0x8C
    if(class<LPDamageTypeBallistic>(MyPHPawn.TakeDamageParams.DamageType) != none)
    {
        MyPHPawn.TakeDamageParams.Momentum = vect(0.0000000, 0.0000000, 0.0000000);        
    }
    else
    {
        // End:0x140
        if(class<LPDamageTypeVSMelee>(MyPHPawn.TakeDamageParams.DamageType) != none)
        {
            MyPHPawn.TakeDamageParams.Damage = MyPHPawn.Health + 1;
            MyPHPawn.bShouldRagdoll = true;
        }
    }
    //return;    
}

function CanDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if((HitCoreIndex == 3) || HitCoreIndex == 4)
    {
        return false;
    }
    return super(LPDamageReactionManagerAI).CanDamageCore(CoreTag);
    //return ReturnValue;    
}

function SetDefaultDamageReaction()
{
    // End:0x26
    if(MyPHPawn.Health <= 0)
    {
        return;
    }
    // End:0x53
    if(HitCoreIndex >= 0)
    {
        SetAIReactionDelegate(DHD_CoreHitReaction);        
    }
    else
    {
        SetAIReactionDelegate(DHD_NonCoreHitReaction);
    }
    //return;    
}

function DHD_CoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], phCon;

    phCon = LPAIControllerPackHunter(LPC);
    // End:0x83
    if(ClassIsChildOf(myAIPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSDrill'))
    {
        phCon.CmdHitReaction(0.0000000,, 1);
    }
    // End:0x11E
    if(phCon != none)
    {
        phCon.NotifyOfCoreHit(HitCoreIndex, float(MyPHPawn.TakeDamageParams.Damage), MyPHPawn.TakeDamageParams.DamageType);
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], phCon;

    phCon = LPAIControllerPackHunter(LPC);
    // End:0x83
    if(ClassIsChildOf(myAIPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSDrill'))
    {
        phCon.CmdHitReaction(0.0000000,, 1);
    }
    // End:0x115
    if(phCon != none)
    {
        phCon.NotifyOfNonCoreHit(float(MyPHPawn.TakeDamageParams.Damage), MyPHPawn.TakeDamageParams.DamageType);
    }
    //return;    
}
