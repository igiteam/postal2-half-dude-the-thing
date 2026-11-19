class LPSM_PlayerZiplineBase extends SPSM_PlayAnimBase
    abstract
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], MyLPPlayerPawn;

    MyLPPlayerPawn = LPPlayerPawn(MySPPawn);
    MyLPPlayerPawn.SavedVelocity = MyLPPlayerPawn.Velocity;
    MyLPPlayerPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MyLPPlayerPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    super.SpecialMoveStarted(bForced, PrevMove);
    MyLPPlayerPawn.Mesh.RootMotionMode = 3;
    MyLPPlayerPawn.Mesh.RootMotionRotationMode = 1;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, MyLPPlayerPawn;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x1DD
    if(((MySPPawn != none) && !MySPPawn.bDeleteMe) && !MySPPawn.IsInState('Dying'))
    {
        MyLPPlayerPawn = LPPlayerPawn(MySPPawn);
        MyLPPlayerPawn.CancelDestinationRegistration();
        MyLPPlayerPawn.Mesh.RootMotionMode = MyLPPlayerPawn.default.Mesh.RootMotionMode;
        MyLPPlayerPawn.Mesh.RootMotionRotationMode = MyLPPlayerPawn.default.Mesh.RootMotionRotationMode;
        MyLPPlayerPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        MyLPPlayerPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    }
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x80
    if(((MySPPawn != none) && LPPlayerPawn(MySPPawn) != none) && LPPlayerPawn(MySPPawn).ZiplineLogicAnimTree != none)
    {
        return LPPlayerPawn(MySPPawn).ZiplineLogicAnimTree;
    }
    return super.GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    AnimationTemplateNodeNames=/* Array type was not detected. */
}