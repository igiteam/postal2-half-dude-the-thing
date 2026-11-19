class LPFXAction_ProtoHarmonize extends LPFXActionBase;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private name HarmonizeFXBinding;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL HarmonizeComp[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHarmonizeFXActive;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPlayerPawn;

// Export ULPFXAction_ProtoHarmonize::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_ProtoHarmonize::execShutDown(FFrame&, void* const)
native event ShutDown();

// Export ULPFXAction_ProtoHarmonize::execEnd(FFrame&, void* const)
native event End();

// Export ULPFXAction_ProtoHarmonize::execGetPlayerPawn(FFrame&, void* const)
native final function GetPlayerPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPFXAction_ProtoHarmonize::execSetHarmonizeFXActive(FFrame&, void* const)
native final function SetHarmonizeFXActive()
{
    local /*0x97E50000-0x00000000*/ private bool bActive[8388609];


}

function SetEventBinding()
{
    local /*0x97E50000-0x00000000*/ private name FXBinding[8388609];

    HarmonizeFXBinding = FXBinding;
    //return;    
}

defaultproperties
{
    bIsTickable=true
}