class LPAimControlVsLaroche extends SPGFAimControlBase
    editinlinenew;

// Export ULPAimControlVsLaroche::execDebugDraw(FFrame&, void* const)
native function DebugDraw();

event UpdateAim()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myVsCtrl, MyVSPawn;

    myVsCtrl = LPAIControllerVsLaroche(PawnOuter.Controller);
    MyVSPawn = LPAIPawnVsLaroche(PawnOuter);
    // End:0xDB
    if(myVsCtrl != none)
    {
        WorldAimRotator = myVsCtrl.GetBaseAIAimRotation(none, MyVSPawn.GetAimStartTraceLocation(), myVsCtrl.GetAimLocation());
        WorldAimDir = Vector(WorldAimRotator);
    }
    //return;    
}

protected event ScriptDebugDraw()
{
    //return;    
}
