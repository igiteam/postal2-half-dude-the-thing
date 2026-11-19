class LPTempPlaceHolderWeakPoint extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private name MyName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSpawned[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL CylinderComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PrevHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Health;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanRegenerate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRegenStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RegenerateTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RegenerateRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StayDeadTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToComeBackToLife;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HealthyColor[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DeadColor[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DamagedColor[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RegenColor[131073];

static simulated function CreateInstance()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name WeakPointName[8388609], SocketName;
    local /*0x97E50000-0x00000000*/ private float InSize[8388609], InHealth;
    local /*0x97E50000-0x00000000*/ private bool InbCanRegenerate[8388609];
    local /*0x97E50000-0x00000000*/ private float inRegenerateTime[8388609], inStayDeadTime;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

simulated function Init()
{
    local /*0x97E50000-0x00000000*/ private float InSize[8388609], InHealth;

    CylinderComponent.SetCylinderSize(InSize, InSize);
    Health = InHealth;
    MaxHealth = InHealth;
    PrevHealth = InHealth;
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0x6B
    if((!bRegenStarted && EventInstigator != MyPawn.Controller) && DamageCauser != MyPawn)
    {
        ApplyForcedDamage(DamageAmount);
    }
    super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

simulated function ApplyForcedDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];

    // End:0x67
    if(Health > float(0))
    {
        Health -= float(DamageAmount);
        // End:0x67
        if(Health <= float(0))
        {
            Health = 0.0000000;
            MyPawn.TempPlaceHolderWeakPointReachedZeroHealth(self);
        }
    }
    //return;    
}

simulated function IsRegenrating()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bRegenStarted;
    //return ReturnValue;    
}

simulated function IsActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (Health > float(0)) && !bRegenStarted;
    //return ReturnValue;    
}

event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Start, End;
    local /*0x97E50000-0x00000000*/ private float DamageFactor;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentColor;

    super.Tick(DeltaTime);
    // End:0x62
    if((PrevHealth > float(0)) && Health <= float(0))
    {
        Health = 0.0000000;
        StartRegen(RegenerateTime, StayDeadTime);
    }
    PrevHealth = Health;
    // End:0x13C
    if(bRegenStarted)
    {
        // End:0x13C
        if(TimeToComeBackToLife < WorldInfo.TimeSeconds)
        {
            // End:0xE7
            if(Health >= MaxHealth)
            {
                Health = MaxHealth;
                bRegenStarted = false;                
            }
            else
            {
                Health += (RegenerateRate * DeltaTime);
                // End:0x13C
                if(Health >= MaxHealth)
                {
                    Health = MaxHealth;
                    bRegenStarted = false;
                }
            }
        }
    }
    Start = Location;
    End = Location;
    Start.Z -= CylinderComponent.CollisionHeight;
    End.Z += CylinderComponent.CollisionHeight;
    // End:0x234
    if(bRegenStarted)
    {
        DamageFactor = 1.0000000 - (GetNormalizedHealth());
        CurrentColor = LerpColor(RegenColor, DeadColor, DamageFactor);        
    }
    else
    {
        // End:0x292
        if(Health > float(0))
        {
            DamageFactor = 1.0000000 - (GetNormalizedHealth());
            CurrentColor = LerpColor(HealthyColor, DamagedColor, DamageFactor);            
        }
        else
        {
            CurrentColor = DeadColor;
        }
    }
    DrawDebugCylinder(Start, End, CylinderComponent.CollisionRadius, 12, CurrentColor.R, CurrentColor.G, CurrentColor.B);
    //return;    
}

simulated function GetNormalizedHealth()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x17
    if(Health <= float(0))
    {
        return 0.0000000;
    }
    // End:0x34
    if(Health > MaxHealth)
    {
        return 1.0000000;
    }
    return Health / MaxHealth;
    //return ReturnValue;    
}

simulated event Destroyed()
{
    super.Destroyed();
    //return;    
}

function StartRegen()
{
    local /*0x97E50000-0x00000000*/ private float inRegenerateTime[8388609], inStayDeadTime;

    // End:0x98
    if(bCanRegenerate)
    {
        // End:0x30
        if(inRegenerateTime <= float(0))
        {
            RegenerateRate = 16777220.0000000;            
        }
        else
        {
            RegenerateRate = (MaxHealth - Health) / inRegenerateTime;
        }
        TimeToComeBackToLife = WorldInfo.TimeSeconds + inStayDeadTime;
        bRegenStarted = true;
    }
    //return;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__LPTempPlaceHolderWeakPoint.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'Engine.CylinderComponent'
    end object
    CylinderComponent=CollisionCylinder
    HealthyColor=(R=255,G=255,B=0,A=255)
    DeadColor=(R=0,G=0,B=0,A=255)
    DamagedColor=(R=255,G=0,B=0,A=255)
    RegenColor=(R=255,G=255,B=255,A=255)
    Components[0]=CollisionCylinder
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bCollideActors=true
    CollisionComponent=CollisionCylinder
}