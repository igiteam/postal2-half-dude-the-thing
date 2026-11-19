class LPPerkDeployable extends LPPerkBase;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastUsedTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ActiveCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DeploymentPromptString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PrimePromptString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDeploymentGuidesActive;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BeaconTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentInventoryCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DeployedPerkList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DeploymentWidth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DeploymentDepth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DeploymentOffset;

// Export ULPPerkDeployable::execCanSpawnActor(FFrame&, void* const)
native function CanSpawnActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerActor[8388609], Loc, Rot;
    local /*0x97E50000-0x00000000*/ private class ActorClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function CopyProperties()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    super.CopyProperties(P);
    // End:0x8D
    if(LPPerkDeployable(P) != none)
    {
        LastUsedTime = LPPerkDeployable(P).LastUsedTime;
        ActiveCount = LPPerkDeployable(P).ActiveCount;
    }
    //return;    
}

simulated function Reset()
{
    super.Reset();
    LastUsedTime = 0.0000000;
    ActiveCount = 0;
    PerkManager.DeploymentLocation = vect(0.0000000, 0.0000000, 0.0000000);
    DeactivateDeploymentGuides();
    //return;    
}

simulated function GetBeaconTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x2C
    if(BeaconTuneData == none)
    {
        BeaconTuneData = LPTuneDataPerkBeaconBase(GetTuneData());
    }
    return BeaconTuneData;
    //return ReturnValue;    
}

function OnUse()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Deployable;

    DeactivateDeploymentGuides();
    Deployable = SpawnDeployable();
    // End:0x4A
    if(Deployable != none)
    {
        SetupDeployable(Deployable);
        return Deployable;
    }
    return none;
    //return ReturnValue;    
}

function SpawnDeployable()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

function SetupDeployable()
{
    local /*0x97E50000-0x00000000*/ private @NULL Deployable[8388609];

    SetupDeployableHackComponentFromOwner(Deployable);
    // End:0x99
    if(CurrentInventoryCount > 0)
    {
        --CurrentInventoryCount;
        // End:0x96
        if((MyPlayerController != none) && MyPlayerController.myLPHUD != none)
        {
            MyPlayerController.myLPHUD.NotifyPerkInventoryChanged();
        }        
    }
    //return;    
}

function SetLastUsedTime()
{
    local /*0x97E50000-0x00000000*/ private float fTime[8388609];

    LastUsedTime = fTime;
    //return;    
}

function GetCooldownTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetBeaconTuneData().CooldownTime.GetValue(MyPlayerController);
    //return ReturnValue;    
}

function GetLastUsedTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return LastUsedTime;
    //return ReturnValue;    
}

function GetNumActivePips()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ActiveCount;
    //return ReturnValue;    
}

function GetMaxPips()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x4B
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) == int(NM_Standalone))
    {
        return GetMaxDeployablesInWorld();
    }
    return int(GetBeaconTuneData().MaxNumberDeployed.GetValue(MyPlayerController));
    //return ReturnValue;    
}

function GetDeploymentTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetBeaconTuneData().DeploymentTime.GetValue(MyPlayerController);
    //return ReturnValue;    
}

simulated function GetDeploymentCost()
{
    local /*0x97E50000-0x00000000*/ private bool bRecalculateCost[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    false
    return GetBeaconTuneData().DeploymentCost.GetValue(MyPlayerController, bRecalculateCost);
    //return ReturnValue;    
}

simulated function GetCost()
{
    local /*0x97E50000-0x00000000*/ private bool bRecalculateCost[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    false
    return GetDeploymentCost(bRecalculateCost);
    //return ReturnValue;    
}

function ValidateDeploymentRules()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ActivateDeploymentGuides()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    LPP = LPPlayerPawn(MyPlayerController.Pawn);
    // End:0xB3
    if(LPP != none)
    {
        // End:0xB3
        if(LPTuneDataPerkBeaconBase(PerkBaseTuneData).GhostedMeshComponent != none)
        {
            LPP.SetDeploymentGhost(LPTuneDataPerkBeaconBase(PerkBaseTuneData).GhostedMeshComponent);
        }
    }
    bDeploymentGuidesActive = true;
    //return;    
}

function DeactivateDeploymentGuides()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    LPP = LPPlayerPawn(MyPlayerController.Pawn);
    // End:0x60
    if(LPP != none)
    {
        LPP.SetDeploymentGhost(none);
    }
    bDeploymentGuidesActive = false;
    //return;    
}

function ActivateDeploymentMode()
{
    MyPlayerController.EndSprint();
    ActivateDeploymentGuides();
    //return;    
}

function DeactivateDeploymentMode()
{
    DeactivateDeploymentGuides();
    //return;    
}

function CanPerkBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool bIgnoreCount[9437185], bIgnoreCooldown, bIgnoreCost, bIgnoreState;
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Pt, TE;
    local /*0x97E50000-0x00000000*/ private float DeployCost, AdjustedCooldown;
    local /*0x97E50000-0x00000000*/ private bool bMultiplayer;

    false
    false
    false
    false
    // End:0x27
    if((GetBeaconTuneData()) == none)
    {
        return 0;
    }
    bMultiplayer = int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone);
    // End:0xBF
    if(!bIgnoreCount)
    {
        // End:0xBF
        if(!bMultiplayer)
        {
            // End:0xA0
            if((GetInventoryCount()) <= 0)
            {
                return 3;
            }
            // End:0xBC
            if((GetNumActivePips()) >= (GetMaxDeployablesInWorld()))
            {
                return 3;
            }            
        }
    }
    // End:0x254
    if(!bIgnoreCooldown)
    {
        // End:0x254
        if(!bMultiplayer)
        {
            AdjustedCooldown = BeaconTuneData.CooldownTime.GetValue();
            Pt = LPPerkTechnician(LPPlayerPawn(MyPlayerController.Pawn).GetEnabledPerk(18));
            // End:0x1F0
            if(Pt != none)
            {
                AdjustedCooldown *= FMax(0.0000000, 1.0000000 - (Pt.TechnicianTuneData.CooldownTimeDecrease.GetValue(MyPlayerController) / float(100)));
            }
            // End:0x254
            if((LastUsedTime > float(0)) && (LastUsedTime + AdjustedCooldown) > Class'Engine.WorldInfo'.static.GetWorldInfo().TimeSeconds)
            {
                return 2;
            }
        }
    }
    // End:0x329
    if(!bIgnoreCost)
    {
        // End:0x329
        if(bMultiplayer)
        {
            DeployCost = GetDeploymentCost();
            // End:0x329
            if(DeployCost > float(0))
            {
                TE = LPThermalEnergy(MyPlayerController.Pawn.FindInventoryType(Class'LPThermalEnergy', true));
                // End:0x2F9
                if(TE == none)
                {
                    return 1;
                }
                // End:0x329
                if(TE.GetEnergyCount() < DeployCost)
                {
                    return 1;
                }
            }
        }
    }
    // End:0x3FD
    if(!bIgnoreState)
    {
        // End:0x34A
        if(MyPlayerController == none)
        {
            return 0;
        }
        // End:0x374
        if(!MyPlayerController.IsInState('PlayerWalking'))
        {
            return 0;
        }
        // End:0x3FD
        if((MyPlayerController.bIsInVitalSuit || int(MyPlayerController.Pawn.Physics) == int(2)) || MyPlayerController.IsDoingASpecialMove())
        {
            return 0;
        }
    }
    return 8;
    //return ReturnValue;    
}

function IncrementActiveCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ModifyActiveCount(1);
    //return ReturnValue;    
}

function DecrementActiveCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ModifyActiveCount(-1);
    //return ReturnValue;    
}

function ModifyActiveCount()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609], ReturnValue;

    ActiveCount += Amount;
    // End:0x31
    if(ActiveCount < 0)
    {
        ActiveCount = 0;        
    }
    else
    {
        // End:0x70
        if(ActiveCount > (GetMaxPips()))
        {
            ActiveCount = (((GetMaxPips()) > 0) ? GetMaxPips() : 0);
        }
    }
    return ActiveCount;
    //return ReturnValue;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function CanSpawnHere()
{
    local /*0x97E50000-0x00000000*/ private @NULL Location[25165825], Rotation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class ActorClass;
    local /*0x97E50000-0x00000000*/ private bool bSpawnOK;

    ActorClass = GetPerkTargetActorType();
    // End:0x25
    if(ActorClass == none)
    {
        return false;
    }
    bSpawnOK = CanSpawnActor(MyPlayerController.Pawn, Location, Rotation, ActorClass);
    // End:0x84
    if(!bSpawnOK)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function GetPerkTargetActorType()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

function @NULL SetupDeployableHackComponentFromOwner()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], C;

    // End:0xC5
    if(A != none)
    {
        // End:0xC4
        foreach A.AllOwnedComponents(Class'LPHackableTotemBaseComponent', C)
        {
            C.SetupParametersFromOwner();
            C.bClonedDeployment = PerkManager.bCurrentDeploymentPerkIsCloned;
            // End:0xC3
            if(C.bClonedDeployment)
            {
            }            
        }        
    }
    //return;    
}

function @NULL GetDeployableHackComponentFromOwner()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], ReturnValue, C;

    // End:0x50
    if(A != none)
    {
        // End:0x4F
        foreach A.AllOwnedComponents(Class'LPHackableTotemBaseComponent', C)
        {            
            return C;            
        }        
    }
    return none;
    //return ReturnValue;    
}

function AddDeployedPerk()
{
    local /*0x97E50000-0x00000000*/ private @NULL DeployedPerk[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIgnoreCount;

    // End:0xA0
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        // End:0xA0
        if(DeployedPerkList.Find(DeployedPerk) < )
        {            
            DeployedPerkList.AddItem(DeployedPerk);            
            // End:0xA0
            if(DeployedPerkList.Length > (GetMaxPips()))
            {
                bIgnoreCount = DestroyOldestDeployedPerk();
            }
        }
    }
    MyPlayerController.MPIncrementPerkCount(PerkIndex, bIgnoreCount);
    //return;    
}

function DestroyOldestDeployedPerk()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OldestDeployedPerk, DeployedTotem, DeployedPawn;

    OldestDeployedPerk = DeployedPerkList[0];
    // End:0x122
    if(OldestDeployedPerk != none)
    {
        DeployedPerkList.Remove(0, 1);        
        DeployedTotem = LPTotemBase(OldestDeployedPerk);
        // End:0x7E
        if(DeployedTotem != none)
        {
            DeployedTotem.EndBeacon(true);
            return true;
        }
        DeployedPawn = LPPawn(OldestDeployedPerk);
        // End:0x122
        if(DeployedPawn != none)
        {
            DeployedPawn.TakeDamage(DeployedPawn.Health + 1, none, DeployedPawn.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageType');
            return false;
        }
    }
    //return ReturnValue;    
}

function RemoveDeployedPerk()
{
    local /*0x97E50000-0x00000000*/ private @NULL DeployedPerk[8388609];
    local /*0x97E50000-0x00000000*/ private int RemoveIdx;

    RemoveIdx = DeployedPerkList.Find(DeployedPerk);    
    // End:0x44
    if(RemoveIdx >= 0)
    {
        DeployedPerkList.Remove(RemoveIdx, 1);        
    }
    //return;    
}

function GetMaxDeployablesInWorld()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return GetBeaconTuneData().MaxCountInWorld;
    //return ReturnValue;    
}

function GetMaxDeployablesInInventory()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return GetBeaconTuneData().MaxCountInPersonalInventory;
    //return ReturnValue;    
}

function GetInventoryCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return CurrentInventoryCount;
    //return ReturnValue;    
}

function GetCurrentDeployablesInWorld()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return GetNumActivePips();
    //return ReturnValue;    
}

function AddInventory()
{
    local /*0x97E50000-0x00000000*/ private int iCount[8388609], ReturnValue;

    // End:0x44
    if((iCount + (GetInventoryCount())) > (GetMaxDeployablesInInventory()))
    {
        iCount = (GetMaxDeployablesInInventory()) - (GetInventoryCount());
    }
    CurrentInventoryCount += iCount;
    // End:0xC1
    if((MyPlayerController != none) && MyPlayerController.myLPHUD != none)
    {
        MyPlayerController.myLPHUD.NotifyPerkInventoryChanged();
    }
    return iCount;
    //return ReturnValue;    
}

function SetInventory()
{
    local /*0x97E50000-0x00000000*/ private int iCount[8388609];

    iCount = Clamp(iCount, 0, GetMaxDeployablesInInventory());
    CurrentInventoryCount = iCount;
    //return;    
}

defaultproperties
{
    DeploymentWidth=32
    DeploymentDepth=32
    DeploymentOffset=(X=16.0000000,Y=16.0000000,Z=0.0000000)
}