class LPSeqAct_GameMessage extends SPSeqAct_GameMessageGFX
    abstract
    forcescriptorder(true)
    dontsortcategories(All)
    hidecategories(Object);

defaultproperties
{
    // Reference: LPLocTextSelector'Default__LPSeqAct_GameMessage.LPDefPropDSSelector'
    begin object name=LPDefPropDSSelector class=Class'LPLocTextSelector'
    end object
    MessageText=LPDefPropDSSelector
    WrongButtonExceptionButtons=/* Array type was not detected. */
    ObjName="Game Message (LP)"
}