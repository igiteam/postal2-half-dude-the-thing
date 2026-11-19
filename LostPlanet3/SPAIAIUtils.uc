class SPAIAIUtils extends SPAIUtils
    abstract
    hidecategories(Object);

const SQRT_TWO = 1.4142135623731;
const METER = 100;

struct native SPPawnsHitInfo
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL PawnHit;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TimeHit;

    structdefaultproperties
    {
        PawnHit=none
        TimeHit=-1.0000000
    }
};

struct native SPHitList
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array PawnsHit;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float MaxLifeTimeOfItemInList;

    structdefaultproperties
    {
        PawnsHit=none
        MaxLifeTimeOfItemInList=-1.0000000
    }
};

static function AddPawnHit()
{
    local /*0x03A30000-0x00000000*/ private @NULL PawnHit[8388609], ListToUpdate;
    local /*0x03A30000-0x00000000*/ private float CurrentTime[9437185];
    local /*0x03A30000-0x00000000*/ private bool bOnlyAddIfNotInList[9437185], ReturnValue;
    local /*0x03A30000-0x00000000*/ private @NULL NewData;

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
    local /*0x03A30000-0x00000000*/ private float CurrentTime[8388609];
    local /*0x03A30000-0x00000000*/ private editfixedsize @NULL ListToUpdate[25165825];
    local /*0x03A30000-0x00000000*/ private int iter;
    local /*0x03A30000-0x00000000*/ private editfixedsize array infoToRemove;
    local /*0x03A30000-0x00000000*/ private float curItemsMaxTimeInList;

    // End:0x188
    if(ListToUpdate.MaxLifeTimeOfItemInList > float(0))
    {
        iter = 0;
        J0x2F:

        // End:0x124 [Loop If]
        if(iter < ListToUpdate.PawnsHit.Length)
        {
            curItemsMaxTimeInList = ListToUpdate.MaxLifeTimeOfItemInList;
            // End:0x116
            if(curItemsMaxTimeInList > float(0))
            {
                // End:0x116
                if((CurrentTime - ListToUpdate.PawnsHit[iter].TimeHit) > curItemsMaxTimeInList)
                {
                    infoToRemove.AddItem(ListToUpdate.PawnsHit[iter]);                    
                }
            }
            iter++;
            // [Loop Continue]
            goto J0x2F;
        }
        iter = 0;
        J0x12F:

        // End:0x188 [Loop If]
        if(iter < infoToRemove.Length)
        {
            ListToUpdate.PawnsHit.RemoveItem(infoToRemove[iter]);            
            iter++;
            // [Loop Continue]
            goto J0x12F;
        }
    }
    //return;    
}

static function HasThisPawnBeenHitRecently()
{
    local /*0x03A30000-0x00000000*/ private @NULL PawnHitting[8388609], ListToUpdate;
    local /*0x03A30000-0x00000000*/ private float CurrentTime[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int iter;

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
    local /*0x03A30000-0x00000000*/ private editfixedsize @NULL ListToUpdate[25165825];

    ListToUpdate.PawnsHit.Remove(0, ListToUpdate.PawnsHit.Length);    
    //return;    
}
