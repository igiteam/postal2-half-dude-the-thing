class LPDodgeableExplosionActor extends LPExplosionActor
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DodgeWindowTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AttackType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte DodgePhase;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LPSM_RollClasses;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanBeDodged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTargetStartedDodgeMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetHeight;

simulated function Explode()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewExplosionTemplate[8388609], Direction;

    super(SPGFGameExplosionActor).Explode(NewExplosionTemplate, Direction);
    InitDodgeData();
    //return;    
}

protected simulated function PostExpansion()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPGFGameExplosionActor).PostExpansion(DeltaTime);
    // End:0x33
    if(bCanBeDodged)
    {
        HandleDodgeWindowForTargetActor(DeltaTime);
    }
    //return;    
}

protected simulated function InitDodgeData()
{
    // End:0x9D
    if(((SPExplosionTemplate != none) && SPExplosionTemplate.bExpanding) && TargetActor != none)
    {
        bCanBeDodged = true;
        TargetActor.GetBoundingCylinder(TargetRadius, TargetHeight);
        TargetPawn = LPPawn(TargetActor);
    }
    //return;    
}

protected simulated function OpenDodgeWindow()
{
    // End:0x39
    if(int(DodgePhase) != int(0))
    {
        DodgePhase = 0;
        // End:0x39
        if(TargetPawn != none)
        {
            NotifyTargetOfDodgeWindow();
        }
    }
    //return;    
}

protected simulated function CloseDodgeWindow()
{
    // End:0x39
    if(int(DodgePhase) != int(1))
    {
        DodgePhase = 1;
        // End:0x39
        if(TargetPawn != none)
        {
            NotifyTargetOfDodgeWindow();
        }
    }
    //return;    
}

protected simulated function NotifyTargetOfDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0xBC
    if(TargetPawn != none)
    {
        LPPC = LPPlayerController(TargetPawn.Controller);
        // End:0xBC
        if(LPPC != none)
        {
            // End:0x91
            if(int(DodgePhase) == int(0))
            {
                LPPC.NotifyDodgeWindow(int(AttackType), self);                
            }
            else
            {
                LPPC.NotifyDodgeWindow(int(AttackType), none);
            }
        }
    }
    //return;    
}

protected simulated function GetSeperation()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return VSize(TargetActor.Location - Location) - (ExpandingRadius + TargetRadius);
    //return ReturnValue;    
}

protected simulated function IsTargetActorInDirectionCone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsBehindExplosion(TargetActor);
    //return ReturnValue;    
}

protected simulated function HandleDodgeWindowForTargetActor()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], Seperation, TargetSpeed, ExplosionSpeed, TimeToHit;

    local /*0x97E50000-0x00000000*/ private @NULL Direction;

    Seperation = GetSeperation();
    // End:0x40
    if(Seperation <= (-TargetRadius * float(2)))
    {
        CloseDodgeWindow();        
    }
    else
    {
        Direction = Normal(TargetActor.Location - Location);
        TargetSpeed = TargetActor.Velocity Dot Direction;
        ExplosionSpeed = SPExplosionTemplate.ExpansionRate - TargetSpeed;
        TimeToHit = Seperation / ExplosionSpeed;
        // End:0x137
        if(TimeToHit <= DodgeWindowTime)
        {
            // End:0x12A
            if(IsTargetActorInDirectionCone())
            {
                OpenDodgeWindow();                
            }
            else
            {
                CloseDodgeWindow();
            }            
        }
        else
        {
            CloseDodgeWindow();
        }
    }
    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    bTargetStartedDodgeMove = false;
    // End:0x9B
    if(Dodger == TargetActor)
    {
        I = 0;
        J0x2E:

        // End:0x9B [Loop If]
        if(I < LPSM_RollClasses.Length)
        {
            // End:0x8D
            if(LPSM_RollClasses[I] != none)
            {
                // End:0x8D
                if(ClassIsChildOf(DodgePerforming, LPSM_RollClasses[I]))
                {
                    bTargetStartedDodgeMove = true;
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x2E;
        }
    }
    //return;    
}

protected simulated function CanBeDamagedByExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL Victim[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0xD5
    if(super(SPGFGameExplosionActor).CanBeDamagedByExplosion(Victim))
    {
        // End:0xD3
        if((Victim == TargetPawn) && bTargetStartedDodgeMove)
        {
            I = 0;
            J0x47:

            // End:0xD3 [Loop If]
            if(I < LPSM_RollClasses.Length)
            {
                // End:0xC5
                if(LPSM_RollClasses[I] != none)
                {
                    // End:0xC5
                    if(TargetPawn.IsDoingSpecialMove_OF_Class(LPSM_RollClasses[I]))
                    {
                        PreviouslyDamaged.AddItem(Victim);                        
                        return false;
                    }
                }
                ++I;
                // [Loop Continue]
                goto J0x47;
            }
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated event Destroyed()
{
    super(SPGFGameExplosionActor).Destroyed();
    CloseDodgeWindow();
    //return;    
}

defaultproperties
{
    DodgeWindowTime=0.5000000
    DodgePhase=eDodgePhase.eDodge_End
    // Reference: RB_RadialImpulseComponent'Default__LPDodgeableExplosionActor.ImpulseComponent0'
    begin object name=ImpulseComponent0
    end object
    RadialImpulseComponent=ImpulseComponent0
    Components[0]=ImpulseComponent0
}