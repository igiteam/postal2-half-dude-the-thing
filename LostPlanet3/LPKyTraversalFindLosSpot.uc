class LPKyTraversalFindLosSpot extends LPKyTraversalLosFromActors;

protected function CheckLos()
{
    local /*0x97E50000-0x00000000*/ private @NULL VertexInfo[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LosTest(VertexInfo.Position, TestActor);
    //return ReturnValue;    
}
