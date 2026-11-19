class LPGFxUIElementKillObjective extends LPGFxUIElementMPObjective
    config(UI);

enum eKillObjectiveState
{
    KOS_Default,                    // 0
    KOS_TakingDamage,               // 1
    KOS_Dead,                       // 2
    KOS_MAX                         // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL KillObjective;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnToKill;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CachedUILocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurPawnHealthPct;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPawnIsDead;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte IconState;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super.Init(MP);
    KillObjective = LPKillObjective(AttachedActor);
    PawnToKill = KillObjective.PawnToKill;
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    super.SetAttachedActor(TheActor, theIndex);
    KillObjective = LPKillObjective(AttachedActor);
    PawnToKill = KillObjective.PawnToKill;
    //return;    
}

function UpdateObjectiveIcon()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], NewHealthPct;

    super.UpdateObjectiveIcon(DeltaTime);
    // End:0x17E
    if(!bPawnIsDead && PawnToKill != none)
    {
        NewHealthPct = FMax(0.0000000, float(PawnToKill.Health) / float(PawnToKill.HealthMax));
        // End:0x17E
        if(NewHealthPct != CurPawnHealthPct)
        {
            // End:0x100
            if(NewHealthPct == 0.0000000)
            {
                SetObjectiveStateEx(2);
                KillObjective.TriggerEventClass(Class'LPSeqEvent_ObjectiveDestroyed', PawnToKill);
                bPawnIsDead = true;                
            }
            else
            {
                // End:0x158
                if(NewHealthPct < CurPawnHealthPct)
                {
                    SetObjectiveStateEx(1);
                    KillObjective.TriggerEventClass(Class'LPSeqEvent_ObjectiveTakingDamage', PawnToKill);
                }
            }
            SetProgress(NewHealthPct);
            CurPawnHealthPct = NewHealthPct;
        }
    }
    //return;    
}

// Export ULPGFxUIElementKillObjective::execGetIconPosition(FFrame&, void* const)
native function GetIconPosition()
{
    local /*0x97E50000-0x00000000*/ private float distToPlayer[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function SetObjectiveStateEx()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInit[9437185];

    false
    // End:0xF9
    if((int(IconState) != int(NewState)) || bInit)
    {
        StateTimer = 0.0000000;
        IconState = NewState;
        switch(NewState)
        {
            // End:0x9D
            case 0:
                SetObjectiveState(((CurPawnHealthPct < 100.0000000) ? "damaged" : "default"));
                // End:0xF9
                break;
            // End:0xCC
            case 1:
                SetObjectiveState("takingDamage");
                StateTimer = 1.0000000;
                // End:0xF9
                break;
            // End:0xF3
            case 2:
                SetObjectiveState("dead");
                StateTimer = 5.0000000;
                // End:0xF9
                break;
            // End:0xFFFF
            default:
                // End:0xF9
                break;
                break;
        }
    }
    //return;    
}

function OnStateTimer()
{
    switch(IconState)
    {
        // End:0x28
        case 1:
            SetObjectiveStateEx(0);
            // End:0xD4
            break;
        // End:0xCE
        case 2:
            Show(false, true);
            SetActive(false, true);
            KillObjective.PawnToKill = none;
            MPHUD.RemoveMovieClip(PointMC);
            MPHUD.RemoveMovieClip(EdgeMC);
            PointMC = none;
            EdgeMC = none;
            // End:0xD4
            break;
        // End:0xFFFF
        default:
            // End:0xD4
            break;
            break;
    }
    //return;    
}

defaultproperties
{
    ObjectiveType="akrid"
    ObjectiveStateFunc="setMPAkridPointState"
}