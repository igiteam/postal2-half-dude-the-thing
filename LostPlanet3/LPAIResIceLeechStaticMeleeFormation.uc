class LPAIResIceLeechStaticMeleeFormation extends LPAIResSurroundFormation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

const LeechRadius = 45;

function GetResourceExtents()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutLocation[25165825];
    local /*0x97E50000-0x00000000*/ private float OutRadius[25165825];

    super(SPAIResGroupMultiLocation).GetResourceExtents(OutLocation, OutRadius);
    //return;    
}

defaultproperties
{
    MaxInFormation=10
    ContentClasses=/* Array type was not detected. */
    Attribute=(Radius=45.0000000,Height=45.0000000)
    UniqueName="LeechMelee"
}