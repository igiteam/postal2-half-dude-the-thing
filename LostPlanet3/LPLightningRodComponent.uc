class LPLightningRodComponent extends ActorComponent
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyActor;
var(0.25_Pct) /*0x80970000-0x00000000*/ private float PercentChanceOfGettingHit[65537];
var(0.25_Pct) /*0x80970000-0x00000000*/ private float ProximityRadius[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextProximityCheckTime;
var(0.25_Pct) /*0x80970000-0x00000000*/ private bool bEnable[65537];

// Export ULPLightningRodComponent::execGetMyActor(FFrame&, void* const)
protected native function GetMyActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPLightningRodComponent::execAddToNearbyBeetle(FFrame&, void* const)
protected native function AddToNearbyBeetle();

simulated function GetPercentChanceOfGettingHit()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Chance;

    Chance = Abs(PercentChanceOfGettingHit);
    // End:0x36
    if(Chance > float(100))
    {
        Chance = 100.0000000;
    }
    return Chance;
    //return ReturnValue;    
}

simulated event GetActorForLightningHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x1C
    if(MyActor != none)
    {
        return MyActor;        
    }
    else
    {
        return GetMyActor();
    }
    //return ReturnValue;    
}

simulated event StartingPlay()
{
    //return;    
}

defaultproperties
{
    PercentChanceOfGettingHit=50.0000000
    ProximityRadius=1700.0000000
    bEnable=true
}