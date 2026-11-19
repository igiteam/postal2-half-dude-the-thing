class LPCSAO_Phadyr extends LPContextSensitiveAnimObject
    dontsortcategories(TemplateAnims,SingleAnims);

var(0.25_Pct) /*0xB9F60000-0x00000000*/ private @NULL MoveForwardAnim[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL WalkForwardTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL IdleTemplate[65537];

event GetAllSingleAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SingleAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    SingleAnims.AddItem(MoveForwardAnim);    
    super(SPContextSensitiveAnimObject).GetAllSingleAnims(SingleAnims, inPawn);
    //return;    
}

event GetAllTemplateAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array TemplateAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    TemplateAnims.AddItem(WalkForwardTemplate);    
    TemplateAnims.AddItem(IdleTemplate);    
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
    MoveForwardAnim=(AnimSlotName="WalkForwardSlotNode",AnimSeqName="None")
    WalkForwardTemplate=(AnimSlotName="WalkForwardSlotNode",AnimNodeTemplateName="None")
    IdleTemplate=(AnimSlotName="IdleSlotNode",AnimNodeTemplateName="None")
    PawnClass=Class'LPAIPawnPhadyr'
}