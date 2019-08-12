function Teleport( event )
	local caster = event.caster
	local point = event.target_points[1]
	
    FindClearSpaceForUnit(caster, point, true)
    caster:Stop() 
    EndTeleport(event)   
end

function EndTeleport( event )
	local caster = event.caster
	caster:StopSound("Hero_Furion.Teleport_Grow")
end