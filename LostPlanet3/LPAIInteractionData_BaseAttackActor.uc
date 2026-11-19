class LPAIInteractionData_BaseAttackActor extends SPAIInteractionData
    abstract
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private class AllowedPawnClass[131073];
var(0.25_Pct) /*0x79C10000-0x00000000*/ private @NULL ActorToAttack[65537];
var(0.25_Pct) /*0x79C10000-0x00000000*/ private editfixedsize array ActorsToStandOn[65537];
var(0.25_Pct) /*0x79C10000-0x00000000*/ private @NULL AttackAnimation[65537];
var(0.25_Pct) /*0x79C10000-0x00000000*/ private float DamageAmount[65537];
var(0.25_Pct) /*0x79C10000-0x00000000*/ private class DamageType[65537];
var(0.25_Pct) /*0x79C10000-0x00000000*/ private name AccessResourceName[65537];

// Export ULPAIInteractionData_BaseAttackActor::execIsActorToAttackDamagable(FFrame&, void* const)
native event IsActorToAttackDamagable()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIInteractionData_BaseAttackActor::execCanBeAttacked(FFrame&, void* const)
native event CanBeAttacked()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIInteractionData_BaseAttackActor::execIsAllowedToInteractWithActor(FFrame&, void* const)
native event IsAllowedToInteractWithActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function OnBeginPlay()
{
    // End:0x22
    if(ActorToAttack == none)
    {
        ActorToAttack = MySmartActor;
    }
    //return;    
}

event HaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x59
    if(IsAllowedToInteractWithActor(Requester))
    {
        // End:0x59
        if(IsActorToAttackDamagable())
        {
            // End:0x59
            if(MyInteractionComponent.DoesResourceHaveUser('SmartObjectAccess', Requester))
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    DamageAmount=100.0000000
    DamageType=Class'LPDamageType'
    AccessResourceName="SmartObjectAccess"
}