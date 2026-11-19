class KynapsePathDataRenderingComponent extends PrimitiveComponent
    editinlinenew
    hidecategories(Object);

struct native RenderingDataElement
{
    var(accidentRatio) /*0x02000000-0x00000000*/ private @NULL visualGeometry;
    var(accidentRatio) /*0x02000000-0x00000000*/ private @NULL Family;
    var(accidentRatio) /*0x02000000-0x00000000*/ private @NULL RenderInfo;

    structdefaultproperties
    {
        visualGeometry=none
        Family=none
        RenderInfo=none
    }
};

var(accidentRatio) /*0x02000000-0x00000010*/ private editfixedsize array visualElements;

defaultproperties
{
    ReplacementPrimitive=none
    HiddenGame=true
    AlwaysLoadOnClient=false
    AlwaysLoadOnServer=false
}