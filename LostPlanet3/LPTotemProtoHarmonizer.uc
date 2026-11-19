class LPTotemProtoHarmonizer extends LPTotemBase
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimName[3];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PHTuneData;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SphereComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SphereScale;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL HarmonizeComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHarmonizeFXInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHarmonizeSoundPlaying;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array BeamComps[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL HarmonizeSoundComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AffectedPlayers[536870913];

// Export ULPTotemProtoHarmonizer::execRegisterWithMapInfo(FFrame&, void* const)
native simulated function RegisterWithMapInfo();

// Export ULPTotemProtoHarmonizer::execCanHarmonize(FFrame&, void* const)
native final simulated function CanHarmonize()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function PostInitData()
{
    SetCollision(false);
    super.PostInitData();
    //return;    
}

simulated function NotifyDeployed()
{
    super.NotifyDeployed();
    InitLocalTuneData();
    RegisterWithMapInfo();
    SetCollision(true, false);
    PlayAnim(0, false);
    PlayParticles();
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    SetPhysics(0);
    // End:0xCC
    if(!bDeployed)
    {
        // End:0xB6
        if(PHTuneData.DeploySoundCue != none)
        {
            PlaySound(PHTuneData.DeploySoundCue);
        }
        SetTimer(0.0100000, true, 'ExpandSphere');        
    }
    else
    {
        SetSphereExpanded();
    }
    SetTimer(0.2000000, true, 'CheckPlayerProximity');
    //return;    
}

simulated function SetSphereExpanded()
{
    SphereScale = vect(1.0000000, 1.0000000, 1.0000000);
    UpdateSphereScale3D();
    //return;    
}

simulated function ExpandSphere()
{
    SphereScale = (SphereScale * 0.9000000) + (vect(1.0000000, 1.0000000, 1.0000000) * 0.1000000);
    // End:0x81
    if(SphereScale.X > 0.9900000)
    {
        SphereScale = vect(1.0000000, 1.0000000, 1.0000000);
        ClearTimer('ExpandSphere');
    }
    UpdateSphereScale3D();
    //return;    
}

simulated function ShrinkSphereAndDie()
{
    SphereScale = SphereScale * 0.9000000;
    // End:0x6E
    if(SphereScale.X < 0.0100000)
    {
        SphereScale = vect(0.0000000, 0.0000000, 0.0000000);
        ClearTimer('ShrinkSphereAndDie');
        Destroy();
    }
    VisibleMesh.SetScale3D(SphereScale);
    UpdateSphereScale3D();
    //return;    
}

simulated function UpdateSphereScale3D()
{
    local /*0x97E50000-0x00000000*/ private float RadiusToSphere;
    local /*0x97E50000-0x00000000*/ private @NULL RadiusToSphereVect;

    // End:0xD4
    if(SphereComp != none)
    {
        RadiusToSphere = TouchRadius / PHTuneData.RadiusFXBaseRadius;
        RadiusToSphereVect = vect(1.0000000, 1.0000000, 1.0000000) * RadiusToSphere;
        RadiusToSphereVect.Z *= PHTuneData.RadiusFXHeightScale;
        SphereComp.SetScale3D(SphereScale * RadiusToSphereVect);
    }
    //return;    
}

simulated event PlayParticles()
{
    // End:0x1C0
    if((PHTuneData.RadiusFXTemplate != none) && int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x1C0
        if(SphereComp != none)
        {
            SphereComp.SetTemplate(PHTuneData.RadiusFXTemplate);
            SphereScale = vect(0.0000000, 0.0000000, 0.0000000);
            SphereComp.SetScale3D(SphereScale);
            AttachComponent(SphereComp);
            SphereComp.SetActive(true);
            // End:0x183
            if(PHTuneData.RadiusFXSocket != 'None')
            {
                VisibleSkelMesh.AttachComponentToSocket(SphereComp, PHTuneData.RadiusFXSocket);                
            }
            else
            {
                SphereComp.SetTranslation(VisibleMesh.Translation);
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

simulated function InitLocalTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC, PRI;

    // End:0x41
    if(Perk != none)
    {
        PHTuneData = LPTuneDataPerkProtoHarmonizer(Perk.GetTuneData());
    }
    // End:0x122
    if(PHTuneData == none)
    {
        // End:0x121
        foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            PRI = LPPRI(LPC.PlayerReplicationInfo);
            // End:0x120
            if(PRI != none)
            {
                PHTuneData = LPTuneDataPerkProtoHarmonizer(PRI.PerksManager.QueryPerkInstance(8).GetTuneData());
                // End:0x120
                if(PHTuneData != none)
                {
                    // End:0x121
                    break;
                }
            }            
        }        
    }
    //return;    
}

simulated function @NULL CreateBeamParticles()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetLoc[8388609], BeamComp, EP;

    EP = WorldInfo.MyEmitterPool;
    // End:0x188
    if(EP != none)
    {
        BeamComp = EP.SpawnEmitter(PHTuneData.BeamFXTemplate, Location);
        BeamComp.SetVectorParameter('BeamTarget', TargetLoc);
        BeamComp.__OnSystemFinished__Delegate = None;
        BeamComps.AddItem(BeamComp);        
        AttachComponent(BeamComp);
        // End:0x188
        if(PHTuneData.BeamFXSourceSocket != 'None')
        {
            VisibleSkelMesh.AttachComponentToSocket(BeamComp, PHTuneData.BeamFXSourceSocket);
        }
    }
    //return;    
}

simulated function CheckPlayerProximity()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    // End:0x54
    foreach OverlappingActors(Class'LPPlayerPawn', LPP, TouchRadius)
    {
        // End:0x53
        if(CanHarmonize(LPP))
        {
            AddAffectedPlayer(LPP);
        }        
    }    
    //return;    
}

simulated function AddAffectedPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609], FXAction;

    // End:0x11E
    if(AffectedPlayers.Find(LPP) == )
    {        
        AffectedPlayers.AddItem(LPP);        
        // End:0x11E
        if(PHTuneData.PlayerFXEventBinding != 'None')
        {
            FXAction = LPFXAction_ProtoHarmonize(LPP.GetFXActionManager().GetFXAction(Class'LPFXAction_ProtoHarmonize'));
            // End:0x11E
            if(FXAction != none)
            {
                FXAction.SetEventBinding(PHTuneData.PlayerFXEventBinding);
                FXAction.Begin();
            }
        }
    }
    //return;    
}

simulated function UpdateAffectedPlayers()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    // End:0x84
    foreach AffectedPlayers(LPP)
    {
        // End:0x83
        if(!CanHarmonize(LPP))
        {
            LPP.GetFXActionManager().StopFXAction(Class'LPFXAction_ProtoHarmonize');
            AffectedPlayers.RemoveItem(LPP);            
        }        
    }    
    //return;    
}

simulated function @NULL UpdateParticles()
{
    local /*0x97E50000-0x00000400*/ private @NULL BeamComp, LPP;
    local /*0x97E50000-0x00000000*/ private int NumPlayers, numBeams;
    local /*0x97E50000-0x00000000*/ private @NULL StartLoc, TargetLoc;

    // End:0x20
    if((PHTuneData == none) || bBeaconEnded)
    {
        return;
    }
    // End:0x13E
    if(PHTuneData.HarmonizeFXTemplate != none)
    {
        // End:0xFB
        if(AffectedPlayers.Length > 0)
        {
            // End:0xB3
            if(!bHarmonizeFXInit)
            {
                HarmonizeComp.SetTemplate(PHTuneData.HarmonizeFXTemplate);
                AttachComponent(HarmonizeComp);
            }
            // End:0xF8
            if(!HarmonizeComp.bIsActive)
            {
                HarmonizeComp.SetActive(true, true);
            }            
        }
        else
        {
            // End:0x13E
            if(HarmonizeComp.bIsActive)
            {
                HarmonizeComp.SetActive(false);
            }
        }
    }
    // End:0x48A
    if(PHTuneData.BeamFXTemplate != none)
    {
        NumPlayers = 0;
        // End:0x415
        foreach AffectedPlayers(LPP)
        {
            // End:0x414
            if(!LPP.bIncapacitated)
            {
                // End:0x234
                if(PHTuneData.BeamFXTargetSocket != 'None')
                {
                    LPP.Mesh.GetSocketWorldLocationAndRotation(PHTuneData.BeamFXTargetSocket, TargetLoc);                    
                }
                else
                {
                    TargetLoc = LPP.Location;
                }
                // End:0x28C
                if(++NumPlayers > BeamComps.Length)
                {
                    CreateBeamParticles(TargetLoc);                    
                }
                else
                {
                    // End:0x303
                    if(PHTuneData.BeamFXSourceSocket != 'None')
                    {
                        VisibleSkelMesh.GetSocketWorldLocationAndRotation(PHTuneData.BeamFXSourceSocket, StartLoc);                        
                    }
                    else
                    {
                        StartLoc = Location + VisibleMesh.Translation;
                    }
                    // End:0x394
                    if(!BeamComps[NumPlayers - 1].bIsActive)
                    {
                        BeamComps[NumPlayers - 1].ActivateSystem(true);
                    }
                    BeamComps[NumPlayers - 1].SetRotation(Rotator(TargetLoc - StartLoc));
                    BeamComps[NumPlayers - 1].SetVectorParameter('BeamTarget', TargetLoc);
                }
            }            
        }        
        // End:0x48A
        if(NumPlayers < BeamComps.Length)
        {
            numBeams = 0;
            // End:0x489
            foreach BeamComps(BeamComp)
            {
                // End:0x488
                if(++numBeams > NumPlayers)
                {
                    BeamComp.DeactivateSystem();
                }                
            }            
        }
    }
    //return;    
}

simulated function UpdateSound()
{
    // End:0x13F
    if((AffectedPlayers.Length > 0) && !bHarmonizeSoundPlaying)
    {
        // End:0xD9
        if(HarmonizeSoundComp == none)
        {
            HarmonizeSoundComp = CreateAudioComponent(PHTuneData.HarmonizeLoopingSoundCue, false, true);
            // End:0xD9
            if(HarmonizeSoundComp != none)
            {
                HarmonizeSoundComp.bUseOwnerLocation = true;
                HarmonizeSoundComp.bStopWhenOwnerDestroyed = true;
                HarmonizeSoundComp.bShouldRemainActiveIfDropped = true;
            }
        }
        // End:0x13C
        if(HarmonizeSoundComp != none)
        {
            HarmonizeSoundComp.Play();
            HarmonizeSoundComp.FadeIn(0.2500000, 1.0000000);
            bHarmonizeSoundPlaying = true;
        }        
    }
    else
    {
        // End:0x1A2
        if((AffectedPlayers.Length == 0) && bHarmonizeSoundPlaying)
        {
            // End:0x1A2
            if(HarmonizeSoundComp != none)
            {
                HarmonizeSoundComp.FadeOut(0.2500000, 0.0000000);
                bHarmonizeSoundPlaying = false;
            }
        }
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    UpdateAffectedPlayers();
    // End:0x5A
    if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        UpdateParticles();
        UpdateSound();
    }
    //return;    
}

simulated function @NULL EndBeacon()
{
    local /*0x97E50000-0x00000000*/ private bool bReplace[9437185];
    local /*0x97E50000-0x00000400*/ private @NULL ParticleComp, LPP;

    false
    super.EndBeacon(bReplace);
    GotoState('None');
    ClearTimer('ExpandSphere');
    ClearTimer('ShrinkSphere');
    ClearTimer('CheckPlayerProximity');
    SetTimer(0.0100000, true, 'ShrinkSphereAndDie');
    // End:0xCC
    foreach AffectedPlayers(LPP)
    {
        LPP.GetFXActionManager().StopFXAction(Class'LPFXAction_ProtoHarmonize');        
    }    
    // End:0x104
    foreach BeamComps(ParticleComp)
    {
        ParticleComp.DeactivateSystem();        
    }    
    // End:0x148
    if(HarmonizeComp.bIsActive)
    {
        HarmonizeComp.SetActive(false);
    }
    // End:0x1AE
    if(HarmonizeSoundComp != none)
    {
        bHarmonizeSoundPlaying = false;
        HarmonizeSoundComp.bAutoDestroy = true;
        HarmonizeSoundComp.Stop();
        HarmonizeSoundComp = none;
    }
    // End:0x1FF
    if(PHTuneData.DestroySoundCue != none)
    {
        PlaySound(PHTuneData.DestroySoundCue);
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    SphereComp = none;
    BeamComps.Length = 0;
    //return;    
}

simulated function ShrinkSphere()
{
    //return;    
}

simulated state EMPShutdown
{
    ignores UpdateAffectedPlayers, UpdateParticles, UpdateSound;

    simulated event @NULL BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];
        local /*0x97E50000-0x00000400*/ private @NULL BeamComp, LPP;

        super.BeginState(PrevStateName);
        SetCollision(false, false);
        // End:0x50
        foreach BeamComps(BeamComp)
        {
            BeamComp.DeactivateSystem();            
        }        
        // End:0xA7
        foreach AffectedPlayers(LPP)
        {
            LPP.GetFXActionManager().StopFXAction(Class'LPFXAction_ProtoHarmonize');            
        }        
        // End:0xEB
        if(HarmonizeComp.bIsActive)
        {
            HarmonizeComp.SetActive(false);
        }
        SetTimer(0.0100000, true, 'ShrinkSphere');
        // End:0x138
        if(HarmonizeSoundComp != none)
        {
            bHarmonizeSoundPlaying = false;
            HarmonizeSoundComp.Stop();
        }
        //return;        
    }

    simulated function ShrinkSphere()
    {
        SphereScale = SphereScale * 0.9000000;
        // End:0x6B
        if(SphereScale.X < 0.0100000)
        {
            SphereScale = vect(0.0000000, 0.0000000, 0.0000000);
            ClearTimer('ShrinkSphere');
        }
        UpdateSphereScale3D();
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0xAC
        if(!bBeaconEnded)
        {
            SetCollision(true, false);
            ClearTimer('ShrinkSphere');
            PlayAnim(0, false);
            // End:0x86
            if(PHTuneData.DeploySoundCue != none)
            {
                PlaySound(PHTuneData.DeploySoundCue);
            }
            SetTimer(0.0100000, true, 'ExpandSphere');
            super.EndState(NextStateName);
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    AnimName="PRP_ProxMine_Placement_Core"
    // Reference: ParticleSystemComponent'Default__LPTotemProtoHarmonizer.SphereCompA'
    begin object name=SphereCompA class=Class'Engine.ParticleSystemComponent'
    end object
    SphereComp=SphereCompA
    // Reference: ParticleSystemComponent'Default__LPTotemProtoHarmonizer.HarmonizeCompA'
    begin object name=HarmonizeCompA class=Class'Engine.ParticleSystemComponent'
    end object
    HarmonizeComp=HarmonizeCompA
    PerkIndex=EPerks.EPERK_HARMONIZER
    // Reference: SkeletalMeshComponent'Default__LPTotemProtoHarmonizer.TotemMeshComp'
    begin object name=TotemMeshComp
    end object
    SkelMesh=TotemMeshComp
    // Reference: SkeletalMeshComponent'Default__LPTotemProtoHarmonizer.EnemyTotemMeshComp'
    begin object name=EnemyTotemMeshComp
    end object
    EnemySkelMesh=EnemyTotemMeshComp
    // Reference: LPHackableTotemBaseComponent'Default__LPTotemProtoHarmonizer.HackComponentA'
    begin object name=HackComponentA
    end object
    HackComponent=HackComponentA
    TeamID_PhysMaterialIndex=0
    // Reference: CylinderComponent'Default__LPTotemProtoHarmonizer.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[0]=CollisionCylinder
    Components[1]=HackComponentA
    // Reference: LPTotemInteractionMetaData'Default__LPTotemProtoHarmonizer.TotemInteract0'
    begin object name=TotemInteract0
    end object
    InteractionMetaData=TotemInteract0
    CollisionComponent=CollisionCylinder
}