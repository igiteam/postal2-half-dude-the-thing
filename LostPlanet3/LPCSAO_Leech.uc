class LPCSAO_Leech extends LPContextSensitiveAnimObject
    dontsortcategories(TemplateAnims,SingleAnims);

var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL RunForwardTemplate[65537];
var(0.25_Pct) /*0xC9E90000-0x00000000*/ private @NULL IdleTemplate[65537];

event GetAllSingleAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SingleAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super(SPContextSensitiveAnimObject).GetAllSingleAnims(SingleAnims, inPawn);
    //return;    
}

event GetAllTemplateAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array TemplateAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    TemplateAnims.AddItem(RunForwardTemplate);    
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
    RunForwardTemplate=(AnimSlotName="RunForwardSlotNode",AnimNodeTemplateName="None")
    IdleTemplate=(AnimSlotName="IdleSlotNode",AnimNodeTemplateName="None")
    PawnClass=Class'LPAIPawnLeech'
}