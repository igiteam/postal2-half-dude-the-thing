class SPDAction_Gib extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private @NULL TuneDataGibs[65537];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private @NULL TuneDataGibs_MP[65537];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private int CurrentIndex;
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private editfixedsize array CreatedGibs;

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x01C00000-0x00000000*/ private @NULL GibPoolMgr, tuneDataToUse;
    local /*0x01C00000-0x00000000*/ private int Idx;
    local /*0x01C00000-0x00000000*/ private float Roll;
    local /*0x01C00000-0x00000000*/ private @NULL GibTemplate, NewGib;

    GibPoolMgr = SPMapInfo(Class'Engine.WorldInfo'.static.GetWorldInfo().GetMapInfo(true)).GibPool;
    // End:0x71
    if(GibPoolMgr == none)
    {
        return 1;
    }
    tuneDataToUse = (((int(Actor.WorldInfo.NetMode) != int(NM_Standalone)) && TuneDataGibs_MP != none) ? TuneDataGibs_MP : TuneDataGibs);
    // End:0xF0
    if(tuneDataToUse == none)
    {
        return 1;
    }
    Idx = CurrentIndex;
    J0x103:

    // End:0x2D1 [Loop If]
    if(Idx < tuneDataToUse.GibMeshesData.Length)
    {
        GibTemplate = tuneDataToUse.GibMeshesData[Idx];
        // End:0x174
        if(GibTemplate == none)
        {            
        }
        else
        {
            // End:0x1D5
            if(GibTemplate.ChanceToSpawn >= float(0))
            {
                Roll = FRand();
                // End:0x1D5
                if(Roll > GibTemplate.ChanceToSpawn)
                {
                    // [Explicit Continue]
                    goto J0x2C3;
                }
            }
            GibPoolMgr.SetNextGibCreatedTuneDataIndex(CurrentIndex);
            GibPoolMgr.SetNextGibCreatedTuneDataGib(tuneDataToUse);
            NewGib = GibPoolMgr.SpawnGibByLocation(GibTemplate, none, Actor.Location, Actor.Rotation);
            CreatedGibs.AddItem(NewGib);            
            CurrentIndex = Idx + 1;
            return 0;
        }
        J0x2C3:

        ++Idx;
        // [Loop Continue]
        goto J0x103;
    }
    CurrentIndex = 0;
    CreatedGibs.Length = 0;
    return 1;
    //return ReturnValue;    
}
