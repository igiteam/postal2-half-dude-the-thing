class LPCSAO_FireWasp extends LPContextSensitiveAnimObject
    dontsortcategories(TemplateAnims,SingleAnims);

var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL MoveForwardAnim[65537];
var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL MoveBackwardsAnim[65537];
var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL MoveLeftAnim[65537];
var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL MoveRightAnim[65537];

event GetAllSingleAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SingleAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    SingleAnims.AddItem(MoveForwardAnim);    
    SingleAnims.AddItem(MoveBackwardsAnim);    
    SingleAnims.AddItem(MoveLeftAnim);    
    SingleAnims.AddItem(MoveRightAnim);    
    super(SPContextSensitiveAnimObject).GetAllSingleAnims(SingleAnims, inPawn);
    //return;    
}

event GetAllTemplateAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array TemplateAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super(SPContextSensitiveAnimObject).GetAllTemplateAnims(TemplateAnims, inPawn);
    //return;    
}

event OnBecomeActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.OnBecomeActive(inPawn);
    //return;    
}

defaultproperties
{
    MoveForwardAnim=(AnimSlotName="FlyForwardSlotNode",AnimSeqName="None")
    MoveBackwardsAnim=(AnimSlotName="FlyBackwardsSlotNode",AnimSeqName="None")
    MoveLeftAnim=(AnimSlotName="FlyLeftSlotNode",AnimSeqName="None")
    MoveRightAnim=(AnimSlotName="FlyRightSlotNode",AnimSeqName="None")
    PawnClass=Class'LPAIPawnFireWasp'
}