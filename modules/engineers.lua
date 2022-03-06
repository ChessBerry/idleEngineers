local modPath = '/mods/idleEngineers/'
local addListener = import(modPath .. 'modules/init.lua').addListener
local getUnits = import(modPath .. 'modules/units.lua').getUnits
--local unitData = import(modPath ..'modules/units.lua').unitData

local LayoutHelpers = import('/lua/maui/layouthelpers.lua')
local Bitmap = import('/lua/maui/bitmap.lua').Bitmap
local ItemList = import('/lua/maui/itemlist.lua').ItemList
local Group = import('/lua/maui/group.lua').Group
local UIUtil = import('/lua/ui/uiutil.lua')

local overlays = {}
                                              --!!! for turn off any overlay scroll down !!!--
  --ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
             -- T1 engineer  - working, idle
function CreateOverlay1(unit)
	local overlay = Bitmap(GetFrame(0))
	local id = unit:GetEntityId()

	--print "creating overlay"

	overlay:SetSolidColor('black') -- color of overlay background
	overlay.Width:Set(10)            -- width of overlay background
	overlay.Height:Set(12)           -- height of overlay background

	overlay:SetNeedsFrameUpdate(true)
	overlay.OnFrame = function(self, delta)
		if(not unit:IsDead()) then
			local worldView = import('/lua/ui/game/worldview.lua').viewLeft
			local pos = worldView:Project(unit:GetPosition())
			LayoutHelpers.AtLeftTopIn(overlay, worldView, pos.x - overlay.Width() / 2, pos.y - overlay.Height() / 2 + 1)
		else
			overlay.destroy = true
			overlay:Hide()
		end
	end

	overlay.id = unit:GetEntityId()
	overlay.destroy = false
	overlay.text = UIUtil.CreateText(overlay, '0', 11, UIUtil.bodyFont) -- second number define size of text in overlay
	overlay.text:SetColor('green')
	overlay.text:SetDropShadow(true)
	LayoutHelpers.AtCenterIn(overlay.text, overlay, 0, 0)

	return overlay
end

function UpdateOverlay1(e)
	local id = e:GetEntityId()
--	local data = unitData(e)
	local tech = 0
	local color = 'green'

	if e:IsIdle() then
		-- IDLE
		if(not overlays[id] and e:IsIdle()) then
			overlays[id] = CreateOverlay1(e)
		end
		overlays[id].text:SetColor('purple') -- color of idle overlay text
		overlays[id].text:SetText("1")        -- text of idle overlay

		
	elseif (not e:IsIdle()) then
         -- WORKING
    	if(not overlays[id] and (not e:IsIdle())) then
			overlays[id] = CreateOverlay1(e)
		end
		overlays[id].text:SetColor('white')  -- color of working overůay text
		overlays[id].text:SetText("1")         -- text of working overlay
	  	  
	else
		if (overlays[id]) then
			--print "Bye bye overlay"
			overlays[id].destroy = true
			overlays[id]:Hide()
		end
	end
end

function engineerOverlay1()
	--print "Hello"
	local engineers = EntityCategoryFilterDown(categories.TECH1 * categories.ENGINEER, getUnits())
	for _, e in engineers do
		--print "Whats up doc!"
		--LOG("e", repr(e))
		if not e:IsDead() then
			UpdateOverlay1(e)
		end
	end
	for id, overlay in overlays do
		if(not overlay or overlay.destroy) then
			--print "Bye bye overlay 2"
			overlay:Destroy()
			overlays[id] = nil
		end
	end
end
 
--fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
             -- T1 engineer  - idle
 function CreateOverlay11(unit)
	local overlay = Bitmap(GetFrame(0))
	local id = unit:GetEntityId()

	--print "creating overlay"

	overlay:SetSolidColor('black')
	overlay.Width:Set(10)
	overlay.Height:Set(12)

	overlay:SetNeedsFrameUpdate(true)
	overlay.OnFrame = function(self, delta)
		if(not unit:IsDead()) then
			local worldView = import('/lua/ui/game/worldview.lua').viewLeft
			local pos = worldView:Project(unit:GetPosition())
			LayoutHelpers.AtLeftTopIn(overlay, worldView, pos.x - overlay.Width() / 2, pos.y - overlay.Height() / 2 + 1)
		else
			overlay.destroy = true
			overlay:Hide()
		end
	end

	overlay.id = unit:GetEntityId()
	overlay.destroy = false
	overlay.text = UIUtil.CreateText(overlay, '0', 11, UIUtil.bodyFont)
	overlay.text:SetColor('green')
	overlay.text:SetDropShadow(true)
	LayoutHelpers.AtCenterIn(overlay.text, overlay, 0, 0)

	return overlay
end

function UpdateOverlay11(k)
	local id = k:GetEntityId()
--	local data = unitData(k)
	local tech = 0
	local color = 'green'

	if not k:IsIdle() then
		--print "is idle"
		if(not overlays[id] and not k:IsIdle()) then
			overlays[id] = CreateOverlay11(k)
		end
		overlays[id].text:SetColor('white')
		overlays[id].text:SetText("1")
	else
		if (overlays[id]) then
			--print "Bye bye overlay"
			overlays[id].destroy = true
			overlays[id]:Hide()
		end
	end
end

function engineerOverlay11()
	--print "Hello"
	local engineers = EntityCategoryFilterDown(categories.TECH1 * categories.ENGINEER, getUnits())
	for _, k in engineers do
		--print "Whats up doc!"
		--LOG("k", repr(k))
		if not k:IsDead() then
			UpdateOverlay11(k)
		end 
	end
	for id, overlay in overlays do
		if(not overlay or overlay.destroy) then
			--print "Bye bye overlay 2"
			overlay:Destroy()
			overlays[id] = nil
		end
	end
end
 --fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
			 -- T2 engineer - working, idle
	function CreateOverlay2(unit)
	local overlay = Bitmap(GetFrame(0))
	local id = unit:GetEntityId()

	--print "creating overlay"

	overlay:SetSolidColor('black')
	overlay.Width:Set(12)
	overlay.Height:Set(13)

	overlay:SetNeedsFrameUpdate(true)
	overlay.OnFrame = function(self, delta)
		if(not unit:IsDead()) then
			local worldView = import('/lua/ui/game/worldview.lua').viewLeft
			local pos = worldView:Project(unit:GetPosition())
			LayoutHelpers.AtLeftTopIn(overlay, worldView, pos.x - overlay.Width() / 2, pos.y - overlay.Height() / 2 + 1)
		else
			overlay.destroy = true
			overlay:Hide()
		end
	end

	overlay.id = unit:GetEntityId()
	overlay.destroy = false
	overlay.text = UIUtil.CreateText(overlay, '0', 11, UIUtil.bodyFont)
	overlay.text:SetColor('green')
	overlay.text:SetDropShadow(true)
	LayoutHelpers.AtCenterIn(overlay.text, overlay, 0, 0)

	return overlay
end

function UpdateOverlay2(d)
	local id = d:GetEntityId()
--	local data = unitData(d)
	local tech = 0
	local color = 'green'

	if d:IsIdle() then
		--print "is idle"
		if(not overlays[id] and d:IsIdle()) then
			overlays[id] = CreateOverlay2(d)
		end
		overlays[id].text:SetColor('purple')
		overlays[id].text:SetText("2")

		
	elseif (not d:IsIdle()) then
         
    	if(not overlays[id] and (not d:IsIdle())) then
			overlays[id] = CreateOverlay2(d)
		end
		overlays[id].text:SetColor('white')
		overlays[id].text:SetText("2")
	  	  
	else
		if (overlays[id]) then
			--print "Bye bye overlay"
			overlays[id].destroy = true
			overlays[id]:Hide()
		end
	end
end

function engineerOverlay2()
	--print "Hello"
	local engineers = EntityCategoryFilterDown(categories.TECH2 * categories.ENGINEER, getUnits())
	for _, d in engineers do
		--print "Whats up doc!"
		--LOG("d", repr(d))
		if not d:IsDead() then
			UpdateOverlay2(d)
		end
	end
	for id, overlay in overlays do
		if(not overlay or overlay.destroy) then
			--print "Bye bye overlay 2"
			overlay:Destroy()
			overlays[id] = nil
		end
	end
end

--fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
			 -- T2 Engineer - idle
	function CreateOverlay22(unit)
	local overlay = Bitmap(GetFrame(0))
	local id = unit:GetEntityId()

	--print "creating overlay"

	overlay:SetSolidColor('black')
	overlay.Width:Set(12)
	overlay.Height:Set(13)

	overlay:SetNeedsFrameUpdate(true)
	overlay.OnFrame = function(self, delta)
		if(not unit:IsDead()) then
			local worldView = import('/lua/ui/game/worldview.lua').viewLeft
			local pos = worldView:Project(unit:GetPosition())
			LayoutHelpers.AtLeftTopIn(overlay, worldView, pos.x - overlay.Width() / 2, pos.y - overlay.Height() / 2 + 1)
		else
			overlay.destroy = true
			overlay:Hide()
		end
	end

	overlay.id = unit:GetEntityId()
	overlay.destroy = false
	overlay.text = UIUtil.CreateText(overlay, '0', 11, UIUtil.bodyFont)
	overlay.text:SetColor('green')
	overlay.text:SetDropShadow(true)
	LayoutHelpers.AtCenterIn(overlay.text, overlay, 0, 0)

	return overlay
end

function UpdateOverlay22(l)
	local id = l:GetEntityId()
--	local data = unitData(l)
	local tech = 0
	local color = 'green'

	if l:IsIdle() then
		--print "is idle"
		if not(not overlays[id] and l:IsIdle()) then
			overlays[id] = CreateOverlay22(l)
		end
		overlays[id].text:SetColor('white')
		overlays[id].text:SetText("2")
	else
		if (overlays[id]) then
			--print "Bye bye overlay"
			overlays[id].destroy = true
			overlays[id]:Hide()
		end
	end
end

function engineerOverlay22()
	--print "Hello"
	local engineers = EntityCategoryFilterDown(categories.TECH2 * categories.ENGINEER, getUnits())
	for _, l in engineers do
		--print "Whats up doc!"
		--LOG("l", repr(l))
		if not l:IsDead() then
			UpdateOverlay22(l)
		end
	end
	for id, overlay in overlays do
		if(not overlay or overlay.destroy) then
			--print "Bye bye overlay 2"
			overlay:Destroy()
			overlays[id] = nil
		end
	end
end

  --ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
             -- T3 Engineer - working, idle
function CreateOverlay3(unit)
	local overlay = Bitmap(GetFrame(0))
	local id = unit:GetEntityId()

	--print "creating overlay"

	overlay:SetSolidColor('black') 
	overlay.Width:Set(12)  
	overlay.Height:Set(13) 

	overlay:SetNeedsFrameUpdate(true)
	overlay.OnFrame = function(self, delta)
		if(not unit:IsDead()) then
			local worldView = import('/lua/ui/game/worldview.lua').viewLeft
			local pos = worldView:Project(unit:GetPosition())
			LayoutHelpers.AtLeftTopIn(overlay, worldView, pos.x - overlay.Width() / 2, pos.y - overlay.Height() / 2 + 1)
		else
			overlay.destroy = true
			overlay:Hide()
		end
	end

	overlay.id = unit:GetEntityId()
	overlay.destroy = false
	overlay.text = UIUtil.CreateText(overlay, '0', 12, UIUtil.bodyFont) 
	overlay.text:SetColor('green')
	overlay.text:SetDropShadow(true)
	LayoutHelpers.AtCenterIn(overlay.text, overlay, 0, 0)

	return overlay
end

function UpdateOverlay3(f)
	local id = f:GetEntityId()
--	local data = unitData(f)
	local tech = 0
	local color = 'green'

	if f:IsIdle() then
		--print "is idle"
		if(not overlays[id] and f:IsIdle()) then
			overlays[id] = CreateOverlay3(f)
		end
		overlays[id].text:SetColor('purple')
		overlays[id].text:SetText("3")

		
	elseif (not f:IsIdle()) then
         
    	if(not overlays[id] and (not f:IsIdle())) then
			overlays[id] = CreateOverlay3(f)
		end
		overlays[id].text:SetColor('white')
		overlays[id].text:SetText("3")
	  	  
	else
		if (overlays[id]) then
			--print "Bye bye overlay"
			overlays[id].destroy = true
			overlays[id]:Hide()
		end
	end
end

function engineerOverlay3()
	--print "Hello"
	local engineers = EntityCategoryFilterDown(categories.BUILTBYTIER3FACTORY * categories.TECH3 * categories.ENGINEER, getUnits())
	for _, f in engineers do
		--print "Whats up doc!"
		--LOG("f", repr(f))
		if not f:IsDead() then
			UpdateOverlay3(f)
		end
	end
	for id, overlay in overlays do
		if(not overlay or overlay.destroy) then
			--print "Bye bye overlay 2"
			overlay:Destroy()
			overlays[id] = nil
		end
	end
end

  --ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
             -- T3 Engineer - idle
function CreateOverlay33(unit)
	local overlay = Bitmap(GetFrame(0))
	local id = unit:GetEntityId()

	--print "creating overlay"

	overlay:SetSolidColor('black')
	overlay.Width:Set(12)
	overlay.Height:Set(13)

	overlay:SetNeedsFrameUpdate(true)
	overlay.OnFrame = function(self, delta)
		if(not unit:IsDead()) then
			local worldView = import('/lua/ui/game/worldview.lua').viewLeft
			local pos = worldView:Project(unit:GetPosition())
			LayoutHelpers.AtLeftTopIn(overlay, worldView, pos.x - overlay.Width() / 2, pos.y - overlay.Height() / 2 + 1)
		else
			overlay.destroy = true
			overlay:Hide()
		end
	end

	overlay.id = unit:GetEntityId()
	overlay.destroy = false
	overlay.text = UIUtil.CreateText(overlay, '0', 12, UIUtil.bodyFont)
	overlay.text:SetColor('green')
	overlay.text:SetDropShadow(true)
	LayoutHelpers.AtCenterIn(overlay.text, overlay, 0, 0)

	return overlay
end

function UpdateOverlay33(m)
	local id = m:GetEntityId()
--	local data = unitData(m)
	local tech = 0
	local color = 'green'

	if m:IsIdle() then
		--print "is idle"
		if not(not overlays[id] and m:IsIdle()) then
			overlays[id] = CreateOverlay33(m)
		end
		overlays[id].text:SetColor('purple')
		overlays[id].text:SetText("3")
	else
		if (overlays[id]) then
			--print "Bye bye overlay"
			overlays[id].destroy = true
			overlays[id]:Hide()
		end
	end
end

function engineerOverlay33()
	--print "Hello"
	local engineers = EntityCategoryFilterDown(categories.BUILTBYTIER3FACTORY * categories.TECH3 * categories.ENGINEER, getUnits())
	for _, m in engineers do
		--print "Whats up doc!"
		--LOG("m", repr(m))
		if not m:IsDead() then
			UpdateOverlay33(m)
		end
	end
	for id, overlay in overlays do
		if(not overlay or overlay.destroy) then
			--print "Bye bye overlay 2"
			overlay:Destroy()
			overlays[id] = nil
		end
	end
end

  --ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
             -- idle SCU
function CreateOverlay4(unit)
	local overlay = Bitmap(GetFrame(0))
	local id = unit:GetEntityId()

	--print "creating overlay"

	overlay:SetSolidColor('black')
	overlay.Width:Set(13)
	overlay.Height:Set(14)

	overlay:SetNeedsFrameUpdate(true)
	overlay.OnFrame = function(self, delta)
		if(not unit:IsDead()) then
			local worldView = import('/lua/ui/game/worldview.lua').viewLeft
			local pos = worldView:Project(unit:GetPosition())
			LayoutHelpers.AtLeftTopIn(overlay, worldView, pos.x - overlay.Width() / 2, pos.y - overlay.Height() / 2 + 1)
		else
			overlay.destroy = true
			overlay:Hide()
		end
	end

	overlay.id = unit:GetEntityId()
	overlay.destroy = false
	overlay.text = UIUtil.CreateText(overlay, '0', 14, UIUtil.bodyFont)
	overlay.text:SetColor('green')
	overlay.text:SetDropShadow(true)
	LayoutHelpers.AtCenterIn(overlay.text, overlay, 0, 0)

	return overlay
end

function UpdateOverlay4(g)
	local id = g:GetEntityId()
--	local data = unitData(g)
	local tech = 0
	local color = 'green'

	if g:IsIdle() then
		--print "is idle"
		if(not overlays[id] and g:IsIdle()) then
			overlays[id] = CreateOverlay4(g)
		end
		overlays[id].text:SetColor('lightblue')
		overlays[id].text:SetText("S")
	else
		if (overlays[id]) then
			--print "Bye bye overlay"
			overlays[id].destroy = true
			overlays[id]:Hide()
		end
	end
end

function engineerOverlay4()
	--print "Hello"
	local engineers = EntityCategoryFilterDown(categories.SUBCOMMANDER, getUnits())
	for _, g in engineers do
		--print "Whats up doc!"
		--LOG("g", repr(g))
		if not g:IsDead() then
			UpdateOverlay4(g)
		end
	end
	for id, overlay in overlays do
		if(not overlay or overlay.destroy) then
			--print "Bye bye overlay 2"
			overlay:Destroy()
			overlays[id] = nil
		end
	end
end

--ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
             -- idle ACU
function CreateOverlay5(unit)
	local overlay = Bitmap(GetFrame(0))
	local id = unit:GetEntityId()

	--print "creating overlay"

	overlay:SetSolidColor('black')
	overlay.Width:Set(15)
	overlay.Height:Set(15)

	overlay:SetNeedsFrameUpdate(true)
	overlay.OnFrame = function(self, delta)
		if(not unit:IsDead()) then
			local worldView = import('/lua/ui/game/worldview.lua').viewLeft
			local pos = worldView:Project(unit:GetPosition())
			LayoutHelpers.AtLeftTopIn(overlay, worldView, pos.x - overlay.Width() / 2, pos.y - overlay.Height() / 2 + 1)
		else
			overlay.destroy = true
			overlay:Hide()
		end
	end

	overlay.id = unit:GetEntityId()
	overlay.destroy = false
	overlay.text = UIUtil.CreateText(overlay, '0', 10, UIUtil.bodyFont)
	overlay.text:SetColor('green')
	overlay.text:SetDropShadow(true)
	LayoutHelpers.AtCenterIn(overlay.text, overlay, 0, 0)

	return overlay
end

function UpdateOverlay5(h)
	local id = h:GetEntityId()
--	local data = unitData(h)
	local tech = 0
	local color = 'green'

	if h:IsIdle() then
		--print "is idle"
		if(not overlays[id] and h:IsIdle()) then
			overlays[id] = CreateOverlay5(h)
		end
		overlays[id].text:SetColor('yellow')
		overlays[id].text:SetText("C")
	else
		if (overlays[id]) then
			--print "Bye bye overlay"
			overlays[id].destroy = true
			overlays[id]:Hide()
		end
	end
end

function engineerOverlay5()
	--print "Hello"
	local engineers = EntityCategoryFilterDown(categories.COMMAND, getUnits())
	for _, h in engineers do
		--print "Whats up doc!"
		--LOG("h", repr(h))
		if not h:IsDead() then
			UpdateOverlay5(h)
		end
	end
	for id, overlay in overlays do
		if(not overlay or overlay.destroy) then
			--print "Bye bye overlay 2"
			overlay:Destroy()
			overlays[id] = nil
		end
	end
end

--ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
             -- idle Factory

function CreateOverlay6(unit)
	local overlay = Bitmap(GetFrame(0))
	local id = unit:GetEntityId()

	--print "creating overlay"

	overlay:SetSolidColor('black')
	overlay.Width:Set(22)
	overlay.Height:Set(11)

	overlay:SetNeedsFrameUpdate(true)
	overlay.OnFrame = function(self, delta)
		if(not unit:IsDead()) then
			local worldView = import('/lua/ui/game/worldview.lua').viewLeft
			local pos = worldView:Project(unit:GetPosition())
			LayoutHelpers.AtLeftTopIn(overlay, worldView, pos.x - overlay.Width() / 2, pos.y - overlay.Height() / -1 - 2)
		else
			overlay.destroy = true
			overlay:Hide()
		end
	end

	overlay.id = unit:GetEntityId()
	overlay.destroy = false
	overlay.text = UIUtil.CreateText(overlay, '0', 9, UIUtil.bodyFont)
	overlay.text:SetColor('green')
	overlay.text:SetDropShadow(true)
	LayoutHelpers.AtCenterIn(overlay.text, overlay, 0, 0)

	return overlay
end

function UpdateOverlay6(j)
	local id = j:GetEntityId()
--	local data = unitData(j)
	local tech = 0
	local color = 'green'

	if j:IsIdle() then
		--print "is idle"
		if(not overlays[id] and j:IsIdle()) then
			overlays[id] = CreateOverlay6(j)
		end
		overlays[id].text:SetColor('white')
		overlays[id].text:SetText("FAC")
	else
		if (overlays[id]) then
			--print "Bye bye overlay"
			overlays[id].destroy = true
			overlays[id]:Hide()
		end
	end
end

function engineerOverlay6()
	--print "Hello"
	local engineers = EntityCategoryFilterDown(categories.FACTORY, getUnits())
	for _, j in engineers do
		--print "Whats up doc!"
		--LOG("j", repr(j))
		if not j:IsDead() then
			UpdateOverlay6(j)
		end
	end
	for id, overlay in overlays do
		if(not overlay or overlay.destroy) then
			--print "Bye bye overlay 2"
			overlay:Destroy()
			overlays[id] = nil
		end
	end
end
----------------- turning off and on overlays
function init(isReplay, parent)   -- 1= overlay is on ,, 2= overlay is off 
	addListener(engineerOverlay1, 1) -- T1 engi working, idle
	addListener(engineerOverlay11, 0) -- T1 engi idle
	addListener(engineerOverlay2, 1) -- T2 engi working, idle
	addListener(engineerOverlay22, 0) -- T2 engi idle
	addListener(engineerOverlay3, 1) -- T3 engi working, idle
	addListener(engineerOverlay33, 0) -- T3 engi idle
	addListener(engineerOverlay4, 1) -- SCU idle
	addListener(engineerOverlay5, 0) -- ACU
	addListener(engineerOverlay6, 1) -- factory idle
end
