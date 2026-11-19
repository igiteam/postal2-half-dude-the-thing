class LPCheatManager extends SPGFxCheatManager within LPPlayerController
    config(Game);

exec function AIDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL DebugModeManager;

    DebugModeManager = SPHUD(Outer.myHUD).GetDebugModeManager();
    // End:0x7E
    if(DebugModeManager != none)
    {
        DebugModeManager.ToggleDebugMode(Class'LPDebugModeAI');
    }
    //return;    
}

exec function EnableHostGame()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    Outer.bHostGameEnabled = bEnable;
    //return;    
}

exec function RecoverAllAmmo()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn, Weapon, GrenadeWeapon;

    PlayerPawn = LPPlayerPawn(Outer.Pawn);
    // End:0x68
    if((PlayerPawn == none) || PlayerPawn.InvManager == none)
    {
        return;
    }
    // End:0xF2
    foreach PlayerPawn.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', Weapon)
    {
        Weapon.AmmoLeftForWeapon = Weapon.GetMaxAmmoForWeapon();        
    }    
    GrenadeWeapon = PlayerPawn.GetGrenade();
    // End:0x18A
    if(GrenadeWeapon != none)
    {
        GrenadeWeapon.AmmoLeftInMagazine = 4;
        PlayerPawn.ShowGrenades(GrenadeWeapon.AmmoLeftInMagazine);
    }
    PlayerPawn.AddThermalEnergy(100.0000000);
    //return;    
}

exec function AmmoConsume()
{
    local /*0x97E50000-0x00000000*/ private @NULL Weapon;

    // End:0x61
    if((Outer.Pawn == none) || Outer.Pawn.InvManager == none)
    {
        return;
    }
    // End:0x100
    foreach Outer.Pawn.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', Weapon)
    {
        Weapon.AmmoLeftForWeapon = 1;
        Weapon.AmmoLeftInMagazine = 1;        
    }    
    //return;    
}

exec function AmmoGift()
{
    local /*0x97E50000-0x00000000*/ private @NULL Weapon;

    // End:0x61
    if((Outer.Pawn == none) || Outer.Pawn.InvManager == none)
    {
        return;
    }
    // End:0x12C
    foreach Outer.Pawn.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', Weapon)
    {
        Weapon.SetMaxAmmoForWeapon(10000);
        Weapon.MaxAmmoInMagazine = 10000;
        Weapon.AmmoLeftForWeapon = 10000;        
    }    
    //return;    
}

exec function GrenadeGift()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon;

    GrenadeWeapon = LPPlayerPawn(Outer.Pawn).GetGrenade();
    // End:0xFA
    if(GrenadeWeapon != none)
    {
        GrenadeWeapon.AmmoLeftInMagazine = 1000;
        GrenadeWeapon.AmmoLeftForWeapon = 1000;
        LPPlayerPawn(Outer.Pawn).ShowGrenades(GrenadeWeapon.AmmoLeftInMagazine);
    }
    //return;    
}

exec function EnergyGift()
{
    LPPlayerPawn(Outer.Pawn).AddThermalEnergy(1000.0000000);
    //return;    
}

exec function DukeMode()
{
    Outer.bSemiDukeMode = !Outer.bSemiDukeMode;
    // End:0xC1
    if(Outer.bSemiDukeMode)
    {
        RecoverAllAmmo();
        Outer.bGodMode = true;
        Outer.ClientMessage("Duke mode on.");        
    }
    else
    {
        Outer.bGodMode = false;
        Outer.ClientMessage("Duke mode off.");
    }
    //return;    
}

exec function SemiDukeMode()
{
    Outer.bSemiDukeMode = !Outer.bSemiDukeMode;
    // End:0x9B
    if(Outer.bSemiDukeMode)
    {
        Outer.ClientMessage("Semi Duke mode on.");        
    }
    else
    {
        Outer.ClientMessage("Semi Duke mode off.");
    }
    //return;    
}

exec function ToggleStats()
{
    Outer.ConsoleCommand("stat fps", false);    
    Outer.ConsoleCommand("stat unit", false);
    // End:0xD8
    if(int(Outer.WorldInfo.NetMode) != int(NM_Standalone))
    {        
        Outer.ConsoleCommand("stat net", false);
    }
    //return;    
}

exec function SetNetFrequency()
{
    local /*0x97E50000-0x00000000*/ private float Freq[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MPGame;

    MPGame = LPGameMP_Base(Outer.WorldInfo.Game);
    // End:0x7F
    if(MPGame != none)
    {
        MPGame.UpdateNetFrequencies(int(Freq));
    }
    //return;    
}

exec function SetLowNetFrequency()
{
    SetNetFrequency(10.0000000);
    //return;    
}

exec function SetMediumNetFrequency()
{
    SetNetFrequency(15.0000000);
    //return;    
}

exec function SetHighNetFrequency()
{
    SetNetFrequency(20.0000000);
    //return;    
}

exec function Mobility()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    // End:0x1B2
    if(Outer.bMobilityMode)
    {
        Outer.bMobilityMode = false;
        LPP = LPPawn(Outer.Pawn);
        // End:0x17A
        if(LPP != none)
        {
            LPP.AirControl = LPP.default.AirControl;
            LPP.AirSpeed = LPP.TuneDataBasePawn.AirSpeed;
            LPP.GroundSpeed = LPP.TuneDataBasePawn.GroundSpeed_Tunable.GetValue();
        }
        Outer.ClientMessage("Mobility mode OFF.");        
    }
    else
    {
        Outer.bMobilityMode = true;
        Outer.Pawn.AirControl = 1.0000000;
        Outer.Pawn.AirSpeed *= 2.0000000;
        Outer.Pawn.GroundSpeed *= 2.0000000;
        Outer.ClientMessage("Mobility mode ON.");
    }
    //return;    
}

exec function ForceMaxGibbing()
{
    local /*0x97E50000-0x00000000*/ private @NULL lpPlayer;

    // End:0xFF
    filtereditoronly
    {
        // End:0xFE
        foreach Outer.LocalPlayerControllers(Class'LPPlayerController', lpPlayer)
        {
            lpPlayer.MyBasePlayerPawn.TuneDataBasePlayerPawn.MaxNumberOfDamageGibsForThisPlayer.SetBaseValue(100000.0000000);
            lpPlayer.MyBasePlayerPawn.TuneDataBasePlayerPawn.MaxNumberOfDecalsForDamageGibsForThisPlayer.SetBaseValue(100000.0000000);            
        }        
    }
    //return;    
}

exec function ToggleGibDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL GibPoolMgr;

    GibPoolMgr = SPMapInfo(Class'Engine.WorldInfo'.static.GetWorldInfo().GetMapInfo(true)).GibPool;
    // End:0x8F
    if(GibPoolMgr != none)
    {
        GibPoolMgr.bShowGibDebug = true;
    }
    //return;    
}

exec function GiveAllAmmoTypes()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 1;
    J0x0B:

    // End:0x155 [Loop If]
    if(I < SPInventoryWeapon(Outer.Pawn.Weapon).TuneDataBaseWeapon.SupportedAmmoTypes.Length)
    {
        SPInventoryWeapon(Outer.Pawn.Weapon).GiveAmmoType(SPInventoryWeapon(Outer.Pawn.Weapon).TuneDataBaseWeapon.SupportedAmmoTypes[I]);
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

exec function GiveAllWeaponAmmoTypes()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL W;

    // End:0x11B
    foreach Outer.Pawn.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', W)
    {
        I = 1;
        J0x69:

        // End:0x11A [Loop If]
        if(I < W.TuneDataBaseWeapon.SupportedAmmoTypes.Length)
        {
            W.GiveAmmoType(W.TuneDataBaseWeapon.SupportedAmmoTypes[I]);
            I++;
            // [Loop Continue]
            goto J0x69;
        }        
    }    
    //return;    
}

exec function GiveAllWeaponUpgrades()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL W;

    // End:0x116
    foreach Outer.Pawn.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', W)
    {
        I = 0;
        J0x69:

        // End:0x115 [Loop If]
        if(I < W.TuneDataBaseWeapon.SupportedUpgrades.Length)
        {
            W.GiveUpgrade(W.TuneDataBaseWeapon.SupportedUpgrades[I]);
            I++;
            // [Loop Continue]
            goto J0x69;
        }        
    }    
    //return;    
}

exec function RemoveAllWeaponUpgrades()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL W;

    // End:0x1AF
    foreach Outer.Pawn.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', W)
    {
        I = 0;
        J0x69:

        // End:0x1AE [Loop If]
        if(I < SPInventoryWeapon(Outer.Pawn.Weapon).TuneDataBaseWeapon.SupportedUpgrades.Length)
        {
            SPInventoryWeapon(Outer.Pawn.Weapon).TuneDataBaseWeapon.SupportedUpgrades[I].RemoveUpgrade(SPInventoryWeapon(Outer.Pawn.Weapon));
            I++;
            // [Loop Continue]
            goto J0x69;
        }        
    }    
    //return;    
}

exec function GiveAllUpgrades()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x150 [Loop If]
    if(I < SPInventoryWeapon(Outer.Pawn.Weapon).TuneDataBaseWeapon.SupportedUpgrades.Length)
    {
        SPInventoryWeapon(Outer.Pawn.Weapon).GiveUpgrade(SPInventoryWeapon(Outer.Pawn.Weapon).TuneDataBaseWeapon.SupportedUpgrades[I]);
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

exec function ReplenishAmmo()
{
    LPPlayerPawn(Outer.Pawn).ServerReplenishAmmoFromMunitionsLocker(LPPlayerController(Outer.Pawn.Controller), true);
    //return;    
}

exec function EquipWeapon()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string WeaponName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPreOrderVariant[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPW, MyPlayerPawn;
    local /*0x97E50000-0x00000000*/ private class WeaponClass;
    local /*0x97E50000-0x00000000*/ private editfixedsize string WeaponPath;

    false
    MyPlayerPawn = Outer.GetMyPlayerPawn();
    // End:0x1A3
    if(MyPlayerPawn != none)
    {
        // End:0xCB
        foreach MyPlayerPawn.InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            // End:0xCA
            if(LPW == MyPlayerPawn.Weapon)
            {
                LPW.Destroy();
            }            
        }        
        WeaponPath = (((bPreOrderVariant) ? "LostPlanetPreOrderDLC.LPWDLCPO_" : "LostPlanetGameContent.LPWeapon") $ WeaponName) $ "Content";
        WeaponClass = class<Inventory>(FindObject(WeaponPath, Class'Core.Class'));
        // End:0x1A3
        if(WeaponClass != none)
        {
            MyPlayerPawn.CreateInventory(WeaponClass, false);
        }
    }
    //return;    
}

exec function SetGoalScore()
{
    local /*0x97E50000-0x00000000*/ private int GoalScore[8388609];

    Outer.WorldInfo.GRI.GoalScore = GoalScore;
    Outer.WorldInfo.Game.GoalScore = GoalScore;
    //return;    
}

exec function CausePoison()
{
    // End:0x2F
    if(LPPlayerPawn(Outer.Pawn) == none)
    {
        return;
    }
    Outer.Pawn.TakeDamage(5, Outer.Pawn.Controller, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypePoisonNails');
    //return;    
}

exec function ShowAiPawnHitLocationDebugInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL AIPawn;

    // End:0xD2
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', AIPawn)
    {
        AIPawn.bShowHitLocationDebugInfo = !AIPawn.bShowHitLocationDebugInfo;
        // End:0xD1
        if(!AIPawn.bShowHitLocationDebugInfo)
        {
            AIPawn.RecentLocalSpaceHits.Length = 0;
        }        
    }    
    //return;    
}

exec function ShowAiAttachmentDebugInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    // End:0x8D
    foreach Outer.WorldInfo.AllPawns(Class'LPBaseVSPlayerPawn', vsPawn)
    {
        vsPawn.bShowAiAttachmentDebugInfo = !vsPawn.bShowAiAttachmentDebugInfo;        
    }    
    //return;    
}

exec function DisableAllCrabClaws()
{
    local /*0x97E50000-0x00000000*/ private @NULL crabToDeClaw, leftCore, rightCore;
    local /*0x97E50000-0x00000000*/ private int leftClawCoreId, rightClawCoreId;

    // End:0x188
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnBaseSnowCrab', crabToDeClaw)
    {
        leftCore = crabToDeClaw.FindPhysMatPropTag_CoreIdFromCoreID(6);
        // End:0xE9
        if(leftCore != none)
        {
            leftClawCoreId = crabToDeClaw.GetCoreIndexFromTag(leftCore);
            crabToDeClaw.CoreDestroyed(leftCore, leftClawCoreId);
        }
        rightCore = crabToDeClaw.FindPhysMatPropTag_CoreIdFromCoreID(5);
        // End:0x187
        if(rightCore != none)
        {
            rightClawCoreId = crabToDeClaw.GetCoreIndexFromTag(rightCore);
            crabToDeClaw.CoreDestroyed(rightCore, rightClawCoreId);
        }        
    }    
    //return;    
}

exec function DisableAllAI()
{
    local /*0x97E50000-0x00000000*/ private @NULL AIPawn;

    // End:0x8A
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', AIPawn)
    {
        SPAIController(AIPawn.Controller).ForceDisableAI();        
    }    
    //return;    
}

exec function EnableAllAI()
{
    local /*0x97E50000-0x00000000*/ private @NULL AIPawn;

    // End:0x89
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', AIPawn)
    {
        SPAIController(AIPawn.Controller).ForceEnableAI();        
    }    
    //return;    
}

exec function CrabToggleOnlyWithDrawAndCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentCrab;

    // End:0x126
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnBaseSnowCrab', currentCrab)
    {
        currentCrab.TuneDataIceCrab.bOnlyWithdrawAndCharge = !currentCrab.TuneDataIceCrab.bOnlyWithdrawAndCharge;
        currentCrab.TuneDataIceCrab.bOnlyTauntAttack = false;
        currentCrab.TuneDataIceCrab.bOnlyCQBAttack = false;
        // End:0x126
        break;        
    }    
    //return;    
}

exec function CrabToggleOnlyTauntAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentCrab;

    // End:0x126
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnBaseSnowCrab', currentCrab)
    {
        currentCrab.TuneDataIceCrab.bOnlyTauntAttack = !currentCrab.TuneDataIceCrab.bOnlyTauntAttack;
        currentCrab.TuneDataIceCrab.bOnlyWithdrawAndCharge = false;
        currentCrab.TuneDataIceCrab.bOnlyCQBAttack = false;
        // End:0x126
        break;        
    }    
    //return;    
}

exec function CrabToggleOnlyCQBAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentCrab;

    // End:0x126
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnBaseSnowCrab', currentCrab)
    {
        currentCrab.TuneDataIceCrab.bOnlyCQBAttack = !currentCrab.TuneDataIceCrab.bOnlyCQBAttack;
        currentCrab.TuneDataIceCrab.bOnlyWithdrawAndCharge = false;
        currentCrab.TuneDataIceCrab.bOnlyTauntAttack = false;
        // End:0x126
        break;        
    }    
    //return;    
}

exec function PackHunterToggleOnlyDashAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x126
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnPackHunter', currentNpc)
    {
        currentNpc.TuneDataPackHunter.bDoOnlyForcedDashAttack = !currentNpc.TuneDataPackHunter.bDoOnlyForcedDashAttack;
        currentNpc.TuneDataPackHunter.bForce360TailSwipe = false;
        currentNpc.TuneDataPackHunter.bDoOnlyForcedDirectAttack = false;
        // End:0x126
        break;        
    }    
    //return;    
}

exec function PackHunterToggleOnlyDirectAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x126
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnPackHunter', currentNpc)
    {
        currentNpc.TuneDataPackHunter.bDoOnlyForcedDirectAttack = !currentNpc.TuneDataPackHunter.bDoOnlyForcedDirectAttack;
        currentNpc.TuneDataPackHunter.bForce360TailSwipe = false;
        currentNpc.TuneDataPackHunter.bDoOnlyForcedDashAttack = false;
        // End:0x126
        break;        
    }    
    //return;    
}

exec function PackHunterToggleOnly360TailSwipe()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x126
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnPackHunter', currentNpc)
    {
        currentNpc.TuneDataPackHunter.bForce360TailSwipe = !currentNpc.TuneDataPackHunter.bForce360TailSwipe;
        currentNpc.TuneDataPackHunter.bDoOnlyForcedDirectAttack = false;
        currentNpc.TuneDataPackHunter.bDoOnlyForcedDashAttack = false;
        // End:0x126
        break;        
    }    
    //return;    
}

exec function EnableBurrowerAnnounce()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentBurrower;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnBurrower', currentBurrower)
    {
        currentBurrower.TuneDataBurrower.bEnableAnnounce = true;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function DisableBurrowerAnnounce()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentBurrower;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnBurrower', currentBurrower)
    {
        currentBurrower.TuneDataBurrower.bEnableAnnounce = false;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function ToggleBurrowerAnnounce()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentBurrower;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnBurrower', currentBurrower)
    {
        currentBurrower.TuneDataBurrower.bEnableAnnounce = !currentBurrower.TuneDataBurrower.bEnableAnnounce;
        // End:0xBA
        break;        
    }    
    //return;    
}

exec function AllNpcToggleForcedToNotLookForAttacksWhileStalking()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xAD
    foreach Outer.WorldInfo.AllControllers(Class'LPAIController', currentNpc)
    {
        // End:0x8D
        if(currentNpc.AreWeForcedToNotLookForAttacksWhileStalking())
        {
            currentNpc.UnForceToNotLookForAttacksWhileStalking();
            // End:0xAC
            continue;
        }
        currentNpc.ForceToNotLookForAttacksWhileStalking();        
    }    
    //return;    
}

exec function ToggleStepUpSmoothing()
{
    local /*0x97E50000-0x00000000*/ private @NULL P;

    // End:0xB3
    foreach Outer.WorldInfo.AllPawns(Class'LPPawn', P)
    {
        P.StepUpSmoothingInfo.bEnabled = !P.StepUpSmoothingInfo.bEnabled;        
    }    
    //return;    
}

exec function MedFlyerToggleAllowedToAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnMedFlyer', currentNpc)
    {
        currentNpc.TuneDataMedFlyer.bForceFlyerNotToAttack = !currentNpc.TuneDataMedFlyer.bForceFlyerNotToAttack;
        // End:0xBA
        break;        
    }    
    //return;    
}

exec function MedFlyerToggleAllowedLobAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnMedFlyer', currentNpc)
    {
        currentNpc.TuneDataMedFlyer.bNotAllowedToRangeLobAttack = !currentNpc.TuneDataMedFlyer.bNotAllowedToRangeLobAttack;
        // End:0xBA
        break;        
    }    
    //return;    
}

exec function MedFlyerToggleOnlyLobAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.bMedFlyer_ForceOnlyRangedLobAttacks = !Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.bMedFlyer_ForceOnlyRangedLobAttacks;
    // End:0x14F
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnMedFlyer', currentNpc)
    {
        currentNpc.TuneDataMedFlyer.bDoOnlyForcedRangeLobAttack = !currentNpc.TuneDataMedFlyer.bDoOnlyForcedRangeLobAttack;
        // End:0x14F
        break;        
    }    
    //return;    
}

exec function MedFlyerToggleOnlyPhysicalAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.bMedFlyer_ForceOnlyFullPhysicalAttacks = !Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.bMedFlyer_ForceOnlyFullPhysicalAttacks;
    // End:0x14F
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnMedFlyer', currentNpc)
    {
        currentNpc.TuneDataMedFlyer.bDoOnlyForcedFullPhysicalAttack = !currentNpc.TuneDataMedFlyer.bDoOnlyForcedFullPhysicalAttack;
        // End:0x14F
        break;        
    }    
    //return;    
}

exec function MedFlyerDoOnlyPhysicalAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.bMedFlyer_ForceOnlyFullPhysicalAttacks = true;
    // End:0xD0
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnMedFlyer', currentNpc)
    {
        currentNpc.TuneDataMedFlyer.bDoOnlyForcedFullPhysicalAttack = true;
        // End:0xD0
        break;        
    }    
    //return;    
}

exec function MedFlyerDisableDoOnlyPhysicalAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.bMedFlyer_ForceOnlyFullPhysicalAttacks = false;
    // End:0xD0
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnMedFlyer', currentNpc)
    {
        currentNpc.TuneDataMedFlyer.bDoOnlyForcedFullPhysicalAttack = false;
        // End:0xD0
        break;        
    }    
    //return;    
}

exec function @NULL MedFlyerToggleOnlyRamAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc, lpAiResMgr;

    Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.bMedFlyer_ForceOnlyRamAttacks = !Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.bMedFlyer_ForceOnlyRamAttacks;
    // End:0x4DB
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnMedFlyer', currentNpc)
    {
        currentNpc.TuneDataMedFlyer.bDoOnlyForcedRamAttack = !currentNpc.TuneDataMedFlyer.bDoOnlyForcedRamAttack;
        // End:0x4D7
        if(Outer.MyBasePlayerPawn != none)
        {
            lpAiResMgr = LPAIResManPlayer(Outer.MyBasePlayerPawn.AIResourceManager);
            // End:0x4D7
            if(lpAiResMgr != none)
            {
                // End:0x293
                if(Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.bMedFlyer_ForceOnlyRamAttacks)
                {
                    lpAiResMgr.AIResDefenderRogueFromOrbitSlotEngagement.ChangeTimeBetweenStrikeOfThisType(21, 0.1000000, 0.1000000);
                    lpAiResMgr.AIResDefenderRogueFromOrbitSlotEngagement.ChangeTimeBetweenAttacksOfThisType(21, 0.1000000, 0.1000000);                    
                }
                else
                {
                    lpAiResMgr.AIResDefenderRogueFromOrbitSlotEngagement.ChangeTimeBetweenStrikeOfThisType(21, Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.DefenderRogueStrikeTimeInfoByTypeOfAttackList[21].MinTimeBetweenStrikes.GetValue(), Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.DefenderRogueStrikeTimeInfoByTypeOfAttackList[21].MaxTimeBetweenStrikes.GetValue());
                    lpAiResMgr.AIResDefenderRogueFromOrbitSlotEngagement.ChangeTimeBetweenAttacksOfThisType(21, Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.DefenderRogueAttackTimeInfoByTypeOfAttackList[21].MinTimeBetweenStrikes.GetValue(), Outer.MyBasePlayerPawn.TuneDataBasePlayerPawn.DefenderRogueAttackTimeInfoByTypeOfAttackList[21].MaxTimeBetweenStrikes.GetValue());
                }
            }
        }
        // End:0x4DB
        break;        
    }    
    //return;    
}

exec function MedFlyerToggleNotAllowedToRamAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnMedFlyer', currentNpc)
    {
        currentNpc.TuneDataMedFlyer.bNotAllowedToRamAttack = !currentNpc.TuneDataMedFlyer.bNotAllowedToRamAttack;
        // End:0xBA
        break;        
    }    
    //return;    
}

exec function CarrierToggleAllowedToAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.TuneDataCarrier.bForceCarrierNotToAttack = !currentNpc.TuneDataCarrier.bForceCarrierNotToAttack;
        // End:0xBA
        break;        
    }    
    //return;    
}

exec function CarrierToggleOnlyProactivelyLaunchDefendersAndNothingElse()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.TuneDataCarrier.bOnlyProactivelyLaunchDefendersAndNothingElse = !currentNpc.TuneDataCarrier.bOnlyProactivelyLaunchDefendersAndNothingElse;
        // End:0xBA
        break;        
    }    
    //return;    
}

exec function CarrierToggleNotAllowedToProactivelyLaunchDefenders()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.TuneDataCarrier.bNotAllowedToProactivelyLaunchDefenders = !currentNpc.TuneDataCarrier.bNotAllowedToProactivelyLaunchDefenders;
        // End:0xBA
        break;        
    }    
    //return;    
}

exec function CarrierToggleNotAllowedToReactivlyLaunchDefenders()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.TuneDataCarrier.bNotAllowedToReactivlyLaunchDefenders = !currentNpc.TuneDataCarrier.bNotAllowedToReactivlyLaunchDefenders;
        // End:0xBA
        break;        
    }    
    //return;    
}

exec function CarrierToggleNotAllowedToLaunchDefendersAtAll()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.TuneDataCarrier.bNotAllowedToLaunchDefendersAtAll = !currentNpc.TuneDataCarrier.bNotAllowedToLaunchDefendersAtAll;
        // End:0xBA
        break;        
    }    
    //return;    
}

exec function CarrierForceIntentionalAllPossibleDefendersLaunch()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x89
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.ForceIntentionalAllPossibleDefendersLaunch(Outer.MyBasePlayerPawn);        
    }    
    //return;    
}

exec function CarrierForceRandomArbitraryDefendersLaunch()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x89
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.ForceRandomArbitraryDefendersLaunch(Outer.MyBasePlayerPawn);        
    }    
    //return;    
}

exec function CarrierForceKillAllDefenderLaunched()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x89
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.KillAllDefendersLaunched(Outer.MyBasePlayerPawn);        
    }    
    //return;    
}

exec function CarrierToggleOnlyOnlyReactionAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.TuneDataCarrier.bOnlyReactionAttack = !currentNpc.TuneDataCarrier.bOnlyReactionAttack;
        // End:0xBA
        break;        
    }    
    //return;    
}

exec function CarrierToggleOnlyOnlyBerserkAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.TuneDataCarrier.bForceBerserkAttack = !currentNpc.TuneDataCarrier.bForceBerserkAttack;
        // End:0xBA
        break;        
    }    
    //return;    
}

exec function CarriersDestroyAllHiveCells()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x6B
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.DestroyAllHiveCells();        
    }    
    //return;    
}

exec function CarriersMakeAllHiveCellsVulnerable()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x6B
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.MakeAllNonDestroyedHiveCellsVulnerableEx();        
    }    
    //return;    
}

exec function CarriersMakeAllHiveCellsProtected()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x6B
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.MakeAllNonDestroyedHiveCellsProtectedEx();        
    }    
    //return;    
}

exec function CarriersFreeGrabHorns()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x6B
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnCarrier', currentNpc)
    {
        currentNpc.FreeGrabHorns();        
    }    
    //return;    
}

exec function ResetAllHiveSpawners()
{
    local /*0x97E50000-0x00000000*/ private @NULL hiveToReset;

    // End:0x63
    foreach Outer.WorldInfo.AllActors(Class'LPHiveSpawnPoint', hiveToReset)
    {
        hiveToReset.Reset();        
    }    
    //return;    
}

exec function VsLarocheFreeGrabPoints()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x6B
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.FreeGrabPoints();        
    }    
    //return;    
}

exec function VsLarocheForceGrabsOnlyNoFreeAttacks()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;
    local /*0x97E50000-0x00000000*/ private bool btuneFlagSet;

    btuneFlagSet = false;
    // End:0xDE
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        // End:0xDD
        if(!btuneFlagSet)
        {
            currentNpc.TuneDataVsLaroche.bForceGrabsOnlyNoFreeAttacks = !currentNpc.TuneDataVsLaroche.bForceGrabsOnlyNoFreeAttacks;
            btuneFlagSet = true;
        }        
    }    
    //return;    
}

exec function VsLarocheForceNotAllowedToGrabOnlyFreeAttacks()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;
    local /*0x97E50000-0x00000000*/ private bool btuneFlagSet;

    btuneFlagSet = false;
    // End:0xE1
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        // End:0xE0
        if(!btuneFlagSet)
        {
            currentNpc.TuneDataVsLaroche.bForceNotAllowedToGrabOnlyFreeAttacks = !currentNpc.TuneDataVsLaroche.bForceNotAllowedToGrabOnlyFreeAttacks;
            btuneFlagSet = true;
            // End:0xE1
            break;
        }        
    }    
    //return;    
}

exec function VsLarocheForceStruggleMode_None()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;
    local /*0x97E50000-0x00000000*/ private bool btuneFlagSet;

    btuneFlagSet = false;
    // End:0xA9
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        // End:0xA8
        if(!btuneFlagSet)
        {
            currentNpc.TuneDataVsLaroche.ForceThisLaRocheBossFightStruggleMode = 0;
            btuneFlagSet = true;
        }        
    }    
    //return;    
}

exec function VsLarocheForceStruggleMode_Emp()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;
    local /*0x97E50000-0x00000000*/ private bool btuneFlagSet;

    btuneFlagSet = false;
    // End:0xA9
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        // End:0xA8
        if(!btuneFlagSet)
        {
            currentNpc.TuneDataVsLaroche.ForceThisLaRocheBossFightStruggleMode = 1;
            btuneFlagSet = true;
        }        
    }    
    //return;    
}

exec function VsLarocheForceStruggleMode_Taser()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;
    local /*0x97E50000-0x00000000*/ private bool btuneFlagSet;

    btuneFlagSet = false;
    // End:0xA9
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        // End:0xA8
        if(!btuneFlagSet)
        {
            currentNpc.TuneDataVsLaroche.ForceThisLaRocheBossFightStruggleMode = 2;
            btuneFlagSet = true;
        }        
    }    
    //return;    
}

exec function VsLarocheForceStruggleMode_KnockOut()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;
    local /*0x97E50000-0x00000000*/ private bool btuneFlagSet;

    btuneFlagSet = false;
    // End:0xA9
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        // End:0xA8
        if(!btuneFlagSet)
        {
            currentNpc.TuneDataVsLaroche.ForceThisLaRocheBossFightStruggleMode = 3;
            btuneFlagSet = true;
        }        
    }    
    //return;    
}

exec function VsLarocheForceStruggleMode_DrillKill()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;
    local /*0x97E50000-0x00000000*/ private bool btuneFlagSet;

    btuneFlagSet = false;
    // End:0xA9
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        // End:0xA8
        if(!btuneFlagSet)
        {
            currentNpc.TuneDataVsLaroche.ForceThisLaRocheBossFightStruggleMode = 4;
            btuneFlagSet = true;
        }        
    }    
    //return;    
}

exec function VsLarocheForceStruggleMode_SawTheCock()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;
    local /*0x97E50000-0x00000000*/ private bool btuneFlagSet;

    btuneFlagSet = false;
    // End:0xA9
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        // End:0xA8
        if(!btuneFlagSet)
        {
            currentNpc.TuneDataVsLaroche.ForceThisLaRocheBossFightStruggleMode = 5;
            btuneFlagSet = true;
        }        
    }    
    //return;    
}

exec function VsLarocheEnableGrabForCommKill()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x6B
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.VsLarocheEnableGrabForCommKill();        
    }    
    //return;    
}

exec function VsLarocheEnableGrabForSawGenKill()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x6B
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.VsLarocheEnableGrabForSawGenKill();        
    }    
    //return;    
}

exec function VsLarocheEnableGrabForMobilityKill()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x6B
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.VsLarocheEnableGrabForMobilityKill();        
    }    
    //return;    
}

exec function VsLarocheEnableGrabForRigKill()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x6B
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.VsLarocheEnableGrabForRigKill();        
    }    
    //return;    
}

exec function VsLarocheDestroyLeftSide()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x6B
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.VsLarocheDestroyLeftSide();        
    }    
    //return;    
}

exec function VsLarocheDestroyRightSide()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x6B
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.VsLarocheDestroyRightSide();        
    }    
    //return;    
}

exec function VsLarocheDestroyHip()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x6B
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.VsLarocheDestroyHip();        
    }    
    //return;    
}

exec function VsLaRocheUnForceStrikeType()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 0;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_LeftJab()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 1;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_RightJab()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 2;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_LeftHook()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 3;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_RightHook()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 4;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_Combo1()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 7;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_Combo2()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 8;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_Combo3()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 9;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_StrightSawToCockpit()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 23;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_OneMoveSawArmSwing()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 24;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_ThreeMoveSawArmSwing()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 25;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_ShoulderCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 26;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_DoubleArmSmash()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 27;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceStrikeType_EmpPulseProjLaunch()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x85
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.TuneDataVsLaroche.ForceThisLaRocheStrikeType = 28;
        // End:0x85
        break;        
    }    
    //return;    
}

exec function VsLaRocheForceMeleeStunned()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xE6
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnVsLaroche', currentNpc)
    {
        currentNpc.MyVsLarocheController.CmdHitReactionToStun(currentNpc.TuneDataAIPawn.VSMeleeStunDuration.GetValue(), Class'LPSM_VsLarocheDefaultStandingStun', Class'LPSM_VsLarocheDefaultStandingStunStart', Class'LPSM_VsLarocheDefaultStandingStunEnd');        
    }    
    //return;    
}

exec function PlayersOnly()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc, currentPPawn;

    // End:0x69
    foreach Outer.WorldInfo.AllControllers(Class'LPAIController', currentNpc)
    {
        currentNpc.NotifyPlayersOnly();        
    }    
    // End:0xD5
    foreach Outer.WorldInfo.AllPawns(Class'LPBasePlayerPawn', currentPPawn)
    {
        currentPPawn.NotifyPlayersOnly();        
    }    
    super(CheatManager).PlayersOnly();
    //return;    
}

exec function SepiaToggleOnlySuicideStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x192
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnSepia', currentNpc)
    {
        currentNpc.TuneDataSepia.bToggleOnlySuicideStrike = !currentNpc.TuneDataSepia.bToggleOnlySuicideStrike;
        currentNpc.TuneDataSepia.bToggleOnlyCloseRangeBitStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlyFastJumpBiteStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlyJumpBiteWithTellStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlyLobStrike = false;
        // End:0x192
        break;        
    }    
    //return;    
}

exec function SepiaToggleOnlyCloseRangeBitStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x192
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnSepia', currentNpc)
    {
        currentNpc.TuneDataSepia.bToggleOnlyCloseRangeBitStrike = !currentNpc.TuneDataSepia.bToggleOnlyCloseRangeBitStrike;
        currentNpc.TuneDataSepia.bToggleOnlyFastJumpBiteStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlyJumpBiteWithTellStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlySuicideStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlyLobStrike = false;
        // End:0x192
        break;        
    }    
    //return;    
}

exec function SepiaToggleOnlyFastJumpBiteStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x192
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnSepia', currentNpc)
    {
        currentNpc.TuneDataSepia.bToggleOnlyFastJumpBiteStrike = !currentNpc.TuneDataSepia.bToggleOnlyFastJumpBiteStrike;
        currentNpc.TuneDataSepia.bToggleOnlyCloseRangeBitStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlyJumpBiteWithTellStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlySuicideStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlyLobStrike = false;
        // End:0x192
        break;        
    }    
    //return;    
}

exec function SepiaToggleOnlyJumpBiteWithTellStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x192
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnSepia', currentNpc)
    {
        currentNpc.TuneDataSepia.bToggleOnlyJumpBiteWithTellStrike = !currentNpc.TuneDataSepia.bToggleOnlyJumpBiteWithTellStrike;
        currentNpc.TuneDataSepia.bToggleOnlyCloseRangeBitStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlyFastJumpBiteStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlySuicideStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlyLobStrike = false;
        // End:0x192
        break;        
    }    
    //return;    
}

exec function SepiaToggleOnlyToggleOnlyLobStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0x192
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnSepia', currentNpc)
    {
        currentNpc.TuneDataSepia.bToggleOnlyLobStrike = !currentNpc.TuneDataSepia.bToggleOnlyLobStrike;
        currentNpc.TuneDataSepia.bToggleOnlyCloseRangeBitStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlyFastJumpBiteStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlySuicideStrike = false;
        currentNpc.TuneDataSepia.bToggleOnlyJumpBiteWithTellStrike = false;
        // End:0x192
        break;        
    }    
    //return;    
}

exec function HumanToggleCover()
{
    ToggleCover(Class'LPAIPawnHumanSoldier');
    //return;    
}

exec function HumanDisableCover()
{
    DisableCover(Class'LPAIPawnHumanSoldier');
    //return;    
}

exec function HumanEnableCover()
{
    EnableCover(Class'LPAIPawnHumanSoldier');
    //return;    
}

exec function StalkerToggleCover()
{
    ToggleCover(Class'LPAIPawnStalker');
    //return;    
}

exec function StalkerDisableCover()
{
    DisableCover(Class'LPAIPawnStalker');
    //return;    
}

exec function StalkerEnableCover()
{
    EnableCover(Class'LPAIPawnStalker');
    //return;    
}

function ToggleCover()
{
    local /*0x97E50000-0x00000000*/ private class AiPawnClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentPawn;

    // End:0xE7
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', CurrentPawn)
    {
        // End:0xE6
        if(ClassIsChildOf(CurrentPawn.Class, AiPawnClass))
        {
            CurrentPawn.TuneDataPawn.bCanUseCover = !CurrentPawn.TuneDataPawn.bCanUseCover;
            // End:0xE7
            break;
        }        
    }    
    //return;    
}

function DisableCover()
{
    local /*0x97E50000-0x00000000*/ private class AiPawnClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentPawn;

    // End:0xB2
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', CurrentPawn)
    {
        // End:0xB1
        if(ClassIsChildOf(CurrentPawn.Class, AiPawnClass))
        {
            CurrentPawn.TuneDataPawn.bCanUseCover = false;
            // End:0xB2
            break;
        }        
    }    
    //return;    
}

function EnableCover()
{
    local /*0x97E50000-0x00000000*/ private class AiPawnClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentPawn;

    // End:0xB2
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', CurrentPawn)
    {
        // End:0xB1
        if(ClassIsChildOf(CurrentPawn.Class, AiPawnClass))
        {
            CurrentPawn.TuneDataPawn.bCanUseCover = true;
            // End:0xB2
            break;
        }        
    }    
    //return;    
}

exec function PackHunterToggleOnlyStruggle()
{
    ToggleDoOnlyStruggle(Class'LPAIPawnPackHunter');
    //return;    
}

exec function PackHunterOnlyStruggle()
{
    EnableDoOnlyStruggle(Class'LPAIPawnPackHunter');
    //return;    
}

exec function PackHunterDisableOnlyStruggle()
{
    DisableDoOnlyStruggle(Class'LPAIPawnPackHunter');
    //return;    
}

exec function PackHunterDisableStruggle()
{
    DisableStruggleMode(Class'LPAIPawnPackHunter');
    //return;    
}

exec function PackHunterEnableStruggle()
{
    EnableStruggleMode(Class'LPAIPawnPackHunter');
    //return;    
}

exec function LeechToggleOnlyStruggle()
{
    ToggleDoOnlyStruggle(Class'LPAIPawnLeech');
    //return;    
}

exec function LeechOnlyStruggle()
{
    EnableDoOnlyStruggle(Class'LPAIPawnLeech');
    //return;    
}

exec function LeechDisableOnlyStruggle()
{
    DisableDoOnlyStruggle(Class'LPAIPawnLeech');
    //return;    
}

exec function LeechDisableStruggle()
{
    DisableStruggleMode(Class'LPAIPawnLeech');
    //return;    
}

exec function LeechEnableStruggle()
{
    EnableStruggleMode(Class'LPAIPawnLeech');
    //return;    
}

exec function FireWaspDoOnlyStruggle()
{
    EnableDoOnlyStruggle(Class'LPAIPawnFireWasp');
    MedFlyerDoOnlyPhysicalAttack();
    //return;    
}

exec function FireWaspDisableDoOnlyStruggle()
{
    DisableDoOnlyStruggle(Class'LPAIPawnFireWasp');
    MedFlyerDisableDoOnlyPhysicalAttack();
    //return;    
}

exec function FireWaspDisableStruggleMode()
{
    DisableStruggleMode(Class'LPAIPawnFireWasp');
    //return;    
}

exec function FireWaspEnableStruggleMode()
{
    EnableStruggleMode(Class'LPAIPawnFireWasp');
    //return;    
}

exec function BurrowerDoOnlyStruggle()
{
    EnableDoOnlyStruggle(Class'LPAIPawnBurrower');
    //return;    
}

exec function BurrowerDisableDoOnlyStruggle()
{
    DisableDoOnlyStruggle(Class'LPAIPawnBurrower');
    //return;    
}

exec function BurrowerDisableStruggleMode()
{
    DisableStruggleMode(Class'LPAIPawnBurrower');
    //return;    
}

exec function BurrowerEnableStruggleMode()
{
    EnableStruggleMode(Class'LPAIPawnBurrower');
    //return;    
}

exec function StalkerToggleOnlyStruggle()
{
    ToggleDoOnlyStruggle(Class'LPAIPawnStalker');
    //return;    
}

exec function StalkerOnlyStruggle()
{
    EnableDoOnlyStruggle(Class'LPAIPawnStalker');
    //return;    
}

exec function StalkerDisableOnlyStruggle()
{
    DisableDoOnlyStruggle(Class'LPAIPawnStalker');
    //return;    
}

exec function StalkerDisableStruggle()
{
    DisableStruggleMode(Class'LPAIPawnStalker');
    //return;    
}

exec function StalkerEnableStruggle()
{
    EnableStruggleMode(Class'LPAIPawnStalker');
    //return;    
}

function ToggleDoOnlyStruggle()
{
    local /*0x97E50000-0x00000000*/ private class AiPawnClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentPawn;

    // End:0xE7
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', CurrentPawn)
    {
        // End:0xE6
        if(ClassIsChildOf(CurrentPawn.Class, AiPawnClass))
        {
            CurrentPawn.TuneDataAIPawn.bDoOnlyForcedStruggle = !CurrentPawn.TuneDataAIPawn.bDoOnlyForcedStruggle;
            // End:0xE7
            break;
        }        
    }    
    //return;    
}

function EnableDoOnlyStruggle()
{
    local /*0x97E50000-0x00000000*/ private class AiPawnClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentPawn;

    // End:0xB2
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', CurrentPawn)
    {
        // End:0xB1
        if(ClassIsChildOf(CurrentPawn.Class, AiPawnClass))
        {
            CurrentPawn.TuneDataAIPawn.bDoOnlyForcedStruggle = true;
            // End:0xB2
            break;
        }        
    }    
    //return;    
}

function DisableDoOnlyStruggle()
{
    local /*0x97E50000-0x00000000*/ private class AiPawnClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentPawn;

    // End:0xB2
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', CurrentPawn)
    {
        // End:0xB1
        if(ClassIsChildOf(CurrentPawn.Class, AiPawnClass))
        {
            CurrentPawn.TuneDataAIPawn.bDoOnlyForcedStruggle = false;
            // End:0xB2
            break;
        }        
    }    
    //return;    
}

function DisableStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private class AiPawnClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentPawn;

    // End:0xB2
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', CurrentPawn)
    {
        // End:0xB1
        if(ClassIsChildOf(CurrentPawn.Class, AiPawnClass))
        {
            CurrentPawn.TuneDataAIPawn.bDisableStruggleMode = true;
            // End:0xB2
            break;
        }        
    }    
    //return;    
}

exec function CheckTeams()
{
    local /*0x97E50000-0x00000000*/ private @NULL P;

    P = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0x77 [Loop If]
    if(P != none)
    {
        P = P.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

function EnableStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private class AiPawnClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentPawn;

    // End:0xB2
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', CurrentPawn)
    {
        // End:0xB1
        if(ClassIsChildOf(CurrentPawn.Class, AiPawnClass))
        {
            CurrentPawn.TuneDataAIPawn.bDisableStruggleMode = false;
            // End:0xB2
            break;
        }        
    }    
    //return;    
}

exec function ShowAiAttackArcs()
{
    local /*0x97E50000-0x00000000*/ private @NULL aiCtrlToChange;

    Outer.bShowAiAttackArcs = ((Outer.bShowAiAttackArcs) ? false : true);
    // End:0xF3
    foreach Outer.WorldInfo.AllControllers(Class'LPAIController', aiCtrlToChange)
    {
        // End:0xD3
        if(aiCtrlToChange.AreWeShowingAttackArtifacts())
        {
            aiCtrlToChange.ShowAttackArtifacts();
            // End:0xF2
            continue;
        }
        aiCtrlToChange.DoNotShowAttackArtifacts();        
    }    
    //return;    
}

exec function ForceAllAiTightAreaStalk()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xED
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', currentNpc)
    {
        currentNpc.TuneDataAIPawn.bForceTightAreaStalk = !currentNpc.TuneDataAIPawn.bForceTightAreaStalk;
        currentNpc.TuneDataAIPawn.bForceOpenAreaStalk = false;        
    }    
    //return;    
}

exec function ForceAllAiOpenAreaStalk()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xED
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', currentNpc)
    {
        currentNpc.TuneDataAIPawn.bForceOpenAreaStalk = !currentNpc.TuneDataAIPawn.bForceOpenAreaStalk;
        currentNpc.TuneDataAIPawn.bForceTightAreaStalk = false;        
    }    
    //return;    
}

exec function ShowVsDynamaicAvoidZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL aiCtrlToChange;

    // End:0x69
    foreach Outer.WorldInfo.AllControllers(Class'LPAIControllerBaseSnowCrab', aiCtrlToChange)
    {
        aiCtrlToChange.ShowVsDynamaicAvoidZone();        
    }    
    //return;    
}

exec function ToggleShowChargeAndWithDrawPointArtifacts()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', currentNpc)
    {
        currentNpc.TuneDataAIPawn.bShowChargeAndWithDrawPointArtifacts = !currentNpc.TuneDataAIPawn.bShowChargeAndWithDrawPointArtifacts;
        // End:0xBA
        break;        
    }    
    //return;    
}

exec function ShowGrenadeAssistZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', currentNpc)
    {
        currentNpc.TuneDataAIPawn.bShowGrenadeAssistArtifacts = !currentNpc.TuneDataAIPawn.bShowGrenadeAssistArtifacts;
        // End:0xBA
        break;        
    }    
    Outer.bShowGrenadeAssistZone = ((Outer.bShowGrenadeAssistZone) ? false : true);
    //return;    
}

exec function ShowWinchAssistZone()
{
    Outer.bShowWinchAssistZone = ((Outer.bShowWinchAssistZone) ? false : true);
    //return;    
}

exec function ShowShowLobFireAttackDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentAiPawn;

    Outer.bShowLobFireAttackDebug = ((Outer.bShowLobFireAttackDebug) ? false : true);
    // End:0x100
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', currentAiPawn)
    {
        currentAiPawn.TuneDataAIPawn.bShowLobFireAttackDebug = !currentAiPawn.TuneDataAIPawn.bShowLobFireAttackDebug;
        // End:0x100
        break;        
    }    
    //return;    
}

exec function ShowFlyerLaunchDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL currentAiPawn;

    // End:0xBA
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawn', currentAiPawn)
    {
        currentAiPawn.TuneDataAIPawn.bShowFlyerLaunchDebug = !currentAiPawn.TuneDataAIPawn.bShowFlyerLaunchDebug;
        // End:0xBA
        break;        
    }    
    //return;    
}

function TestOptional()
{
    local /*0x97E50000-0x00000000*/ private int I[9437185];

    10
    //return;    
}

exec function TestO()
{
    TestOptional();
    TestOptional(30);
    //return;    
}

exec function LogSquadEnemyList()
{
    local /*0x97E50000-0x00000000*/ private @NULL AI, E;
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x117
    if(Outer.Squad != none)
    {
        Idx = 0;
        // End:0x85
        foreach Outer.Squad.AllEnemies(Class'SPEngine.SPPawn', E)
        {
            Idx++;            
        }        
        // End:0x116
        foreach Outer.Squad.AllMembers(Class'SPAI.SPAIController', AI)
        {
            Idx = 0;
            J0xDA:

            // End:0x115 [Loop If]
            if(Idx < AI.LocalEnemyList.Length)
            {
                Idx++;
                // [Loop Continue]
                goto J0xDA;
            }            
        }        
    }
    //return;    
}

exec function SetVSReticle()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReticleName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL VSPlayer;

    VSPlayer = LPVSPlayerPawn(Outer.Pawn);
    // End:0x68
    if(VSPlayer != none)
    {
        VSPlayer.SetVSReticle(ReticleName);
    }
    //return;    
}

exec function ToggleGrenadePreview()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    LPP = LPPlayerPawn(Outer.Pawn);
    LPP.bDisableProjectilePreview = !LPP.bDisableProjectilePreview;
    //return;    
}

exec function AddCurrency()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];

    Outer.GiveCurrency(0, float(Amount));
    //return;    
}

exec function AddTime()
{
    local /*0x97E50000-0x00000000*/ private int NumSeconds[8388609];

    Class'LPSeqAct_AddTime'.static.AddTime(NumSeconds);
    //return;    
}

exec function SetRoundsToWin()
{
    local /*0x97E50000-0x00000000*/ private int NumRounds[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GameMP;

    GameMP = LPGameMP_Base(Outer.WorldInfo.Game);
    // End:0x7D
    if(GameMP != none)
    {
        GameMP.SetRoundsToWin(NumRounds);
    }
    //return;    
}

exec function SpitterAttackSpitOnly()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugAttackSpitOnly();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterAttackChargeOnly()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugAttackChargeOnly();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterAttackTailStingOnly()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugAttackTailStingOnly();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterAttackTailStingQuickOnly()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugAttackTailStingQuickOnly();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterAttackTalonOnly()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugAttackTalonOnly();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterAttackTalonQuickOnly()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugAttackTalonQuickOnly();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterAttackNormal()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugAttackNormal();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterAttackReactiveOnly()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugAttackReactiveOnly();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterBreakTail()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugStartTailDestruction();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterDropHealthByPct()
{
    local /*0x97E50000-0x00000000*/ private float Pct[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xCA [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x9F
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugDropHealthByPct(Pct);
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterDie()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugSpitterDie();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterBurnSpitHole()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugStartSpitHoleBurn();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterHobble()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugHobble();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function SpitterSpitTest()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, SpitterPawn;

    CurPawn = Outer.WorldInfo.PawnList;
    J0x3D:

    // End:0xC1 [Loop If]
    if(CurPawn != none)
    {
        SpitterPawn = LPAIPawnSpitter(CurPawn);
        // End:0x96
        if(SpitterPawn != none)
        {
            SpitterPawn.DebugSpitPof();
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

exec function ServerTravel()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string URL[8388609];

    Outer.WorldInfo.ServerTravel(URL);
    //return;    
}

exec function EnableTGSDemo()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[9437185];

    true
    Class'LPGameViewportClient'.static.EnableTGSDemo(bEnable);
    //return;    
}

exec function EnableFriendlyFire()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL SPGI;

    true
    SPGI = SPGameInfo(Outer.WorldInfo.Game);
    // End:0x84
    if(SPGI != none)
    {
        SPGI.bAllowFriendlyFire = bEnable;
    }
    //return;    
}

exec function DebugSendQuestEvent()
{
    local /*0x97E50000-0x00000000*/ private name InName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ES;

    ES = new Class'LPQuestEventSelector';
    ES.SetEventName(InName);
    ES.SendEvent();
    //return;    
}

exec function ForceUnlockNextObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL BM, Objective, Quest, GameDataStore;

    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x16C
    if(GameDataStore.QuestManager != none)
    {
        BM = Class'LPBreadcrumbManager'.static.GetBreadcrumbManager();
        // End:0x16C
        if(BM != none)
        {
            Objective = SPQO_Objective(BM.GetObjectiveToTrack());
            // End:0x16C
            if(Objective != none)
            {
                Quest = SPQO_Quest(Objective.Outer);
                // End:0x16C
                if(Quest != none)
                {
                    GameDataStore.QuestManager.ForceUnlockNextObjective(Quest, false);
                }
            }
        }
    }
    //return;    
}

exec function ForceCompleteCurrentObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL BM, Objective, GameDataStore;

    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x12C
    if(GameDataStore.QuestManager != none)
    {
        BM = Class'LPBreadcrumbManager'.static.GetBreadcrumbManager();
        // End:0x12C
        if(BM != none)
        {
            Objective = SPQO_Objective(BM.GetObjectiveToTrack());
            // End:0x12C
            if(Objective != none)
            {
                GameDataStore.QuestManager.ForceCompleteObjective(Objective, false);
            }
        }
    }
    //return;    
}

exec function ForceGarbageCollection()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    // End:0x69
    foreach Outer.WorldInfo.AllControllers(Class'Engine.PlayerController', PC)
    {
        PC.ClientForceGarbageCollection();        
    }    
    //return;    
}

exec function ReviveMe()
{
    Outer.MyPlayerPawn.HealDamage(100, Outer, none);
    Outer.MyPlayerPawn.RecoverFromKnockDown(Outer.Pawn);
    Outer.MPStartClientState('PlayerWalking');
    //return;    
}

defaultproperties
{
    CheatMapMenuTitle=" "
}