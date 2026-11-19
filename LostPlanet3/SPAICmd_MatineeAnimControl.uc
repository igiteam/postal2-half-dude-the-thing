class SPAICmd_MatineeAnimControl extends SPAICommand within SPAIController;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function Paused()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewCommand[8388609];

    super(GameAICommand).Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x03A30000-0x00000000*/ private name OldCommandName[8388609];

    super(GameAICommand).Resumed(OldCommandName);
    //return;    
}

function NotifyFinishMatineeAnimControl()
{
    Outer.PopCommand(self);
    //return;    
}

defaultproperties
{
    bIgnoreNotifies=true
}