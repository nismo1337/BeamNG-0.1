$camStartPos  = false;
$camTargetPos = false;
$moveRangeX   = 0.8;
$moveRangeZ   = 0.4;
$hitObject    = false;

function MainMenuGui::load3dBackground(%this)
{
   if($no3dGUI $= "")
   {
      if(isObject( ServerGroup ) && $missionRunning && $Server::MissionFile !$= "levels/menu/menu.mis")
      {
         // if we are connected, disconnect first
         disconnect();
      }

      if ( isObject( ServerGroup ) )
         return;

      // Main menu with mission in background
      loadLoadingGui();
      createAndConnectToLocalServer( "SinglePlayer", "levels/menu/menu.mis" );
   }
}

function MainMenuGui::onWake(%this)
{
}

function MainMenuGui::onRender(%this)
{   
   if(!isObject(LocalClientConnection))
   {
      %this.load3dBackground();
   } else if($camTargetPos != false)
   {
      %obj = LocalClientConnection.getControlObject();
      if (!isObject(%obj)) return;
      %p = %obj.getPosition();
      // slowly move towards it
      %d = VectorSub($camTargetPos, %p);
      %d = VectorScale(%d, 0.06);
      %d = VectorAdd(%p, %d);
      commandToServer('MoveMenuCam', %d);
   }
}

function setObjectSelected(%obj, %val)
{
   for(%k = 0; %k < %obj.getTargetCount(); %k++)
   {
      %matName = %obj.getTargetName(%k);
      %mapped = getMaterialMapping( %matName );
      %mapped.emissive[0] = %val;
      %mapped.flush();
      //echo(%mapped@" = "@%val);
   }
}

function selectObject(%newObj)
{
   if($hitObject == %newObj)
   {
      // no change
      return;
   }
   
   // deselect all
   if($hitObject != false)
   {
      setObjectSelected($hitObject, 0);
      $hitObject = false;
   }
   // select new
   if(%newObj != false)
   {
      setObjectSelected(%newObj, 1);
      $hitObject = %newObj;
   }
}

function mouseRayTest(%this, %pos, %start, %ray)
{
   %ray = VectorScale(%ray, 2000);
   %end = VectorAdd(%start, %ray);
   %result = ContainerRayCast( %start, %end, $TypeMasks::StaticObjectType);
   
   // If the terrain object was found in the scan
   if( %result )
   {
      %obj = firstWord(%result);  
      %hitPos = getWords(%result, 1, 3);
      
      //echo(" hit object " @ %obj.getId() @ " / " @ %obj.getName() @ " at " @ %pos);
      if( %obj.isMethod( "getTargetName" ) )
      {
         selectObject(%obj);
         return;
      }
   }
   selectObject(false);
}

function MainMenuGui::onMouseMove(%this, %pos, %start, %ray)
{
   mouseRayTest(%this, %pos, %start, %ray);
}

function MainMenuGui::onMouseDown(%this, %pos, %start, %ray)
{
   mouseRayTest(%this, %pos, %start, %ray);
   if($hitObject == false) return;   
   %n = $hitObject.getName();
   
   if(%n $= "betaSign")
   {
      gotoWebPage("http://www.beamng.com/alpha");
      schedule(200, 0, selectObject, false);
   }
}

function MainMenuGui::onMouseMoveSpecial(%this, %mousePosX, %mousePosY)
{
   if (!isObject(LocalClientConnection)) return;
   %obj = LocalClientConnection.getControlObject();
   if (!isObject(%obj)) return;

   if($camStartPos == false)
   {
      $camStartPos = %obj.getPosition();
      $camTargetPos = $camStartPos;
   } else
   {
      %camMoveX = %mousePosX * $moveRangeX - ($moveRangeX * 0.5);
      %camMoveZ = (1 - %mousePosY) * $moveRangeZ - ($moveRangeZ * 0.5);
      $camTargetPos = VectorAdd($camstartPos,(%camMoveX@" 0 "@%camMoveZ));
   }
}