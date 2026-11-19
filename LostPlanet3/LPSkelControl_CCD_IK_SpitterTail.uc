class LPSkelControl_CCD_IK_SpitterTail extends SPSkelControl_CCD_IK_EC
    hidecategories(Object,Object);

event @NULL TickSkelControl()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609], SpitterPawn;

    // End:0x79
    if(ControlStrength > float(0))
    {
        SpitterPawn = LPAIPawnSpitter(SkelComp.Outer);
        // End:0x79
        if(SpitterPawn != none)
        {
            SetTarget(SpitterPawn.TargetPosition);
        }
    }
    super(SkelControlBase).TickSkelControl(DeltaTime, SkelComp);
    //return;    
}

simulated function SetTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL InTarget[8388609];

    // End:0xBC
    if(ControlStrength > float(0))
    {
        EffectorLocation.X = InTarget.X;
        EffectorLocation.Y = InTarget.Y;
        EffectorLocation.Z = InTarget.Z;
    }
    //return;    
}

defaultproperties
{
    bShouldTickInScript=true
}