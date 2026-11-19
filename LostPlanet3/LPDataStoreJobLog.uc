class LPDataStoreJobLog extends UIDataStore_StringBase
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

struct native TuneDataJobStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataJob;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCompleted;

    structdefaultproperties
    {
        TuneDataJob=none
        bCompleted=false
    }
};

var(0.25_Pct) /*0x7DFC0000-0x00000000*/ private editfixedsize array Jobs[65537];

function AddJob()
{
    local /*0x97E50000-0x00000000*/ private @NULL job[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bFound;
    local /*0x97E50000-0x00000000*/ private @NULL newJob;

    I = 0;
    J0x0B:

    // End:0x74 [Loop If]
    if(I < Jobs.Length)
    {
        // End:0x66
        if(Jobs[I].TuneDataJob == job)
        {
            bFound = true;
            // [Explicit Break]
            goto J0x74;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x74:

    // End:0xBF
    if(!bFound)
    {
        newJob.TuneDataJob = job;
        Jobs.AddItem(newJob);        
    }
    //return;    
}

function CompleteJob()
{
    local /*0x97E50000-0x00000000*/ private @NULL job[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bFound;

    I = 0;
    J0x0B:

    // End:0x9D [Loop If]
    if(I < Jobs.Length)
    {
        // End:0x8F
        if(Jobs[I].TuneDataJob == job)
        {
            bFound = true;
            Jobs[I].bCompleted = true;
            // [Explicit Break]
            goto J0x9D;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x9D:

    // End:0xAC
    if(!bFound)
    {
    }
    //return;    
}

function DeactivateJob()
{
    local /*0x97E50000-0x00000000*/ private @NULL job[8388609];
    local /*0x97E50000-0x00000000*/ private int I, FoundIndex;

    FoundIndex = -1;
    I = 0;
    J0x1A:

    // End:0x8A [Loop If]
    if(I < Jobs.Length)
    {
        // End:0x7C
        if(Jobs[I].TuneDataJob == job)
        {
            FoundIndex = I;
            // [Explicit Break]
            goto J0x8A;
        }
        I++;
        // [Loop Continue]
        goto J0x1A;
    }
    J0x8A:

    // End:0xA0
    if(FoundIndex == -1)
    {        
    }
    else
    {
        Jobs.Remove(FoundIndex, 1);        
    }
    //return;    
}

defaultproperties
{
    Tag="DataStoreJobLog"
}