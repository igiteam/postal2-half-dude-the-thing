class CrowdAgentBase extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation)
    classgroup(Crowd)
    implements(Interface_NavigationHandle);

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IInterface_NavigationHandle[268566529];

event NotifyPathChanged()
{
    //return;    
}
