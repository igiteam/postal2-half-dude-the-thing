class LPAttackVolumeCarrier extends LPAttackVolume
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(0.25_Pct) /*0xAFC00000-0x00000000*/ private @NULL ActorToUseAsEntryLocation[65537];
var(0.25_Pct) /*0xAFC00000-0x00000000*/ private @NULL ActorToFaceWhenExiting[65537];
var(0.25_Pct) /*0xAFC00000-0x00000000*/ private int NumOfTimesToPlayTheBackUpCycleToGetOutOfTheAttackVol[65537];

// Export ULPAttackVolumeCarrier::execGetScriptedAttackIndex(FFrame&, void* const)
protected native function GetScriptedAttackIndex()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    super.UnTouch(Other);
    //return;    
}

defaultproperties
{
    NumOfTimesToPlayTheBackUpCycleToGetOutOfTheAttackVol=1
    // Reference: LPAIResManAttackVolume'Default__LPAttackVolumeCarrier.LPAIResManAttackVolume'
    begin object name=LPAIResManAttackVolume
    end object
    ResourceManager=LPAIResManAttackVolume
    // Reference: BrushComponent'Default__LPAttackVolumeCarrier.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    Components[1]=LPAIResManAttackVolume
    CollisionComponent=BrushComponent0
}