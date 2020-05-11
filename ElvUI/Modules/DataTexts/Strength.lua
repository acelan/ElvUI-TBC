local E, L, V, P, G = unpack(select(2, ...))
local DT = E:GetModule('DataTexts')

local displayNumberString = ''
local lastPanel;
local strjoin = string.join
local UnitStat = UnitStat
local ITEM_MOD_STRENGTH_SHORT = ITEM_MOD_STRENGTH_SHORT
local LE_UNIT_STAT_STRENGTH = LE_UNIT_STAT_STRENGTH

local function OnEvent(self)
	self.text:SetFormattedText(displayNumberString, ITEM_MOD_STRENGTH_SHORT, UnitStat("player", LE_UNIT_STAT_STRENGTH))

	lastPanel = self
end

local function ValueColorUpdate(hex, r, g, b)
	displayNumberString = strjoin("", "%s: ", hex, "%.f|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E['valueColorUpdateFuncs'][ValueColorUpdate] = true

DT:RegisterDatatext('Strength', 'Primary', { "UNIT_STATS", "UNIT_AURA", "ACTIVE_TALENT_GROUP_CHANGED", "PLAYER_TALENT_UPDATE" }, OnEvent, nil, nil, nil, nil, ITEM_MOD_STRENGTH_SHORT)
