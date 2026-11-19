class LPDAction_SpawnAICreative extends SPDAction_SpawnAI
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(0.25_Pct) /*0x28A00000-0x00000000*/ private name CreativeSpawnNodeName[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private class SpecialMoveClass[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private int MaxAlive[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private bool bSpawnDead[65537];

// Export ULPDAction_SpawnAICreative::execGetPawnClassFromFactory(FFrame&, void* const)
native function GetPawnClassFromFactory()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];


}

function CreateActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL manager[8388609], inActor, DamageInfo, ReturnValue, NewActor, A,
	    LPP, AIC, SM;

    local /*0x97E50000-0x00000000*/ private int AliveCount;
    local /*0x97E50000-0x00000000*/ private bool bCanSpawnAlive;

    AliveCount = 0;
    // End:0x71
    foreach inActor.DynamicActors(GetPawnClassFromFactory(), A)
    {
        // End:0x70
        if(Pawn(A).IsAliveAndWell())
        {
            AliveCount++;
        }        
    }    
    bCanSpawnAlive = (MaxAlive == 0) || AliveCount < MaxAlive;
    // End:0xC4
    if(!bCanSpawnAlive && !bSpawnDead)
    {
        return none;
    }
    NewActor = super.CreateActor(manager, inActor, DamageInfo);
    // End:0x2FB
    if(int(NewActor.Role) == int(ROLE_Authority))
    {
        LPP = LPPawn(NewActor);
        // End:0x2FB
        if(LPP != none)
        {
            // End:0x2A0
            if(bCanSpawnAlive)
            {
                LPP.SetPhysics(4);
                AIC = SPAIController(LPP.Controller);
                // End:0x1CE
                if(AIC != none)
                {
                    AIC.ForceDisableAI();
                }
                SM = LPP.GetSpecialMoveInstance(SpecialMoveClass);
                // End:0x271
                if((SM != none) && CreativeSpawnNodeName != 'None')
                {
                    SM.AnimationTemplateNodeNames[0] = CreativeSpawnNodeName;
                    SM.InitAnimations();
                }
                LPP.DoSpecialMove(SpecialMoveClass, true, true);                
            }
            else
            {
                LPP.TakeDamage(LPP.HealthMax, none, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), none);
            }
        }
    }
    return NewActor;
    //return ReturnValue;    
}

defaultproperties
{
    SpecialMoveClass=Class'LPSM_DestructSpawnBase'
}