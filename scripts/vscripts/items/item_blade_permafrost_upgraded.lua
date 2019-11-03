function PurgeEffects( keys )
	local target = keys.target
	local caster = keys.caster
	local ability = keys.ability

	if target:TriggerSpellAbsorb(ability) then 	return end
	target:TriggerSpellReflect(ability)
	target:Purge(true, false, false, false, false)
end