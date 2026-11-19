class LPAIObjectiveFleeDongo extends LPAIObjectiveFlee within LPAIControllerDongo
    hidecategories(Object,Object);

protected function BuidFleeFromList()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL OtherDongo;

    super.BuidFleeFromList(FleeFrom);
    // End:0xA1
    foreach Outer.WorldInfo.AllPawns(Class'LPAIPawnDongo', OtherDongo)
    {
        // End:0xA0
        if(OtherDongo != Outer.myAIPawn)
        {
            FleeFrom.AddItem(OtherDongo);            
        }        
    }    
    //return;    
}

defaultproperties
{
    FleeDuration=5.0000000
    FleeDistances=/* Array type was not detected. */
}