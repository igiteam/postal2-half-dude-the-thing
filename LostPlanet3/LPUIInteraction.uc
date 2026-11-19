class LPUIInteraction extends SPUIInteraction within LPGameViewportClient
    transient
    config(UI)
    hidecategories(Object,UIRoot);

defaultproperties
{
    UIManagerClass=Class'LPUIManager'
    SceneClientClass=Class'LPGameUISceneClient'
}