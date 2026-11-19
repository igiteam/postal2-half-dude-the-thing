class CheatManager extends Object within PlayerController;

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ViewingFrom;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string OwnCamera;

exec function FXPlay()
{
    local /*0x35EA0000-0x00000000*/ private class aClass[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FXAnimPath[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL P, ClosestPawn;
    local /*0x35EA0000-0x00000000*/ private float ThisDistance, ClosestPawnDistance;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FxAnimGroup, FxAnimName;
    local /*0x35EA0000-0x00000000*/ private int dotPos;

    // End:0x2A3
    if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        ClosestPawn = none;
        ClosestPawnDistance = 10000000.0000000;
        // End:0x1BA
        foreach Outer.DynamicActors(Class'Pawn', P)
        {
            // End:0x1B9
            if(ClassIsChildOf(P.Class, aClass) && P != PlayerController(Outer.Owner).Pawn)
            {
                ThisDistance = VSize(P.Location - PlayerController(Outer.Owner).Pawn.Location);
                // End:0x1B9
                if(ThisDistance < ClosestPawnDistance)
                {
                    ClosestPawn = P;
                    ClosestPawnDistance = ThisDistance;
                }
            }            
        }        
        // End:0x2A3
        if(ClosestPawn.Mesh != none)
        {
            dotPos = InStr(FXAnimPath, ".");
            // End:0x2A3
            if(dotPos != -1)
            {
                FxAnimGroup = Left(FXAnimPath, dotPos);
                FxAnimName = Right(FXAnimPath, (Len(FXAnimPath) - dotPos) - 1);
                ClosestPawn.Mesh.PlayFaceFXAnim(none, FxAnimName, FxAnimGroup, none, none);
            }
        }
    }
    //return;    
}

exec function FXStop()
{
    local /*0x35EA0000-0x00000000*/ private class aClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL P, ClosestPawn;
    local /*0x35EA0000-0x00000000*/ private float ThisDistance, ClosestPawnDistance;

    // End:0x213
    if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        ClosestPawn = none;
        ClosestPawnDistance = 10000000.0000000;
        // End:0x1BA
        foreach Outer.DynamicActors(Class'Pawn', P)
        {
            // End:0x1B9
            if(ClassIsChildOf(P.Class, aClass) && P != PlayerController(Outer.Owner).Pawn)
            {
                ThisDistance = VSize(P.Location - PlayerController(Outer.Owner).Pawn.Location);
                // End:0x1B9
                if(ThisDistance < ClosestPawnDistance)
                {
                    ClosestPawn = P;
                    ClosestPawnDistance = ThisDistance;
                }
            }            
        }        
        // End:0x213
        if(ClosestPawn.Mesh != none)
        {
            ClosestPawn.Mesh.StopFaceFXAnim();
        }
    }
    //return;    
}

exec function DebugAI()
{
    local /*0x35EA0000-0x00000000*/ private name Category[143654913];

    //return;    
}

exec function EditAIByTrace()
{
    local /*0x35EA0000-0x00000000*/ private @NULL CamLoc, CamRot, HitLocation, HitNormal, HitPawn, C;

    Outer.GetPlayerViewPoint(CamLoc, CamRot);
    HitPawn = Pawn(Outer.Trace(HitLocation, HitNormal, CamLoc + (Vector(CamRot) * float(10000)), CamLoc, true, vect(10.0000000, 10.0000000, 10.0000000)));
    // End:0x1BA
    if(HitPawn != none)
    {
        C = HitPawn.Controller;
        // End:0x14F
        if((C == none) && HitPawn.DrivenVehicle != none)
        {
            C = HitPawn.DrivenVehicle.Controller;
        }
        // End:0x1BA
        if(C != none)
        {            
            Outer.ConsoleCommand("EDITACTOR NAME=" $ string(C.Name), true);
        }
    }
    //return;    
}

exec function DebugPause()
{
    Outer.WorldInfo.Game.DebugPause();
    //return;    
}

exec function ListDynamicActors()
{
    //return;    
}

exec function FreezeFrame()
{
    local /*0x35EA0000-0x00000000*/ private float Delay[8388609];

    Outer.WorldInfo.Game.SetPause(Outer, Outer.CanUnpause);
    Outer.WorldInfo.PauseDelay = Outer.WorldInfo.TimeSeconds + Delay;
    //return;    
}

exec function WriteToLog()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Param[8388609];

    //return;    
}

exec function KillViewedActor()
{
    // End:0x12E
    if(Outer.ViewTarget != none)
    {
        // End:0xE0
        if((Pawn(Outer.ViewTarget) != none) && Pawn(Outer.ViewTarget).Controller != none)
        {
            Pawn(Outer.ViewTarget).Controller.Destroy();
        }
        Outer.ViewTarget.Destroy();
        Outer.SetViewTarget(none);
    }
    //return;    
}

exec function Teleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitActor, HitNormal, HitLocation, ViewLocation, ViewRotation;

    Outer.GetPlayerViewPoint(ViewLocation, ViewRotation);
    HitActor = Outer.Trace(HitLocation, HitNormal, ViewLocation + (float(1000000) * Vector(ViewRotation)), ViewLocation, true);
    // End:0xBB
    if(HitActor != none)
    {
        HitLocation += (HitNormal * 4.0000000);
    }
    Outer.ViewTarget.SetLocation(HitLocation);
    //return;    
}

exec function ChangeSize()
{
    local /*0x35EA0000-0x00000000*/ private float F[8388609];

    Outer.Pawn.CylinderComponent.SetCylinderSize(Outer.Pawn.default.CylinderComponent.CollisionRadius * F, Outer.Pawn.default.CylinderComponent.CollisionHeight * F);
    Outer.Pawn.SetDrawScale(F);
    Outer.Pawn.SetLocation(Outer.Pawn.Location);
    //return;    
}

exec function EndPath()
{
    //return;    
}

exec function Amphibious()
{
    Outer.Pawn.UnderWaterTime = 999999.0000000;
    //return;    
}

exec function Fly()
{
    // End:0xD9
    if((Outer.Pawn != none) && Outer.Pawn.CheatFly())
    {
        Outer.ClientMessage("You feel much lighter");
        Outer.bCheatFlying = true;
        Outer.GotoState('PlayerFlying');
    }
    //return;    
}

exec function Walk()
{
    Outer.bCheatFlying = false;
    // End:0x9E
    if((Outer.Pawn != none) && Outer.Pawn.CheatWalk())
    {
        Outer.Restart(false);
    }
    //return;    
}

exec function Ghost()
{
    // End:0xA4
    if((Outer.Pawn != none) && Outer.Pawn.CheatGhost())
    {
        Outer.bCheatFlying = true;
        Outer.GotoState('PlayerFlying');        
    }
    else
    {
        Outer.bCollideWorld = false;
    }
    Outer.ClientMessage("You feel ethereal");
    //return;    
}

exec function AllAmmo()
{
    //return;    
}

exec function God()
{
    // End:0x74
    if(Outer.bGodMode)
    {
        Outer.bGodMode = false;
        Outer.ClientMessage("God mode off");
        return;
    }
    Outer.bGodMode = true;
    Outer.ClientMessage("God Mode on");
    //return;    
}

exec function Slomo()
{
    local /*0x35EA0000-0x00000000*/ private float T[8388609];

    Outer.WorldInfo.Game.SetGameSpeed(T, true);
    //return;    
}

exec function SetJumpZ()
{
    local /*0x35EA0000-0x00000000*/ private float F[8388609];

    Outer.Pawn.JumpZ = F;
    //return;    
}

exec function SetGravity()
{
    local /*0x35EA0000-0x00000000*/ private float F[8388609];

    Outer.WorldInfo.WorldGravityZ = F;
    //return;    
}

exec function SetSpeed()
{
    local /*0x35EA0000-0x00000000*/ private float F[8388609];

    Outer.Pawn.GroundSpeed = Outer.Pawn.default.GroundSpeed * F;
    Outer.Pawn.WaterSpeed = Outer.Pawn.default.WaterSpeed * F;
    //return;    
}

exec function KillAll()
{
    local /*0x35EA0000-0x00000000*/ private class aClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL A;

    // End:0x36
    if(ClassIsChildOf(aClass, Class'Pawn'))
    {
        KillAllPawns(class<Pawn>(aClass));
        return;
    }
    // End:0xAA
    foreach Outer.DynamicActors(Class'Actor', A)
    {
        // End:0xA9
        if(ClassIsChildOf(A.Class, aClass))
        {
            A.Destroy();
        }        
    }    
    //return;    
}

function KillAllPawns()
{
    local /*0x35EA0000-0x00000000*/ private class aClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL P;

    // End:0xEB
    foreach Outer.DynamicActors(Class'Pawn', P)
    {
        // End:0xEA
        if(ClassIsChildOf(P.Class, aClass) && !P.IsPlayerPawn())
        {
            // End:0xD2
            if(P.Controller != none)
            {
                P.Controller.Destroy();
            }
            P.Destroy();
        }        
    }    
    //return;    
}

exec function KillPawns()
{
    KillAllPawns(Class'Pawn');
    //return;    
}

exec function Avatar()
{
    local /*0x35EA0000-0x00000000*/ private name ClassName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL P, TargetPawn, FirstPawn, OldPawn;
    local /*0x35EA0000-0x00000000*/ private bool bPickNextPawn;

    // End:0xD2
    foreach Outer.DynamicActors(Class'Pawn', P)
    {
        // End:0x69
        if(P == Outer.Pawn)
        {
            bPickNextPawn = true;
            // End:0xD1
            continue;
        }
        // End:0xD1
        if(P.IsA(ClassName))
        {
            // End:0xAE
            if(FirstPawn == none)
            {
                FirstPawn = P;
            }
            // End:0xD1
            if(bPickNextPawn)
            {
                TargetPawn = P;
                // End:0xD2
                break;
            }
        }        
    }    
    // End:0xF5
    if(TargetPawn == none)
    {
        TargetPawn = FirstPawn;
    }
    // End:0x1FF
    if(TargetPawn != none)
    {
        TargetPawn.DetachFromController(true);
        // End:0x1A5
        if(Outer.Pawn != none)
        {
            OldPawn = Outer.Pawn;
            Outer.Pawn.DetachFromController();
        }
        Outer.Possess(TargetPawn, false);
        // End:0x1FC
        if(OldPawn != none)
        {
            OldPawn.SpawnDefaultController();
        }        
    }
    //return;    
}

exec function Summon()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ClassName[8388609];
    local /*0x35EA0000-0x00000000*/ private class NewClass;
    local /*0x35EA0000-0x00000000*/ private @NULL SpawnLoc;

    NewClass = class<Actor>(DynamicLoadObject(ClassName, Class'Core.Class'));
    // End:0x13F
    if(NewClass != none)
    {
        // End:0xA3
        if(Outer.Pawn != none)
        {
            SpawnLoc = Outer.Pawn.Location;            
        }
        else
        {
            SpawnLoc = Outer.Location;
        }
        Outer.Spawn(NewClass,,, (SpawnLoc + (float(72) * Vector(Outer.Rotation))) + (vect(0.0000000, 0.0000000, 1.0000000) * float(15)));
    }
    //return;    
}

exec function GiveWeapon()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string WeaponClassStr[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Weap;
    local /*0x35EA0000-0x00000000*/ private class WeaponClass;

    WeaponClass = class<Weapon>(DynamicLoadObject(WeaponClassStr, Class'Core.Class'));
    Weap = Weapon(Outer.Pawn.FindInventoryType(WeaponClass));
    // End:0x9A
    if(Weap != none)
    {
        return Weap;
    }
    return Weapon(Outer.Pawn.CreateInventory(WeaponClass));
    //return ReturnValue;    
}

exec function PlayersOnly()
{
    // End:0xDF
    if(Outer.WorldInfo.bPlayersOnly || Outer.WorldInfo.bPlayersOnlyPending)
    {
        Outer.WorldInfo.bPlayersOnly = false;
        Outer.WorldInfo.bPlayersOnlyPending = false;        
    }
    else
    {
        Outer.WorldInfo.bPlayersOnlyPending = !Outer.WorldInfo.bPlayersOnlyPending;
    }
    //return;    
}

exec function SuspendAI()
{
    Outer.WorldInfo.bSuspendAI = !Outer.WorldInfo.bSuspendAI;
    //return;    
}

exec function DestroyFractures()
{
    local /*0x35EA0000-0x00000000*/ private float Radius[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL FracActor;

    // End:0x23
    if(Radius == 0.0000000)
    {
        Radius = 256.0000000;
    }
    // End:0x11A
    foreach Outer.CollidingActors(Class'FracturedStaticMeshActor', FracActor, Radius, Outer.Pawn.Location, true)
    {
        // End:0x119
        if(int(FracActor.Physics) == int(0))
        {
            FracActor.BreakOffPartsInRadius(Outer.Pawn.Location, Radius, 500.0000000, true);
        }        
    }    
    //return;    
}

exec function FractureAllMeshes()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FracActor;

    // End:0x4E
    foreach Outer.AllActors(Class'FracturedStaticMeshActor', FracActor)
    {
        FracActor.HideOneFragment();        
    }    
    //return;    
}

exec function FractureAllMeshesToMaximizeMemoryUsage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FracActor;

    // End:0x4E
    foreach Outer.AllActors(Class'FracturedStaticMeshActor', FracActor)
    {
        FracActor.HideFragmentsToMaximizeMemoryUsage();        
    }    
    //return;    
}

exec function RememberSpot()
{
    // End:0x7A
    if(Outer.Pawn != none)
    {
        Outer.SetDestinationPosition(Outer.Pawn.Location);        
    }
    else
    {
        Outer.SetDestinationPosition(Outer.Location);
    }
    //return;    
}

exec function ViewSelf()
{
    local /*0x35EA0000-0x00000000*/ private bool bQuiet[9437185];

    Outer.ResetCameraMode();
    // End:0x86
    if(Outer.Pawn != none)
    {
        Outer.SetViewTarget(Outer.Pawn);        
    }
    else
    {
        Outer.SetViewTarget(Outer);
    }
    // End:0xF0
    if(!bQuiet)
    {
        Outer.ClientMessage(OwnCamera, 'Event');
    }
    Outer.FixFOV();
    //return;    
}

exec function ViewPlayer()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL P;

    // End:0xB2
    foreach Outer.WorldInfo.AllControllers(Class'Controller', P)
    {
        // End:0xB1
        if(P.bIsPlayer && P.PlayerReplicationInfo.PlayerName ~= S)
        {
            // End:0xB2
            break;
        }        
    }    
    // End:0x17C
    if(P.Pawn != none)
    {
        Outer.ClientMessage(ViewingFrom @ P.PlayerReplicationInfo.PlayerName, 'Event');
        Outer.SetViewTarget(P.Pawn);
    }
    //return;    
}

exec function ViewActor()
{
    local /*0x35EA0000-0x00000000*/ private name actorName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL A;

    // End:0xAF
    foreach Outer.AllActors(Class'Actor', A)
    {
        // End:0xAE
        if(A.Name == actorName)
        {
            Outer.SetViewTarget(A);
            Outer.SetCameraMode('ThirdPerson');            
            return;
        }        
    }    
    //return;    
}

exec function ViewBot()
{
    local /*0x35EA0000-0x00000000*/ private @NULL first;
    local /*0x35EA0000-0x00000000*/ private bool bFound;
    local /*0x35EA0000-0x00000000*/ private @NULL C;

    // End:0x122
    foreach Outer.WorldInfo.AllControllers(Class'AIController', C)
    {
        // End:0x121
        if((C.Pawn != none) && C.PlayerReplicationInfo != none)
        {
            // End:0xD4
            if(bFound || first == none)
            {
                first = C;
                // End:0xD4
                if(bFound)
                {
                    // End:0x122
                    break;
                }
            }
            // End:0x121
            if(C.PlayerReplicationInfo == Outer.RealViewTarget)
            {
                bFound = true;
            }
        }        
    }    
    // End:0x1A5
    if(first != none)
    {
        Outer.SetViewTarget(first);
        Outer.SetCameraMode('ThirdPerson');
        Outer.FixFOV();        
    }
    else
    {
        ViewSelf(true);
    }
    //return;    
}

exec function ViewClass()
{
    local /*0x35EA0000-0x00000000*/ private class aClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Other, first;
    local /*0x35EA0000-0x00000000*/ private bool bFound;

    first = none;
    // End:0xB3
    foreach Outer.AllActors(aClass, Other)
    {
        // End:0x7A
        if(bFound || first == none)
        {
            first = Other;
            // End:0x7A
            if(bFound)
            {
                // End:0xB3
                break;
            }
        }
        // End:0xB2
        if(Other == Outer.ViewTarget)
        {
            bFound = true;
        }        
    }    
    // End:0x1BB
    if(first != none)
    {
        // End:0x131
        if(Pawn(first) != none)
        {
            Outer.ClientMessage(ViewingFrom @ first.GetHumanReadableName(), 'Event');            
        }
        else
        {
            Outer.ClientMessage(ViewingFrom @ string(first), 'Event');
        }
        Outer.SetViewTarget(first);
        Outer.FixFOV();        
    }
    else
    {
        ViewSelf(false);
    }
    //return;    
}

exec function Loaded()
{
    // End:0x40
    if(int(Outer.WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    AllWeapons();
    AllAmmo();
    //return;    
}

exec function AllWeapons()
{
    //return;    
}

function SetLevelStreamingStatus()
{
    local /*0x35EA0000-0x00000000*/ private name PackageName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bShouldBeLoaded[8388609], bShouldBeVisible;
    local /*0x35EA0000-0x00000000*/ private @NULL PC;
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0xA2
    if(PackageName != 'All')
    {
        // End:0x9E
        foreach Outer.WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            PC.ClientUpdateLevelStreamingStatus(PackageName, bShouldBeLoaded, bShouldBeVisible, false);            
        }                
    }
    else
    {
        // End:0x1CD
        foreach Outer.WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            I = 0;
            J0xF6:

            // End:0x1CC [Loop If]
            if(I < Outer.WorldInfo.StreamingLevels.Length)
            {
                PC.ClientUpdateLevelStreamingStatus(Outer.WorldInfo.StreamingLevels[I].PackageName, bShouldBeLoaded, bShouldBeVisible, false);
                I++;
                // [Loop Continue]
                goto J0xF6;
            }            
        }        
    }
    //return;    
}

exec function StreamLevelIn()
{
    local /*0x35EA0000-0x00000000*/ private name PackageName[8388609];

    SetLevelStreamingStatus(PackageName, true, true);
    //return;    
}

exec function OnlyLoadLevel()
{
    local /*0x35EA0000-0x00000000*/ private name PackageName[8388609];

    SetLevelStreamingStatus(PackageName, true, false);
    //return;    
}

exec function StreamLevelOut()
{
    local /*0x35EA0000-0x00000000*/ private name PackageName[8388609];

    SetLevelStreamingStatus(PackageName, false, false);
    //return;    
}

exec function TestLevel()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A, Found;
    local /*0x35EA0000-0x00000000*/ private bool bFoundErrors;

    // End:0x99
    foreach Outer.AllActors(Class'Actor', A)
    {
        bFoundErrors = bFoundErrors || A.CheckForErrors();
        // End:0x98
        if(bFoundErrors && Found == none)
        {
            Found = A;
        }        
    }    
    // End:0xAC
    if(bFoundErrors)
    {
        // DebugMode: 0
        assert(false);
    }
    //return;    
}

exec function SetOnlineDebugLevel()
{
    local /*0x35EA0000-0x00000000*/ private int DebugLevel[8388609];

    // End:0x61
    if(Outer.OnlineSub != none)
    {
        Outer.OnlineSub.SetDebugSpewLevel(DebugLevel);
    }
    //return;    
}

exec function TestNavMeshPath()
{
    local /*0x35EA0000-0x00000000*/ private bool bDrawPath[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL HitActor, HitLoc, HitNorm, Start, End, Rot;

    true
    // End:0x5E
    if(Outer.NavigationHandle == none)
    {
        Outer.NavigationHandle = new (Outer) Class'NavigationHandle';
    }
    Outer.GetPlayerViewPoint(Start, Rot);
    End = Start + (Vector(Rot) * float(10000));
    HitActor = Outer.Trace(HitLoc, HitNorm, End, Start, false);
    // End:0x3FF
    if(HitActor != none)
    {
        Class'NavMeshPath_Toward'.static.TowardPoint(Outer.NavigationHandle, HitLoc);
        Class'NavMeshGoal_At'.static.AtLocation(Outer.NavigationHandle, HitLoc);
        Outer.NavigationHandle.bDebugConstraintsAndGoalEvals = true;
        Outer.NavigationHandle.bUltraVerbosePathDebugging = true;
        // End:0x2FF
        if(Outer.NavigationHandle.FindPath())
        {
            Outer.DrawDebugLine(HitLoc, Start, 0, 255, 0, true);
            Outer.DrawDebugCoordinateSystem(HitLoc, rot(0, 0, 0), 25.0000000, true);
            // End:0x2FC
            if(bDrawPath)
            {
                Outer.NavigationHandle.DrawPathCache(,, true);
            }            
        }
        else
        {
            Outer.DrawDebugLine(HitLoc, Start, 255, 0, 0, true);
            Outer.DrawDebugCoordinateSystem(HitLoc, rot(0, 0, 0), 25.0000000, true);
            Outer.DrawDebugBox(Outer.Pawn.Location, Outer.Pawn.GetCollisionExtent(), 255, 0, 0, true);
        }
    }
    //return;    
}

exec function TestPylonConnectivity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Py;

    // End:0x4E
    foreach Outer.AllActors(Class'Pylon', Py)
    {
        Py.VerifyTopLevelConnections();        
    }    
    //return;    
}

exec function VerbosePathDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitLoc, HitNorm, Start, End, Rot, P;

    Outer.GetPlayerViewPoint(Start, Rot);
    End = Start + (Vector(Rot) * float(10000));
    // End:0x1E2
    foreach Outer.TraceActors(Class'Pawn', P, HitLoc, HitNorm, End, Start, vect(1.0000000, 1.0000000, 1.0000000))
    {
        Outer.Pawn.MessagePlayer("Verbosepathdebug trace hit" @ string(P));
        // End:0x1E1
        if((P != none) && P.Controller != none)
        {
            P.Controller.NavigationHandle.bUltraVerbosePathDebugging = !P.Controller.NavigationHandle.bUltraVerbosePathDebugging;
        }        
    }    
    //return;    
}

function InitCheatManager()
{
    //return;    
}

// Export UCheatManager::execLogPlaySoundCalls(FFrame&, void* const)
native exec function LogPlaySoundCalls()
{
    local /*0x35EA0000-0x00000000*/ private bool bShouldLog[8388609];


}

// Export UCheatManager::execLogParticleActivateSystemCalls(FFrame&, void* const)
native exec function LogParticleActivateSystemCalls()
{
    local /*0x35EA0000-0x00000000*/ private bool bShouldLog[8388609];


}

// Export UCheatManager::execVerifyNavMeshObjects(FFrame&, void* const)
native exec function VerifyNavMeshObjects();

// Export UCheatManager::execDrawUnsupportingEdges(FFrame&, void* const)
native exec function DrawUnsupportingEdges()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PawnClassName[142606337];


}

exec function NavMeshVerification()
{
    local /*0x35EA0000-0x00000000*/ private float interval[9437185];

    0.5000000
    // End:0x4E
    if(interval < float(0))
    {
        Outer.ClearTimer('VerifyNavMeshObjects', Outer);        
    }
    else
    {
        Outer.SetTimer(interval, true, 'VerifyNavMeshObjects', Outer);
    }
    //return;    
}

// Export UCheatManager::execPrintAllPathObjectEdges(FFrame&, void* const)
native exec function PrintAllPathObjectEdges();

// Export UCheatManager::execPrintNavMeshObstacles(FFrame&, void* const)
native exec function PrintNavMeshObstacles();

// Export UCheatManager::execVerifyNavMeshCoverRefs(FFrame&, void* const)
native exec function VerifyNavMeshCoverRefs();

exec function ToggleAILogging()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Eng;

    Eng = Class'Engine'.static.GetEngine();
    // End:0x10F
    if(Outer.Pawn != none)
    {
        // End:0xC0
        if(Eng.bDisableAILogging)
        {
            Outer.Pawn.MessagePlayer("OK! AI logging is now ON");            
        }
        else
        {
            Outer.Pawn.MessagePlayer("OK! AI logging is now OFF");
        }
    }
    Eng.bDisableAILogging = !Eng.bDisableAILogging;
    //return;    
}

exec function DebugIniLocPatcher()
{
    // End:0xA8
    if((Outer.OnlineSub != none) && Outer.OnlineSub.Patcher != none)
    {
        Outer.OnlineSub.Patcher.DownloadFiles();
    }
    //return;    
}

exec function DebugDownloadTitleFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFromCache[9437185];

    // End:0x22B
    if(Outer.OnlineSub != none)
    {
        // End:0x130
        if(bFromCache)
        {
            // End:0x12D
            if(NotEqual_InterfaceInterface(Outer.OnlineSub.TitleFileCacheInterface, OnlineTitleFileCacheInterface(none)))
            {
                Outer.OnlineSub.TitleFileCacheInterface.AddLoadTitleFileCompleteDelegate(OnLoadComplete);
                Outer.OnlineSub.TitleFileCacheInterface.LoadTitleFile(Filename);                
            }            
        }
        else
        {
            // End:0x22B
            if(NotEqual_InterfaceInterface(Outer.OnlineSub.TitleFileInterface, OnlineTitleFileInterface(none)))
            {
                Outer.OnlineSub.TitleFileInterface.AddReadTitleFileCompleteDelegate(OnDownloadComplete);
                Outer.OnlineSub.TitleFileInterface.ReadTitleFile(Filename);                
            }
        }
    }
    //return;    
}

function OnDownloadComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];

    Outer.OnlineSub.TitleFileInterface.ClearReadTitleFileCompleteDelegate(OnDownloadComplete);
    // End:0x7B
    if(bWasSuccessful)
    {
        DebugSaveTitleFile(Filename);
    }
    //return;    
}

function OnLoadComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];

    Outer.OnlineSub.TitleFileCacheInterface.ClearLoadTitleFileCompleteDelegate(OnLoadComplete);
    DebugDownloadTitleFile(Filename, false);
    //return;    
}

exec function DebugSaveTitleFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FileContents;

    // End:0x1E5
    if(Outer.OnlineSub != none)
    {
        // End:0xD3
        if(NotEqual_InterfaceInterface(Outer.OnlineSub.TitleFileInterface, OnlineTitleFileInterface(none)))
        {
            // End:0xD0
            if(Outer.OnlineSub.TitleFileInterface.GetTitleFileContents(Filename, FileContents))
            {                
            }            
        }
        // End:0x1E5
        if(NotEqual_InterfaceInterface(Outer.OnlineSub.TitleFileCacheInterface, OnlineTitleFileCacheInterface(none)))
        {
            Outer.OnlineSub.TitleFileCacheInterface.AddSaveTitleFileCompleteDelegate(OnSaveComplete);
            Outer.OnlineSub.TitleFileCacheInterface.SaveTitleFile(Filename, "TestName.ini", FileContents);            
        }
    }
    //return;    
}

function OnSaveComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Filename[8388609];

    Outer.OnlineSub.TitleFileCacheInterface.ClearSaveTitleFileCompleteDelegate(OnSaveComplete);
    //return;    
}

exec function DebugDeleteTitleFiles()
{
    // End:0xC6
    if(Outer.OnlineSub != none)
    {
        // End:0xC6
        if(NotEqual_InterfaceInterface(Outer.OnlineSub.TitleFileCacheInterface, OnlineTitleFileCacheInterface(none)))
        {
            // End:0xC3
            if(Outer.OnlineSub.TitleFileCacheInterface.DeleteTitleFiles(0.0000000))
            {                
            }            
        }
    }
    //return;    
}

exec function DebugEmsDownload()
{
    // End:0xA8
    if((Outer.OnlineSub != none) && Outer.OnlineSub.Patcher != none)
    {
        Outer.OnlineSub.Patcher.DownloadFiles();
    }
    //return;    
}

// Export UCheatManager::execDumpCoverStats(FFrame&, void* const)
native exec function DumpCoverStats();

exec function DrawLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Loc[8388609];

    Outer.DrawDebugCoordinateSystem(Loc, rot(0, 0, 0), 50.0000000, true);
    //return;    
}

exec function DrawLocationXYZ()
{
    local /*0x35EA0000-0x00000000*/ private float X[8388609], Y, Z;
    local /*0x35EA0000-0x00000000*/ private @NULL DrawSpot;

    DrawSpot.X = X;
    DrawSpot.Y = Y;
    DrawSpot.Z = Z;
    Outer.DrawDebugCoordinateSystem(DrawSpot, rot(0, 0, 0), 150.0000000, true);
    //return;    
}

exec function DebugNotification()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string MessageBody[8388609];
    local /*0x35EA0000-0x00000000*/ private int SecondsFromNow[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL AppNotification, NotificationInfo, MessageInfo;

    AppNotification = Class'PlatformInterfaceBase'.static.GetAppNotificationsInterface();
    // End:0x1D3
    if(AppNotification != none)
    {
        NotificationInfo.BadgeNumber = 1;
        NotificationInfo.MessageBody = MessageBody;
        MessageInfo.Key = "test key 1";
        MessageInfo.Value = "test val 1";
        NotificationInfo.MessageInfo.AddItem(MessageInfo);        
        MessageInfo.Key = "test key 2";
        MessageInfo.Value = "test val 2";
        NotificationInfo.MessageInfo.AddItem(MessageInfo);        
        AppNotification.__OnReceivedLocalNotification__Delegate = OnReceivedLocalNotificationDebug;
        AppNotification.ScheduleLocalNotification(NotificationInfo, SecondsFromNow);
    }
    //return;    
}

private final function OnReceivedLocalNotificationDebug()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Notification[25296897];
    local /*0x35EA0000-0x00000000*/ private bool bWasAppActive[8388609];

    Class'PlatformInterfaceBase'.static.GetAppNotificationsInterface().DebugLogNotification(Notification);
    //return;    
}

exec function DebugQueryUserFiles()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609];

    // End:0x11E
    if((Outer.OnlineSub != none) && NotEqual_InterfaceInterface(Outer.OnlineSub.UserCloudInterface, UserCloudFileInterface(none)))
    {
        Outer.OnlineSub.UserCloudInterface.AddEnumerateUserFileCompleteDelegate(OnEnumerateUserFilesComplete);
        Outer.OnlineSub.UserCloudInterface.EnumerateUserFiles(UserId);
    }
    //return;    
}

private final function OnEnumerateUserFilesComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609];

    Outer.OnlineSub.UserCloudInterface.ClearEnumerateUserFileCompleteDelegate(OnEnumerateUserFilesComplete);    
    Outer.ConsoleCommand("obj dump" @ string(Outer.OnlineSub.UserCloudInterface.Name));
    //return;    
}

exec function DebugWriteUserFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FileContents;

    // End:0x17B
    if((Outer.OnlineSub != none) && NotEqual_InterfaceInterface(Outer.OnlineSub.UserCloudInterface, UserCloudFileInterface(none)))
    {
        Idx = 0;
        J0x7B:

        // End:0xBB [Loop If]
        if(Idx < 1000)
        {
            FileContents[Idx] = byte(Idx);
            Idx++;
            // [Loop Continue]
            goto J0x7B;
        }
        Outer.OnlineSub.UserCloudInterface.AddWriteUserFileCompleteDelegate(OnWriteUserFileComplete);
        Outer.OnlineSub.UserCloudInterface.WriteUserFile(UserId, Filename, FileContents);
    }
    //return;    
}

private final function OnWriteUserFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;

    Outer.OnlineSub.UserCloudInterface.ClearWriteUserFileCompleteDelegate(OnWriteUserFileComplete);    
    Outer.ConsoleCommand("obj dump" @ string(Outer.OnlineSub.UserCloudInterface.Name));
    //return;    
}

exec function DebugReadUserFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;

    // End:0x127
    if((Outer.OnlineSub != none) && NotEqual_InterfaceInterface(Outer.OnlineSub.UserCloudInterface, UserCloudFileInterface(none)))
    {
        Outer.OnlineSub.UserCloudInterface.AddReadUserFileCompleteDelegate(OnReadUserFileComplete);
        Outer.OnlineSub.UserCloudInterface.ReadUserFile(UserId, Filename);
    }
    //return;    
}

private final function OnReadUserFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array FileContents;

    Outer.OnlineSub.UserCloudInterface.ClearReadUserFileCompleteDelegate(OnReadUserFileComplete);
    Outer.OnlineSub.UserCloudInterface.GetFileContents(UserId, Filename, FileContents);    
    Outer.ConsoleCommand("obj dump" @ string(Outer.OnlineSub.UserCloudInterface.Name));
    //return;    
}

exec function DebugDeleteUserFile()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;

    // End:0x129
    if((Outer.OnlineSub != none) && NotEqual_InterfaceInterface(Outer.OnlineSub.UserCloudInterface, UserCloudFileInterface(none)))
    {
        Outer.OnlineSub.UserCloudInterface.AddDeleteUserFileCompleteDelegate(OnDeleteUserFileComplete);
        Outer.OnlineSub.UserCloudInterface.DeleteUserFile(UserId, Filename, true, true);
    }
    //return;    
}

private final function OnDeleteUserFileComplete()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string UserId[8388609], Filename;

    Outer.OnlineSub.UserCloudInterface.ClearDeleteUserFileCompleteDelegate(OnDeleteUserFileComplete);    
    Outer.ConsoleCommand("obj dump" @ string(Outer.OnlineSub.UserCloudInterface.Name));
    //return;    
}

exec function TestHttp()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Verb[8388609], Payload, URL;
    local /*0x35EA0000-0x00000000*/ private bool bSendParallelRequest[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL R;

    R = Class'HttpFactory'.static.CreateRequest();
    R.__OnProcessRequestComplete__Delegate = OnRequestComplete;
    R.SetURL(URL);
    // End:0xBE
    if(Len(Verb) > 0)
    {
        R.SetVerb(Verb);        
    }
    // End:0xFA
    if(Len(Payload) > 0)
    {
        R.SetContentAsString(Payload);        
    }
    // End:0x121
    if(!R.ProcessRequest())
    {        
    }
    // End:0x200
    if(bSendParallelRequest)
    {
        // End:0x200
        if(!Class'HttpFactory'.static.CreateRequest().SetURL("http://www.epicgames.com").SetVerb("GET").SetHeader("Test", "Value").SetProcessRequestCompleteDelegate(OnRequestComplete).ProcessRequest())
        {            
        }
    }
    //return;    
}

function OnRequestComplete()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OriginalRequest[8388609], Response;
    local /*0x35EA0000-0x00000000*/ private bool bDidSucceed[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Headers;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Header, Payload;
    local /*0x35EA0000-0x00000000*/ private int PayloadIndex;

    // End:0xD3
    if(Response != none)
    {
        Headers = Response.GetHeaders();
        // End:0x50
        foreach Headers(Header)
        {            
        }        
        Payload = Response.GetContentAsString();
        // End:0xD3
        if(Len(Payload) > 1024)
        {
            PayloadIndex = 0;
            J0x9A:

            // End:0xD0 [Loop If]
            if(PayloadIndex < Len(Payload))
            {
                PayloadIndex = PayloadIndex + 1024;
                // [Loop Continue]
                goto J0x9A;
            }            
        }
    }
    //return;    
}

defaultproperties
{
    ViewingFrom="Now viewing from"
    OwnCamera="Now viewing from own camera"
}