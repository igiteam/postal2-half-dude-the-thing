class LPDamageReactionManagerAkrid extends LPDamageReactionManagerAI
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyAkridPawn;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MyAkridPawn = LPAIPawnAkrid(inPawn);
    MyAkridPawn.DamageReactionManagerAkrid = self;
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
