class LPSM_PlayerRepairMinigame extends LPSM_PlayerRepairSimple
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SecondsRemaining;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InputDelayRemaining;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRepairCompleted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRepairCompletedEarly;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MinigameFX;

// Export ULPSM_PlayerRepairMinigame::execGetCompletionRatio(FFrame&, void* const)
native final simulated function GetCompletionRatio()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor;

    super.PrepSpecialMove(PrevMove, InteractionActor);
    SecondsRemaining = RepairComp.RepairDuration;
    InputDelayRemaining = RepairComp.CompletionInputDelay;
    bRepairCompleted = false;
    bRepairCompletedEarly = false;
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], LPPC;

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x136
    if(MySPPawn.IsLocallyControlled())
    {
        LPPC = LPPlayerController(MySPPawn.Controller);
        // End:0xE6
        if((int(LPPC.bIgnoreLookInput) == int(0)) && int(LPPC.bIgnoreMoveInput) == int(0))
        {
            LPC.DisableInput(false, true, true);
        }
        LPPlayerPawn(MySPPawn).ClearRepairHUDMessage();
        LPPlayerPawn(MySPPawn).DisplayRepairInstructionMessage();
    }
    RepairComp.Owner.TriggerEventClass(Class'LPSeqEvent_RepairPercent', RepairComp.Owner, 11);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x44
    if(MySPPawn.IsLocallyControlled())
    {
        LPC.EnableInput(true, true, true);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

simulated function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], oldProgress, newProgress;
    local /*0x97E50000-0x00000000*/ private int iIndex;
    local /*0x97E50000-0x00000000*/ private bool bEndIt;
    local /*0x97E50000-0x00000000*/ private float StartingHealth, MaxHealth, CurrentHealth;

    // End:0xEE
    if(bRepairCompleted)
    {
        bEndIt = ((MinigameFX == none) ? false : MinigameFX.Sticks[0].bDeadZoned && MinigameFX.Sticks[1].bDeadZoned);
        InputDelayRemaining -= DeltaTime;
        // End:0xEB
        if((InputDelayRemaining <= float(0)) || bEndIt)
        {
            MySPPawn.ServerEndCurrentSpecialMove();
        }        
    }
    else
    {
        StartingHealth = float(RepairComp.GetHealth());
        MaxHealth = float(RepairComp.GetHealthMax());
        CurrentHealth = StartingHealth + ((MaxHealth - StartingHealth) * GetCompletionRatio());
        oldProgress = float(FFloor((10.0000000 * CurrentHealth) / MaxHealth));
        SecondsRemaining -= DeltaTime;
        CurrentHealth = StartingHealth + ((MaxHealth - StartingHealth) * GetCompletionRatio());
        newProgress = float(FFloor((10.0000000 * CurrentHealth) / MaxHealth));
        // End:0x2E6
        if(oldProgress != newProgress)
        {
            iIndex = int(float(9) - (newProgress - float(1)));
            // End:0x2E6
            if((iIndex > -1) && iIndex < 10)
            {
                RepairComp.Owner.TriggerEventClass(Class'LPSeqEvent_RepairPercent', RepairComp.Owner, iIndex);
            }
        }
        // End:0x304
        if(SecondsRemaining <= 0.0000000)
        {
            RepairCompleted(false);
        }
    }
    //return;    
}

simulated function RepairAborted()
{
    bRepairCompleted = false;
    // End:0x75
    if(MySPPawn.IsLocallyControlled())
    {
        LPC.EndSpecialMove();
        LPPlayerPawn(MySPPawn).ClearRepairInstructionMessage();
    }
    RepairComp.Owner.TriggerEventClass(Class'LPSeqEvent_RepairPercent', RepairComp.Owner, 10);
    StopRepairScreenEffects();
    //return;    
}

simulated function RepairCompleted()
{
    local /*0x97E50000-0x00000000*/ private bool bEarly[8388609];
    local /*0x97E50000-0x00000000*/ private float CompletionRatio, Thirds, Reward;
    local /*0x97E50000-0x00000000*/ private int iIndex;
    local /*0x97E50000-0x00000000*/ private float StartingHealth, MaxHealth, CurrentHealth;

    bRepairCompleted = true;
    bRepairCompletedEarly = bEarly;
    InputDelayRemaining = RepairComp.CompletionInputDelay;
    // End:0xE4
    if(MySPPawn.IsLocallyControlled())
    {
        MinigameFX = LPFXAction_RepairScreenMinigame(MySPPawn.GetFXActionManager().GetFXAction(Class'LPFXAction_RepairScreenMinigame'));
        LPPlayerPawn(MySPPawn).ClearRepairInstructionMessage();
    }
    CompletionRatio = GetCompletionRatio();
    // End:0x2A0
    if(bEarly && RepairComp.bFirePercentageEventsOnEarlyCompletion)
    {
        StartingHealth = float(RepairComp.GetHealth());
        MaxHealth = float(RepairComp.GetHealthMax());
        CurrentHealth = StartingHealth + ((MaxHealth - StartingHealth) * CompletionRatio);
        iIndex = FFloor((CurrentHealth / MaxHealth) * float(10));
        iIndex = 9 - (iIndex - 1);
        iIndex--;
        iIndex = Min(iIndex, 9);
        J0x21D:

        // End:0x2A0 [Loop If]
        if(iIndex >= 0)
        {
            RepairComp.Owner.TriggerEventClass(Class'LPSeqEvent_RepairPercent', RepairComp.Owner, iIndex);
            --iIndex;
            // [Loop Continue]
            goto J0x21D;
        }
    }
    // End:0x3C8
    if(int(MySPPawn.Role) == int(ROLE_Authority))
    {
        // End:0x2EA
        if(!bRepairCompletedEarly)
        {
            Thirds = 3.0000000;            
        }
        else
        {
            // End:0x30F
            if(CompletionRatio < 0.3300000)
            {
                Thirds = 0.0000000;                
            }
            else
            {
                // End:0x334
                if(CompletionRatio < 0.6600000)
                {
                    Thirds = 1.0000000;                    
                }
                else
                {
                    Thirds = 2.0000000;
                }
            }
        }
        Reward = RepairComp.Rewards[int(Thirds)];
        GiveReward(Reward);
        RepairComp.SetHealthDirectly(RepairComp.GetHealthMax());
    }
    RepairComp.Owner.TriggerEventClass(Class'LPSeqEvent_ObjectRepaired', RepairComp.Owner);
    //return;    
}

simulated function StartRepairScreenEffects()
{
    LPP.StartRepairScreenMinigameEffects();
    //return;    
}

simulated function StopRepairScreenEffects()
{
    LPP.StopRepairScreenMinigameEffects();
    //return;    
}

simulated function NotifyCompletedEarly()
{
    RepairCompleted(true);
    //return;    
}
