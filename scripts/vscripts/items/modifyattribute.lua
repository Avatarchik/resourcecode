--[[
Author: DDSuper
Item: Book of Strength / Book of Agillity / Book of Intellect
Data: 10.28.2019
--]]

function ChangeAtribute(keys)
	keys.caster:ModifyAgility(keys.BonusAgillity)
end
function ChangeAtributeInt(keys)
	keys.caster:ModifyIntellect(keys.BonusIntellect)
end
function ChangeAtributeStr(keys)
	keys.caster:ModifyStrength(keys.BonusStrength)
end
