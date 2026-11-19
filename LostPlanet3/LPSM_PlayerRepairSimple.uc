class LPSM_PlayerRepairSimple extends LPSM_PlayerRepairBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPP;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL RepairComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RepairPerk;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasEnhancedRepair;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float fBaseRepairRate;

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x19
    if(AnimTemplateTree != none)
    {
        return AnimTemplateTree;
    }
    return super(SPSpecialMove).GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor;

    super(SPSpecialMove).PrepSpecialMove(PrevMove, InteractionActor);
    LPP = LPPlayerPawn(MySPPawn);
    LPC = LPPlayerController(LPP.Controller);
    RepairPerk = LPPerkRepair(LPP.GetPerkInstance(1));
    bHasEnhancedRepair = LPP.PerkEnabled(1);
    fBaseRepairRate = 1.0000000 + ((bHasEnhancedRepair) ? RepairPerk.RepairTuneData.RepairRateIncrease.GetValue(LPC) / float(100) : 0.0000000);
    fBaseRepairRate *= (RepairPerk.RepairTuneData.GlobalRepairRateModifier.GetValue(LPC) / float(100));
    // End:0x1F7
    if(!MySPPawn.IsLocallyControlled())
    {
        LPP.ClosestValidRepairableActor = InteractionActor;
    }
    RepairComp = Class'LPSM_PlayerRepairBase'.static.GetRepairComponent(InteractionActor);
    // End:0x257
    if(RepairComp != none)
    {
        RepairComp.BeginRepairOperation();
    }
    LPP.CurrentRepairComponent = RepairComp;
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    LPPawn(MySPPawn).TemplateLogicData.bForceStrafeAnims = true;
    // End:0x9B
    if(MySPPawn.IsLocallyControlled())
    {
        LPC.PauseFire();
    }
    LPP.bWantsToRepair = true;
    StartRepairScreenEffects();
    PlayRepairCycle();
    RepairComp.Owner.TriggerEventClass(Class'LPSeqEvent_RepairPercent', RepairComp.Owner, 11);
    //return;    
}

function PlayRepairCycle()
{
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(0),,, 1.0000000, 0.3000000, 0.3000000, true, true);
    // End:0x94
    if(MySPPawn.IsLocallyControlled() && !DoesUseInPlaceRepair())
    {
        LPC.SetVSRepairCam();
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    LPPawn(MySPPawn).TemplateLogicData.bForceStrafeAnims = false;
    // End:0x194
    if(RepairComp != none)
    {
        RepairComp.EndRepairOperation();
        // End:0x12C
        if(RepairComp.GetHealth() < RepairComp.GetHealthMax())
        {
            RepairComp.Owner.TriggerEventClass(Class'LPSeqEvent_RepairPercent', RepairComp.Owner, 10);            
        }
        else
        {
            // End:0x194
            if(int(MySPPawn.WorldInfo.NetMode) == int(NM_Standalone))
            {
                GiveReward(RepairComp.Rewards[0]);
            }
        }
    }
    // End:0x252
    if(MySPPawn != none)
    {
        // End:0x207
        if(MySPPawn.IsLocallyControlled())
        {
            LPC.SetDefaultCam();
            LPC.UnPauseFire();            
        }
        else
        {
            LPP.ClosestValidRepairableActor = none;
        }
        LPP.bWantsToRepair = false;
        StopRepairScreenEffects();
    }
    MySPPawn.StopUpperBodyAnim();
    //return;    
}

simulated function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], EMPTimeRemaining;

    super(GameSpecialMove).Tick(DeltaTime);
    // End:0x36D
    if(int(LPP.Role) >= int(ROLE_AutonomousProxy))
    {
        // End:0x36D
        if(((RepairPerk != none) && LPP.Health > 0) && !LPP.bIncapacitated)
        {
            // End:0x11B
            if(RepairComp == none)
            {
                RepairComp = Class'LPSM_PlayerRepairBase'.static.GetRepairComponent(LPP.ClosestValidRepairableActor);
                // End:0x11B
                if(RepairComp != none)
                {
                    RepairComp.BeginRepairOperation();
                }
            }
            // End:0x36D
            if(RepairComp != none)
            {
                RepairComp.Repair(LPC, fBaseRepairRate);
                // End:0x2F5
                if(bHasEnhancedRepair)
                {
                    // End:0x2F5
                    if(RepairComp.Owner.IsTimerActive('EndEMPEffect'))
                    {
                        EMPTimeRemaining = RepairComp.Owner.GetTimerRate('EndEMPEffect') - RepairComp.Owner.GetTimerCount('EndEMPEffect');
                        EMPTimeRemaining -= (DeltaTime * RepairPerk.RepairTuneData.EMPNeutralizeRate.GetValue(LPC));
                        EMPTimeRemaining = FMax(EMPTimeRemaining, 0.0100000);
                        RepairComp.Owner.SetTimer(EMPTimeRemaining, false, 'EndEMPEffect');
                    }
                }
                // End:0x36D
                if(LPC != none)
                {
                    LPC.ModifyStat('Stat_HealthRepaired', FCeil((float(RepairComp.RepairRate) * fBaseRepairRate) * DeltaTime));
                }
            }
        }
    }
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2E
    if(MessageName == Class'LPSMMTypes'.default.SMM_MeleeTakedownAllowed)
    {
        return true;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

simulated function StartRepairScreenEffects()
{
    LPP.StartRepairScreenEffects();
    //return;    
}

simulated function StopRepairScreenEffects()
{
    LPP.StopRepairScreenEffects();
    //return;    
}

defaultproperties
{
    AnimTemplateTree=AnimTree'PlayerMoveAnimTemplate.PlayerVSAnimations'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}