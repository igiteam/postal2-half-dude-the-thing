class LPGFxUIElementTENGPointManager extends LPGFxUIElementMPObjectiveManager;

function TENGPostTookDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609], Post;
    local /*0x97E50000-0x00000000*/ private int Index[9437185], I;
    local /*0x97E50000-0x00000000*/ private @NULL TENGPoint;

    -1
    I = 0;
    J0x14:

    // End:0x172 [Loop If]
    if(I < Attachments.Length)
    {
        // End:0x164
        if((Attachments[I].bUsed && Attachments[I].AttachedActor == TEP) && (Index == -1) || Attachments[I].Index == Index)
        {
            // End:0x164
            if(Attachments[I].UIElement != none)
            {
                TENGPoint = LPGFxUIElementTENGPoint(Attachments[I].UIElement);
                TENGPoint.TENGPostTookDamage(Post);
            }
        }
        I++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function TENGPostChangedOwner()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP[8388609], Post;
    local /*0x97E50000-0x00000000*/ private int OwningTeam[8388609], Index, I;
    local /*0x97E50000-0x00000000*/ private @NULL TENGPoint;

    -1
    I = 0;
    J0x14:

    // End:0x17B [Loop If]
    if(I < Attachments.Length)
    {
        // End:0x16D
        if((Attachments[I].bUsed && Attachments[I].AttachedActor == TEP) && (Index == -1) || Attachments[I].Index == Index)
        {
            // End:0x16D
            if(Attachments[I].UIElement != none)
            {
                TENGPoint = LPGFxUIElementTENGPoint(Attachments[I].UIElement);
                TENGPoint.TENGPostChangedOwner(Post, OwningTeam);
            }
        }
        I++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

defaultproperties
{
    UIElementClass=Class'LPGFxUIElementTENGPoint'
}