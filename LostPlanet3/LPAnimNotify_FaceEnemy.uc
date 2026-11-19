class LPAnimNotify_FaceEnemy extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(0.25_Pct) /*0x7BF40000-0x00000000*/ private bool bFaceEnemy[65537];
var(0.25_Pct) /*0x7BF40000-0x00000000*/ private float BlendTime[65537];

function FaceEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Owner[8388609], ownerPawn, OwnerController, StrikeCmd, EnemyForStrike, NewRot;

    ownerPawn = Pawn(Owner);
    // End:0x2D
    if(ownerPawn == none)
    {
        return;
    }
    OwnerController = GameAIController(ownerPawn.Controller);
    // End:0x6F
    if(OwnerController == none)
    {
        return;
    }
    StrikeCmd = LPAICmd_Strike(OwnerController.GetActiveCommand());
    // End:0xB2
    if(StrikeCmd == none)
    {
        return;
    }
    EnemyForStrike = StrikeCmd.EnemyForStrike;
    OwnerController.Focus = EnemyForStrike;
    // End:0x1FC
    if(EnemyForStrike != none)
    {
        ownerPawn.SetMovementPhysics();
        NewRot = ownerPawn.Rotation;
        NewRot.Yaw = Rotator(EnemyForStrike.Location - ownerPawn.Location).Yaw;
        ownerPawn.SetDesiredRotation(NewRot,,, BlendTime);
    }
    //return;    
}

function FaceNone()
{
    local /*0x97E50000-0x00000000*/ private @NULL Owner[8388609], ownerPawn, OwnerController;

    ownerPawn = Pawn(Owner);
    // End:0x2D
    if(ownerPawn == none)
    {
        return;
    }
    OwnerController = GameAIController(ownerPawn.Controller);
    // End:0x6F
    if(OwnerController == none)
    {
        return;
    }
    OwnerController.Focus = none;
    //return;    
}

event Notify()
{
    local /*0x97E50000-0x00000000*/ private @NULL Owner[8388609], AnimSeqInstigator;

    // End:0x23
    if(bFaceEnemy)
    {
        FaceEnemy(Owner);        
    }
    else
    {
        FaceNone(Owner);
    }
    //return;    
}

event NotifyEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL Owner[8388609], AnimSeqInstigator;

    // End:0x23
    if(bFaceEnemy)
    {
        FaceNone(Owner);        
    }
    else
    {
        FaceEnemy(Owner);
    }
    //return;    
}

defaultproperties
{
    BlendTime=0.3300000
}