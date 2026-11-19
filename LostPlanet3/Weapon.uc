class Weapon extends Inventory
    abstract
    config(Game)
    notplaceable
    hidecategories(AnimDependency,Navigation);

enum EWeaponFireType
{
    EWFT_InstantHit,                // 0
    EWFT_Projectile,                // 1
    EWFT_Custom,                    // 2
    EWFT_None,                      // 3
    EWFT_MAX                        // 4
};

var(*) /*0x35EA0000-0x00000000*/ private byte CurrentFireMode;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FiringStatesArray;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array WeaponFireTypes;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array WeaponProjectiles;
var(*) /*0x506F0000-0x00000000*/ private editfixedsize array FireInterval[65537];
var(*) /*0x506F0000-0x00000000*/ private editfixedsize array Spread[65537];
var(*) /*0x506F0000-0x00000000*/ private editfixedsize array InstantHitDamage[65537];
var(*) /*0x506F0000-0x00000000*/ private editfixedsize array InstantHitMomentum[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array InstantHitDamageTypes;
var(*) /*0x506F0000-0x00000000*/ private float EquipTime[65537];
var(*) /*0x506F0000-0x00000000*/ private float PutDownTime[65537];
var(*) /*0x506F0000-0x00000000*/ private @NULL FireOffset[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bWeaponPutDown;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanThrow;
var(*) /*0x35EA0000-0x00000000*/ private bool bWasOptionalSet;
var(*) /*0x35EA0000-0x00000000*/ private bool bWasDoNotActivate;
var(*) /*0x35EA0000-0x00000000*/ private bool bInstantHit;
var(*) /*0x35EA0000-0x00000000*/ private bool bMeleeWeapon;
var(*) /*0x506F0000-0x00000000*/ private float WeaponRange[65537];
var(*) /*0x506F0000-0x00000400*/ private export @NULL Mesh[589825];
var(*) /*0x506F0000-0x00000000*/ private float DefaultAnimSpeed[65537];
var(*) /*0x35EA0000-0x00000000*/ private float Priority[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private noexport @NULL AIController;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ShouldFireOnRelease;
var(*) /*0x35EA0000-0x00000000*/ private float AIRating;
var(*) /*0x35EA0000-0x00000000*/ private float CachedMaxRange;

simulated event Destroyed()
{
    DetachWeapon();
    super.Destroyed();
    //return;    
}

function ItemRemovedFromInvManager()
{
    GotoState('Inactive');
    ForceEndFire();
    DetachWeapon();
    ClientWeaponThrown();
    super.ItemRemovedFromInvManager();
    // End:0x8B
    if((Instigator != none) && Instigator.Weapon == self)
    {
        Instigator.Weapon = none;
    }
    //return;    
}

function HolderDied()
{
    ServerStopFire(CurrentFireMode);
    //return;    
}

simulated function DoOverrideNextWeapon()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function DoOverridePrevWeapon()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function DropFrom()
{
    local /*0x35EA0000-0x00000000*/ private @NULL StartLocation[8388609], StartVelocity;

    // End:0x11
    if(!CanThrow())
    {
        return;
    }
    GotoState('Inactive');
    ForceEndFire();
    DetachWeapon();
    super.DropFrom(StartLocation, StartVelocity);
    AIController = none;
    //return;    
}

simulated function CanThrow()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bCanThrow;
    //return ReturnValue;    
}

reliable client simulated function ClientWeaponThrown()
{
    // End:0xA0
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        GotoState('Inactive');
        // End:0x8C
        if((Instigator != none) && Instigator.Weapon == self)
        {
            Instigator.Weapon = none;
        }
        ForceEndFire();
        DetachWeapon();
    }
    //return;    
}

simulated event IsFiring()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function DenyClientWeaponSet()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array DebugInfo;
    local /*0x35EA0000-0x00000000*/ private int I;

    GetWeaponDebug(DebugInfo);
    HUD.Canvas.SetDrawColor(0, 255, 0);
    I = 0;
    J0x59:

    // End:0x127 [Loop If]
    if(I < DebugInfo.Length)
    {
        HUD.Canvas.DrawText("  " @ DebugInfo[I]);
        out_YPos += out_YL;
        HUD.Canvas.SetPos(4.0000000, out_YPos);
        I++;
        // [Loop Continue]
        goto J0x59;
    }
    //return;    
}

simulated function GetWeaponDebug()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array DebugInfo[25165825];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string T;
    local /*0x35EA0000-0x00000000*/ private int I;

    DebugInfo[DebugInfo.Length] = (((((("Weapon:" $ (GetItemName(string(self)))) @ "State:") $ string(GetStateName())) @ "Instigator:") $ string(Instigator)) @ "Owner:") $ string(Owner);
    DebugInfo[DebugInfo.Length] = (((("IsFiring():" $ string(IsFiring())) @ "CurrentFireMode:") $ string(CurrentFireMode)) @ "bWeaponPutDown:") $ string(bWeaponPutDown);
    // End:0x19A
    if(Instigator != none)
    {
        DebugInfo[DebugInfo.Length] = (((("ShotCount:" $ string(Instigator.ShotCount)) @ "FlashCount:") $ string(Instigator.FlashCount)) @ "FlashLocation:") $ string(Instigator.FlashLocation);
    }
    T = "PendingFires:";
    I = 0;
    J0x1BE:

    // End:0x213 [Loop If]
    if(I < GetPendingFireLength())
    {
        T = (T $ string(PendingFire(I))) $ " ";
        I++;
        // [Loop Continue]
        goto J0x1BE;
    }
    DebugInfo[DebugInfo.Length] = T;
    // End:0x36B
    if(Timers.Length > 0)
    {
        I = 0;
        J0x24C:

        // End:0x36B [Loop If]
        if(I < Timers.Length)
        {
            DebugInfo[DebugInfo.Length] = (((("Timer" @ string(Timers[I].FuncName)) @ string(Timers[I].Count)) @ string(Timers[I].Rate)) @ string(int((Timers[I].Count / Timers[I].Rate) * float(100)))) $ "%";
            I++;
            // [Loop Continue]
            goto J0x24C;
        }
    }
    //return;    
}

function ConsumeAmmo()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

    //return;    
}

function AddAmmo()
{
    local /*0x35EA0000-0x00000000*/ private int Amount[8388609], ReturnValue;

    //return ReturnValue;    
}

simulated function HasAmmo()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int Amount[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function HasAnyAmmo()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

final simulated function GetPendingFireLength()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x30
    if(InvManager != none)
    {
        return InvManager.GetPendingFireLength(self);
    }
    return 0;
    //return ReturnValue;    
}

final simulated event PendingFire()
{
    local /*0x35EA0000-0x00000000*/ private int FireMode[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(InvManager != none)
    {
        return InvManager.IsPendingFire(self, FireMode);
    }
    return false;
    //return ReturnValue;    
}

final simulated function SetPendingFire()
{
    local /*0x35EA0000-0x00000000*/ private int FireMode[8388609];

    // End:0x38
    if(InvManager != none)
    {
        InvManager.SetPendingFire(self, FireMode);
    }
    //return;    
}

final simulated function ClearPendingFire()
{
    local /*0x35EA0000-0x00000000*/ private int FireMode[8388609];

    // End:0x38
    if(InvManager != none)
    {
        InvManager.ClearPendingFire(self, FireMode);
    }
    //return;    
}

simulated function GetProjectileClass()
{
    local /*0x35EA0000-0x00000000*/ private class ReturnValue[92274689];

    return ((int(CurrentFireMode) < WeaponProjectiles.Length) ? WeaponProjectiles[int(CurrentFireMode)] : none);
    //return ReturnValue;    
}

simulated function AddSpread()
{
    local /*0x35EA0000-0x00000000*/ private @NULL BaseAim[8388609], ReturnValue, X, Y, Z;

    local /*0x35EA0000-0x00000000*/ private float CurrentSpread, RandY, RandZ;

    CurrentSpread = Spread[int(CurrentFireMode)];
    // End:0x3D
    if(CurrentSpread == float(0))
    {
        return BaseAim;        
    }
    else
    {
        GetAxes(BaseAim, X, Y, Z);
        RandY = FRand() - 0.5000000;
        RandZ = Sqrt(0.5000000 - Square(RandY)) * (FRand() - 0.5000000);
        return Rotator((X + ((RandY * CurrentSpread) * Y)) + ((RandZ * CurrentSpread) * Z));
    }
    //return ReturnValue;    
}

simulated function MaxRange()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x1B
    if(CachedMaxRange > float(0))
    {
        return CachedMaxRange;
    }
    // End:0x3B
    if(bInstantHit)
    {
        CachedMaxRange = WeaponRange;
    }
    I = 0;
    J0x46:

    // End:0xC3 [Loop If]
    if(I < WeaponProjectiles.Length)
    {
        // End:0xB5
        if(WeaponProjectiles[I] != none)
        {
            CachedMaxRange = FMax(CachedMaxRange, WeaponProjectiles[I].static.GetRange());
        }
        I++;
        // [Loop Continue]
        goto J0x46;
    }
    return CachedMaxRange;
    //return ReturnValue;    
}

function GetAIRating()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return AIRating;
    //return ReturnValue;    
}

simulated function GetWeaponRating()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x30
    if(InvManager != none)
    {
        return InvManager.GetWeaponRatingFor(self);
    }
    // End:0x45
    if(!HasAnyAmmo())
    {
        return -1.0000000;
    }
    return 1.0000000;
    //return ReturnValue;    
}

function CanAttack()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function FireOnRelease()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (ShouldFireOnRelease.Length > 0) && int(ShouldFireOnRelease[int(CurrentFireMode)]) != int(0);
    //return ReturnValue;    
}

simulated function @NULL GetWeaponAnimNodeSeq()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Tree, AnimSeq, SkelMesh;

    SkelMesh = SkeletalMeshComponent(Mesh);
    // End:0xEF
    if(SkelMesh != none)
    {
        Tree = AnimTree(SkelMesh.Animations);
        // End:0xB4
        if(Tree != none)
        {
            AnimSeq = AnimNodeSequence(Tree.Children[0].Anim);            
        }
        else
        {
            AnimSeq = AnimNodeSequence(SkelMesh.Animations);
        }
        return AnimSeq;
    }
    return none;
    //return ReturnValue;    
}

simulated function @NULL PlayWeaponAnimation()
{
    local /*0x35EA0000-0x00000000*/ private name Sequence[8388609];
    local /*0x35EA0000-0x00000000*/ private float fDesiredDuration[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bLoop[9437185];
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMesh[9437185], WeapNode, Tree;

    // End:0x2D
    if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    // End:0x58
    if(SkelMesh == none)
    {
        SkelMesh = SkeletalMeshComponent(Mesh);
    }
    // End:0x7B
    if((SkelMesh == none) || (GetWeaponAnimNodeSeq()) == none)
    {
        return;
    }
    // End:0xCF
    if(fDesiredDuration > 0.0000000)
    {
        SkelMesh.PlayAnim(Sequence, fDesiredDuration, bLoop);        
    }
    else
    {
        Tree = AnimTree(SkelMesh.Animations);
        // End:0x158
        if(Tree != none)
        {
            WeapNode = AnimNodeSequence(Tree.Children[0].Anim);            
        }
        else
        {
            WeapNode = AnimNodeSequence(SkelMesh.Animations);
        }
        WeapNode.SetAnim(Sequence);
        WeapNode.PlayAnim(bLoop, DefaultAnimSpeed);
    }
    //return;    
}

simulated function StopWeaponAnimation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimSeq;

    // End:0x2B
    if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    AnimSeq = GetWeaponAnimNodeSeq();
    // End:0x6D
    if(AnimSeq != none)
    {
        AnimSeq.StopAnim();
    }
    //return;    
}

simulated function PlayFireEffects()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[9437185];

    //return;    
}

simulated function StopFireEffects()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

    //return;    
}

simulated function GetFireInterval()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return ((FireInterval[int(FireModeNum)] > float(0)) ? FireInterval[int(FireModeNum)] : 0.0100000);
    //return ReturnValue;    
}

simulated function TimeWeaponFiring()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

    // End:0x3A
    if(!IsTimerActive('RefireCheckTimer'))
    {
        SetTimer(GetFireInterval(FireModeNum), true, 'RefireCheckTimer');
    }
    //return;    
}

simulated function RefireCheckTimer()
{
    //return;    
}

simulated function TimeWeaponPutDown()
{
    SetTimer(((PutDownTime > float(0)) ? PutDownTime : 0.0100000), false, 'WeaponIsDown');
    //return;    
}

simulated function TimeWeaponEquipping()
{
    SetTimer(((EquipTime > float(0)) ? EquipTime : 0.0100000), false, 'WeaponEquipped');
    //return;    
}

simulated function Activate()
{
    // End:0x1D
    if(!IsFiring())
    {
        GotoState('WeaponEquipping');
    }
    //return;    
}

simulated function PutDownWeapon()
{
    GotoState('WeaponPuttingDown');
    //return;    
}

function DenyPickupQuery()
{
    local /*0x35EA0000-0x00000000*/ private class ItemClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Pickup[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(ItemClass == Class)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function WeaponEmpty()
{
    //return;    
}

simulated function IncrementFlashCount()
{
    // End:0x38
    if(Instigator != none)
    {
        Instigator.IncrementFlashCount(self, CurrentFireMode);
    }
    //return;    
}

simulated function ClearFlashCount()
{
    // End:0x2F
    if(Instigator != none)
    {
        Instigator.ClearFlashCount(self);
    }
    //return;    
}

function SetFlashLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609];

    // End:0x41
    if(Instigator != none)
    {
        Instigator.SetFlashLocation(self, CurrentFireMode, HitLocation);
    }
    //return;    
}

function ClearFlashLocation()
{
    // End:0x2F
    if(Instigator != none)
    {
        Instigator.ClearFlashLocation(self);
    }
    //return;    
}

simulated function @NULL AttachWeaponTo()
{
    local /*0x35EA0000-0x00000400*/ private @NULL MeshCpnt[8388609];
    local /*0x35EA0000-0x00000000*/ private name SocketName[9437185];

    //return;    
}

simulated function DetachWeapon()
{
    //return;    
}

reliable client simulated function ClientGivenTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewOwner[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bDoNotActivate[8388609];

    super.ClientGivenTo(NewOwner, bDoNotActivate);
    ClientWeaponSet(true, bDoNotActivate);
    //return;    
}

reliable client simulated function ClientWeaponSet()
{
    local /*0x35EA0000-0x00000000*/ private bool bOptionalSet[8388609], bDoNotActivate;

    bWasOptionalSet = bOptionalSet;
    bWasDoNotActivate = bDoNotActivate;
    // End:0x4A
    if(Instigator == none)
    {
        GotoState('PendingClientWeaponSet');
        return;
    }
    // End:0x69
    if(InvManager == none)
    {
        GotoState('PendingClientWeaponSet');
        return;
    }
    InvManager.ClientWeaponSet(self, bOptionalSet, bDoNotActivate);
    //return;    
}

simulated function StartFire()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

    // End:0x6F
    if((Instigator == none) || !Instigator.bNoWeaponFiring)
    {
        // End:0x5C
        if(int(Role) < int(ROLE_Authority))
        {
            ServerStartFire(FireModeNum);
        }
        BeginFire(FireModeNum);
    }
    //return;    
}

reliable server function ServerStartFire()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

    // End:0x48
    if((Instigator == none) || !Instigator.bNoWeaponFiring)
    {
        BeginFire(FireModeNum);
    }
    //return;    
}

simulated function BeginFire()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

    SetPendingFire(int(FireModeNum));
    //return;    
}

simulated function StopFire()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

    EndFire(FireModeNum);
    // End:0x3A
    if(int(Role) < int(ROLE_Authority))
    {
        ServerStopFire(FireModeNum);
    }
    //return;    
}

reliable server function ServerStopFire()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

    EndFire(FireModeNum);
    //return;    
}

simulated function EndFire()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

    ClearPendingFire(int(FireModeNum));
    //return;    
}

simulated function ForceEndFire()
{
    local /*0x35EA0000-0x00000000*/ private int I, Num;

    // End:0x7E
    if(InvManager != none)
    {
        Num = GetPendingFireLength();
        I = 0;
        J0x2E:

        // End:0x7E [Loop If]
        if(I < Num)
        {
            // End:0x70
            if(PendingFire(I))
            {
                EndFire(byte(I));
            }
            I++;
            // [Loop Continue]
            goto J0x2E;
        }
    }
    //return;    
}

simulated function SendToFiringState()
{
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

    // End:0x1C
    if(int(FireModeNum) >= FiringStatesArray.Length)
    {
        return;
    }
    // End:0x63
    if((FiringStatesArray[int(FireModeNum)] == 'None') || int(WeaponFireTypes[int(FireModeNum)]) == int(3))
    {
        return;
    }
    SetCurrentFireMode(FireModeNum);
    GotoState(FiringStatesArray[int(FireModeNum)]);
    //return;    
}

simulated function SetCurrentFireMode()
{
    local /*0x35EA0000-0x00000000*/ private byte FiringModeNum[8388609];

    CurrentFireMode = FiringModeNum;
    // End:0x4B
    if(Instigator != none)
    {
        Instigator.SetFiringMode(self, FiringModeNum);
    }
    //return;    
}

simulated function FireModeUpdated()
{
    local /*0x35EA0000-0x00000000*/ private byte FiringMode[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bViaReplication[8388609];

    //return;    
}

simulated function FireAmmunition()
{
    ConsumeAmmo(CurrentFireMode);
    switch(WeaponFireTypes[int(CurrentFireMode)])
    {
        // End:0x44
        case 0:
            InstantFire();
            // End:0x6B
            break;
        // End:0x56
        case 1:
            ProjectileFire();
            // End:0x6B
            break;
        // End:0x68
        case 2:
            CustomFire();
            // End:0x6B
            break;
        // End:0xFFFF
        default:
            break;
    }
    NotifyWeaponFired(CurrentFireMode);
    //return;    
}

simulated function GetAdjustedAim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL StartFireLoc[8388609], ReturnValue, R;

    // End:0x42
    if(Instigator != none)
    {
        R = Instigator.GetAdjustedAimFor(self, StartFireLoc);
    }
    return AddSpread(R);
    //return ReturnValue;    
}

simulated event GetTraceRange()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return WeaponRange;
    //return ReturnValue;    
}

simulated function GetTraceOwner()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ((Instigator != none) ? Instigator : self);
    //return ReturnValue;    
}

simulated function CalcWeaponFire()
{
    local /*0x35EA0000-0x00000000*/ private @NULL StartTrace[8388609], EndTrace;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ImpactList[26214401];
    local /*0x35EA0000-0x00000000*/ private @NULL Extent[9437185], ReturnValue, HitLocation, HitNormal, Dir, HitActor,
	    HitInfo, CurrentImpact, Portal;

    local /*0x35EA0000-0x00000000*/ private float HitDist;
    local /*0x35EA0000-0x00000000*/ private bool bOldBlockActors, bOldCollideActors;

    HitActor = GetTraceOwner().Trace(HitLocation, HitNormal, EndTrace, StartTrace, true, Extent, HitInfo, 1);
    // End:0x7F
    if(HitActor == none)
    {
        HitLocation = EndTrace;
    }
    CurrentImpact.HitActor = HitActor;
    CurrentImpact.HitLocation = HitLocation;
    CurrentImpact.HitNormal = HitNormal;
    CurrentImpact.RayDir = Normal(EndTrace - StartTrace);
    CurrentImpact.StartTrace = StartTrace;
    CurrentImpact.HitInfo = HitInfo;
    ImpactList[ImpactList.Length] = CurrentImpact;
    // End:0x4A9
    if(HitActor != none)
    {
        // End:0x35A
        if(PassThroughDamage(HitActor))
        {
            HitActor.bProjTarget = false;
            bOldCollideActors = HitActor.bCollideActors;
            bOldBlockActors = HitActor.bBlockActors;
            // End:0x2A0
            if(HitActor.IsA('Pawn'))
            {
                HitActor.SetCollision(false, false);                
                CalcWeaponFire(HitLocation, EndTrace, ImpactList, Extent);                
            }
            else
            {
                // End:0x2D1
                if(bOldBlockActors)
                {
                    HitActor.SetCollision(bOldCollideActors, false);
                }
                CurrentImpact = CalcWeaponFire(HitLocation, EndTrace, ImpactList, Extent);
            }
            HitActor.bProjTarget = true;
            HitActor.SetCollision(bOldCollideActors, bOldBlockActors);            
        }
        else
        {
            Portal = PortalTeleporter(HitActor);
            // End:0x4A9
            if((Portal != none) && Portal.SisterPortal != none)
            {
                Dir = EndTrace - StartTrace;
                HitDist = VSize(HitLocation - StartTrace);
                StartTrace = Portal.TransformHitLocation(HitLocation);
                EndTrace = StartTrace + Portal.TransformVectorDir(Normal(Dir) * (VSize(Dir) - HitDist));                
                CalcWeaponFire(StartTrace, EndTrace, ImpactList, Extent);
            }
        }
    }
    return CurrentImpact;
    //return ReturnValue;    
}

static simulated function PassThroughDamage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (!HitActor.bBlockActors && HitActor.IsA('Trigger') || HitActor.IsA('TriggerVolume')) || HitActor.IsA('InteractiveFoliageActor');
    //return ReturnValue;    
}

simulated function InstantFire()
{
    local /*0x35EA0000-0x00000000*/ private @NULL StartTrace, EndTrace;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ImpactList;
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL RealImpact;

    StartTrace = Instigator.GetWeaponStartTraceLocation();
    EndTrace = StartTrace + (Vector(GetAdjustedAim(StartTrace)) * (GetTraceRange()));
    RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);
    // End:0xCA
    if(int(Role) == int(ROLE_Authority))
    {
        SetFlashLocation(RealImpact.HitLocation);
    }
    Idx = 0;
    J0xD5:

    // End:0x122 [Loop If]
    if(Idx < ImpactList.Length)
    {
        ProcessInstantHit(CurrentFireMode, ImpactList[Idx]);
        Idx++;
        // [Loop Continue]
        goto J0xD5;
    }
    //return;    
}

simulated function @NULL ProcessInstantHit()
{
    local /*0x35EA0000-0x00000000*/ private byte FiringMode[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Impact[8388609];
    local /*0x35EA0000-0x00000000*/ private int NumHits[9437185], TotalDamage;
    local /*0x35EA0000-0x00000000*/ private @NULL NewKActor, HitStaticMesh;

    // End:0x252
    if(Impact.HitActor != none)
    {
        NumHits = Max(NumHits, 1);
        TotalDamage = int(InstantHitDamage[int(CurrentFireMode)] * float(NumHits));
        // End:0x178
        if(Impact.HitActor.bWorldGeometry)
        {
            HitStaticMesh = StaticMeshComponent(Impact.HitInfo.HitComponent);
            // End:0x178
            if((HitStaticMesh != none) && HitStaticMesh.CanBecomeDynamic())
            {
                NewKActor = Class'KActorFromStatic'.static.MakeDynamic(HitStaticMesh);
                // End:0x178
                if(NewKActor != none)
                {
                    Impact.HitActor = NewKActor;
                }
            }
        }
        Impact.HitActor.TakeDamage(TotalDamage, Instigator.Controller, Impact.HitLocation, InstantHitMomentum[int(FiringMode)] * Impact.RayDir, InstantHitDamageTypes[int(FiringMode)], Impact.HitInfo, self);
    }
    //return;    
}

simulated function ProjectileFire()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], StartTrace, EndTrace, RealStartLoc, AimDir, TestImpact,
	    SpawnedProjectile;

    IncrementFlashCount();
    // End:0x1B4
    if(int(Role) == int(ROLE_Authority))
    {
        StartTrace = Instigator.GetWeaponStartTraceLocation();
        AimDir = Vector(GetAdjustedAim(StartTrace));
        RealStartLoc = GetPhysicalFireStartLoc(AimDir);
        // End:0x120
        if(StartTrace != RealStartLoc)
        {
            EndTrace = StartTrace + (AimDir * (GetTraceRange()));
            TestImpact = CalcWeaponFire(StartTrace, EndTrace);
            AimDir = Normal(TestImpact.HitLocation - RealStartLoc);
        }
        SpawnedProjectile = Spawn(GetProjectileClass(), self,, RealStartLoc);
        // End:0x1AA
        if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
        {
            SpawnedProjectile.Init(AimDir);
        }
        return SpawnedProjectile;
    }
    return none;
    //return ReturnValue;    
}

simulated function CustomFire()
{
    //return;    
}

simulated event GetMuzzleLoc()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x5C
    if(Instigator != none)
    {
        return Instigator.GetPawnViewLocation() + (FireOffset >> Instigator.GetViewRotation());
    }
    return Location;
    //return ReturnValue;    
}

// Export UWeapon::execGetPhysicalFireStartLoc(FFrame&, void* const)
native simulated event GetPhysicalFireStartLoc()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AimDir[9437185], ReturnValue;


}

simulated function TryPutDown()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    bWeaponPutDown = true;
    return true;
    //return ReturnValue;    
}

simulated function HandleFinishedFiring()
{
    GotoState('Active');
    //return;    
}

function NotifyWeaponFired()
{
    local /*0x35EA0000-0x00000000*/ private byte FireMode[8388609];

    // End:0x38
    if(AIController != none)
    {
        AIController.NotifyWeaponFired(self, FireMode);
    }
    //return;    
}

function NotifyWeaponFinishedFiring()
{
    local /*0x35EA0000-0x00000000*/ private byte FireMode[8388609];

    // End:0x38
    if(AIController != none)
    {
        AIController.NotifyWeaponFinishedFiring(self, FireMode);
    }
    //return;    
}

simulated function ShouldRefire()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1B
    if(!HasAmmo(CurrentFireMode))
    {
        return false;
    }
    return StillFiring(CurrentFireMode);
    //return ReturnValue;    
}

simulated function StillFiring()
{
    local /*0x35EA0000-0x00000000*/ private byte FireMode[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return PendingFire(int(FireMode));
    //return ReturnValue;    
}

simulated function WeaponIsDown()
{
    //return;    
}

simulated function CacheAIController()
{
    // End:0x1D
    if(Instigator == none)
    {
        AIController = none;        
    }
    else
    {
        AIController = AIController(Instigator.Controller);
    }
    //return;    
}

simulated function GetTargetDistance()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689], VeryFar;
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation, HitNormal, projStart, TargetLoc, X, Y,
	    Z, CameraRot, PC;

    VeryFar = 32768.0000000;
    PC = PlayerController(Instigator.Controller);
    PC.GetPlayerViewPoint(projStart, CameraRot);
    GetAxes(CameraRot, X, Y, Z);
    TargetLoc = projStart + (X * VeryFar);
    // End:0x111
    if(none == GetTraceOwner().Trace(HitLocation, HitNormal, TargetLoc, projStart, true,,, 1))
    {
        return VeryFar;
    }
    return (HitLocation - projStart) Dot X;
    //return ReturnValue;    
}

auto state Inactive
{
    ignores BeginState, StartFire;

    reliable server function ServerStartFire()
    {
        local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

        global.ServerStartFire(FireModeNum);
        // End:0x59
        if((Instigator != none) && Instigator.Weapon == self)
        {
            GotoState('Active');            
        }
        else
        {
            // End:0x1FC
            if((InvManager != none) && InvManager.PendingWeapon == self)
            {
                // End:0xFF
                if(Instigator.Weapon.IsInState('WeaponPuttingDown'))
                {
                    Instigator.Weapon.WeaponIsDown();                    
                }
                else
                {
                    InvManager.SetCurrentWeapon(self);
                    InvManager.ServerSetCurrentWeapon(self);
                    // End:0x1F9
                    if(((Instigator.Weapon != self) && InvManager.PendingWeapon == self) && Instigator.Weapon.IsInState('WeaponPuttingDown'))
                    {
                        Instigator.Weapon.WeaponIsDown();
                    }
                }                
            }
            else
            {
                // End:0x305
                if(Instigator != none)
                {
                    InvManager.SetCurrentWeapon(self);
                    InvManager.ServerSetCurrentWeapon(self);
                    // End:0x305
                    if(((Instigator.Weapon != self) && InvManager.PendingWeapon == self) && Instigator.Weapon.IsInState('WeaponPuttingDown'))
                    {
                        Instigator.Weapon.WeaponIsDown();
                    }
                }
            }
        }
        //return;        
    }

    reliable server function ServerStopFire()
    {
        local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

        ClearPendingFire(int(FireModeNum));
        //return;        
    }

    simulated function TryPutDown()
    {
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
    stop;    
}

simulated state Active
{
    ignores Activate;

    simulated event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x35EA0000-0x00000000*/ private int I;

        // End:0x1E
        if(int(Role) == int(ROLE_Authority))
        {
            CacheAIController();
        }
        // End:0x38
        if(bWeaponPutDown)
        {
            PutDownWeapon();            
        }
        else
        {
            // End:0x54
            if(!HasAnyAmmo())
            {
                WeaponEmpty();                
            }
            else
            {
                // End:0xC0
                if(AllowDirectBeginFireCall())
                {
                    I = 0;
                    J0x6C:

                    // End:0xC0 [Loop If]
                    if(I < GetPendingFireLength())
                    {
                        // End:0xB2
                        if(PendingFire(I))
                        {
                            BeginFire(byte(I));
                            // [Explicit Break]
                            goto J0xC0;
                        }
                        I++;
                        // [Loop Continue]
                        goto J0x6C;
                    }
                }
            }
        }
        J0xC0:

        //return;        
    }

    simulated function AllowDirectBeginFireCall()
    {
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function BeginFire()
    {
        local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];

        // End:0x77
        if(!bDeleteMe && Instigator != none)
        {
            global.BeginFire(FireModeNum);
            // End:0x77
            if(PendingFire(int(FireModeNum)) && HasAmmo(FireModeNum))
            {
                SendToFiringState(FireModeNum);
            }
        }
        //return;        
    }

    simulated function ReadyToFire()
    {
        local /*0x35EA0000-0x00000000*/ private bool bFinished[8388609], ReturnValue;

        return true;
        //return ReturnValue;        
    }

    simulated function TryPutDown()
    {
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        PutDownWeapon();
        return true;
        //return ReturnValue;        
    }
    stop;    
}

simulated state WeaponFiring
{
    simulated event IsFiring()
    {
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function RefireCheckTimer()
    {
        // End:0x19
        if(bWeaponPutDown)
        {
            PutDownWeapon();
            return;
        }
        // End:0x32
        if(ShouldRefire())
        {
            FireAmmunition();
            return;
        }
        HandleFinishedFiring();
        //return;        
    }

    simulated event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        FireAmmunition();
        TimeWeaponFiring(CurrentFireMode);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        ClearFlashCount();
        ClearFlashLocation();
        ClearTimer('RefireCheckTimer');
        NotifyWeaponFinishedFiring(CurrentFireMode);
        //return;        
    }
    stop;    
}

simulated state WeaponEquipping
{
    ignores Activate;

    simulated event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        TimeWeaponEquipping();
        bWeaponPutDown = false;
        //return;        
    }

    simulated event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('WeaponEquipped');
        //return;        
    }

    simulated function WeaponEquipped()
    {
        // End:0x19
        if(bWeaponPutDown)
        {
            PutDownWeapon();
            return;
        }
        GotoState('Active');
        //return;        
    }
    stop;    
}

simulated state WeaponPuttingDown
{
    simulated event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        TimeWeaponPutDown();
        bWeaponPutDown = false;
        ForceEndFire();
        //return;        
    }

    simulated function WeaponIsDown()
    {
        // End:0x24
        if(InvManager.CancelWeaponChange())
        {
            return;
        }
        DetachWeapon();
        GotoState('Inactive');
        InvManager.ChangedWeapon();
        //return;        
    }

    simulated function TryPutDown()
    {
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    reliable client simulated function ClientWeaponThrown()
    {
        WeaponIsDown();
        global.ClientWeaponThrown();
        //return;        
    }

    simulated event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('WeaponIsDown');
        //return;        
    }
    stop;    
}

state PendingClientWeaponSet
{
    simulated function PendingWeaponSetTimer()
    {
        ClientWeaponSet(bWasOptionalSet, bWasDoNotActivate);
        //return;        
    }

    simulated event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        SetTimer(0.0300000, true, 'PendingWeaponSetTimer');
        //return;        
    }

    simulated event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('PendingWeaponSetTimer');
        //return;        
    }
    stop;    
}

defaultproperties
{
    EquipTime=0.3300000
    PutDownTime=0.3300000
    bCanThrow=true
    WeaponRange=16384.0000000
    DefaultAnimSpeed=1.0000000
    Priority=-1.0000000
    AIRating=0.5000000
    ItemName="Weapon"
    RespawnTime=30.0000000
    Components=none
    bReplicateInstigator=true
    bOnlyDirtyReplication=false
}