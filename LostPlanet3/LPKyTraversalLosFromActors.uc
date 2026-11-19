class LPKyTraversalLosFromActors extends LPKyTraversal
    abstract;

struct native PointData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VertexInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Count;

    structdefaultproperties
    {
        VertexInfo=(Position=(X=0.0000000,Y=0.0000000,Z=0.0000000),InternalData=(VertexReferenceIndex=0))
        Count=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ActorList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Point[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBestFound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> IsVisible;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __LosTest__Delegate;

delegate LosTest()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

final function SetLosFunction()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> Callback[8388609];

    IsVisible = Callback;
    //return;    
}

function SetActors()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array InHideFrom[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    ActorList.Length = 0;
    I = 0;
    J0x17:

    // End:0x76 [Loop If]
    if(I < InHideFrom.Length)
    {
        // End:0x68
        if(InHideFrom[I] != none)
        {
            ActorList.AddItem(InHideFrom[I]);            
        }
        ++I;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function SetActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestActor[8388609];

    ActorList.Length = 0;
    ActorList.AddItem(TestActor);    
    //return;    
}

function GetBestPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Best[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x46
    if(bBestFound)
    {
        Best = Point.VertexInfo.Position;
    }
    return bBestFound;
    //return ReturnValue;    
}

protected event TraversalStrated()
{
    bBestFound = false;
    super.TraversalStrated();
    //return;    
}

protected event TraversalFinished()
{
    super.TraversalFinished();
    //return;    
}

protected event TraversalAborted()
{
    super.TraversalAborted();
    //return;    
}

protected function CheckLos()
{
    local /*0x97E50000-0x00000000*/ private @NULL VertexInfo[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !LosTest(VertexInfo.Position, TestActor);
    //return ReturnValue;    
}

protected event ProcessVertex()
{
    local /*0x97E50000-0x00000000*/ private @NULL VertexInfo[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I, Count;

    // End:0x2D
    if(!IsPositionClear(VertexInfo.Position))
    {
        return true;
    }
    Count = 0;
    I = 0;
    J0x43:

    // End:0xB6 [Loop If]
    if(I < ActorList.Length)
    {
        // End:0xA8
        if(ActorList[I] != none)
        {
            // End:0xA8
            if(CheckLos(VertexInfo, ActorList[I]))
            {
                Count++;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x43;
    }
    // End:0x1A3
    if(Count > 0)
    {
        // End:0x14B
        if(bBestFound)
        {
            // End:0x148
            if(Count > Point.Count)
            {
                Point.VertexInfo = VertexInfo;
                Point.Count = Count;
            }            
        }
        else
        {
            bBestFound = true;
            Point.VertexInfo = VertexInfo;
            Point.Count = Count;
        }
    }
    // End:0x1C0
    if(Count >= ActorList.Length)
    {
        return false;        
    }
    else
    {
        return true;
    }
    //return ReturnValue;    
}
