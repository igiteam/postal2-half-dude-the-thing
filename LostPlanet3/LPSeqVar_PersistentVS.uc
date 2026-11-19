class LPSeqVar_PersistentVS extends SeqVar_Object
    forcescriptorder(true)
    hidecategories(Object);

// Export ULPSeqVar_PersistentVS::execFindPersistentVS(FFrame&, void* const)
native function FindPersistentVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function GetObjectValue()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return FindPersistentVS();
    //return ReturnValue;    
}

defaultproperties
{
    SupportedClasses=/* Array type was not detected. */
    ObjName="Persistent VS"
}