class LPDamageReactionManagerAct1Boss extends LPDamageReactionManagerAkrid
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BossPawn;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    BossPawn = LPAIPawnAct1Boss(inPawn);
    //return;    
}

function CanDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xA3
    if(BossPawn.IsCoreEnabled(CoreTag.GetCoreId()))
    {
        // End:0xA3
        if(BossPawn.Controller != none)
        {
            return LPAIControllerAct1Boss(BossPawn.Controller).bCoresVulnerable;
        }
    }
    return false;
    //return ReturnValue;    
}

function SetDefaultDamageReaction()
{
    // End:0x26
    if(BossPawn.Health <= 0)
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
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], bc;

    bc = LPAIControllerAct1Boss(LPC);
    // End:0xB7
    if(bc != none)
    {
        bc.NotifyOfCoreHit(HitCoreIndex, float(BossPawn.TakeDamageParams.Damage), BossPawn.TakeDamageParams.DamageType);
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], bc;

    bc = LPAIControllerAct1Boss(LPC);
    // End:0xAE
    if(bc != none)
    {
        bc.NotifyOfNonCoreHit(float(BossPawn.TakeDamageParams.Damage), BossPawn.TakeDamageParams.DamageType);
    }
    //return;    
}
