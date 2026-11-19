class SPAISmartObject extends Actor
    abstract
    placeable
    hidecategories(AnimDependency,Navigation,Object);

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private export @NULL EditorSprite[537526273];
var(__NotifyAccessLostDelegate__Delegate) /*0x02C70000-0x00000400*/ private const export @NULL SPInteractionComponent[589825];

defaultproperties
{
    // Reference: SPAISmartObjectInteractionComponent'Default__SPAISmartObject.SPAISmartObjectInteractionComponent'
    begin object name=SPAISmartObjectInteractionComponent class=Class'SPAISmartObjectInteractionComponent'
    end object
    SPInteractionComponent=SPAISmartObjectInteractionComponent
    Components[0]=none
    Components[1]=SPAISmartObjectInteractionComponent
    InteractionComponent=SPAISmartObjectInteractionComponent
}