class SPDAction_SetAngularVelocity extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private float DegreesPerSecond[65537];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private @NULL AxisOfRotation[65537];

event array Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x01C00000-0x00000400*/ private @NULL MeshComp;
    local /*0x01C00000-0x00000000*/ private float radians;
    local /*0x01C00000-0x00000000*/ private @NULL W;
    local /*0x01C00000-0x00000400*/ private editfixedsize array ComponentArray;

    Actor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
    // End:0x62
    if(ComponentArray.Length > 0)
    {
        MeshComp = MeshComponent(ComponentArray[0]);        
    }
    else
    {
        Actor.GetComponentsOfClass(Class'Engine.StaticMeshComponent', ComponentArray);
        // End:0xC1
        if(ComponentArray.Length > 0)
        {
            MeshComp = MeshComponent(ComponentArray[0]);
        }
    }
    // End:0x18B
    if(MeshComp != none)
    {
        radians = (DegreesPerSecond * 3.1415930) / 180.0000000;
        W = Normal(AxisOfRotation);
        W = W * radians;
        MeshComp.SetRBAngularVelocity(W);
        MeshComp.SetRBLinearVelocity(Actor.Velocity);
    }
    return 1;
    //return ReturnValue;    
}

defaultproperties
{
    AxisOfRotation=(X=0.0000000,Y=0.0000000,Z=1.0000000)
}