class LPDamageReactionManager extends Object
    abstract
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsVSMeleeDamage;

// Export ULPDamageReactionManager::execUpdate(FFrame&, void* const)
native function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    MyLPPawn = LPPawn(inPawn);
    //return;    
}

simulated function TurnOffAnyLoopingDamageActions()
{
    //return;    
}

final event CacheDamageAttributes()
{
    // End:0x4B
    if(int(MyLPPawn.WorldInfo.NetMode) == int(NM_Client))
    {
        ClientCacheDamageAttributes();        
    }
    else
    {
        ServerCacheDamageAttributes();
    }
    //return;    
}

simulated function ClientCacheDamageAttributes()
{
    //return;    
}

function ServerCacheDamageAttributes()
{
    bIsVSMeleeDamage = ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMelee');
    //return;    
}

function ReplicateTakeDamageEffects()
{
    //return;    
}
