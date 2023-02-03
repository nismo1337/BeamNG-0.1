
singleton TSShapeConstructor(Ind_bld_02Dae)
{
   baseShape = "./ind_bld_02.dae";
};

function Ind_bld_02Dae::onLoad(%this)
{
   %this.setDetailLevelSize("300", "450");
}
