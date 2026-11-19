class LPDamageReactionManagerMech extends LPDamageReactionManagerAI
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyMechPawn;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MyMechPawn = LPAIPawnMech(inPawn);
    MyMechPawn.DamageReactionManagerMech = self;
    //return;    
}

function ReplicateTakeDamageEffects()
{
    super.ReplicateTakeDamageEffects();
    //return;    
}

simulated function ClientCacheDamageAttributes()
{
    super.ClientCacheDamageAttributes();
    //return;    
}

function ServerCacheDamageAttributes()
{
    super.ServerCacheDamageAttributes();
    SetHitCoreProperties();
    //return;    
}

function CanDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (((CoreTag != none) && MyMechPawn.IsValidCoreTagType(CoreTag)) && MyMechPawn.CanDamageCoreID(CoreTag.GetCoreId(), MyMechPawn.TakeDamageParams.DamageType, MyMechPawn.TakeDamageParams.DamageCauser)) && MyMechPawn.MyLpAiController.CanDamageCore(CoreTag);
    //return ReturnValue;    
}
