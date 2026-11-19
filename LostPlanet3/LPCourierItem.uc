class LPCourierItem extends LPSkeletalMeshActor
    nativereplication
    hidecategories(Navigation);

enum ECourierState
{
    ECourierState_Default,          // 0
    ECourierState_Home,             // 1
    ECourierState_Capturing,        // 2
    ECourierState_Carried,          // 3
    ECourierState_Dropping,         // 4
    ECourierState_Dropped,          // 5
    ECourierState_Delivering,       // 6
    ECourierState_Delivered,        // 7
    ECourierState_Returning,        // 8
    ECourierState_MAX               // 9
};

var(0.25_Pct) /*0x27940000-0x00000000*/ private @NULL CourierTuneData[65537];
var(0.25_Pct) /*0x27940000-0x00000000*/ private bool bEnabled[2162689];
var(0.25_Pct) /*0x27940000-0x00000000*/ private bool bUsePickUpSpecialMove[65537];
var(0.25_Pct) /*0x27940000-0x00000000*/ private bool bUseDeliverSpecialMove[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDestination;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHomeInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMarkedForRemoval;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIntercepted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsBeingPickedUp;
var(0.25_Pct) /*0x27940000-0x00000000*/ private byte Team[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPCourierItem.ECourierState CourierState[2097153];
var(0.25_Pct) /*0x27940000-0x00000000*/ private Actor DestinationA[2162689];
var(0.25_Pct) /*0x27940000-0x00000000*/ private Actor DestinationB[2162689];
var(0.25_Pct) /*0x27940000-0x00000000*/ private float ReturnHomeTimeAfterDelivered[65537];
var(0.25_Pct) /*0x27940000-0x00000000*/ private float ReturnHomeTimeAfterDropped[65537];
var(0.25_Pct) /*0x27940000-0x00000000*/ private float IconZOffsetDestination[65537];
var(0.25_Pct) /*0x27940000-0x00000000*/ private class PickUpSpecialMoveOverride[65537];
var(0.25_Pct) /*0x27940000-0x00000000*/ private class DeliverSpecialMoveOverride[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL VisibleMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EdgeGlowMIC[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NeutralColorInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel Actor Carrier[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private Actor LastCarrier[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastCarrierPRI[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HomeLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HomeRotation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int PickupFX[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int DeliverFX[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int ReturnFX[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel name AttachedToSocketName[2097153];
var(0.25_Pct) /*0x9AE30000-0x00000400*/ private const export @NULL ObjectiveComponent[589825];

simulated event GetMasterTuneDataReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CourierTuneData;
    //return ReturnValue;    
}

simulated function @NULL InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609], DLE;

    CourierTuneData = LPTuneDataCourierItem(TuneData);
    // End:0x9E
    if(CourierTuneData.SkeletalMeshComponent != none)
    {
        SkeletalMeshComponent = new (self) Class'Engine.SkeletalMeshComponent' (CourierTuneData.SkeletalMeshComponent);
        VisibleMesh = SkeletalMeshComponent;
        AttachComponent(VisibleMesh);        
    }
    else
    {
        // End:0x10A
        if(CourierTuneData.StaticMeshComponent != none)
        {
            VisibleMesh = new (self) Class'Engine.StaticMeshComponent' (CourierTuneData.StaticMeshComponent);
            AttachComponent(VisibleMesh);
        }
    }
    // End:0x1EF
    if(VisibleMesh != none)
    {
        DLE = new Class'Engine.DynamicLightEnvironmentComponent';
        DLE.bUseBooleanEnvironmentShadowing = false;
        DLE.bSynthesizeSHLight = false;
        DLE.SetTickGroup(1);
        DLE.SetEnabled(true);
        AttachComponent(DLE);
        VisibleMesh.SetLightEnvironment(DLE);
    }
    super(Actor).InitTuneData(TuneData);
    //return;    
}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    super(SPSkeletalMeshActor).PostBeginPlay();
    InitColorFX();
    InitCollision();
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.CourierItemList.Find(self);    
    // End:0xB4
    if(iIndex == -1)
    {
        LPMI.CourierItemList.AddItem(self);        
    }
    //return;    
}

simulated function Destroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    super(SkeletalMeshActor).Destroyed();
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.CourierItemList.Find(self);    
    // End:0xA3
    if(iIndex >= 0)
    {
        LPMI.CourierItemList.Remove(iIndex, 1);        
    }
    //return;    
}

simulated function InitCollision()
{
    CylinderComponent(CollisionComponent).SetCylinderSize(CourierTuneData.CollisionRadius, CourierTuneData.CollisionHeight);
    CollisionComponent.SetTranslation(CourierTuneData.CollisionOffset);
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x69
    if(VarName == 'PickupFX')
    {
        PlayCourierFX(CourierTuneData.PickupFXEventName, CourierTuneData.PickupSoundEventName, PickupFX);        
    }
    else
    {
        // End:0xD2
        if(VarName == 'DeliverFX')
        {
            PlayCourierFX(CourierTuneData.DeliverFXEventName, CourierTuneData.DeliverSoundEventName, DeliverFX);            
        }
        else
        {
            // End:0x13B
            if(VarName == 'ReturnFX')
            {
                PlayCourierFX(CourierTuneData.ReturnFXEventName, CourierTuneData.ReturnSoundEventName, ReturnFX);                
            }
            else
            {
                // End:0x169
                if(VarName == 'CourierState')
                {
                    NotifyHUDStateChanged();
                    UpdateCarrier();                    
                }
                else
                {
                    // End:0x18D
                    if(VarName == 'Carrier')
                    {
                        UpdateCarrier();                        
                    }
                    else
                    {
                        // End:0x1BA
                        if(VarName == 'AttachedToSocketName')
                        {
                            AttachToSocket(AttachedToSocketName);                            
                        }
                        else
                        {
                            super(SPSkeletalMeshActor).ReplicatedEvent(VarName);
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function ValidTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function RecheckValidTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL P;

    // End:0x43
    foreach TouchingActors(Class'Engine.Pawn', P)
    {
        Touch(P, none, Location, vect(0.0000000, 0.0000000, 1.0000000));        
    }    
    //return;    
}

function TouchedPickup()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], LPPP;

    LPPP = LPPlayerPawn(Other);
    TriggerEventClass(Class'LPSeqEvent_ObjectiveTouched', Other);
    // End:0x124
    if((LPPP != none) && LPPP.IsAliveAndWell())
    {
        // End:0x9B
        if(CanUse(LPPP))
        {
            GiveTo(LPPP);            
        }
        else
        {
            // End:0x124
            if(int(CourierState) != int(1))
            {
                LastCarrier = LPPP;
                SendHome(Other);
                PlayCourierFX(CourierTuneData.ReturnFXEventName, CourierTuneData.ReturnSoundEventName, ReturnFX);
            }
        }
    }
    //return;    
}

function UnTouched()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    TriggerEventClass(Class'LPSeqEvent_ObjectiveUntouched', Other);
    ActorNotifyProximity(Other,, false);
    //return;    
}

function TouchedDestination()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dest[8388609];

    //return;    
}

function UnTouchedDestination()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dest[8388609];

    //return;    
}

function ActorNotifyProximity()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDest[9437185], bNearby;
    local /*0x97E50000-0x00000000*/ private @NULL LPPP, LPPC;

    false
    true
    LPPP = LPPlayerPawn(Other);
    // End:0xA9
    if(LPPP != none)
    {
        LPPC = LPPlayerController(LPPP.Controller);
        // End:0xA9
        if(LPPC != none)
        {
            LPPC.ClientNotifyProximityToCourierItem(self, bDest, bNearby);
        }
    }
    //return;    
}

simulated function PlayCourierFX()
{
    local /*0x97E50000-0x00000000*/ private name FXEventName[8388609], SoundEventName;
    local /*0x97E50000-0x00000000*/ private int RepVariable[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL LPPP;

    // End:0x172
    if((FXEventName != 'None') || SoundEventName != 'None')
    {
        // End:0x4F
        if(int(Role) == int(ROLE_Authority))
        {
            RepVariable++;
        }
        LPPP = LPPlayerPawn(Carrier);
        LPPP = ((LPPP != none) ? LPPP : LPPlayerPawn(LastCarrier));
        // End:0x172
        if(LPPP != none)
        {
            // End:0x109
            if(FXEventName != 'None')
            {
                LPPP.LocalParticleFX(FXEventName, vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, -16384));
            }
            // End:0x172
            if(SoundEventName != 'None')
            {
                LPPP.TuneDataPawnSoundEventBindings.PlayEventSoundLocally(SoundEventName, 'None', LPPP, none, none);
            }
        }
    }
    //return;    
}

simulated function InitColorFX()
{
    local /*0x97E50000-0x00000000*/ private @NULL MI;
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x173
    if(CourierTuneData.bTeamColorEnabled && EdgeGlowMIC == none)
    {
        Idx = 0;
        J0x3E:

        // End:0x173 [Loop If]
        if(Idx < VisibleMesh.GetNumElements())
        {
            MI = VisibleMesh.GetMaterial(Idx);
            // End:0x165
            if((MI != none) && MI.GetPhysicalMaterial() == CourierTuneData.TeamColorPhysMaterial)
            {
                EdgeGlowMIC = VisibleMesh.CreateAndSetMaterialInstanceConstant(Idx);
                // End:0x165
                if(EdgeGlowMIC != none)
                {
                    NeutralColorInfo = Class'LPPawn'.static.GetEdgeGlowFromMIC(EdgeGlowMIC);
                    return;
                }
            }
            Idx++;
            // [Loop Continue]
            goto J0x3E;
        }
    }
    //return;    
}

simulated function UpdateColorFX()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], LPP;
    local /*0x97E50000-0x00000000*/ private int TeamColorIndex;

    // End:0x202
    if(A == self)
    {
        // End:0x200
        if(EdgeGlowMIC != none)
        {
            TeamColorIndex = ((Carrier != none) ? int(Carrier.GetTeamNum()) : -1);
            // End:0x117
            if(TeamColorIndex == 0)
            {
                // End:0x114
                if(CourierTuneData.TeamColorNevec.EdgeGlowBlends.Length > 0)
                {
                    Class'LPPawn'.static.ApplyEdgeGlowToMIC(EdgeGlowMIC, CourierTuneData.TeamColorNevec.EdgeGlowBlends[0].EndColorInfo);
                }                
            }
            else
            {
                // End:0x1CF
                if(TeamColorIndex == 1)
                {
                    // End:0x1CC
                    if(CourierTuneData.TeamColorPirates.EdgeGlowBlends.Length > 0)
                    {
                        Class'LPPawn'.static.ApplyEdgeGlowToMIC(EdgeGlowMIC, CourierTuneData.TeamColorPirates.EdgeGlowBlends[0].EndColorInfo);
                    }                    
                }
                else
                {
                    Class'LPPawn'.static.ApplyEdgeGlowToMIC(EdgeGlowMIC, NeutralColorInfo);
                }
            }
        }
        return;
    }
    LPP = LPPawn(A);
    // End:0x333
    if(LPP != none)
    {
        TeamColorIndex = ((Carrier == A) ? int(Carrier.GetTeamNum()) : -1);
        // End:0x2C5
        if(TeamColorIndex == 0)
        {
            LPP.StartEdgeGlow(CourierTuneData.TeamColorNevec);            
        }
        else
        {
            // End:0x314
            if(TeamColorIndex == 1)
            {
                LPP.StartEdgeGlow(CourierTuneData.TeamColorPirates);                
            }
            else
            {
                LPP.StopEdgeGlow();
            }
        }
    }
    //return;    
}

function GiveTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL CarrierActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInteracted[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPP, TouchingLPP;

    false
    // End:0x25F
    if(bEnabled && !bIsBeingPickedUp)
    {
        // End:0x6E
        if(CourierTuneData.bInteractToPickup && !bInteracted)
        {
            ActorNotifyProximity(CarrierActor);            
        }
        else
        {
            LPP = LPPlayerPawn(CarrierActor);
            // End:0x25F
            if((LPP != none) && LPP.Controller != none)
            {
                // End:0x24A
                if(bUsePickUpSpecialMove && (PickUpSpecialMoveOverride != none) || CourierTuneData.PickUpSpecialMoveClass != none)
                {
                    // End:0x247
                    if(CanUse(LPPlayerPawn(CarrierActor)))
                    {
                        UpdateAnimatedPickupHeight(LPP);
                        // End:0x1A0
                        if(PickUpSpecialMoveOverride != none)
                        {
                            LPPlayerController(LPP.Controller).ServerDictateSpecialMove(PickUpSpecialMoveOverride, false, None, self);                            
                        }
                        else
                        {
                            LPPlayerController(LPP.Controller).ServerDictateSpecialMove(CourierTuneData.PickUpSpecialMoveClass, false, None, self);
                        }
                        // End:0x23A
                        foreach TouchingActors(Class'LPPlayerPawn', TouchingLPP)
                        {
                            UnTouch(TouchingLPP);                            
                        }                        
                        bIsBeingPickedUp = true;
                    }                    
                }
                else
                {
                    SetCarrier(LPP);
                }
            }
        }
    }
    //return;    
}

function NotifyPickUpAttemptFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    bIsBeingPickedUp = false;
    // End:0x48
    if(Carrier == none)
    {
        // End:0x47
        foreach TouchingActors(Class'LPPlayerPawn', LPP)
        {
            TouchedPickup(LPP);            
        }        
    }
    //return;    
}

function UpdateAnimatedPickupHeight()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];
    local /*0x97E50000-0x00000000*/ private float zdiff;

    zdiff = Location.Z - LPP.Location.Z;
    // End:0xBC
    if(zdiff <= CourierTuneData.PickupLowZThreshold)
    {
        LPP.TemplateLogicData.AnimatedPickupHeight = 0;        
    }
    else
    {
        // End:0x11F
        if(zdiff >= CourierTuneData.PickupHighZThreshold)
        {
            LPP.TemplateLogicData.AnimatedPickupHeight = 2;            
        }
        else
        {
            LPP.TemplateLogicData.AnimatedPickupHeight = 1;
        }
    }
    //return;    
}

function TryDeliver()
{
    local /*0x97E50000-0x00000000*/ private bool bInteracted[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    // End:0x4C
    if(CourierTuneData.bInteractToDeliver && !bInteracted)
    {
        ActorNotifyProximity(Carrier, true, true);        
    }
    else
    {
        // End:0x1B2
        if(bDestination)
        {
            LPP = LPPlayerPawn(Carrier);
            // End:0x1A6
            if((bUseDeliverSpecialMove && LPP != none) && (DeliverSpecialMoveOverride != none) || CourierTuneData.DeliverSpecialMoveClass != none)
            {
                // End:0x135
                if(DeliverSpecialMoveOverride != none)
                {
                    LPPlayerController(LPP.Controller).ServerDictateSpecialMove(DeliverSpecialMoveOverride, false, None, self);                    
                }
                else
                {
                    LPPlayerController(LPP.Controller).ServerDictateSpecialMove(CourierTuneData.DeliverSpecialMoveClass, false, None, self);
                }                
            }
            else
            {
                Deliver();
            }
        }
    }
    //return;    
}

function CanUse()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPP[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x75
    if((LPPP != none) && LPPP.IsAliveAndWell())
    {
        // End:0x75
        if((IsFootballMode()) || int(LPPP.GetTeamNum()) == int(Team))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function IsFootballMode()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (int(Team) == int(3)) || int(Team) == int(2);
    //return ReturnValue;    
}

function SetCarrier()
{
    local /*0x97E50000-0x00000000*/ private @NULL CarrierActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceCarrier[9437185], bUseFX;
    local /*0x97E50000-0x00000000*/ private @NULL LPPP;

    false
    true
    // End:0x130
    if(bForceCarrier || bEnabled && CanUse(LPPlayerPawn(CarrierActor)))
    {
        Carrier = CarrierActor;
        TriggerEventClass(Class'LPSeqEvent_ObjectivePickedUp', Carrier, int(Carrier.GetTeamNum()));
        // End:0xC5
        foreach TouchingActors(Class'LPPlayerPawn', LPPP)
        {
            UnTouch(LPPP);            
        }        
        // End:0x122
        if(bUseFX)
        {
            PlayCourierFX(CourierTuneData.PickupFXEventName, CourierTuneData.PickupSoundEventName, PickupFX);
        }
        GotoState('Carried');
    }
    //return;    
}

function Drop()
{
    local /*0x97E50000-0x00000000*/ private bool bSendHome[9437185];
    local /*0x97E50000-0x00000000*/ private int TeamNum;

    false
    bIntercepted = false;
    bDestination = false;
    TeamNum = ((LPAIPawnAkrid(Carrier) != none) ? 2 : int(Carrier.GetTeamNum()));
    TriggerEventClass(Class'LPSeqEvent_ObjectiveDropped', Carrier, TeamNum);
    // End:0xA6
    if(bSendHome)
    {
        SendHome();        
    }
    else
    {
        GotoState('Dropping');
    }
    MulticastDrop();
    //return;    
}

reliable client simulated function MulticastDrop()
{
    AttachToSocket('None');
    //return;    
}

function Deliver()
{
    local /*0x97E50000-0x00000000*/ private bool bForceDeliver[9437185], bUseFX;
    local /*0x97E50000-0x00000000*/ private @NULL LPC, LPP;

    false
    true
    // End:0x1D6
    if(bForceDeliver || bDestination)
    {
        LPP = LPPlayerPawn(Carrier);
        // End:0x118
        if(LPP != none)
        {
            // End:0xB0
            if(bIntercepted)
            {
                LPPRI(LPP.PlayerReplicationInfo).ServerGiveAward('Emblem_EndzoneRun');
                bIntercepted = false;
            }
            LPC = LPPlayerController(LPP.Controller);
            // End:0x118
            if(LPC != none)
            {
                LPC.IncrementStat('Stat_FlagsCaptured');
            }
        }
        TriggerEventClass(Class'LPSeqEvent_ObjectiveReachedDest', LPC, int(Carrier.GetTeamNum()));
        ActorNotifyProximity(Carrier,, false);
        // End:0x1C8
        if(bUseFX)
        {
            PlayCourierFX(CourierTuneData.DeliverFXEventName, CourierTuneData.DeliverSoundEventName, DeliverFX);
        }
        GotoState('Delivered');
    }
    //return;    
}

function SendHome()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[9437185];
    local /*0x97E50000-0x00000000*/ private int SenderTeam;

    SenderTeam = ((Sender != none) ? int(Sender.GetTeamNum()) : -1);
    TriggerEventClass(Class'LPSeqEvent_ObjectiveReachedSource', Sender, SenderTeam);
    GotoState('Home');
    //return;    
}

simulated function UpdateCarrier()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private bool bShouldHide, bCarriedByAkrid;

    LPP = LPPawn(Carrier);
    // End:0xB8
    if(LPP != none)
    {
        // End:0x85
        if(bMarkedForRemoval)
        {
            AttachToSocket('None');
            LPP.RemoveCourierItem(self);
            bMarkedForRemoval = false;
            Carrier = none;            
        }
        else
        {
            AttachToSocket(AttachedToSocketName);
            LPP.AddCourierItem(self);
        }
    }
    switch(CourierState)
    {
        // End:0xFE
        case 1:
            VisibleMesh.SetHidden(!bEnabled);
            // End:0x20B
            break;
        // End:0x1BD
        case 3:
            bCarriedByAkrid = LPAIPawnAkrid(Carrier) != none;
            bShouldHide = (bCarriedByAkrid && CourierTuneData.bHideWhileCarriedByAkrid) || !bCarriedByAkrid && CourierTuneData.bHideWhileCarried;
            VisibleMesh.SetHidden(bShouldHide);
            // End:0x20B
            break;
        // End:0x1E5
        case 7:
            VisibleMesh.SetHidden(true);
            // End:0x20B
            break;
        // End:0xFFFF
        default:
            VisibleMesh.SetHidden(false);
            // End:0x20B
            break;
            break;
    }
    // End:0x25E
    if(CourierTuneData.bTeamColorEnabled)
    {
        UpdateColorFX(self);
        UpdateColorFX(LastCarrier);
        UpdateColorFX(Carrier);
    }
    //return;    
}

function OnObjectiveSetDestination()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], A;

    // End:0xC0
    if(inAction.Destination != none)
    {
        bDestination = false;
        DestinationA = inAction.Destination;
        // End:0xC0
        if(DestinationA != none)
        {
            // End:0xBF
            foreach DestinationA.TouchingActors(Class'Engine.Actor', A)
            {
                // End:0xBE
                if(Carrier == A)
                {
                    TouchedDestination(DestinationA);
                }                
            }            
        }
    }
    //return;    
}

simulated function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    Reset();
    // End:0x109
    if(bEnabled)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveBegin', self);
    }
    //return;    
}

function OnObjectiveFinish()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    CheckForLoneWolf();
    //return;    
}

function SetCourierState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    CourierState = NewState;
    NotifyHUDStateChanged();
    UpdateCarrier();
    //return;    
}

simulated function NotifyHUDStateChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    // End:0x79
    foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
    {
        // End:0x78
        if(LPC.myLPHUD != none)
        {
            LPC.myLPHUD.CourierItemChangedState(self);
        }        
    }    
    //return;    
}

function CheckForInterception()
{
    local /*0x97E50000-0x00000000*/ private @NULL VictimPRI, CarrierPRI;

    bIntercepted = false;
    VictimPRI = LPPRI(LastCarrierPRI);
    // End:0x121
    if((VictimPRI != none) && VictimPRI.LastKillerPRI != none)
    {
        CarrierPRI = LPPRI(Pawn(Carrier).PlayerReplicationInfo);
        // End:0x121
        if(((CarrierPRI != none) && CarrierPRI != VictimPRI) && CarrierPRI == VictimPRI.LastKillerPRI)
        {
            CarrierPRI.ServerGiveAward('Emblem_Interception');
            bIntercepted = true;
        }
    }
    //return;    
}

function CheckForLoneWolf()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    PRI = LPPRI(Pawn(Carrier).PlayerReplicationInfo);
    // End:0xC0
    if((PRI != none) && !PRI.CheckForNearbyPlayers(Class'LPAwardManager'.static.GetDefaultAwardParam('Emblem_LoneWolf'), true))
    {
        PRI.ServerGiveAward('Emblem_LoneWolf');
    }
    //return;    
}

simulated function AttachToSocket()
{
    local /*0x97E50000-0x00000000*/ private name SocketName[8388609];

    AttachedToSocketName = SocketName;
    // End:0x15F
    if(Carrier != none)
    {
        // End:0x9C
        if(SocketName == 'None')
        {
            Pawn(Carrier).Mesh.DetachComponent(VisibleMesh);
            AttachComponent(VisibleMesh);
            SetBase(none);            
        }
        else
        {
            // End:0x151
            if(Pawn(Carrier).Mesh.GetSocketByName(SocketName) != none)
            {
                SetBase(Carrier,,, SocketName);
                Pawn(Carrier).Mesh.AttachComponentToSocket(VisibleMesh, SocketName);                
            }
            else
            {
                AttachToCarryLocation(true);
            }
        }        
    }
    else
    {
        VisibleMesh.DetachFromAny();
        AttachComponent(VisibleMesh);
        SetBase(none);
    }
    //return;    
}

simulated function AttachToPickupLocation()
{
    // End:0x54
    if(CourierTuneData.PickUpSocket != 'None')
    {
        AttachToSocket(CourierTuneData.PickUpSocket);
    }
    //return;    
}

simulated function AttachToCarryLocation()
{
    local /*0x97E50000-0x00000000*/ private bool bNoSocket[9437185];

    false
    // End:0xD2
    if(bNoSocket || CourierTuneData.CarriedSocket == 'None')
    {
        AttachedToSocketName = 'NoSocket';
        SetBase(Carrier,,, CourierTuneData.CarriedBone);
        SetRelativeLocation(CourierTuneData.CarriedOffset);
        SetRelativeRotation(CourierTuneData.CarriedRotation);        
    }
    else
    {
        AttachToSocket(CourierTuneData.CarriedSocket);
    }
    //return;    
}

simulated function AttachToDeliverLocation()
{
    // End:0x54
    if(CourierTuneData.DeliverSocket != 'None')
    {
        AttachToSocket(CourierTuneData.DeliverSocket);
    }
    //return;    
}

simulated function DetachFromCarrier()
{
    AttachToSocket('None');
    //return;    
}

simulated function GetDestinationActor()
{
    local /*0x97E50000-0x00000000*/ private int DestinationTeamNum[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    0
    // End:0x32
    if((DestinationB != none) && DestinationTeamNum == 1)
    {
        return DestinationB;        
    }
    else
    {
        return DestinationA;
    }
    //return ReturnValue;    
}

simulated function Reset()
{
    GotoState('Home',, true);
    //return;    
}

function ExternalTriggerEvent()
{
    local /*0x97E50000-0x00000000*/ private class EventClassToTrigger[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(EventInstigator == none)
    {
        EventInstigator = self;
    }
    return TriggerEventClass(EventClassToTrigger, EventInstigator);
    //return ReturnValue;    
}

auto state Home
{
    ignores SendHome;

    event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

        TouchedPickup(Other);
        //return;        
    }

    event UnTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

        UnTouched(Other);
        //return;        
    }

    function Timer()
    {
        BeginState('None');
        //return;        
    }

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        SetPhysics(0);
        bCollideWorld = false;
        LastCarrierPRI = none;
        // End:0x66
        if(!bHomeInit)
        {
            HomeLocation = Location;
            HomeRotation = Rotation;
            bHomeInit = true;
            SetCollision(true);            
        }
        else
        {
            SetCollision(false);
            SetBase(none);
            // End:0x9E
            if(SetLocation(HomeLocation))
            {
                SetRotation(HomeRotation);
                SetCollision(true);                
            }
            else
            {
                SetTimer(1.0000000);
            }
        }
        SetCourierState(1);
        //return;        
    }
    stop;    
}

state Carried
{
    event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

        // End:0x54
        if((Other != none) && (Other == DestinationA) || Other == DestinationB)
        {
            TouchedDestination(Other);
        }
        //return;        
    }

    event UnTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

        // End:0x54
        if((Other != none) && (Other == DestinationA) || Other == DestinationB)
        {
            UnTouchedDestination(Other);
        }
        //return;        
    }

    function TouchedDestination()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Dest[8388609];

        // End:0x91
        if(IsFootballMode())
        {
            // End:0x91
            if(((Dest == DestinationA) && int(Carrier.GetTeamNum()) != 0) || (Dest == DestinationB) && int(Carrier.GetTeamNum()) != 1)
            {
                return;
            }
        }
        bDestination = true;
        TryDeliver();
        //return;        
    }

    function UnTouchedDestination()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Dest[8388609];

        // End:0x91
        if(IsFootballMode())
        {
            // End:0x91
            if(((Dest == DestinationA) && int(Carrier.GetTeamNum()) != 0) || (Dest == DestinationB) && int(Carrier.GetTeamNum()) != 1)
            {
                return;
            }
        }
        bDestination = false;
        UnTouched(Carrier);
        //return;        
    }

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPP, TouchingActor;

        bIsBeingPickedUp = false;
        SetCollision(false);
        SetPhysics(0);
        bCollideWorld = false;
        // End:0x54
        if(CourierTuneData.PickUpSpecialMoveClass != none)
        {
            AttachToPickupLocation();            
        }
        else
        {
            AttachToCarryLocation();
        }
        LPP = LPPawn(Carrier);
        // End:0xAA
        if(LPP != none)
        {
            LPP.AddCourierItem(self);
        }
        CheckForInterception();
        SetCourierState(3);
        bDestination = false;
        // End:0x13D
        foreach Carrier.TouchingActors(Class'Engine.Actor', TouchingActor)
        {
            // End:0x13C
            if((TouchingActor == DestinationA) || TouchingActor == DestinationB)
            {
                TouchedDestination(TouchingActor);
            }            
        }        
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        DetachFromCarrier();
        LastCarrier = Carrier;
        LastCarrierPRI = ((Pawn(Carrier) != none) ? Pawn(Carrier).PlayerReplicationInfo : none);
        bMarkedForRemoval = true;
        //return;        
    }
    stop;    
}

state Dropping
{
    ignores Touch, UnTouch;

    event Landed()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor, Extent, Loc, Norm;

        local /*0x97E50000-0x00000000*/ private float Dist;

        Loc = Location + vect(0.0000000, 0.0000000, 50.0000000);
        Extent = vect(1.0000000, 1.0000000, 1.0000000);
        Class'SPEngine.SPUtil'.static.DistanceToGround(Loc, Extent, Norm, Dist);
        Loc.Z -= Dist;
        SetLocation(Loc);
        GotoState('Dropped');
        //return;        
    }

    simulated event FellOutOfWorld()
    {
        local /*0x97E50000-0x00000000*/ private class dmgType[8388609];

        SendHome();
        //return;        
    }

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private float DropAngle;

        VisibleMesh.SetHidden(false);
        SetPhysics(2);
        bCollideWorld = true;
        SetLocation(Carrier.Location);
        Velocity = Carrier.Velocity * 0.5000000;
        Velocity.Z += CourierTuneData.DropMaxVelocity.Z;
        DropAngle = (FRand() * float(2)) * 3.1415930;
        Velocity.X += (Cos(DropAngle) * CourierTuneData.DropMaxVelocity.X);
        Velocity.Y += (Sin(DropAngle) * CourierTuneData.DropMaxVelocity.Y);
        SetCourierState(4);
        //return;        
    }
    stop;    
}

state Dropped
{
    event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

        TouchedPickup(Other);
        //return;        
    }

    event UnTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

        UnTouched(Other);
        //return;        
    }

    function Timer()
    {
        SendHome();
        //return;        
    }

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        SetPhysics(0);
        SetCollision(true);
        bCollideWorld = true;
        SetTimer(30.0000000);
        SetCourierState(5);
        //return;        
    }
    stop;    
}

state Delivered
{
    function Timer()
    {
        SendHome();
        //return;        
    }

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        SetBase(none);
        SetCollision(false);
        VisibleMesh.SetHidden(true);
        SetPhysics(0);
        bDestination = false;
        // End:0x5E
        if(ReturnHomeTimeAfterDelivered >= float(0))
        {
            SetTimer(ReturnHomeTimeAfterDelivered);
        }
        SetCourierState(7);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        LastCarrier = none;
        LastCarrierPRI = none;
        //return;        
    }
    stop;    
}

defaultproperties
{
    bUsePickUpSpecialMove=true
    bUseDeliverSpecialMove=true
    Team=ELPTeams.LPTeam_Neutral
    ReturnHomeTimeAfterDelivered=-1.0000000
    ReturnHomeTimeAfterDropped=30.0000000
    NeutralColorInfo=(bEnableEdgeGlow=true,EdgeGlowColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),bEnableEdgeGlowSharp=false,EdgeGlowRamp=0.0000000,EdgeGlowThresholdRef=0.0000000,EdgeGlowThresholdSlope=0.0000000)
    // Reference: LPObjectiveComponentCTF'Default__LPCourierItem.ObjectiveComp'
    begin object name=ObjectiveComp class=Class'LPObjectiveComponentCTF'
    end object
    ObjectiveComponent=ObjectiveComp
    // Reference: SPHeadTrackComponent'Default__LPCourierItem.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    // Reference: SkeletalMeshComponent'Default__LPCourierItem.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPCourierItem.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPCourierItem.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    // Reference: CylinderComponent'Default__LPCourierItem.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'Engine.CylinderComponent'
    end object
    Components[4]=CollisionCylinder
    Components[5]=ObjectiveComp
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=false
    bCanStepUpOn=false
    bAlwaysRelevant=true
    bUpdateSimulatedPosition=true
    bCollideActors=true
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}