class LPDamageReactionManagerSepia extends LPDamageReactionManagerAkrid
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MySepiaPawn;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MySepiaPawn = LPAIPawnSepia(inPawn);
    //return;    
}

function ServerCacheDamageAttributes()
{
    super.ServerCacheDamageAttributes();
    //return;    
}

function CanDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPDamageReactionManagerAI).CanDamageCore(CoreTag);
    //return ReturnValue;    
}

function SetDefaultDamageReaction()
{
    // End:0x26
    if(MySepiaPawn.Health <= 0)
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

simulated function ClientCacheDamageAttributes()
{
    super.ClientCacheDamageAttributes();
    //return;    
}

function DHD_CoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], medFlyCtrl;

    medFlyCtrl = LPAIControllerSepia(LPC);
    // End:0xDD
    if(medFlyCtrl != none)
    {
        medFlyCtrl.NotifyOfCoreHit(HitCoreIndex, float(MySepiaPawn.TakeDamageParams.Damage), MySepiaPawn.TakeDamageParams.DamageType);
        medFlyCtrl.CmdHitReaction(0.0000000);
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], medFlyCtrl;

    medFlyCtrl = LPAIControllerSepia(LPC);
    // End:0xD5
    if(medFlyCtrl != none)
    {
        medFlyCtrl.NotifyOfNonCoreHit(float(MySepiaPawn.TakeDamageParams.Damage), MySepiaPawn.TakeDamageParams.DamageType);
        medFlyCtrl.CmdHitReaction(0.0000000,, 1);
    }
    //return;    
}
