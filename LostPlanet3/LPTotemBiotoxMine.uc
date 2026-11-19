class LPTotemBiotoxMine extends LPTotemProximityMine
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DeployParticles[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BiotoxTuneData;

simulated function PostInitData()
{
    super.PostInitData();
    BiotoxTuneData = LPTuneDataPerkBiotoxMine(TuneDataTotem);
    //return;    
}

simulated function DoExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL CloudActor;

    super.DoExplosion();
    // End:0xA7
    if(int(Role) == int(ROLE_Authority))
    {
        CloudActor = Spawn(BiotoxTuneData.CloudObjectClass, self);
        CloudActor.OwningController = OwningController;
        CloudActor.Team = Team;
    }
    //return;    
}

simulated event @NULL PlaySinkingParticles()
{
    local /*0x97E50000-0x00000400*/ private @NULL Comp;

    // End:0xA3
    if((DeployParticles != none) && int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        Comp = new (self) DeployParticles.Class (DeployParticles);
        AttachComponent(Comp);
        Comp.SetActive(true);
    }
    super.PlaySinkingParticles();
    //return;    
}

defaultproperties
{
    PerkIndex=EPerks.EPERK_BIOTOXMINE
    // Reference: SkeletalMeshComponent'Default__LPTotemBiotoxMine.TotemMeshComp'
    begin object name=TotemMeshComp
    end object
    SkelMesh=TotemMeshComp
    // Reference: SkeletalMeshComponent'Default__LPTotemBiotoxMine.EnemyTotemMeshComp'
    begin object name=EnemyTotemMeshComp
    end object
    EnemySkelMesh=EnemyTotemMeshComp
    // Reference: LPHackableTotemBaseComponent'Default__LPTotemBiotoxMine.HackComponentA'
    begin object name=HackComponentA
    end object
    HackComponent=HackComponentA
    TeamID_PhysMaterialIndex=1
    // Reference: CylinderComponent'Default__LPTotemBiotoxMine.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[0]=CollisionCylinder
    Components[1]=HackComponentA
    // Reference: LPTotemInteractionMetaData'Default__LPTotemBiotoxMine.TotemInteract0'
    begin object name=TotemInteract0
    end object
    InteractionMetaData=TotemInteract0
    CollisionComponent=CollisionCylinder
}