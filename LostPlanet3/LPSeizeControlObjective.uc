class LPSeizeControlObjective extends Actor
    abstract
    nativereplication
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0xB0590000-0x00000000*/ private editfixedsize array ControlVolumes[65537];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private bool bEnabled[65537];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private bool bVsAkrid[65537];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private bool bClampTicketsToMax[65537];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private bool bOnlyAwardToOccupyingPlayers[65537];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private bool bOnlyAwardWhileOccupied[65537];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private bool bOnlyAwardWhileNotLosingControl[65537];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private bool bOnlyAwardWhileFullyControlled[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bIsControlled[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bIsTotalControlled[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int EnabledRepCount[2097153];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private float TotalControlAmount[2162689];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private byte InitialControlTeam[65537];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private float TicketRegenRate[65537];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private int TicketBonusForFullControl[65537];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private int CreditsPerSecond[65537];
var(0.25_Pct) /*0xB0590000-0x00000000*/ private float CreditBonusForFullControl[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int ControlTeamIndex[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int OccupyingTeamIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ControlAmount[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayerControlRateMultiplier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AkridControlRateMultiplier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel Actor TouchedPlayer[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel Actor UnTouchedPlayer[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataSC;
var(0.25_Pct) /*0x9AE30000-0x00000400*/ private const export @NULL ObjectiveComponent[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TotalPlayersInVolume[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PlayersInVolume[2];

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x56
    if(((VarName == 'bIsControlled') || VarName == 'bIsTotalControlled') || VarName == 'ControlTeamIndex')
    {
        NotifyHUDStateChanged();        
    }
    else
    {
        // End:0x84
        if(VarName == 'TouchedPlayer')
        {
            NotifyHUDTouchChanged(TouchedPlayer, true);            
        }
        else
        {
            // End:0xB2
            if(VarName == 'UnTouchedPlayer')
            {
                NotifyHUDTouchChanged(UnTouchedPlayer, false);                
            }
            else
            {
                // End:0xD6
                if(VarName == 'EnabledRepCount')
                {
                    UpdateEnabled();                    
                }
                else
                {
                    super.ReplicatedEvent(VarName);
                }
            }
        }
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    NotifyHUDTouchChanged(Other, true);
    // End:0x7B
    if(!bVsAkrid && (int(Other.GetTeamNum()) == 2) || int(Other.GetTeamNum()) == int(255))
    {
        return;
    }
    // End:0xA7
    if(bEnabled)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveTouched', Other);
    }
    //return;    
}

event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    NotifyHUDTouchChanged(Other, false);
    // End:0x7B
    if(!bVsAkrid && (int(Other.GetTeamNum()) == 2) || int(Other.GetTeamNum()) == int(255))
    {
        return;
    }
    // End:0xA7
    if(bEnabled)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveUntouched', Other);
    }
    //return;    
}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCVolume, LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    super.PostBeginPlay();
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.SeizeControlItemList.Find(self);    
    // End:0xA0
    if(iIndex == -1)
    {
        LPMI.SeizeControlItemList.AddItem(self);        
    }
    // End:0x10B
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0xEC
        foreach ControlVolumes(SCVolume)
        {
            SCVolume.MyObjective = self;            
        }        
        SetControlTeam(InitialControlTeam);
        TotalPlayersInVolume = 0;
    }
    //return;    
}

simulated function Destroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    super.Destroyed();
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.SeizeControlItemList.Find(self);    
    // End:0xA3
    if(iIndex >= 0)
    {
        LPMI.SeizeControlItemList.Remove(iIndex, 1);        
    }
    //return;    
}

event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPrevControlled, bPrevTotalControlled;
    local /*0x97E50000-0x00000000*/ private int PrevOccupyingTeamIndex, PrevControlTeamIndex;
    local /*0x97E50000-0x00000000*/ private float PrevControlPercent, ControlPercent;
    local /*0x97E50000-0x00000000*/ private bool bShouldStartAwardTimers, bShouldStopAwardTimers;

    super.Tick(DeltaTime);
    // End:0x6BC
    if(bEnabled)
    {
        bPrevControlled = bIsControlled;
        bPrevTotalControlled = bIsTotalControlled;
        PrevControlTeamIndex = ControlTeamIndex;
        PrevControlPercent = GetControlPercent();
        PrevOccupyingTeamIndex = OccupyingTeamIndex;
        UpdateControlAmount(DeltaTime);
        ControlPercent = GetControlPercent();
        bIsTotalControlled = ControlPercent == float(100);
        // End:0x1A6
        if(bIsControlled && (ControlPercent <= TuneDataSC.NeutralPercentThreshhold) || PrevControlTeamIndex != ControlTeamIndex)
        {
            bIsControlled = false;
            TriggerEventClass(Class'LPSeqEvent_ObjectiveNeutralized', SPTeamInfo(WorldInfo.GRI.Teams[1 - PrevControlTeamIndex]).TeamMembers[0], 1 - PrevControlTeamIndex);
        }
        // End:0x255
        if(!bIsControlled && bIsTotalControlled)
        {
            bIsControlled = true;
            TriggerEventClass(Class'LPSeqEvent_ObjectiveControlled', SPTeamInfo(WorldInfo.GRI.Teams[ControlTeamIndex]).TeamMembers[0], ControlTeamIndex);
            AwardFullControlBonus();
        }
        // End:0x315
        if(PrevControlTeamIndex != ControlTeamIndex)
        {
            // End:0x29A
            if(ControlTeamIndex == -1)
            {
                TriggerEventClass(Class'LPSeqEvent_ObjectiveChangedControl', none, 2);                
            }
            else
            {
                TriggerEventClass(Class'LPSeqEvent_ObjectiveChangedControl', SPTeamInfo(WorldInfo.GRI.Teams[ControlTeamIndex]).TeamMembers[0], ControlTeamIndex);
            }
        }
        // End:0x43F
        if(PrevOccupyingTeamIndex != OccupyingTeamIndex)
        {
            // End:0x3B5
            if(OccupyingTeamIndex == -1)
            {
                TriggerEventClass(Class'LPSeqEvent_ObjectiveUnoccupied', SPTeamInfo(WorldInfo.GRI.Teams[PrevOccupyingTeamIndex]).TeamMembers[0]);                
            }
            else
            {
                // End:0x43F
                if(!bIsTotalControlled)
                {
                    TriggerEventClass(Class'LPSeqEvent_ObjectiveOccupied', SPTeamInfo(WorldInfo.GRI.Teams[OccupyingTeamIndex]).TeamMembers[0], OccupyingTeamIndex);
                }
            }
        }
        // End:0x496
        if(((PrevControlTeamIndex != ControlTeamIndex) || bPrevControlled != bIsControlled) || bPrevTotalControlled != bIsTotalControlled)
        {
            NotifyHUDStateChanged();
        }
        // End:0x6BC
        if(((int(Role) == int(ROLE_Authority)) && (TicketRegenRate > float(0)) || CreditsPerSecond > 0) && !bVsAkrid)
        {
            // End:0x5D4
            if(IsTimerActive('HandleRespawnTickets') || IsTimerActive('HandleCreditAwards'))
            {
                bShouldStopAwardTimers = (((ControlPercent == 0.0000000) || bOnlyAwardWhileFullyControlled && !bIsTotalControlled) || bOnlyAwardWhileNotLosingControl && ControlPercent < PrevControlPercent) || bOnlyAwardWhileOccupied && PlayersInVolume[ControlTeamIndex] <= 0;
                // End:0x5D1
                if(bShouldStopAwardTimers)
                {
                    ClearTimer('HandleCreditAwards');
                    ClearTimer('HandleRespawnTickets');
                }                
            }
            else
            {
                bShouldStartAwardTimers = (((ControlPercent > 0.0000000) && !bOnlyAwardWhileFullyControlled || bIsTotalControlled) && !bOnlyAwardWhileNotLosingControl || ControlPercent >= PrevControlPercent) && !bOnlyAwardWhileOccupied || PlayersInVolume[ControlTeamIndex] > 0;
                // End:0x6BC
                if(bShouldStartAwardTimers)
                {
                    // End:0x694
                    if(CreditsPerSecond > 0)
                    {
                        SetTimer(1.0000000, true, 'HandleCreditAwards');
                    }
                    // End:0x6BC
                    if(TicketRegenRate > float(0))
                    {
                        SetTimer(TicketRegenRate, true, 'HandleRespawnTickets');
                    }
                }
            }
        }
    }
    //return;    
}

function UpdateControlAmount()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private int PlayersTeamA, PlayersTeamB, PlayerDifference;
    local /*0x97E50000-0x00000000*/ private float AkridControlAmount, ControlAmountChange;
    local /*0x97E50000-0x00000000*/ private @NULL SCVolume, LPP;
    local /*0x97E50000-0x00000000*/ private byte TeamNum;

    PlayersTeamA = 0;
    PlayersTeamB = 0;
    AkridControlAmount = 0.0000000;
    // End:0x325
    foreach ControlVolumes(SCVolume)
    {
        // End:0x323
        foreach SCVolume.TouchingActors(Class'LPPawn', LPP)
        {
            // End:0x322
            if(LPP.IsAliveAndWell())
            {
                // End:0x173
                if((LPAIPawnHuman(LPP) != none) || (LPBasePlayerPawn(LPP) != none) && (LPPlayerPawn(LPP) == none) || !LPPlayerPawn(LPP).bIncapacitated)
                {
                    TeamNum = LPP.GetTeamNum();
                    // End:0x151
                    if(int(TeamNum) == int(0))
                    {
                        PlayersTeamA++;                        
                    }
                    else
                    {
                        // End:0x170
                        if(int(TeamNum) == int(1))
                        {
                            PlayersTeamB++;
                        }
                    }
                    // End:0x322
                    continue;
                }
                // End:0x322
                if(bVsAkrid)
                {
                    // End:0x1CF
                    if(LPAIPawnAkridSmall(LPP) != none)
                    {
                        AkridControlAmount += (TuneDataSC.AkridSmallControlPerSecond * DeltaTime);
                        // End:0x322
                        continue;
                    }
                    // End:0x238
                    if((LPAIPawnAkridMedium(LPP) != none) || LPAIPawnMedFlyer(LPP) != none)
                    {
                        AkridControlAmount += (TuneDataSC.AkridMediumControlPerSecond * DeltaTime);
                        // End:0x322
                        continue;
                    }
                    // End:0x287
                    if(LPAIPawnAkridLarge(LPP) != none)
                    {
                        AkridControlAmount += (TuneDataSC.AkridLargeControlPerSecond * DeltaTime);
                        // End:0x322
                        continue;
                    }
                    // End:0x2D6
                    if(LPAIPawnAkridExtraLarge(LPP) != none)
                    {
                        AkridControlAmount += (TuneDataSC.AkridExtraLargeControlPerSecond * DeltaTime);
                        // End:0x322
                        continue;
                    }
                    // End:0x322
                    if(LPAIPawnAkridStationary(LPP) != none)
                    {
                        AkridControlAmount += (TuneDataSC.AkridStationaryControlPerSecond * DeltaTime);
                    }
                }
            }            
        }                
    }    
    ControlAmountChange = 0.0000000;
    // End:0x41D
    if(bVsAkrid)
    {
        PlayerDifference = PlayersTeamA + PlayersTeamB;
        // End:0x3FB
        if(PlayerDifference > 0)
        {
            ControlAmountChange += (TuneDataSC.FirstPlayerControlPerSecond * DeltaTime);
            ControlAmountChange += ((float(PlayerDifference - 1) * TuneDataSC.AdditionalPlayersControlPerSecond) * DeltaTime);
            ControlAmountChange *= PlayerControlRateMultiplier;
        }
        ControlAmountChange -= (AkridControlAmount * AkridControlRateMultiplier);        
    }
    else
    {
        PlayerDifference = PlayersTeamA - PlayersTeamB;
        // End:0x501
        if(Abs(float(PlayerDifference)) > float(0))
        {
            ControlAmountChange += (TuneDataSC.FirstPlayerControlPerSecond * DeltaTime);
            ControlAmountChange += (((Abs(float(PlayerDifference)) - float(1)) * TuneDataSC.AdditionalPlayersControlPerSecond) * DeltaTime);
            ControlAmountChange *= PlayerControlRateMultiplier;
            // End:0x501
            if(PlayerDifference < 0)
            {
                ControlAmountChange *= float(-1);
            }
        }
    }
    // End:0x527
    if(ControlTeamIndex == 0)
    {
        ControlAmount += ControlAmountChange;        
    }
    else
    {
        // End:0x54D
        if(ControlTeamIndex == 1)
        {
            ControlAmount -= ControlAmountChange;            
        }
        else
        {
            ControlAmount += ControlAmountChange;
            ControlTeamIndex = 0;
        }
    }
    // End:0x5A5
    if(ControlAmount < float(0))
    {
        ControlAmount *= float(-1);
        ControlTeamIndex = 1 - ControlTeamIndex;
    }
    // End:0x613
    if(((float(PlayersTeamA + PlayersTeamB) + AkridControlAmount) == float(0)) && !bIsControlled)
    {
        ControlAmount -= (TuneDataSC.ErodeAmountPerSecond * DeltaTime);
    }
    ControlAmount = FClamp(ControlAmount, 0.0000000, TotalControlAmount);
    // End:0x656
    if(ControlAmount == float(0))
    {
        ControlTeamIndex = -1;
    }
    PlayersInVolume[0] = PlayersTeamA;
    PlayersInVolume[1] = PlayersTeamB;
    TotalPlayersInVolume = PlayersTeamA + PlayersTeamB;
    // End:0x6C3
    if(PlayersTeamA > PlayersTeamB)
    {
        OccupyingTeamIndex = 0;        
    }
    else
    {
        // End:0x6E8
        if(PlayersTeamB > PlayersTeamA)
        {
            OccupyingTeamIndex = 1;            
        }
        else
        {
            // End:0x706
            if(TotalPlayersInVolume == 0)
            {
                OccupyingTeamIndex = -1;
            }
        }
    }
    //return;    
}

function HandleRespawnTickets()
{
    local /*0x97E50000-0x00000000*/ private @NULL Team;

    Team = LPTeamInfo_MP(WorldInfo.GRI.Teams[ControlTeamIndex]);
    Team.TeamLives++;
    // End:0xDA
    if(bClampTicketsToMax)
    {
        Team.TeamLives = Min(Team.TeamLives, Team.MaxTeamLives);
    }
    //return;    
}

function HandleCreditAwards()
{
    AwardCredits(CreditsPerSecond);
    //return;    
}

function AwardFullControlBonus()
{
    local /*0x97E50000-0x00000000*/ private @NULL Team;

    // End:0x103
    if(!bVsAkrid && TicketBonusForFullControl > 0)
    {
        Team = LPTeamInfo_MP(WorldInfo.GRI.Teams[ControlTeamIndex]);
        Team.TeamLives += TicketBonusForFullControl;
        // End:0x103
        if(bClampTicketsToMax)
        {
            Team.TeamLives = Min(Team.TeamLives, Team.MaxTeamLives);
        }
    }
    AwardCredits(int(CreditBonusForFullControl));
    //return;    
}

function AwardCredits()
{
    local /*0x97E50000-0x00000000*/ private int CreditAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SCVolume, PC, P, PRI;

    // End:0x1F3
    if(CreditAmount > 0)
    {
        // End:0x124
        if(bOnlyAwardToOccupyingPlayers)
        {
            // End:0x120
            foreach ControlVolumes(SCVolume)
            {
                // End:0x11E
                foreach SCVolume.TouchingActors(Class'LPBasePlayerPawn', P)
                {
                    // End:0x11D
                    if(P.IsAliveAndWell() && int(P.GetTeamNum()) == ControlTeamIndex)
                    {
                        PRI = LPPRI(P.PlayerReplicationInfo);
                        // End:0x11D
                        if(PRI != none)
                        {
                            PRI.AddMPCreditsEarned(CreditAmount, true, true);
                        }
                    }                    
                }                                
            }                        
        }
        else
        {
            // End:0x1F2
            foreach WorldInfo.AllControllers(Class'LPPlayerController', PC)
            {
                // End:0x1F1
                if(int(PC.GetTeamNum()) == ControlTeamIndex)
                {
                    PRI = LPPRI(PC.PlayerReplicationInfo);
                    // End:0x1F1
                    if(PRI != none)
                    {
                        PRI.AddMPCreditsEarned(CreditAmount, true, true);
                    }
                }                
            }            
        }
    }
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
            LPC.myLPHUD.SeizeControlPointChangedState(self);
        }        
    }    
    //return;    
}

simulated function NotifyHUDTouchChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsTouching[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    // End:0xAF
    foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
    {
        // End:0xAE
        if(LPC.Pawn == Other)
        {
            // End:0xAE
            if(LPC.myLPHUD != none)
            {
                LPC.myLPHUD.SeizeControlPointChangedTouch(self, bIsTouching);
            }
        }        
    }    
    // End:0x158
    if((int(Role) == int(ROLE_Authority)) && LPPlayerPawn(Other) != none)
    {
        // End:0x123
        if(bIsTouching)
        {
            TouchedPlayer = Other;
            // End:0x120
            if(UnTouchedPlayer == TouchedPlayer)
            {
                UnTouchedPlayer = none;
            }            
        }
        else
        {
            UnTouchedPlayer = Other;
            // End:0x158
            if(TouchedPlayer == UnTouchedPlayer)
            {
                TouchedPlayer = none;
            }
        }
    }
    //return;    
}

function OnToggle()
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
    ResetObjective();
    // End:0x109
    if(bEnabled)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveBegin', self);
    }
    //return;    
}

function OnObjectiveSetControl()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    SetControlTeam(inAction.ControlTeam);
    //return;    
}

function OnObjectiveSetControlRate()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    PlayerControlRateMultiplier = inAction.PlayerControlRateMultiplier;
    AkridControlRateMultiplier = inAction.AkridControlRateMultiplier;
    //return;    
}

function OnObjectiveFinish()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    CheckForLoneWolf();
    //return;    
}

function SetControlTeam()
{
    local /*0x97E50000-0x00000000*/ private byte ControlTeam[8388609];

    // End:0x61
    if((int(ControlTeam) == int(0)) || int(ControlTeam) == int(1))
    {
        bIsControlled = true;
        ControlTeamIndex = int(ControlTeam);
        ControlAmount = TotalControlAmount;        
    }
    else
    {
        bIsControlled = false;
        ControlTeamIndex = -1;
        ControlAmount = 0.0000000;
    }
    //return;    
}

simulated function GetControlPercent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return (100.0000000 * ControlAmount) / TotalControlAmount;
    //return ReturnValue;    
}

simulated function UpdateEnabled()
{
    // End:0x2B
    if(int(Role) != int(ROLE_Authority))
    {
        bEnabled = EnabledRepCount > 0;
    }
    //return;    
}

simulated function Reset()
{
    ResetObjective();
    //return;    
}

function ResetObjective()
{
    SetControlTeam(InitialControlTeam);
    TotalPlayersInVolume = 0;
    // End:0x4D
    if(int(Role) == int(ROLE_Authority))
    {
        EnabledRepCount = ((bEnabled) ? 1 : 0);
    }
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

function IsPlayerGainingControl()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bEnabled)
    {
        return false;
    }
    // End:0x62
    if(bVsAkrid || IsTeamGainingControl(int(P.GetTeamNum())))
    {
        return IsPlayerInVolume(P);
    }
    return false;
    //return ReturnValue;    
}

function IsTeamGainingControl()
{
    local /*0x97E50000-0x00000000*/ private int TeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return PlayersInVolume[TeamNum] > PlayersInVolume[1 - TeamNum];
    //return ReturnValue;    
}

function IsPlayerInVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SCVolume, LPP;

    // End:0x62
    foreach ControlVolumes(SCVolume)
    {
        // End:0x60
        foreach SCVolume.TouchingActors(Class'LPBasePlayerPawn', LPP)
        {
            // End:0x5F
            if(P == LPP)
            {
                break;                
                return true;
            }            
        }                
    }    
    return false;
    //return ReturnValue;    
}

function CheckForLoneWolf()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCVolume, LPP, PRI;

    // End:0x10E
    if(TotalPlayersInVolume == 1)
    {
        // End:0x10D
        foreach ControlVolumes(SCVolume)
        {
            // End:0x10B
            foreach SCVolume.TouchingActors(Class'LPBasePlayerPawn', LPP)
            {
                PRI = LPPRI(LPP.PlayerReplicationInfo);
                // End:0x10A
                if((PRI != none) && !PRI.CheckForNearbyPlayers(Class'LPAwardManager'.static.GetDefaultAwardParam('Emblem_LoneWolf'), true))
                {
                    PRI.ServerGiveAward('Emblem_LoneWolf');
                }                
            }                        
        }        
    }
    //return;    
}

defaultproperties
{
    bClampTicketsToMax=true
    bOnlyAwardToOccupyingPlayers=true
    bOnlyAwardWhileOccupied=true
    EnabledRepCount=-1
    TotalControlAmount=100.0000000
    InitialControlTeam=ELPTeams.LPTeam_Neutral
    ControlTeamIndex=-1
    OccupyingTeamIndex=-1
    PlayerControlRateMultiplier=1.0000000
    AkridControlRateMultiplier=1.0000000
    // Reference: LPObjectiveComponentSeizeControl'Default__LPSeizeControlObjective.ObjectiveComp'
    begin object name=ObjectiveComp class=Class'LPObjectiveComponentSeizeControl'
    end object
    ObjectiveComponent=ObjectiveComp
    Components[0]=ObjectiveComp
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
    bAlwaysRelevant=true
    SupportedEvents=/* Array type was not detected. */
}