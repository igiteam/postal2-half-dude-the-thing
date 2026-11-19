class SPDAction_SetMaterial extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private editfixedsize array Materials[589825];

event array Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x01C00000-0x00000000*/ private int Idx;
    local /*0x01C00000-0x00000400*/ private @NULL StaticMesh, SkeletalMesh;
    local /*0x01C00000-0x00000400*/ private editfixedsize array ComponentArray;

    // End:0x84
    if(DamageInfo.Component == none)
    {
        Actor.GetComponentsOfClass(Class'Engine.StaticMeshComponent', ComponentArray);
        // End:0x81
        if(ComponentArray.Length > 0)
        {
            StaticMesh = StaticMeshComponent(ComponentArray[0]);
        }        
    }
    else
    {
        StaticMesh = StaticMeshComponent(DamageInfo.Component);
    }
    // End:0x17A
    if(StaticMesh != none)
    {
        Idx = 0;
        J0xCD:

        // End:0x177 [Loop If]
        if(Idx < Materials.Length)
        {
            // End:0x169
            if((StaticMesh.GetMaterial(Idx) != none) && Materials[Idx] != none)
            {
                StaticMesh.SetMaterial(Idx, Materials[Idx]);
            }
            Idx++;
            // [Loop Continue]
            goto J0xCD;
        }        
    }
    else
    {
        // End:0x1FE
        if(DamageInfo.Component == none)
        {
            Actor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
            // End:0x1FB
            if(ComponentArray.Length > 0)
            {
                SkeletalMesh = SkeletalMeshComponent(ComponentArray[0]);
            }            
        }
        else
        {
            SkeletalMesh = SkeletalMeshComponent(DamageInfo.Component);
        }
        // End:0x2F1
        if(SkeletalMesh != none)
        {
            Idx = 0;
            J0x247:

            // End:0x2F1 [Loop If]
            if(Idx < Materials.Length)
            {
                // End:0x2E3
                if((SkeletalMesh.GetMaterial(Idx) != none) && Materials[Idx] != none)
                {
                    SkeletalMesh.SetMaterial(Idx, Materials[Idx]);
                }
                Idx++;
                // [Loop Continue]
                goto J0x247;
            }
        }
    }
    return 1;
    //return ReturnValue;    
}
