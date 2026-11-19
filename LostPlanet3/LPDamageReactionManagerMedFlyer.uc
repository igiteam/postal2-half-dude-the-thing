class LPDamageReactionManagerMedFlyer extends LPDamageReactionManagerAkrid
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyMedFlyerPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastPawnToCauseBurnDamage;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MyMedFlyerPawn = LPAIPawnMedFlyer(inPawn);
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
    if(MyMedFlyerPawn.Health <= 0)
    {
        return;
    }
    // End:0x5F
    if(MyMedFlyerPawn.MyMedFlyerController.IsDoingRamAttack())
    {
        return;
    }
    // End:0x8C
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

function GetTakeDamageAmount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return MyAkridPawn.TakeDamageParams.Damage;
    //return ReturnValue;    
}

simulated function ClientCacheDamageAttributes()
{
    super.ClientCacheDamageAttributes();
    // End:0x6C
    if(MyMedFlyerPawn.Health > 0)
    {
        MyMedFlyerPawn.TestForNonDirectCoreHitDismemberment();
        MyMedFlyerPawn.TestForNonDirectCoreHitDamageGibbing();
    }
    //return;    
}

function DHD_CoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    // End:0x62
    if(MyMedFlyerPawn.Health > 0)
    {
        MyMedFlyerPawn.TestForNonDirectCoreHitDismemberment();
        MyMedFlyerPawn.TestForNonDirectCoreHitDamageGibbing();
    }
    // End:0x126
    if((MyMedFlyerPawn.TakeDamageParams.DamageType == Class'LPDamageTypeVSWelder') || MyMedFlyerPawn.TakeDamageParams.DamageType == Class'LPDamageTypeElectrical')
    {
        LastPawnToCauseBurnDamage = LPPawn(MyMedFlyerPawn.TakeDamageParams.InstigatedByPawn);
    }
    // End:0x3E1
    if(MyMedFlyerPawn.MyMedFlyerController != none)
    {
        MyMedFlyerPawn.MyMedFlyerController.NotifyOfCoreHit(HitCoreIndex, float(MyMedFlyerPawn.TakeDamageParams.Damage), MyMedFlyerPawn.TakeDamageParams.DamageType);
        // End:0x325
        if(((MyMedFlyerPawn.TakeDamageParams.DamageType == Class'LPDamageTypeVSWelderDOT') || MyMedFlyerPawn.TakeDamageParams.DamageType == Class'LPDamageTypeARIncendiaryDOT') || MyMedFlyerPawn.TakeDamageParams.DamageType == Class'LPDamageTypeElectricDOT')
        {
            // End:0x322
            if(!MyMedFlyerPawn.MyMedFlyerController.bReactingToBeingOnFire)
            {
                MyMedFlyerPawn.MyMedFlyerController.CmdMedFlyerOnFire(LastPawnToCauseBurnDamage);
            }            
        }
        else
        {
            // End:0x3E1
            if((MyMedFlyerPawn.TakeDamageParams.DamageType != Class'LPDamageTypeVSWelder') && MyMedFlyerPawn.TakeDamageParams.DamageType != Class'LPDamageTypeElectrical')
            {
                MyMedFlyerPawn.MyMedFlyerController.CmdHitReaction(0.0000000,, 1);
            }
        }
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    // End:0x62
    if(MyMedFlyerPawn.Health > 0)
    {
        MyMedFlyerPawn.TestForNonDirectCoreHitDismemberment();
        MyMedFlyerPawn.TestForNonDirectCoreHitDamageGibbing();
    }
    // End:0x126
    if((MyMedFlyerPawn.TakeDamageParams.DamageType == Class'LPDamageTypeVSWelder') || MyMedFlyerPawn.TakeDamageParams.DamageType == Class'LPDamageTypeElectrical')
    {
        LastPawnToCauseBurnDamage = LPPawn(MyMedFlyerPawn.TakeDamageParams.InstigatedByPawn);
    }
    // End:0x3D8
    if(MyMedFlyerPawn.MyMedFlyerController != none)
    {
        MyMedFlyerPawn.MyMedFlyerController.NotifyOfNonCoreHit(float(MyMedFlyerPawn.TakeDamageParams.Damage), MyMedFlyerPawn.TakeDamageParams.DamageType);
        // End:0x31C
        if(((MyMedFlyerPawn.TakeDamageParams.DamageType == Class'LPDamageTypeVSWelderDOT') || MyMedFlyerPawn.TakeDamageParams.DamageType == Class'LPDamageTypeARIncendiaryDOT') || MyMedFlyerPawn.TakeDamageParams.DamageType == Class'LPDamageTypeElectricDOT')
        {
            // End:0x319
            if(!MyMedFlyerPawn.MyMedFlyerController.bReactingToBeingOnFire)
            {
                MyMedFlyerPawn.MyMedFlyerController.CmdMedFlyerOnFire(LastPawnToCauseBurnDamage);
            }            
        }
        else
        {
            // End:0x3D8
            if((MyMedFlyerPawn.TakeDamageParams.DamageType != Class'LPDamageTypeVSWelder') && MyMedFlyerPawn.TakeDamageParams.DamageType != Class'LPDamageTypeElectrical')
            {
                MyMedFlyerPawn.MyMedFlyerController.CmdHitReaction(0.0000000,, 1);
            }
        }
    }
    //return;    
}
