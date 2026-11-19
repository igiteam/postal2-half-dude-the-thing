class LPAIUtils extends Object
    abstract
    hidecategories(Object);

const SQRT_TWO = 1.4142135623731;
const METER = 100;

struct native LPPawnsHitInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnHit;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeHit;

    structdefaultproperties
    {
        PawnHit=none
        TimeHit=-1.0000000
    }
};

struct native LPHitList
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PawnsHit;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxLifeTimeOfItemInList;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxLifeTimeOfVsInList;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxLifeTimeOfShutdownVsInList;

    structdefaultproperties
    {
        PawnsHit=none
        MaxLifeTimeOfItemInList=-1.0000000
        MaxLifeTimeOfVsInList=-1.0000000
        MaxLifeTimeOfShutdownVsInList=-1.0000000
    }
};

// Export ULPAIUtils::execGetPawnsAtLocation(FFrame&, void* const)
native static function GetPawnsAtLocation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array OutPawns[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[8388609];
    local /*0x97E50000-0x00000000*/ private float Inradius[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIUtils::execLPUnrealToKynapseDistance(FFrame&, void* const)
native static function LPUnrealToKynapseDistance()
{
    local /*0x97E50000-0x00000000*/ private float Distance[8388609], ReturnValue;


}

static function AddPawnHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnHit[8388609], ListToUpdate;
    local /*0x97E50000-0x00000000*/ private float CurrentTime[9437185];
    local /*0x97E50000-0x00000000*/ private bool bOnlyAddIfNotInList[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL NewData;

    0.0000000
    false
    NewData.PawnHit = PawnHit;
    NewData.TimeHit = CurrentTime;
    // End:0x91
    if(bOnlyAddIfNotInList)
    {
        // End:0x91
        if(HasThisPawnBeenHitRecently(PawnHit, ListToUpdate, CurrentTime))
        {
            return false;
        }
    }
    ListToUpdate.PawnsHit.AddItem(NewData);    
    return true;
    //return ReturnValue;    
}

static function PurgeHitListOfOldData()
{
    local /*0x97E50000-0x00000000*/ private float CurrentTime[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ListToUpdate[25165825];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private editfixedsize array infoToRemove;
    local /*0x97E50000-0x00000000*/ private float curItemsMaxTimeInList;
    local /*0x97E50000-0x00000000*/ private @NULL curVs;

    // End:0x2A2
    if(((ListToUpdate.MaxLifeTimeOfItemInList > float(0)) || ListToUpdate.MaxLifeTimeOfVsInList > float(0)) || ListToUpdate.MaxLifeTimeOfShutdownVsInList > float(0))
    {
        iter = 0;
        J0x7B:

        // End:0x23E [Loop If]
        if(iter < ListToUpdate.PawnsHit.Length)
        {
            curItemsMaxTimeInList = ListToUpdate.MaxLifeTimeOfItemInList;
            curVs = LPBaseVSPlayerPawn(ListToUpdate.PawnsHit[iter].PawnHit);
            // End:0x19A
            if(curVs != none)
            {
                // End:0x174
                if(curVs.Health > 1)
                {
                    curItemsMaxTimeInList = ListToUpdate.MaxLifeTimeOfVsInList;                    
                }
                else
                {
                    curItemsMaxTimeInList = ListToUpdate.MaxLifeTimeOfShutdownVsInList;
                }
            }
            // End:0x230
            if(curItemsMaxTimeInList > float(0))
            {
                // End:0x230
                if((CurrentTime - ListToUpdate.PawnsHit[iter].TimeHit) > curItemsMaxTimeInList)
                {
                    infoToRemove.AddItem(ListToUpdate.PawnsHit[iter]);                    
                }
            }
            iter++;
            // [Loop Continue]
            goto J0x7B;
        }
        iter = 0;
        J0x249:

        // End:0x2A2 [Loop If]
        if(iter < infoToRemove.Length)
        {
            ListToUpdate.PawnsHit.RemoveItem(infoToRemove[iter]);            
            iter++;
            // [Loop Continue]
            goto J0x249;
        }
    }
    //return;    
}

static function HasThisPawnBeenHitRecently()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnHitting[8388609], ListToUpdate;
    local /*0x97E50000-0x00000000*/ private float CurrentTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    PurgeHitListOfOldData(CurrentTime, ListToUpdate);
    iter = 0;
    J0x27:

    // End:0xA9 [Loop If]
    if(iter < ListToUpdate.PawnsHit.Length)
    {
        // End:0x9B
        if(ListToUpdate.PawnsHit[iter].PawnHit == PawnHitting)
        {
            return true;
        }
        iter++;
        // [Loop Continue]
        goto J0x27;
    }
    return false;
    //return ReturnValue;    
}

static function EmptyHitList()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ListToUpdate[25165825];

    ListToUpdate.PawnsHit.Remove(0, ListToUpdate.PawnsHit.Length);    
    //return;    
}

static function KynapseAdjustedRadius()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], ActorRadius, ActorHeight;

    ActorRadius = 0.0000000;
    // End:0x70
    if(Pawn(TheActor) != none)
    {
        ActorRadius = Pawn(TheActor).CylinderComponent.CollisionRadius;        
    }
    else
    {
        // End:0xB0
        if(TheActor != none)
        {
            TheActor.GetBoundingCylinder(ActorRadius, ActorHeight);
        }
    }
    return ActorRadius * 1.4142140;
    //return ReturnValue;    
}
