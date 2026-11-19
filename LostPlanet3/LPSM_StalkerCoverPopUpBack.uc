class LPSM_StalkerCoverPopUpBack extends LPSM_AIBasePlayFullBodyAnimSeq
    config(Game);

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPSM_PlayAnimBase).Tick(DeltaTime);
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPAIPawnStalker(PawnOwner).StalkerCoverAnimTree;
    //return ReturnValue;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Discard
    RotationExtraction=ERootRotationOption.RRO_Discard
    BlendOutTime=0.5000000
    bManageRootMotionMode=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
}