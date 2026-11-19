class LPSM_HSCoverStandLean extends LPSM_AIBasePlayFullBodyAnimSeq
    config(Game);

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x6B
    if(PlayingSeq.GetTimeLeft() < BlendOutTime)
    {
        LPAIPawnHumanSoldier(PawnOwner).EndSpecialMove(self.Class);
    }
    super(SPSM_PlayAnimBase).Tick(DeltaTime);
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPAIPawnHumanSoldier(PawnOwner).HumanSoldierCoverAnimTree;
    //return ReturnValue;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Discard
    RotationExtraction=ERootRotationOption.RRO_Discard
    BlendOutTime=0.0500000
    bManageRootMotionMode=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
}