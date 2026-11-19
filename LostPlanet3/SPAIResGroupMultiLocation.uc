class SPAIResGroupMultiLocation extends SPAIResourceGroup within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Attribute;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private class GeneratedClass;

// Export USPAIResGroupMultiLocation::execUpdate(FFrame&, void* const)
native function Update();

// Export USPAIResGroupMultiLocation::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000                        
}

function Init()
{
    super.Init();
    //return;    
}

function ShutDown()
{
    super.ShutDown();
    //return;    
}

function InitResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL Res[8388609], ResLocation;

    ResLocation = SPAIResMultiLocation(Res);
    ResLocation.SetAttributesFromGroup(Attribute);
    super.InitResource(Res);
    //return;    
}

protected function GetWorldPos()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x99 [Loop If]
    if(I < Resource.Length)
    {
        // End:0x8B
        if(Outer.IsValidResource(Resource[I]))
        {
            return SPAIResMultiLocation(Resource[I]).GetFormationCenter();
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return super.GetWorldPos();
    //return ReturnValue;    
}

protected event CreateResource()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689], NewAIResLocation;

    NewAIResLocation = SPAIResMultiLocation(GeneratedClass.static.CreateNew(Outer, UniqueName, MaxUsers));
    // End:0x70
    if(NewAIResLocation != none)
    {
        AddResource(NewAIResLocation);
    }
    return NewAIResLocation;
    //return ReturnValue;    
}

function GetResourceExtents()
{
    local /*0x03A30000-0x00000000*/ private @NULL OutLocation[25165825];
    local /*0x03A30000-0x00000000*/ private float OutRadius[25165825];

    OutLocation = Outer.GetOuterLocation();
    OutRadius = Attribute.FormationRadius;
    //return;    
}

function AreOtherUsersInStrikePosition()
{
    local /*0x03A30000-0x00000000*/ private @NULL Excluded[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int I, J;
    local /*0x03A30000-0x00000000*/ private editfixedsize array Users;
    local /*0x03A30000-0x00000000*/ private @NULL Res;

    I = 0;
    J0x0C:

    // End:0x15F [Loop If]
    if(I < Resource.Length)
    {
        Res = SPAIResMultiLocation(Resource[I]);
        // End:0x151
        if((Res != none) && !Res.IsDestroyed())
        {
            Res.GetAllUsers(Users);
            J = 0;
            J0xB3:

            // End:0x151 [Loop If]
            if(J < Users.Length)
            {
                // End:0x143
                if((Users[J] != none) && Users[J] != Excluded)
                {
                    // End:0x143
                    if(Res.GetUserSeperation(Users[J]) == float(0))
                    {
                        return true;
                    }
                }
                ++J;
                // [Loop Continue]
                goto J0xB3;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x0C;
    }
    return false;
    //return ReturnValue;    
}

function HandleSequenceAction()
{
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609], OverrideFormationRadius;

    OverrideFormationRadius = SPSeqAct_OverrideFormationRadius(inAction);
    // End:0x3E
    if(OverrideFormationRadius != none)
    {
        OnOverrideFormationRadius(OverrideFormationRadius);
    }
    super.HandleSequenceAction(inAction);
    //return;    
}

function OnOverrideFormationRadius()
{
    local /*0x03A30000-0x00000000*/ private @NULL OverrideFormationRadius[8388609];

    // End:0x238
    if(OverrideFormationRadius != none)
    {
        // End:0x125
        if(int(OverrideFormationRadius.Mode) == int(0))
        {
            Attribute.MinFormationRadius = OverrideFormationRadius.Override.MinRadius;
            Attribute.FormationRadius = OverrideFormationRadius.Override.IdealRadius;
            Attribute.MaxFormationRadius = OverrideFormationRadius.Override.MaxRadius;            
        }
        else
        {
            // End:0x238
            if(int(OverrideFormationRadius.Mode) == int(1))
            {
                Attribute.MinFormationRadius = default.Class.default.Attribute.MinFormationRadius;
                Attribute.FormationRadius = default.Class.default.Attribute.FormationRadius;
                Attribute.MaxFormationRadius = default.Class.default.Attribute.MaxFormationRadius;
            }
        }
    }
    //return;    
}

defaultproperties
{
    Attribute=(Radius=0.0000000,Height=0.0000000,MinFormationRadius=0.0000000,FormationRadius=0.0000000,MaxFormationRadius=0.0000000,MoveConstraintRadiusFactor=0.5000000,RevokeReachTimeTolerance=1.0000000)
    GeneratedClass=Class'SPAIResMultiLocation'
}