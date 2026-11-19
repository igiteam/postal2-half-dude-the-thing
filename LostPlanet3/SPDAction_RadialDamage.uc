class SPDAction_RadialDamage extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02740000-0x00000000*/ private class DamageType[65537];
var(__OnDestroyed__Delegate) /*0x02740000-0x00000000*/ private float Radius[65537];
var(__OnDestroyed__Delegate) /*0x02740000-0x00000000*/ private float Damage[65537];
var(__OnDestroyed__Delegate) /*0x02740000-0x00000000*/ private bool bHurtPlayerDifferently[65537];
var(__OnDestroyed__Delegate) /*0x02740000-0x00000000*/ private float PlayerRadius[65537];
var(__OnDestroyed__Delegate) /*0x02740000-0x00000000*/ private float PlayerDamage[65537];

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x80
    if(bHurtPlayerDifferently)
    {
        manager.SPDHurtRadius(Damage, Radius, PlayerDamage, PlayerRadius, DamageType, 0.0000000, DamageInfo.Location);        
    }
    else
    {
        manager.HurtRadius(Damage, Radius, DamageType, 0.0000000, DamageInfo.Location);
    }
    return 1;
    //return ReturnValue;    
}

defaultproperties
{
    Radius=100.0000000
    Damage=1.0000000
    PlayerRadius=100.0000000
    PlayerDamage=1.0000000
}