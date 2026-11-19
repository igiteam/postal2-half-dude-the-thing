class SPDAction_RandomBranch extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02670000-0x00000400*/ private editfixedsize array OtherActionLists[589825];

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x01C00000-0x00000000*/ private int NumberOfActionsListsAvailable, SelectedList;
    local /*0x01C00000-0x00000000*/ private editfixedsize array NonEmptyListIndices;
    local /*0x01C00000-0x00000000*/ private int I;

    NumberOfActionsListsAvailable = OtherActionLists.Length;
    I = 0;
    J0x1F:

    // End:0x92 [Loop If]
    if(I < NumberOfActionsListsAvailable)
    {
        // End:0x84
        if(OtherActionLists[I].HasActions())
        {
            NonEmptyListIndices.Insert(0, 1);            
            NonEmptyListIndices[0] = I;
        }
        ++I;
        // [Loop Continue]
        goto J0x1F;
    }
    // End:0xA5
    if(NonEmptyListIndices.Length == 0)
    {
        return 1;
    }
    SelectedList = 1;
    SelectedList = Rand(NonEmptyListIndices.Length + 1);
    // End:0x14B
    if(SelectedList != 0)
    {
        SelectedList -= 1;
        SelectedList = NonEmptyListIndices[SelectedList];
        manager.AddActionListWithDamageInfo(OtherActionLists[SelectedList], Actor, 0, DamageInfo);
        return 2;
    }
    return 1;
    //return ReturnValue;    
}
