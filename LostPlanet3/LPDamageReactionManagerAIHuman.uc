class LPDamageReactionManagerAIHuman extends LPDamageReactionManagerAI
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyHumanPawn;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MyHumanPawn = LPAIPawnHuman(inPawn);
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
    super.ExecuteDamageReaction();
    //return;    
}

function SetDefaultDamageReaction()
{
    // End:0x26
    if(MyHumanPawn.Health <= 0)
    {
        return;
    }
    // End:0xAC
    if(class<LPDamageTypeBallistic>(MyHumanPawn.TakeDamageParams.DamageType) != none)
    {
        SetAIReactionDelegate(None);
        SetAdditiveTemplateRoot(MyHumanPawn.ATL_AdditiveHitReaction);        
    }
    else
    {
        SetAIReactionDelegate(DHD_BasicHitReaction);
    }
    //return;    
}
