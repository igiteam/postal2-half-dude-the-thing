class LPDamageReactionManagerStalker extends LPDamageReactionManagerAkrid
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyStalkerPawn;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MyStalkerPawn = LPAIPawnStalker(inPawn);
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
    //return;    
}

function ExecuteDamageReaction()
{
    super(LPDamageReactionManagerAI).ExecuteDamageReaction();
    //return;    
}

function SetDefaultDamageReaction()
{
    // End:0x26
    if(MyStalkerPawn.Health <= 0)
    {
        return;
    }
    // End:0xBE
    if(!MyStalkerPawn.TuneDataStalker.EnableReactiveStrikeToPlayerMelee && MyStalkerPawn.TakeDamageParams.DamageType == Class'LPDamageTypePlayerMelee')
    {
        SetAIReactionDelegate(DHD_BasicHitReaction);        
    }
    else
    {
        SetAIReactionDelegate(None);
        // End:0x13E
        if(FRand() < MyStalkerPawn.TuneDataStalker.PctgAltHitReaction)
        {
            SetAdditiveTemplateRoot(MyStalkerPawn.ATL_AdditiveHitReaction02);            
        }
        else
        {
            SetAdditiveTemplateRoot(MyStalkerPawn.ATL_AdditiveHitReaction);
        }
    }
    //return;    
}
