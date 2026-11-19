class SPDAction_Scale extends SPDAction_Latent
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private float TimeToScale[65537];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private float Scale[65537];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private bool Use3dScale[65537];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private @NULL Scale3D[65537];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL TargetScale;
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL StartScale;
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private float Counter;

event PushData()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609];

    manager.PushFloat(Counter);
    //return;    
}

event PopData()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609];

    Counter = manager.PopFloat();
    //return;    
}

event Enter()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x23
    if(Use3dScale)
    {
        TargetScale = Scale3D;        
    }
    else
    {
        TargetScale.X = Scale;
        TargetScale.Y = Scale;
        TargetScale.Z = Scale;
    }
    StartScale = Actor.DrawScale3D;
    // End:0xF9
    if(TimeToScale <= float(0))
    {
        Actor.SetDrawScale3D(TargetScale);
        return 1;
    }
    Counter = TimeToScale;
    return 0;
    //return ReturnValue;    
}

function UpdateScale()
{
    local /*0x01C00000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x01C00000-0x00000000*/ private float T, RemainingTime;
    local /*0x01C00000-0x00000000*/ private @NULL CurrentScale;

    RemainingTime = Counter;
    // End:0x33
    if(RemainingTime < float(0))
    {
        RemainingTime = 0.0000000;
    }
    T = 1.0000000 - (RemainingTime / TimeToScale);
    CurrentScale = ((TargetScale - StartScale) * T) + StartScale;
    inActor.SetDrawScale3D(CurrentScale);
    //return;    
}

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];

    Counter -= ElapsedTime;
    // End:0x40
    if(Counter > 0.0000000)
    {
        UpdateScale(Actor);
        return 0;        
    }
    else
    {
        Actor.SetDrawScale3D(TargetScale);
        return 1;
    }
    //return ReturnValue;    
}

event Exit()
{
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;

    //return;    
}

defaultproperties
{
    Scale=1.0000000
    Scale3D=(X=1.0000000,Y=1.0000000,Z=1.0000000)
}