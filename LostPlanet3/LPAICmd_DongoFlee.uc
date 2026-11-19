class LPAICmd_DongoFlee extends LPAICmd_Flee within LPAIControllerDongo;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowInterruptionOfFlee;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToFocus;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.SetChargeCSA(false);
    Outer.myAIPawn.SetMaxSpeedScale(Outer.CrabPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
    Outer.ResetRotationRate();
    Outer.DongoPawn.EndRollSound();
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super.Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    AICMDFleeParams.bStopWhenHidden = true;
    AICMDFleeParams.computeDestinationInterval = 2.0000000;
    Outer.ResetRotationRate();
    Outer.DongoPawn.RotationRate.Yaw *= float(4);
    Outer.Focus = ActorToFocus;
    Outer.myAIPawn.bDontStopDesiredSpeedOnSpeedUpdate = false;
    Outer.DongoPawn.StartRollSound();
    //return;    
}

function PreFleeSetup()
{
    super.PreFleeSetup();
    AICMDFleeParams.bStopWhenHidden = true;
    AICMDFleeParams.computeDestinationInterval = 2.0000000;
    Outer.ResetRotationRate();
    Outer.DongoPawn.RotationRate.Yaw *= float(4);
    Outer.DongoPawn.DoSpecialMove(none);
    Outer.Focus = GetActorForFocus();
    Outer.myAIPawn.bDontStopDesiredSpeedOnSpeedUpdate = false;
    SetInterruptible(bAllowInterruptionOfFlee);
    //return;    
}

event LPCommandTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x2D
    if(AtSafeDistance())
    {
        Outer.PopCommand(self);
    }
    // End:0xCD
    if(ActorToFocus != none)
    {
        Outer.myAIPawn.SetDesiredRotation(Rotator(ActorToFocus.Location - Outer.myAIPawn.Location), true, true, -1.0000000, false);
    }
    //return;    
}

function GetActorForFocus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], CandidatePawn, BestPawn;
    local /*0x97E50000-0x00000000*/ private float BestDistSq, DistSq;
    local /*0x97E50000-0x00000000*/ private int I;

    BestPawn = none;
    // End:0x1A2
    if(Class'SPEngine.SPUtil'.static.IsSinglePlayerGame())
    {
        BestDistSq = 2147484000.0000000 * float(2147483647);
        I = 0;
        J0x50:

        // End:0x1A2 [Loop If]
        if(I < AICMDFleeParams.FleeDangerousBots.Length)
        {
            CandidatePawn = LPPawn(AICMDFleeParams.FleeDangerousBots[I]);
            // End:0x194
            if((CandidatePawn != none) && Outer.CanBeMyEnemy(CandidatePawn))
            {
                DistSq = VSizeSq2D(CandidatePawn.Location - Outer.myAIPawn.Location);
                // End:0x194
                if(DistSq < BestDistSq)
                {
                    BestPawn = CandidatePawn;
                    BestDistSq = DistSq;
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x50;
        }
    }
    return BestPawn;
    //return ReturnValue;    
}

function AtSafeDistance()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bSafe;
    local /*0x97E50000-0x00000000*/ private float CurSeperation;

    bSafe = true;
    I = 0;
    J0x17:

    // End:0xD8 [Loop If]
    if(I < AICMDFleeParams.FleeDangerousBots.Length)
    {
        CurSeperation = Outer.Seperation2D(AICMDFleeParams.FleeDangerousBots[I]);
        // End:0xCA
        if(CurSeperation < AICMDFleeParams.DangerRadius)
        {
            bSafe = false;
            // [Explicit Break]
            goto J0xD8;
        }
        ++I;
        // [Loop Continue]
        goto J0x17;
    }
    J0xD8:

    return bSafe;
    //return ReturnValue;    
}

defaultproperties
{
    bAllowInterruptionOfFlee=true
}