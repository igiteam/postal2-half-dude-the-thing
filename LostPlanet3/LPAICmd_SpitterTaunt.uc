class LPAICmd_SpitterTaunt extends LPAICmd_SpitterSMPlayer within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Mode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TauntTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyForTaunt;

function Pushed()
{
    super.Pushed();
    Outer.EnableRotation(false);
    //return;    
}

function Popped()
{
    super.Popped();
    OnExitSpitterTaunt();
    Outer.TimeTauntEnd = CurTime();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    OnExitSpitterTaunt();
    //return;    
}

function OnExitSpitterTaunt()
{
    Outer.ResetRotationRate();
    Outer.EnableRotation(true);
    Outer.Focus = none;
    //return;    
}

function TalonLeft()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x2F
    if(Outer.IsTailIntact())
    {
        return Class'LPSM_SpitterAttackTalonLeft';        
    }
    else
    {
        return Class'LPSM_SpitterAttackTalonLeftLowered';
    }
    //return ReturnValue;    
}

function TalonRight()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x2F
    if(Outer.IsTailIntact())
    {
        return Class'LPSM_SpitterAttackTalonRight';        
    }
    else
    {
        return Class'LPSM_SpitterAttackTalonRightLowered';
    }
    //return ReturnValue;    
}

event LPCommandTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], Seperation;

    super(LPAICommand).LPCommandTick(DeltaTime);
    Seperation = Outer.SeperationToPawn2D(EnemyForTaunt);
    // End:0xAF
    if(Outer.IsInAttackRangeMax(Outer.SpitterPawn.AttackSeperation_TalonAttackPof, Seperation))
    {
        SetInterruptible(true);
    }
    //return;    
}

state StateCmdActive
{
    function SetupSm()
    {
        // End:0xA7
        if(int(Mode) == int(2))
        {
            Description = "Taunt Announce";
            SMList.Add(1);            
            SMList[0].SMClass = Class'LPSM_SpitterTaunt';
            SMList[0].Mode = 0;
            SMList[0].bInterruptible = false;            
        }
        else
        {
            // End:0x153
            if(int(Mode) == int(3))
            {
                Description = "Taunt During Attack";
                SMList.Add(1);                
                SMList[0].SMClass = Class'LPSM_SpitterTaunt';
                SMList[0].Mode = 0;
                SMList[0].bInterruptible = false;                
            }
            else
            {
                // End:0x1F6
                if(int(Mode) == int(1))
                {
                    Description = "Long Taunt";
                    SMList.Add(1);                    
                    SMList[0].SMClass = Class'LPSM_SpitterTaunt';
                    SMList[0].Mode = 0;
                    SMList[0].bInterruptible = false;                    
                }
                else
                {
                    Description = "Short Taunt";
                    SMList.Add(1);                    
                    SMList[0].SMClass = Class'LPSM_SpitterTauntShort';
                    SMList[0].Mode = 0;
                    SMList[0].bInterruptible = false;
                }
            }
        }
        //return;        
    }
Begin:

    SetInterruptible(false);
    Outer.PawnZeroVelocity();
    // End:0x146
    if(Outer.CanBeMyEnemy(EnemyForTaunt))
    {
        Outer.Focus = EnemyForTaunt;
        Outer.EnableRotation(true);
        Outer.CmdTurnToFaceFocus(0);
        // End:0x11B
        if(!Outer.SpitterPawn.IsTeenSpitter())
        {
            Outer.EnableRotation(false);
        }
        SetupSm();
        DesiredFocus = EnemyForTaunt;
        GotoState('StartNextSm');
    }
    Outer.PopCommand(self);
    stop;        
}
