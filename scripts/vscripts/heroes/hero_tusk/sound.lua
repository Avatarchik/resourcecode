function playsound(keys)
	local caster = keys.caster
	local target = keys.target

	caster:EmitSound(SynSobaki)
	target:EmitSound(SynSobaki)
end	