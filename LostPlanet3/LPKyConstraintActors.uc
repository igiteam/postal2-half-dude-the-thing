class LPKyConstraintActors extends LPKyConstraintCapsules within LPAIController
    editinlinenew;

struct native LPKyConstraintActor_Entry
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TheActor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Capsule;

    structdefaultproperties
    {
        TheActor=none
        Capsule=(StartPoint=(X=0.0000000,Y=0.0000000,Z=0.0000000),EndPoint=(X=0.0000000,Y=0.0000000,Z=0.0000000),Radius=0.0000000)
    }
};

var(0.25_Pct) /*0x80200000-0x00000000*/ private @NULL ToBeAvoided[65537];

// Export ULPKyConstraintActors::execSetActor(FFrame&, void* const)
native function SetActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewActor[8388609];
    local /*0x97E50000-0x00000000*/ private float Radius[9437185], Height;


}

// Export ULPKyConstraintActors::execGetDefaultRadiusAndHeightOffGround(FFrame&, void* const)
protected native function GetDefaultRadiusAndHeightOffGround()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private float Radius[25165825], Height;


}

// Export ULPKyConstraintActors::execGetCostRatio(FFrame&, void* const)
protected native event GetCostRatio()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThePawn[8388609], From, To;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

event Clear()
{
    super(SPKyConstraint).Clear();
    ToBeAvoided.TheActor = none;
    //return;    
}
