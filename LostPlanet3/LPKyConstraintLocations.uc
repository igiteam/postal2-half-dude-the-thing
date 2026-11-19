class LPKyConstraintLocations extends LPKyConstraintCapsules within LPAIController
    editinlinenew;

var(0.25_Pct) /*0x80220000-0x00000000*/ private @NULL ToBeAvoided[65537];

// Export ULPKyConstraintLocations::execGetCostRatio(FFrame&, void* const)
protected native event GetCostRatio()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn[8388609], From, To;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPKyConstraintLocations::execSetPosition(FFrame&, void* const)
native function SetPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewPosition[25296897];
    local /*0x97E50000-0x00000000*/ private float Radius[8388609], Height;


}

event Clear()
{
    super(SPKyConstraint).Clear();
    //return;    
}
