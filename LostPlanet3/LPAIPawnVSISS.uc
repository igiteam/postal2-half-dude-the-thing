class LPAIPawnVSISS extends LPAIPawnMech
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

enum EVSISSWeapon
{
    EIW_LeftHand,                   // 0
    EIW_RightHand,                  // 1
    EIW_Missiles,                   // 2
    EIW_NUM,                        // 3
    EIW_MAX                         // 4
};

var(0.25_Pct) /*0xCECA0000-0x00000000*/ private @NULL TuneDataVsISS[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DefaultVSWeapons;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ActiveWeaponID;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForcedWeapon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForcedCloseRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLeftShoulderActive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRightShoulderActive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayingCloseRangeCharge[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOnlyOneSetOf9PointAims;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAimLocationLocked;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDamageOnlyWhenStunned;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStunned[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumTimesFiredWeapon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VSWeapons;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ShieldEffectLoop[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ATL_RecoilAnimNames;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ATL_RecoilAnimNodes[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ATL_ChargingAnimNames;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ATL_ChargingAnimNodes[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_MissileLauncherUpAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_MissileLauncherUpAnimNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_MissileLauncherDownAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_MissileLauncherDownAnimNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_MissileLauncherHoldAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_MissileLauncherHoldAnimNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MissileLauncherAnimInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_LeftShoulderUpAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_LeftShoulderUpAnimNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_LeftShoulderDownAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_LeftShoulderDownAnimNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_LeftShoulderHoldAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_LeftShoulderHoldAnimNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LeftShoulderAnimInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_RightShoulderUpAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_RightShoulderUpAnimNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_RightShoulderDownAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_RightShoulderDownAnimNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_RightShoulderHoldAnimName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_RightShoulderHoldAnimNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightShoulderAnimInfo;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL CloseRangeChargeEffectCmp[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ChargingSound[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampCloseRangeExplosion[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MaxDistancePlaybackOverride;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GibsGrenadeLauncher;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ExplosionGrenadeLauncher;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GibsMissileLauncher;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ExplosionMissileLauncher;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GibsRailgun;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ExplosionRailgun;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LockedAimLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StunnedHealth[536870913];

// Export ULPAIPawnVSISS::execRemoteClientGetInventoryByClass(FFrame&, void* const)
native simulated function RemoteClientGetInventoryByClass()
{
    local /*0x97E50000-0x00000000*/ private class InvClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPAIPawnVSISS::execPawnCommitToFiring(FFrame&, void* const)
native simulated function PawnCommitToFiring()
{
    local /*0x97E50000-0x00000000*/ private byte InFiringMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnVSISS::execWantsToAim(FFrame&, void* const)
native simulated function WantsToAim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnVSISS::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array tempGibs;
    local /*0x97E50000-0x00000000*/ private @NULL tempDeathExplosion;

    super.InitTuneData(TuneData);
    TuneDataVsISS = LPTuneDataVsISS(TuneData);
    // End:0x4FA
    if(TuneDataVsISS != none)
    {
        I = 0;
        J0x49:

        // End:0xCD [Loop If]
        if(I < TuneDataVsISS.BoneNamesDamagedGrenadeLauncher.Length)
        {
            Mesh.HideBoneByName(TuneDataVsISS.BoneNamesDamagedGrenadeLauncher[I], 2);
            ++I;
            // [Loop Continue]
            goto J0x49;
        }
        I = 0;
        J0xD8:

        // End:0x15C [Loop If]
        if(I < TuneDataVsISS.BoneNamesDamagedMissileLauncher.Length)
        {
            Mesh.HideBoneByName(TuneDataVsISS.BoneNamesDamagedMissileLauncher[I], 2);
            ++I;
            // [Loop Continue]
            goto J0xD8;
        }
        I = 0;
        J0x167:

        // End:0x1EB [Loop If]
        if(I < TuneDataVsISS.BoneNamesDamagedRailgun.Length)
        {
            Mesh.HideBoneByName(TuneDataVsISS.BoneNamesDamagedRailgun[I], 2);
            ++I;
            // [Loop Continue]
            goto J0x167;
        }
        tempGibs = TuneDataVsISS.GibClassGrenadeLauncher.static.DetermineGibsToSpawn(self, TuneDataVsISS.GrenadeLauncherGibTemplateOverrideData);
        I = 0;
        J0x253:

        // End:0x299 [Loop If]
        if(I < tempGibs.Length)
        {
            GibsGrenadeLauncher.AddItem(tempGibs[I]);            
            ++I;
            // [Loop Continue]
            goto J0x253;
        }
        // End:0x2F0
        if(TuneDataVsISS.GibClassGrenadeLauncher.static.DetermineDeathExplosionToSpawn(tempDeathExplosion, self))
        {
            ExplosionGrenadeLauncher.AddItem(tempDeathExplosion);            
        }
        tempGibs = TuneDataVsISS.GibClassMissileLauncher.static.DetermineGibsToSpawn(self, TuneDataVsISS.MissileLauncherGibTemplateOverrideData);
        I = 0;
        J0x358:

        // End:0x39E [Loop If]
        if(I < tempGibs.Length)
        {
            GibsMissileLauncher.AddItem(tempGibs[I]);            
            ++I;
            // [Loop Continue]
            goto J0x358;
        }
        // End:0x3F5
        if(TuneDataVsISS.GibClassMissileLauncher.static.DetermineDeathExplosionToSpawn(tempDeathExplosion, self))
        {
            ExplosionMissileLauncher.AddItem(tempDeathExplosion);            
        }
        tempGibs = TuneDataVsISS.GibClassRailgun.static.DetermineGibsToSpawn(self, TuneDataVsISS.RailgunGibTemplateOverrideData);
        I = 0;
        J0x45D:

        // End:0x4A3 [Loop If]
        if(I < tempGibs.Length)
        {
            GibsRailgun.AddItem(tempGibs[I]);            
            ++I;
            // [Loop Continue]
            goto J0x45D;
        }
        // End:0x4FA
        if(TuneDataVsISS.GibClassRailgun.static.DetermineDeathExplosionToSpawn(tempDeathExplosion, self))
        {
            ExplosionRailgun.AddItem(tempDeathExplosion);            
        }
    }
    //return;    
}

simulated function InitAnimTemplates()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SMNodes, SMNames;
    local /*0x97E50000-0x00000000*/ private int I;

    super.InitAnimTemplates();
    // End:0x47D
    if(MechLogicAnimTree != none)
    {
        MechLogicAnimTree.FindAnimNodes(ATL_RecoilAnimNames, SMNodes, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
        I = 0;
        J0x5E:

        // End:0xAD [Loop If]
        if(I < SMNodes.Length)
        {
            ATL_RecoilAnimNodes.AddItem(SPAnimNodeTemplateLogicNamedRoot(SMNodes[I]));            
            ++I;
            // [Loop Continue]
            goto J0x5E;
        }
        SMNodes.Remove(0, SMNodes.Length);        
        MechLogicAnimTree.FindAnimNodes(ATL_ChargingAnimNames, SMNodes, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
        I = 0;
        J0x108:

        // End:0x157 [Loop If]
        if(I < SMNodes.Length)
        {
            ATL_ChargingAnimNodes.AddItem(SPAnimNodeTemplateLogicNamedRoot(SMNodes[I]));            
            ++I;
            // [Loop Continue]
            goto J0x108;
        }
        SMNodes.Remove(0, SMNodes.Length);        
        SMNames.AddItem(ATL_MissileLauncherUpAnimName);        
        SMNames.AddItem(ATL_MissileLauncherDownAnimName);        
        SMNames.AddItem(ATL_MissileLauncherHoldAnimName);        
        MechLogicAnimTree.FindAnimNodes(SMNames, SMNodes, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
        // End:0x255
        if(SMNodes.Length == 3)
        {
            ATL_MissileLauncherUpAnimNode = SPAnimNodeTemplateLogicNamedRoot(SMNodes[0]);
            ATL_MissileLauncherDownAnimNode = SPAnimNodeTemplateLogicNamedRoot(SMNodes[1]);
            ATL_MissileLauncherHoldAnimNode = SPAnimNodeTemplateLogicNamedRoot(SMNodes[2]);
        }
        SMNodes.Remove(0, SMNodes.Length);        
        SMNames.Remove(0, SMNames.Length);        
        SMNames.AddItem(ATL_LeftShoulderUpAnimName);        
        SMNames.AddItem(ATL_LeftShoulderDownAnimName);        
        SMNames.AddItem(ATL_LeftShoulderHoldAnimName);        
        MechLogicAnimTree.FindAnimNodes(SMNames, SMNodes, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
        // End:0x369
        if(SMNodes.Length == 3)
        {
            ATL_LeftShoulderUpAnimNode = SPAnimNodeTemplateLogicNamedRoot(SMNodes[0]);
            ATL_LeftShoulderDownAnimNode = SPAnimNodeTemplateLogicNamedRoot(SMNodes[1]);
            ATL_LeftShoulderHoldAnimNode = SPAnimNodeTemplateLogicNamedRoot(SMNodes[2]);
        }
        SMNodes.Remove(0, SMNodes.Length);        
        SMNames.Remove(0, SMNames.Length);        
        SMNames.AddItem(ATL_RightShoulderUpAnimName);        
        SMNames.AddItem(ATL_RightShoulderDownAnimName);        
        SMNames.AddItem(ATL_RightShoulderHoldAnimName);        
        MechLogicAnimTree.FindAnimNodes(SMNames, SMNodes, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
        // End:0x47D
        if(SMNodes.Length == 3)
        {
            ATL_RightShoulderUpAnimNode = SPAnimNodeTemplateLogicNamedRoot(SMNodes[0]);
            ATL_RightShoulderDownAnimNode = SPAnimNodeTemplateLogicNamedRoot(SMNodes[1]);
            ATL_RightShoulderHoldAnimNode = SPAnimNodeTemplateLogicNamedRoot(SMNodes[2]);
        }
    }
    //return;    
}

simulated function @NULL PerformPostInitAnimTreeActions()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super.PerformPostInitAnimTreeActions(SkelComp);
    MissileLauncherAnimInfo.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(MissileLauncherAnimInfo.AnimNodeSlotName));
    LeftShoulderAnimInfo.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(LeftShoulderAnimInfo.AnimNodeSlotName));
    RightShoulderAnimInfo.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(RightShoulderAnimInfo.AnimNodeSlotName));
    //return;    
}

simulated event PostBeginPlay()
{
    GiveDefaultVSWeapons();
    ActiveWeaponID = 3;
    SetActiveVSWeapon(0);
    PlayMissileLauncherDownAnimation();
    EnableCoreById(0, false);
    EnableCoreById(2, false);
    EnableCoreById(1, false);
    EnableCoreById(3, false);
    EnableCoreById(4, false);
    SetStunnedHealth();
    super.PostBeginPlay();
    //return;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private int I;

    super.Destroyed();
    I = 0;
    J0x15:

    // End:0x76 [Loop If]
    if(I < VSWeapons.Length)
    {
        // End:0x68
        if(VSWeapons[I] != none)
        {
            VSWeapons[I].Destroy();
        }
        I++;
        // [Loop Continue]
        goto J0x15;
    }
    VSWeapons.Length = 0;
    //return;    
}

simulated function OnGetIsenbergStage()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x4E
    if(GetCoreHealth(0) > 0.0000000)
    {
        inAction.OutputLinks[0].bHasImpulse = true;        
    }
    else
    {
        // End:0x9D
        if(GetCoreHealth(2) > 0.0000000)
        {
            inAction.OutputLinks[1].bHasImpulse = true;            
        }
        else
        {
            inAction.OutputLinks[3].bHasImpulse = true;
        }
    }
    //return;    
}

simulated function GetMainCore()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x1B
    if(GetCoreHealth(0) > 0.0000000)
    {
        return 0;        
    }
    else
    {
        // End:0x37
        if(GetCoreHealth(2) > 0.0000000)
        {
            return 0;            
        }
        else
        {
            // End:0x52
            if(GetCoreHealth(1) > 0.0000000)
            {
                return 1;                
            }
            else
            {
                return 4;
            }
        }
    }
    //return ReturnValue;    
}

simulated function GetFrontCoreDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int MainCoreId;
    local /*0x97E50000-0x00000000*/ private float CoresHealth, MaxTotalHealth, DamageFactor;
    local /*0x97E50000-0x00000000*/ private int CoreIndex;

    CoreIndex = GetCoreIndexForThisCoreId(4);
    // End:0x73
    if(MyCoreData[CoreIndex].CoreFadeEndTime > WorldInfo.TimeSeconds)
    {
        return CoreFadingInOutDamageFactor(CoreIndex);
    }
    // End:0x8A
    if(!IsCoreEnabled(4))
    {
        return 0.0000000;
    }
    MainCoreId = int(GetMainCore());
    CoresHealth = GetCoreHealth(MainCoreId);
    MaxTotalHealth = GetCoreMaxHealth(MainCoreId);
    DamageFactor = 0.1000000 + ((1.0000000 - (CoresHealth / MaxTotalHealth)) * (0.9000000 - 0.1000000));
    return DamageFactor;
    //return ReturnValue;    
}

simulated function GetBackCoreDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int MainCoreId;
    local /*0x97E50000-0x00000000*/ private float CoresHealth, MaxTotalHealth, DamageFactor;
    local /*0x97E50000-0x00000000*/ private int CoreIndex;

    CoreIndex = GetCoreIndexForThisCoreId(3);
    // End:0x73
    if(MyCoreData[CoreIndex].CoreFadeEndTime > WorldInfo.TimeSeconds)
    {
        return CoreFadingInOutDamageFactor(CoreIndex);
    }
    // End:0x8A
    if(!IsCoreEnabled(3))
    {
        return 0.0000000;
    }
    MainCoreId = int(GetMainCore());
    CoresHealth = GetCoreHealth(MainCoreId);
    MaxTotalHealth = GetCoreMaxHealth(MainCoreId);
    DamageFactor = 0.1000000 + ((1.0000000 - (CoresHealth / MaxTotalHealth)) * (0.9000000 - 0.1000000));
    return DamageFactor;
    //return ReturnValue;    
}

simulated function GetGrenadeLauncherDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], DamageFactor;

    DamageFactor = GetCoreDamageFactor(0);
    // End:0x94
    if(((DamageFactor != 0.0000000) && DamageFactor != 1.0000000) && bDamageOnlyWhenStunned)
    {
        DamageFactor = 0.1000000 + ((1.0000000 - (StunnedHealth / TuneDataVsISS.DamageStunnedGrenadeLauncher)) * 0.8000000);
    }
    return DamageFactor;
    //return ReturnValue;    
}

simulated function GetSalvoLauncherDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], DamageFactor;

    DamageFactor = GetCoreDamageFactor(2);
    // End:0x95
    if(((DamageFactor != 0.0000000) && DamageFactor != 1.0000000) && bDamageOnlyWhenStunned)
    {
        DamageFactor = 0.1000000 + ((1.0000000 - (StunnedHealth / TuneDataVsISS.DamageStunnedGrenadeLauncher)) * 0.8000000);
    }
    return DamageFactor;
    //return ReturnValue;    
}

simulated function GetRailgunDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], DamageFactor;

    DamageFactor = GetCoreDamageFactor(1);
    // End:0x94
    if(((DamageFactor != 0.0000000) && DamageFactor != 1.0000000) && bDamageOnlyWhenStunned)
    {
        DamageFactor = 0.1000000 + ((1.0000000 - (StunnedHealth / TuneDataVsISS.DamageStunnedRailgun)) * 0.8000000);
    }
    return DamageFactor;
    //return ReturnValue;    
}

function CanDamageCoreID()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x26
    if(CoreID == 1)
    {
        // End:0x26
        if(GetCoreHealth(0) > 0.0000000)
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function CoreTookDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float prevCoreHealth[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL MyISSController;

    super(LPAIPawn).CoreTookDamage(CoreTag, CoreIndex, prevCoreHealth);
    // End:0x55
    if(MyCoreData[CoreIndex].Health > float(0))
    {
        return;
    }
    // End:0x27E
    if(MyCoreData[CoreIndex].CoreID == 0)
    {
        iter = 0;
        J0x8C:

        // End:0x110 [Loop If]
        if(iter < TuneDataVsISS.BoneNamesHealthyGrenadeLauncher.Length)
        {
            Mesh.HideBoneByName(TuneDataVsISS.BoneNamesHealthyGrenadeLauncher[iter], 1);
            ++iter;
            // [Loop Continue]
            goto J0x8C;
        }
        iter = 0;
        J0x11B:

        // End:0x19D [Loop If]
        if(iter < TuneDataVsISS.BoneNamesDamagedGrenadeLauncher.Length)
        {
            Mesh.UnHideBoneByName(TuneDataVsISS.BoneNamesDamagedGrenadeLauncher[iter]);
            ++iter;
            // [Loop Continue]
            goto J0x11B;
        }
        GibsTimeDelayBeforeCollisionOn = 0.3000000;
        GibStatusList = GibsGrenadeLauncher;
        ProcessForGibbing(0.0000000);
        DeathExplosionStatusList = ExplosionGrenadeLauncher;
        ProcessForDeathExplosion();
        MyISSController = LPAIControllerVSISS(Controller);
        // End:0x27B
        if(MyISSController != none)
        {
            MyISSController.ISSCoreDestroyed(TuneDataVsISS.CoreInfo[CoreIndex].CoreTag, CoreIndex);
        }        
    }
    else
    {
        // End:0x4A8
        if(MyCoreData[CoreIndex].CoreID == 2)
        {
            iter = 0;
            J0x2B6:

            // End:0x33A [Loop If]
            if(iter < TuneDataVsISS.BoneNamesHealthyMissileLauncher.Length)
            {
                Mesh.HideBoneByName(TuneDataVsISS.BoneNamesHealthyMissileLauncher[iter], 1);
                ++iter;
                // [Loop Continue]
                goto J0x2B6;
            }
            iter = 0;
            J0x345:

            // End:0x3C7 [Loop If]
            if(iter < TuneDataVsISS.BoneNamesDamagedMissileLauncher.Length)
            {
                Mesh.UnHideBoneByName(TuneDataVsISS.BoneNamesDamagedMissileLauncher[iter]);
                ++iter;
                // [Loop Continue]
                goto J0x345;
            }
            GibsTimeDelayBeforeCollisionOn = 0.3000000;
            GibStatusList = GibsMissileLauncher;
            ProcessForGibbing(0.0000000);
            DeathExplosionStatusList = ExplosionMissileLauncher;
            ProcessForDeathExplosion();
            MyISSController = LPAIControllerVSISS(Controller);
            // End:0x4A5
            if(MyISSController != none)
            {
                MyISSController.ISSCoreDestroyed(TuneDataVsISS.CoreInfo[CoreIndex].CoreTag, CoreIndex);
            }            
        }
        else
        {
            // End:0x6D1
            if(MyCoreData[CoreIndex].CoreID == 1)
            {
                iter = 0;
                J0x4DF:

                // End:0x561 [Loop If]
                if(iter < TuneDataVsISS.BoneNamesDamagedRailgun.Length)
                {
                    Mesh.UnHideBoneByName(TuneDataVsISS.BoneNamesDamagedRailgun[iter]);
                    ++iter;
                    // [Loop Continue]
                    goto J0x4DF;
                }
                iter = 0;
                J0x56C:

                // End:0x5F0 [Loop If]
                if(iter < TuneDataVsISS.BoneNamesDamagedRailgun.Length)
                {
                    Mesh.HideBoneByName(TuneDataVsISS.BoneNamesDamagedRailgun[iter], 1);
                    ++iter;
                    // [Loop Continue]
                    goto J0x56C;
                }
                GibsTimeDelayBeforeCollisionOn = 0.3000000;
                GibStatusList = GibsRailgun;
                ProcessForGibbing(0.0000000);
                DeathExplosionStatusList = ExplosionRailgun;
                ProcessForDeathExplosion();
                MyISSController = LPAIControllerVSISS(Controller);
                // End:0x6CE
                if(MyISSController != none)
                {
                    MyISSController.ISSCoreDestroyed(TuneDataVsISS.CoreInfo[CoreIndex].CoreTag, CoreIndex);
                }                
            }
            else
            {
                // End:0x78E
                if(MyCoreData[CoreIndex].CoreID == 4)
                {
                    MyISSController = LPAIControllerVSISS(Controller);
                    // End:0x78E
                    if(MyISSController != none)
                    {
                        MyISSController.ISSCoreDestroyed(TuneDataVsISS.CoreInfo[CoreIndex].CoreTag, CoreIndex);
                    }
                }
            }
        }
    }
    //return;    
}

simulated function ShouldGib()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

    // End:0x22
    if(InstigatedBy == Controller)
    {
        InDamage = 0;
    }
    // End:0x45
    if(LPAIController(InstigatedBy) != none)
    {
        InDamage = 0;
    }
    super(LPAIPawn).AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    //return;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag;

    // End:0x7D
    if(DamageReactionManagerAI != none)
    {
        CoreTag = DamageReactionManagerAI.hitCoreTag;
        // End:0x7D
        if((CoreTag != none) && GetCoreHealth(CoreTag.GetCoreId()) <= 0.0000000)
        {
            return false;
        }
    }
    return super.AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    PlayDyingSpecialMove(Class'LPSM_VSISSDie');
    //return;    
}

function Died()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAIPawn).Died(Killer, DamageType, HitLocation);
    //return ReturnValue;    
}

function DestroyVS()
{
    Destroy();
    //return;    
}

function VsHitMe()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheVs[8388609], HitNormal;

    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    AimController.UpdateAim(DeltaTime);
    WorldAimDir = AimController.GetWorldAimRotator();
    //return;    
}

simulated function GetActiveWeaponID()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return ActiveWeaponID;
    //return ReturnValue;    
}

simulated function EnableMissileLauncher()
{
    //return;    
}

simulated function ClearForcedWeapon()
{
    bForcedWeapon = false;
    //return;    
}

simulated function SetForcedWeapon()
{
    local /*0x97E50000-0x00000000*/ private byte InActiveWeapon[8388609], FireMode;

    0
    bForcedWeapon = false;
    SetActiveVSWeapon(InActiveWeapon, FireMode);
    bForcedWeapon = true;
    //return;    
}

simulated function GetCurrentFireMode()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return Weapon.CurrentFireMode;
    //return ReturnValue;    
}

simulated function SetActiveVSWeapon()
{
    local /*0x97E50000-0x00000000*/ private byte InActiveWeapon[8388609], FireMode;

    0
    // End:0x15
    if(bForcedWeapon)
    {
        return;
    }
    // End:0x11C
    if((int(InActiveWeapon) != int(ActiveWeaponID)) || int(FireMode) != int(Weapon.CurrentFireMode))
    {
        StopFiring();
        NumTimesFiredWeapon = 0;
        ActiveWeaponID = InActiveWeapon;
        Weapon = VSWeapons[int(ActiveWeaponID)];
        // End:0xEE
        if(int(InActiveWeapon) == int(2))
        {
            LPWeaponVSISSMissileLauncher(Weapon).SetForcedFireMode(FireMode);
        }
        // End:0x11C
        if(Weapon != none)
        {
            Weapon.CacheAIController();
        }
    }
    //return;    
}

simulated function AimingSocket()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x17
    if(bOnlyOneSetOf9PointAims)
    {
        return 'CoreSocket';
    }
    // End:0x38
    if(int(ActiveWeaponID) == int(1))
    {
        return 'R_WeaponSocket';        
    }
    else
    {
        // End:0x59
        if(int(ActiveWeaponID) == int(0))
        {
            return 'L_WeaponSocket';            
        }
        else
        {
            return 'CoreSocket';
        }
    }
    //return ReturnValue;    
}

simulated event HeadBoneName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x21
    if(int(ActiveWeaponID) == int(1))
    {
        return 'JO_R_Elbow';        
    }
    else
    {
        return 'JO_L_Elbow';
    }
    //return ReturnValue;    
}

function GiveDefaultVSWeapons()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL SpawnedWeapon;

    // End:0x12
    if(VSWeapons.Length > 0)
    {
        return;
    }
    I = 0;
    J0x1D:

    // End:0xB2 [Loop If]
    if(I < DefaultVSWeapons.Length)
    {
        SpawnedWeapon = Spawn(DefaultVSWeapons[I], self);
        SpawnedWeapon.GiveTo(self);
        SpawnedWeapon.bWeaponActive = true;
        I++;
        // [Loop Continue]
        goto J0x1D;
    }
    //return;    
}

simulated function OnGiveInventory()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx, I;
    local /*0x97E50000-0x00000000*/ private class InvClass;
    local /*0x97E50000-0x00000000*/ private @NULL SpawnedWeapon;

    // End:0x9A
    if(inAction.bClearExisting)
    {
        I = 0;
        J0x2D:

        // End:0x8E [Loop If]
        if(I < VSWeapons.Length)
        {
            // End:0x80
            if(VSWeapons[I] != none)
            {
                VSWeapons[I].Destroy();
            }
            I++;
            // [Loop Continue]
            goto J0x2D;
        }
        VSWeapons.Length = 0;
    }
    // End:0x1E6
    if(inAction.InventoryList.Length > 0)
    {
        Idx = 0;
        J0xCA:

        // End:0x1E3 [Loop If]
        if(Idx < inAction.InventoryList.Length)
        {
            InvClass = inAction.InventoryList[Idx];
            // End:0x188
            if(InvClass != none)
            {
                SpawnedWeapon = LPBaseVSWeapon(Spawn(InvClass, none));
                SpawnedWeapon.GiveTo(self);                
            }
            else
            {
                inAction.ScriptLog("WARNING: Attempting to give NULL inventory!");
            }
            Idx++;
            // [Loop Continue]
            goto J0xCA;
        }        
    }
    else
    {
        inAction.ScriptLog("WARNING: Give Inventory without any inventory specified!");
    }
    //return;    
}

simulated function LockAimLocation()
{
    LockedAimLocation = SPGFCoverAIController(Controller).GetAimLocation();
    bAimLocationLocked = true;
    //return;    
}

simulated function UnlockAimLocation()
{
    bAimLocationLocked = false;
    //return;    
}

simulated function StartAdditiveChargingAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    // End:0xB6
    if(ATL_ChargingAnimNodes[int(ActiveWeaponID)] != none)
    {
        AnimSeqTemplate = ATL_ChargingAnimNodes[int(ActiveWeaponID)].GetBestSequenceTemplate(self);
        AdditiveAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, true, false, 0, 0, false, 3);
    }
    //return;    
}

simulated function StopAdditiveChargingAnimation()
{
    AdditiveAnimInfo.AnimNodeSlot.StopCustomAnim(0.2500000);
    //return;    
}

simulated function WeaponFired()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[9437185];

    StartAdditiveFireAnimation();
    super(LPPawn).WeaponFired(InWeapon, bViaReplication, HitLocation);
    //return;    
}

simulated function StartAdditiveFireAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    // End:0xB6
    if(ATL_RecoilAnimNodes[int(ActiveWeaponID)] != none)
    {
        AnimSeqTemplate = ATL_RecoilAnimNodes[int(ActiveWeaponID)].GetBestSequenceTemplate(self);
        AdditiveAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, false, false, 0, 0, false, 3);
    }
    //return;    
}

simulated function StopAdditiveFireAnimation()
{
    AdditiveAnimInfo.AnimNodeSlot.StopCustomAnim(0.2500000);
    //return;    
}

simulated function PlayMissileLauncherDownAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = ATL_MissileLauncherDownAnimNode.GetBestSequenceTemplate(self);
    MissileLauncherAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, false, false, 0, 0, false, 3);
    //return;    
}

simulated function PlayMissileLauncherUpAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = ATL_MissileLauncherUpAnimNode.GetBestSequenceTemplate(self);
    MissileLauncherAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(LauncherUpAnimFinished, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, false, false, 0, 0, false, 3);
    //return;    
}

function LauncherUpAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    PlayMissileLauncherHoldAnimation();
    //return;    
}

simulated function PlayMissileLauncherHoldAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = ATL_MissileLauncherHoldAnimNode.GetBestSequenceTemplate(self);
    MissileLauncherAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, true, false, 0, 0, false, 3);
    //return;    
}

simulated function PlayShoulderUpAnimation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InOnAnimFinished[8388609];

    // End:0x29
    if(GetCoreHealth(0) > float(0))
    {
        PlayLeftShoulderUpAnimation(InOnAnimFinished);        
    }
    else
    {
        PlayRightShoulderUpAnimation(InOnAnimFinished);
    }
    //return;    
}

simulated function PlayShoulderHoldAnimation()
{
    // End:0x1A
    if(bLeftShoulderActive)
    {
        PlayLeftShoulderHoldAnimation();        
    }
    else
    {
        PlayRightShoulderHoldAnimation();
    }
    //return;    
}

simulated function PlayShoulderDownAnimation()
{
    // End:0x1A
    if(bLeftShoulderActive)
    {
        PlayLeftShoulderDownAnimation();        
    }
    else
    {
        PlayRightShoulderDownAnimation();
    }
    //return;    
}

private final simulated function PlayLeftShoulderDownAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    // End:0x11
    if(!bLeftShoulderActive)
    {
        return;
    }
    bLeftShoulderActive = false;
    EnableCoreById(0, false);
    AnimSeqTemplate = ATL_LeftShoulderDownAnimNode.GetBestSequenceTemplate(self);
    LeftShoulderAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, false, false, 0, 0, false, 3);
    //return;    
}

private final simulated function PlayLeftShoulderUpAnimation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InOnAnimFinished[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    // End:0x0F
    if(bLeftShoulderActive)
    {
        return;
    }
    bLeftShoulderActive = true;
    EnableCoreById(0, true);
    AnimSeqTemplate = ATL_LeftShoulderUpAnimNode.GetBestSequenceTemplate(self);
    LeftShoulderAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(InOnAnimFinished, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, false, false, 0, 0, false, 3);
    //return;    
}

private final simulated function PlayLeftShoulderHoldAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    // End:0x11
    if(!bLeftShoulderActive)
    {
        return;
    }
    AnimSeqTemplate = ATL_LeftShoulderHoldAnimNode.GetBestSequenceTemplate(self);
    LeftShoulderAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, true, false, 0, 0, false, 3);
    //return;    
}

private final simulated function PlayShoulderUpAndHoldAnimation()
{
    // End:0x20
    if(GetCoreHealth(0) > float(0))
    {
        PlayLeftShoulderUpAndHoldAnimation();        
    }
    else
    {
        PlayRightShoulderUpAndHoldAnimation();
    }
    //return;    
}

private final simulated function PlayLeftShoulderUpAndHoldAnimation()
{
    PlayLeftShoulderUpAnimation(LeftShoulderUpAnimFinished);
    //return;    
}

private final simulated function LeftShoulderUpAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    PlayLeftShoulderHoldAnimation();
    //return;    
}

simulated function EnableCoreById()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x6B
    if(((CoreID == 1) || CoreID == 2) || CoreID == 0)
    {
        // End:0x4F
        if(bEnable)
        {
            EnableCoreById(3, true);            
        }
        else
        {
            // End:0x6B
            if(!bStunned)
            {
                EnableCoreById(3, false);
            }
        }
    }
    super(LPAIPawn).EnableCoreById(CoreID, bEnable);
    //return;    
}

private final simulated function PlayRightShoulderDownAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    // End:0x11
    if(!bRightShoulderActive)
    {
        return;
    }
    bRightShoulderActive = false;
    EnableCoreById(1, false);
    AnimSeqTemplate = ATL_RightShoulderDownAnimNode.GetBestSequenceTemplate(self);
    RightShoulderAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, false, false, 0, 0, false, 3);
    //return;    
}

private final simulated function PlayRightShoulderUpAnimation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InOnAnimFinished[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    // End:0x0F
    if(bRightShoulderActive)
    {
        return;
    }
    bRightShoulderActive = true;
    EnableCoreById(1, true);
    AnimSeqTemplate = ATL_RightShoulderUpAnimNode.GetBestSequenceTemplate(self);
    RightShoulderAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(InOnAnimFinished, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, false, false, 0, 0, false, 3);
    //return;    
}

private final simulated function PlayRightShoulderHoldAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    // End:0x11
    if(!bRightShoulderActive)
    {
        return;
    }
    AnimSeqTemplate = ATL_RightShoulderHoldAnimNode.GetBestSequenceTemplate(self);
    RightShoulderAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, true, false, 0, 0, false, 3);
    //return;    
}

private final simulated function PlayRightShoulderUpAndHoldAnimation()
{
    PlayRightShoulderUpAnimation(RightShoulderUpAnimFinished);
    //return;    
}

private final function RightShoulderUpAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    PlayRightShoulderHoldAnimation();
    //return;    
}

simulated function StarCloseRangeCharge()
{
    bPlayingCloseRangeCharge = true;
    PlayCloseRangeChargingEffect();
    PlayShoulderUpAndHoldAnimation();
    //return;    
}

simulated function StopCloseRangeCharge()
{
    // End:0x11
    if(!bPlayingCloseRangeCharge)
    {
        return;
    }
    StopCloseRangeChargingEffect();
    PlayShoulderDownAnimation();
    bPlayingCloseRangeCharge = false;
    //return;    
}

simulated function CloseRangeFire()
{
    // End:0x11
    if(!bPlayingCloseRangeCharge)
    {
        return;
    }
    StopCloseRangeCharge();
    DoCloseRangeExplosion();
    //return;    
}

simulated function HandleAnimVSISSFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];
    local /*0x97E50000-0x00000000*/ private float Duration[8388609];

    CloseRangeFire();
    //return;    
}

private final simulated function PlayCloseRangeChargingEffect()
{
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideType = 2;
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideValue = 100000000000000000.0000000;
    CloseRangeChargeEffectCmp = TuneDataPawnFXEventBindings.PlayEventFX('VSISSCloseRangeCharge', none, Mesh, MaxDistancePlaybackOverride);
    // End:0x189
    if(CloseRangeChargeEffectCmp != none)
    {
        CloseRangeChargeEffectCmp.ActivateSystem();
        // End:0x158
        if(ChargingSound == none)
        {
            ChargingSound = AudioComponent(TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('VSISSCloseRangeCharge', 'VSISSCloseRangeCharge', self, none, none));
            ChargingSound.bStopWhenOwnerDestroyed = true;
        }
        // End:0x186
        if(ChargingSound != none)
        {
            ChargingSound.Play();
        }        
    }
    //return;    
}

private final simulated function StopCloseRangeChargingEffect()
{
    // End:0x97
    if(CloseRangeChargeEffectCmp != none)
    {
        WorldInfo.MyEmitterPool.OnParticleSystemFinished(CloseRangeChargeEffectCmp);
        CloseRangeChargeEffectCmp.DetachFromAny();
        CloseRangeChargeEffectCmp.SetActive(false);
        CloseRangeChargeEffectCmp = none;
    }
    // End:0xCF
    if(ChargingSound != none)
    {
        ChargingSound.FadeOut(0.5000000, 0.0000000);
    }
    //return;    
}

private final simulated function DoCloseRangeExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL explosionActor, CloseRangeExplosionLocation, CloseRangeExplosionRotation;

    // End:0x7B
    if(!Mesh.GetSocketWorldLocationAndRotation(TuneDataVsISS.CloseRangeExplosionSocketName, CloseRangeExplosionLocation, CloseRangeExplosionRotation))
    {
        CloseRangeExplosionLocation = Location;
        CloseRangeExplosionRotation = Rotation;
    }
    explosionActor = Spawn(Class'LPExplosionActor',,, CloseRangeExplosionLocation, CloseRangeExplosionRotation);
    // End:0x238
    if(explosionActor != none)
    {
        TimeStampCloseRangeExplosion = WorldInfo.TimeSeconds;
        explosionActor.TheWeaponThatSpawnedMe = self;
        explosionActor.Instigator = self;
        explosionActor.InstigatorController = Controller;
        explosionActor.bDrawDebug = TuneDataVsISS.bCloseRangeExplosionDrawDebug;
        explosionActor.ExplosionPhysMaterial = ((Mesh.PhysMaterialOverride != none) ? SPPhysicalMaterial(Mesh.PhysMaterialOverride) : none);
        explosionActor.Explode(TuneDataVsISS.CloseRangeExplosion);
    }
    //return;    
}

event @NULL RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherActor[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x35
    if((WorldInfo.TimeSeconds - TimeStampCloseRangeExplosion) < 1.0000000)
    {
        return;
    }
    // End:0x71
    if(LPPlayerPawn(OtherActor) != none)
    {
        // End:0x67
        if(bPlayingCloseRangeCharge)
        {
            CloseRangeFire();            
        }
        else
        {
            DoCloseRangeExplosion();
        }
    }
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609], DebugMode;

    DebugMode = InHUD.GetDebugModeManager().GetDebugMode();
    // End:0x1AE
    if(DebugMode != none)
    {
        // End:0x17B
        if((Weapon == none) || !Weapon.IsFiring())
        {
            // End:0xBE
            if(DebugMode.IsFlagEnabled('ISSGrenades'))
            {
                SetForcedWeapon(0);                
            }
            else
            {
                // End:0xF9
                if(DebugMode.IsFlagEnabled('ISSRailgun'))
                {
                    SetForcedWeapon(1);                    
                }
                else
                {
                    // End:0x135
                    if(DebugMode.IsFlagEnabled('ISSMissiles'))
                    {
                        SetForcedWeapon(2, 0);                        
                    }
                    else
                    {
                        // End:0x171
                        if(DebugMode.IsFlagEnabled('ISSMissilesRing'))
                        {
                            SetForcedWeapon(2, 1);                            
                        }
                        else
                        {
                            ClearForcedWeapon();
                        }
                    }
                }
            }
        }
        bForcedCloseRangeStrike = DebugMode.IsFlagEnabled('ISSCloseRange');
    }
    // End:0x1F3
    if(int(ActiveWeaponID) == int(2))
    {
        LPWeaponVSISSMissileLauncher(Weapon).DrawDebug(InHUD);
    }
    //return;    
}

simulated function VSISSFireWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL AIC;

    AIC = LPAIController(Controller);
    // End:0x63
    if((AIC != none) && IsDoingSpecialMove_OF_Class(Class'LPSM_SmartObjectInteraction'))
    {
        AIC.WeaponStartFiring();
    }
    //return;    
}

simulated function StartShieldEffect()
{
    ShieldEffectLoop = TuneDataPawnFXEventBindings.PlayEventFX('VSISSShieldLoop', self, Mesh, none);
    // End:0x9C
    if(ShieldEffectLoop != none)
    {
        ShieldEffectLoop.__OnSystemFinished__Delegate = None;
        ShieldEffectLoop.ActivateSystem(true);
    }
    //return;    
}

simulated function StopShieldEffect()
{
    // End:0x58
    if(ShieldEffectLoop != none)
    {
        ShieldEffectLoop.DetachFromAny();
        ShieldEffectLoop.DeactivateSystem();
        ShieldEffectLoop = none;
    }
    //return;    
}

simulated function SetStunned()
{
    local /*0x97E50000-0x00000000*/ private bool bInStunned[8388609];

    // End:0xB2
    if(bInStunned != bStunned)
    {
        bStunned = bInStunned;
        // End:0xB2
        if(bDamageOnlyWhenStunned)
        {
            EnableCoreById(3, bStunned);
            EnableCoreById(4, bStunned);
            // End:0x99
            if(bStunned)
            {
                EnableCoreById(0, false);
                EnableCoreById(2, false);
                EnableCoreById(1, false);
            }
            // End:0xB2
            if(!bStunned)
            {
                SetStunnedHealth();
            }
        }
    }
    //return;    
}

function SetStunnedHealth()
{
    // End:0x40
    if(int(GetMainCore()) == int(0))
    {
        StunnedHealth = TuneDataVsISS.DamageStunnedGrenadeLauncher;        
    }
    else
    {
        // End:0x80
        if(int(GetMainCore()) == int(2))
        {
            StunnedHealth = TuneDataVsISS.DamageStunnedMissileLauncher;            
        }
        else
        {
            // End:0xBD
            if(int(GetMainCore()) == int(1))
            {
                StunnedHealth = TuneDataVsISS.DamageStunnedRailgun;
            }
        }
    }
    //return;    
}

defaultproperties
{
    bDamageOnlyWhenStunned=true
    MissileLauncherAnimInfo=(AnimNodeSlotName="MissileLauncherSlotNode",AnimNodeSlot=none)
    LeftShoulderAnimInfo=(AnimNodeSlotName="LeftShoulderSlotNode",AnimNodeSlot=none)
    RightShoulderAnimInfo=(AnimNodeSlotName="RightShoulderSlotNode",AnimNodeSlot=none)
    // Reference: SPTuneDataEventDefSoundBase'Default__LPAIPawnVSISS.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj class=Class'SPEngine.SPTuneDataEventDefSoundBase'
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    // Reference: LPAIResManVSISS'Default__LPAIPawnVSISS.LPAIResManVSISS'
    begin object name=LPAIResManVSISS class=Class'LPAIResManVSISS'
    end object
    AIResourceManager=LPAIResManVSISS
    // Reference: LPAimControlVsISS'Default__LPAIPawnVSISS.AimControl'
    begin object name=AimControl class=Class'LPAimControlVsISS'
    end object
    AimController=AimControl
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnVSISS.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnVSISS.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnVSISS.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnVSISS.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnVSISS.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnVSISS.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnVSISS.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnVSISS.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    InventoryManagerClass=none
    // Reference: AudioComponent'Default__LPAIPawnVSISS.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=myKynapseBodyHandle
    Components[4]=MyLightEnvironment
    Components[5]=SPPawnMesh
    Components[6]=FaceAudioComponent
    Components[7]=SPDamageOverTimeComponentObj
    Components[8]=SMTC
    // Reference: SPDamageStateComponent'Default__LPAIPawnVSISS.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj
    end object
    Components[9]=DamageStateComponentDefObj
    Components[10]=LPAIResManVSISS
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnVSISS.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}