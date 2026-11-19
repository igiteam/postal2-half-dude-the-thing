class LPGFxUIElementTENGPoint extends LPGFxUIElementMPObjective
    config(UI);

enum EPostUIState
{
    EPostUIState_Init,              // 0
    EPostUIState_Neutral,           // 1
    EPostUIState_Acquire,           // 2
    EPostUIState_Active,            // 3
    EPostUIState_Attacked,          // 4
    EPostUIState_MAX                // 5
};

struct native PostInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte State;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TeamIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StateTimer;

    structdefaultproperties
    {
        State=EPostUIState.EPostUIState_Init
        TeamIndex=0
        StateTimer=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ThermalEnergyPocketActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PostStates;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumPosts;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPostAttacked;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableFadeout[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeOutDistance[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeOutSpeed[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeAlpha;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastEnergyPercent;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    ThermalEnergyPocketActor = LPThermalEnergyPocketActor(AttachedActor);
    FadeAlpha = 1.0000000;
    super.Init(MP);
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    super.SetAttachedActor(TheActor, theIndex);
    ThermalEnergyPocketActor = LPThermalEnergyPocketActor(TheActor);
    //return;    
}

function InitObjectiveIcon()
{
    // End:0x4C
    if(ThermalEnergyPocketActor.NumThermalPosts > 0)
    {
        SetNumPosts(ThermalEnergyPocketActor.NumThermalPosts);
    }
    super.InitObjectiveIcon();
    //return;    
}

function UpdateObjectiveIcon()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    super.UpdateObjectiveIcon(DeltaTime);
    SetEnergyPercent(int((100.0000000 * ThermalEnergyPocketActor.EnergyRemaining) / ThermalEnergyPocketActor.MaxEnergy));
    I = 0;
    J0x6F:

    // End:0x164 [Loop If]
    if(I < NumPosts)
    {
        // End:0x156
        if(PostStates[I].StateTimer > 0.0000000)
        {
            PostStates[I].StateTimer -= DeltaTime;
            // End:0x156
            if(PostStates[I].StateTimer <= 0.0000000)
            {
                PostStates[I].StateTimer = 0.0000000;
                PostStateTransition(I);
            }
        }
        I++;
        // [Loop Continue]
        goto J0x6F;
    }
    //return;    
}

function ObjectiveChangedState()
{
    local /*0x97E50000-0x00000000*/ private int I, NumControlledPosts;

    // End:0x24
    if(!bIconInit)
    {
        SetObjectiveState("default");
        return;
    }
    // End:0x67
    if(bPostAttacked)
    {
        bPostAttacked = false;
        SetObjectiveState("takingDamage");
        StateTimer = 1.5000000;        
    }
    else
    {
        // End:0x125
        if(StateTimer == 0.0000000)
        {
            I = 0;
            J0x85:

            // End:0xE1 [Loop If]
            if(I < NumPosts)
            {
                // End:0xD3
                if(PostStates[I].TeamIndex >= 0)
                {
                    NumControlledPosts++;
                }
                I++;
                // [Loop Continue]
                goto J0x85;
            }
            // End:0x112
            if(NumControlledPosts == NumPosts)
            {
                SetObjectiveState("fullControl");                
            }
            else
            {
                SetObjectiveState("default");
            }
        }
    }
    //return;    
}

function OnStateTimer()
{
    ObjectiveChangedState();
    //return;    
}

function TENGPostTookDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Post[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xB6 [Loop If]
    if(I < NumPosts)
    {
        // End:0xA8
        if(Post == ThermalEnergyPocketActor.ThermalPosts[I])
        {
            // End:0xA5
            if(Post.IsDeployed())
            {
                SetPostState(I, 4);
                bPostAttacked = true;
                ObjectiveChangedState();
            }
            // [Explicit Break]
            goto J0xB6;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0xB6:

    //return;    
}

function TENGPostChangedOwner()
{
    local /*0x97E50000-0x00000000*/ private @NULL Post[8388609];
    local /*0x97E50000-0x00000000*/ private int OwningTeam[8388609], I;

    I = 0;
    J0x0B:

    // End:0x1D9 [Loop If]
    if(I < NumPosts)
    {
        // End:0x1CB
        if(Post == ThermalEnergyPocketActor.ThermalPosts[I])
        {
            // End:0x103
            if(!Post.IsDeployed() || (OwningTeam != 0) && OwningTeam != 1)
            {
                PostStates[I].TeamIndex = -1;
                SetTENGPointSlotOwner(PointMC, I, -1);
                SetPostState(I, 1);                
            }
            else
            {
                // End:0x1BE
                if(OwningTeam != PostStates[I].TeamIndex)
                {
                    PostStates[I].TeamIndex = OwningTeam;
                    SetTENGPointSlotOwner(PointMC, I, PostStates[I].TeamIndex);
                    SetPostState(I, 2);
                }
            }
            ObjectiveChangedState();
            // [Explicit Break]
            goto J0x1D9;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x1D9:

    //return;    
}

function SetPostState()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    // End:0x16D
    if(int(PostStates[SlotIndex].State) != int(NewState))
    {
        PostStates[SlotIndex].State = NewState;
        switch(NewState)
        {
            // End:0xA0
            case 1:
                SetTENGPointSlotPulse(PointMC, SlotIndex, false);
                // End:0x16D
                break;
            // End:0xF1
            case 2:
                SetTENGPointSlotPulse(PointMC, SlotIndex, true);
                PostStates[SlotIndex].StateTimer = 3.0000000;
                // End:0x16D
                break;
            // End:0x116
            case 3:
                SetTENGPointSlotPulse(PointMC, SlotIndex, false);
                // End:0x16D
                break;
            // End:0x167
            case 4:
                SetTENGPointSlotPulse(PointMC, SlotIndex, false);
                PostStates[SlotIndex].StateTimer = 1.0000000;
                // End:0x16D
                break;
            // End:0xFFFF
            default:
                // End:0x16D
                break;
                break;
        }
    }
    //return;    
}

function PostStateTransition()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609];

    switch(PostStates[SlotIndex].State)
    {
        // End:0x35
        case 2:
        // End:0x52
        case 4:
            SetPostState(SlotIndex, 3);
            // End:0x58
            break;
        // End:0xFFFF
        default:
            // End:0x58
            break;
            break;
    }
    //return;    
}

function SetNumPosts()
{
    local /*0x97E50000-0x00000000*/ private int Num[8388609], I;

    NumPosts = Num;
    PostStates.Length = NumPosts;
    SetTENGPointNumPosts(PointMC, NumPosts);
    I = 0;
    J0x4E:

    // End:0x101 [Loop If]
    if(I < NumPosts)
    {
        PostStates[I].TeamIndex = -1;
        PostStates[I].StateTimer = 0.0000000;
        SetPostState(I, 1);
        SetTENGPointSlotOwner(PointMC, I, -1);
        I++;
        // [Loop Continue]
        goto J0x4E;
    }
    //return;    
}

function SetEnergyPercent()
{
    local /*0x97E50000-0x00000000*/ private int EnergyPercent[8388609];

    // End:0x46
    if(LastEnergyPercent != EnergyPercent)
    {
        LastEnergyPercent = EnergyPercent;
        SetTENGPointPercent(PointMC, EnergyPercent);
    }
    //return;    
}

function SetTENGPointNumPosts()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private int Num[8388609];

    // End:0x49
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("setMPExtractPointNumPosts");
    }
    //return;    
}

function SetTENGPointPercent()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private int Percent[8388609];

    // End:0x48
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("setMPExtractPointPercent");
    }
    //return;    
}

function SetTENGPointSlotOwner()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private int SlotNum[8388609], TeamNum;

    // End:0x4A
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("setMPExtractPointSlotOwner");
    }
    //return;    
}

function SetTENGPointSlotPulse()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private int SlotNum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPulse[8388609];

    // End:0x4A
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("setMPExtractPointSlotPulse");
    }
    //return;    
}

defaultproperties
{
    bEnableFadeout=true
    FadeOutDistance=800.0000000
    FadeOutSpeed=1.0000000
    LastEnergyPercent=-1
    ObjectiveType="extract"
    ObjectiveStateFunc="setMPExtractPointState"
    IconOffset=(X=0.0000000,Y=0.0000000,Z=180.0000000)
}