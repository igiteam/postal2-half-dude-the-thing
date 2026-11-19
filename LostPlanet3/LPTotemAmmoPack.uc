class LPTotemAmmoPack extends LPTotemBase
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimName[3];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SphereParticles[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SphereComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SphereScale;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL HologramMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AmmoReplenishInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataAmmoPack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int NumPlayersSupplied[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PrevNumPlayersSupplied[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SuppliedPRIs[536870913];

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x24
    if(VarName == 'NumPlayersSupplied')
    {
        UpdateSupplyStats();        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
    //return;    
}

simulated function UpdateSupplyStats()
{
    local /*0x97E50000-0x00000000*/ private int Delta;

    // End:0x28
    if(int(Role) == int(ROLE_Authority))
    {
        NumPlayersSupplied = SuppliedPRIs.Length;
    }
    // End:0xA9
    if(OwningController != none)
    {
        Delta = NumPlayersSupplied - PrevNumPlayersSupplied;
        // End:0x96
        if(Delta > 0)
        {
            OwningController.ModifyStat('Stat_PlayersSupplied', Delta);
        }
        PrevNumPlayersSupplied = NumPlayersSupplied;
    }
    //return;    
}

simulated function PostInitData()
{
    super.PostInitData();
    TuneDataAmmoPack = LPTuneDataPerkAmmoPack(TuneDataTotem);
    //return;    
}

simulated function NotifyDeployed()
{
    local /*0x97E50000-0x00000000*/ private float RateMultiplier;

    super.NotifyDeployed();
    SetCollision(true, false);
    PlayAnim(0, false);
    PlayFX();
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    SetPhysics(0);
    // End:0xB8
    if(!bDeployed)
    {
        // End:0xA2
        if(TuneDataAmmoPack.DeployCue != none)
        {
            PlaySound(TuneDataAmmoPack.DeployCue);
        }
        SetTimer(0.0100000, true, 'ExpandFX');        
    }
    else
    {
        SetFXExpanded();
    }
    // End:0x1B1
    if(int(Role) == int(ROLE_Authority))
    {
        RateMultiplier = 1.0000000 / TuneDataAmmoPack.PulseRateMultiplier.GetValue(LPPlayerController(Instigator.Controller));
        SetTimer(TuneDataAmmoPack.PulseRateAmmo * RateMultiplier, true, 'ReplenishAmmo');
        SetTimer(TuneDataAmmoPack.PulseRateGrenades * RateMultiplier, true, 'ReplenishGrenades');
    }
    //return;    
}

simulated function SetFXExpanded()
{
    local /*0x97E50000-0x00000000*/ private float RadiusToSphere;

    // End:0x77
    if(SphereComp != none)
    {
        SphereScale = vect(1.0000000, 1.0000000, 1.0000000);
        RadiusToSphere = TouchRadius / 500.0000000;
        SphereComp.SetScale3D(RadiusToSphere * vect(1.0000000, 1.0000000, 1.0000000));
    }
    // End:0xAE
    if(HologramMesh != none)
    {
        HologramMesh.SetScale3D(SphereScale);
    }
    //return;    
}

simulated function ExpandFX()
{
    local /*0x97E50000-0x00000000*/ private float RadiusToSphere;
    local /*0x97E50000-0x00000000*/ private @NULL HologramScale;

    SphereScale = (SphereScale * 0.9000000) + (vect(1.0000000, 1.0000000, 1.0000000) * 0.1000000);
    // End:0x81
    if(SphereScale.X > 0.9900000)
    {
        SphereScale = vect(1.0000000, 1.0000000, 1.0000000);
        ClearTimer('ExpandFX');
    }
    // End:0xF6
    if(SphereComp != none)
    {
        RadiusToSphere = TouchRadius / TuneDataAmmoPack.ParticleSystemRadius;
        SphereComp.SetScale3D(SphereScale * RadiusToSphere);
    }
    // End:0x162
    if(HologramMesh != none)
    {
        HologramScale = SphereScale;
        HologramScale.Z = 1.0000000;
        HologramMesh.SetScale3D(HologramScale);
    }
    //return;    
}

simulated function ShrinkFXAndDie()
{
    local /*0x97E50000-0x00000000*/ private float RadiusToSphere;
    local /*0x97E50000-0x00000000*/ private @NULL HologramScale;

    SphereScale = SphereScale * 0.9000000;
    // End:0x6E
    if(SphereScale.X < 0.0100000)
    {
        SphereScale = vect(0.0000000, 0.0000000, 0.0000000);
        ClearTimer('ShrinkFXAndDie');
        Destroy();
    }
    // End:0xE3
    if(SphereComp != none)
    {
        RadiusToSphere = TouchRadius / TuneDataAmmoPack.ParticleSystemRadius;
        SphereComp.SetScale3D(SphereScale * RadiusToSphere);
    }
    // End:0x11A
    if(VisibleMesh != none)
    {
        VisibleMesh.SetScale3D(SphereScale);
    }
    // End:0x186
    if(HologramMesh != none)
    {
        HologramScale = SphereScale;
        HologramScale.Z = 1.0000000;
        HologramMesh.SetScale3D(HologramScale);
    }
    //return;    
}

simulated event PlayFX()
{
    local /*0x97E50000-0x00000000*/ private @NULL MIC, TeamColor, TeamLColor, ColorVec;

    // End:0x3AC
    if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        TeamColor = Class'LPGameMP_Base'.static.GetTeamColor(int(GetTeamNum()));
        TeamLColor.R = float(TeamColor.R) / 255.0000000;
        TeamLColor.G = float(TeamColor.G) / 255.0000000;
        TeamLColor.B = float(TeamColor.B) / 255.0000000;
        TeamLColor.A = float(TeamColor.A) / 255.0000000;
        // End:0x1D0
        if(HologramMesh != none)
        {
            MIC = HologramMesh.CreateAndSetMaterialInstanceConstant(0);
            MIC.SetVectorParameterValue('GlowColor', TeamLColor);
        }
        // End:0x3AC
        if((SphereComp == none) && SphereParticles != none)
        {
            SphereComp = new (self) SphereParticles.Class (SphereParticles);
            // End:0x3AC
            if(SphereComp != none)
            {
                SphereScale = vect(0.0000000, 0.0000000, 0.0000000);
                SphereComp.SetScale3D(SphereScale);
                AttachComponent(SphereComp);
                SphereComp.SetActive(true);
                ColorVec.X = TeamLColor.R;
                ColorVec.Y = TeamLColor.G;
                ColorVec.Z = TeamLColor.B;
                ColorVec *= TuneDataAmmoPack.ParticleTeamColorIntensity;
                SphereComp.SetVectorParameter('InstanceColor', ColorVec);
            }
        }
    }
    //return;    
}

simulated function PlayAnim()
{
    local /*0x97E50000-0x00000000*/ private int AnimIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLoop[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Slot;

    // End:0xA7
    if(VisibleSkelMesh != none)
    {
        Slot = SPAnimNodeSlot(VisibleSkelMesh.FindAnimNode('TotemSlotNode'));
        // End:0xA7
        if(Slot != none)
        {
            Slot.PlayCustomAnim(AnimName[AnimIndex], 1.0000000, 0.5000000, -1.0000000, bLoop, true);
        }
    }
    //return;    
}

function ReplenishAmmo()
{
    Replenish(true, false);
    //return;    
}

function ReplenishGrenades()
{
    Replenish(false, true);
    //return;    
}

function Replenish()
{
    local /*0x97E50000-0x00000000*/ private bool bReplenishAmmo[9437185], bReplenishGrenades;
    local /*0x97E50000-0x00000000*/ private @NULL P, PRI;
    local /*0x97E50000-0x00000000*/ private bool bSuppliedAmmo;

    true
    true
    // End:0x45
    if((Team == none) || Team.TeamIndex == -1)
    {
        return;
    }
    // End:0x1CC
    foreach WorldInfo.AllPawns(Class'LPPlayerPawn', P)
    {
        // End:0x1CB
        if(Team == P.GetTeam())
        {
            // End:0x1CB
            if(VSizeSq(P.Location - Location) < (TouchRadius * TouchRadius))
            {
                // End:0x1CB
                if(P.ReplenishAmmoFromAmmoPack(self, bReplenishAmmo, bReplenishGrenades) > 0)
                {
                    // End:0x1BF
                    if(OwningController != P.Controller)
                    {
                        PRI = LPPRI(P.PlayerReplicationInfo);
                        // End:0x1BF
                        if(SuppliedPRIs.Find(PRI) < )
                        {                            
                            SuppliedPRIs.AddItem(PRI);                            
                            UpdateSupplyStats();
                        }
                    }
                    bSuppliedAmmo = true;
                }
            }
        }        
    }    
    // End:0x22D
    if(bSuppliedAmmo && TuneDataAmmoPack.PulseCue != none)
    {
        PlaySound(TuneDataAmmoPack.PulseCue);
    }
    //return;    
}

simulated function EndBeacon()
{
    local /*0x97E50000-0x00000000*/ private bool bReplace[9437185];

    false
    super.EndBeacon(bReplace);
    GotoState('None');
    ClearTimer('ExpandFX');
    ClearTimer('ShrinkFX');
    SetTimer(0.0100000, true, 'ShrinkFXAndDie');
    // End:0xB3
    if(TuneDataAmmoPack.DestroyCue != none)
    {
        PlaySound(TuneDataAmmoPack.DestroyCue);
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    SphereComp = none;
    //return;    
}

simulated function ShrinkFX()
{
    //return;    
}

simulated state EMPShutdown
{
    ignores Replenish;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        super.BeginState(PrevStateName);
        SetCollision(false, false);
        SetTimer(0.0100000, true, 'ShrinkFX');
        //return;        
    }

    simulated function ShrinkFX()
    {
        local /*0x97E50000-0x00000000*/ private float RadiusToSphere;
        local /*0x97E50000-0x00000000*/ private @NULL HologramScale;

        SphereScale = SphereScale * 0.9000000;
        // End:0x6B
        if(SphereScale.X < 0.0100000)
        {
            SphereScale = vect(0.0000000, 0.0000000, 0.0000000);
            ClearTimer('ShrinkFX');
        }
        // End:0xE0
        if(SphereComp != none)
        {
            RadiusToSphere = TouchRadius / TuneDataAmmoPack.ParticleSystemRadius;
            SphereComp.SetScale3D(SphereScale * RadiusToSphere);
        }
        // End:0x14C
        if(HologramMesh != none)
        {
            HologramScale = SphereScale;
            HologramScale.Z = 1.0000000;
            HologramMesh.SetScale3D(HologramScale);
        }
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0xAC
        if(!bBeaconEnded)
        {
            SetCollision(true, false);
            ClearTimer('ShrinkFX');
            PlayAnim(0, false);
            // End:0x86
            if(TuneDataAmmoPack.DeployCue != none)
            {
                PlaySound(TuneDataAmmoPack.DeployCue);
            }
            SetTimer(0.0100000, true, 'ExpandFX');
            super.EndState(NextStateName);
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    AnimName="PRP_ProxMine_Placement_Core"
    PerkIndex=EPerks.EPERK_AMMOPACK
    // Reference: SkeletalMeshComponent'Default__LPTotemAmmoPack.TotemMeshComp'
    begin object name=TotemMeshComp
    end object
    SkelMesh=TotemMeshComp
    // Reference: SkeletalMeshComponent'Default__LPTotemAmmoPack.EnemyTotemMeshComp'
    begin object name=EnemyTotemMeshComp
    end object
    EnemySkelMesh=EnemyTotemMeshComp
    // Reference: LPHackableTotemBaseComponent'Default__LPTotemAmmoPack.HackComponentA'
    begin object name=HackComponentA
    end object
    HackComponent=HackComponentA
    // Reference: CylinderComponent'Default__LPTotemAmmoPack.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[0]=CollisionCylinder
    Components[1]=HackComponentA
    // Reference: LPTotemInteractionMetaData'Default__LPTotemAmmoPack.TotemInteract0'
    begin object name=TotemInteract0
    end object
    InteractionMetaData=TotemInteract0
    CollisionComponent=CollisionCylinder
}