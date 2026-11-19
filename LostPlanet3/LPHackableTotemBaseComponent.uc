class LPHackableTotemBaseComponent extends ActorComponent;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HackTimeInSeconds;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinHackDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinHackPitchAngle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinHackYawAngle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinHackHeightTolerance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitializedFromOwner;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bClonedDeployment;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string HUDHackPromptString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataBeacon;

event Attached()
{
    SetupParametersFromOwner();
    //return;    
}

event Detached()
{
    //return;    
}

simulated function SetupParametersFromOwner()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    InitTuneData();
    // End:0x1B
    if(TuneDataBeacon == none)
    {
        return false;
    }
    HackTimeInSeconds = TuneDataBeacon.HackTimeInSeconds.GetValue();
    MinHackDistance = TuneDataBeacon.MinHackDistance.GetValue();
    MinHackPitchAngle = TuneDataBeacon.MinHackPitchAngle.GetValue();
    MinHackYawAngle = TuneDataBeacon.MinHackYawAngle.GetValue();
    MinHackHeightTolerance = TuneDataBeacon.MinHackHeightTolerance.GetValue();
    bInitializedFromOwner = true;
    return true;
    //return ReturnValue;    
}

simulated function CanBeHacked()
{
    local /*0x97E50000-0x00000000*/ private @NULL Hacker[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ToHacker, HackerAim, YawAngle, PitchAngle;
    local /*0x97E50000-0x00000000*/ private float zdiff, YawDot, MinYawRad;

    // End:0x33D
    if((Hacker != none) && Owner != none)
    {
        HackerAim = Hacker.GetAimDirection();
        YawAngle.Yaw = HackerAim.Yaw;
        PitchAngle.Pitch = HackerAim.Pitch;
        ToHacker = Owner.Location - Hacker.Location;
        zdiff = Abs(ToHacker.Z);
        ToHacker.Z = 0.0000000;
        YawDot = Vector(YawAngle) Dot Normal(ToHacker);
        MinYawRad = Cos(MinHackYawAngle * 0.0174533);
        // End:0x33D
        if(((((((((Owner != none) && !Owner.bHidden) && (Pawn(Owner) == none) || Pawn(Owner).IsAliveAndWell()) && VSize2D(ToHacker) < (MinHackDistance + Hacker.GetHackDistanceBonus())) && zdiff < MinHackHeightTolerance) && YawDot > MinYawRad) && Vector(PitchAngle).X > Cos(MinHackPitchAngle * 0.0174533)) && int(Owner.GetTeamNum()) != int(Hacker.GetTeamNum())) && Hacker.FastTrace(Owner.Location))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetPerkDeployable()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    Idx = GetPerkDeployableIndex();
    // End:0xD2
    if(Idx >= 0)
    {
        // End:0x5B
        foreach Owner.LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            // End:0x5B
            break;            
        }        
        // End:0xD2
        if(LPC != none)
        {
            return LPPerkDeployable(LPPRI(LPC.PlayerReplicationInfo).PerksManager.QueryPerkInstance(byte(Idx)));
        }
    }
    return none;
    //return ReturnValue;    
}

function GetPerkDeployableIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Totem, AITurret;

    // End:0xAA
    if(Owner != none)
    {
        Totem = LPTotemBase(Owner);
        // End:0x5E
        if(Totem != none)
        {
            return int(Totem.PerkIndex);            
        }
        else
        {
            AITurret = LPAIPawnTurret(Owner);
            // End:0xAA
            if(AITurret != none)
            {
                return int(AITurret.PerkIndex);
            }
        }
    }
    return -1;
    //return ReturnValue;    
}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL PD;

    // End:0x64
    if(TuneDataBeacon == none)
    {
        PD = GetPerkDeployable();
        // End:0x64
        if(PD != none)
        {
            TuneDataBeacon = LPTuneDataPerkBeaconBase(GetPerkDeployable().PerkBaseTuneData);
        }
    }
    //return;    
}

function AssimilateTotem()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    Owner.Destroy();
    //return;    
}

function WasCloned()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bClonedDeployment;
    //return ReturnValue;    
}

defaultproperties
{
    HackTimeInSeconds=7.0000000
    MinHackDistance=250.0000000
    MinHackPitchAngle=180.0000000
    MinHackYawAngle=180.0000000
    MinHackHeightTolerance=200.0000000
    HUDHackPromptString="<Strings:LostPlanetGame.HUDHintMessages.HUDHint_HackDeployable>"
}