--[[
Title: Graphical User Interface API 
Description: A generic API that can be used in order to build a simple to complex user interface and handle events associated with such. 
--]]

local function draw(self) --Redraws the screen including any changes to the gui set. 
	local term = self.term
	for id=self.lastid,1,-1 do
		local obj = self.obj[id]
		if obj then
			term.setCursorPos(obj.x,obj.y)
			term.setBackgroundColor(obj.bg)
			term.setTextColor(obj.fg)
			diff = obj.l-obj.text 
			if diff < 0 then
				error("Text is too long for object. ID: "..obj.id)
			end
			for i=0, obj.l-1 do
				for j=0, obj.h-1 do
					term.setCursorPos(obj.x+i, obj.y+h)
					term.
				end
			end
		end
	end
end

local function add(self, x, y, l, h) --Allows for the addition of a new gui object into the set. 
	local button = {
		id = #self.obj+1,
		x = x,
		y = y,
		l = l,
		h = h
	}
	if #self.obj+1>self.lastid then 
		self.lastid = #self.obj+1
	end
	self.obj[id] = button
end

local function rm(self, id) --Allows for the removal of a gui object. 
	self.obj[id] = nil
end

local function set(self, id, bg, fg, cc) --Allows for the setting of a gui object. 
	self.obj[id].bg = bg
	self.obj[id].fg = fg
	self.obj[id].cc = cc --CC stands for Click Color. 
end

local function setText(self, id, text, x, y)
	local obj = self.obj[id]
	obj.text = text 
	obj.tx = x
	obj.ty = y
end

local function repos(self, id, x, y, l, w) --Allows for the translocation of a gui object. 
	self.obj[id].x = x
	self.obj[id].y = y
	self.obj[id].l = l
	self.obj[id].h = h
end

local function clear(self) --Allows for the removal of all gui objects in a gui set without deleting the entire table itself. 
	self.obj = nil
	self.obj = {}
	self.lastid = 0
end

local function createSet(monitor) --Allows for the creation of a gui set. 
	local tab = {
		obj = {},
		draw = draw,
		add = add,
		rm = rm,
		set = set,
		move = move,
		clear = clear,
		lastid = 0
	}
	if monitor then 
		tab.term = monitor
	else
		tab.term = term
	end
	return tab
end

local function checkSet(self, event) 
	for i=self.lastid, 1, -1 do 
		--TODO
	end
end

local function drawLayers(...)
	arg = {...}
	for i=1, #arg do 
		draw(arg[i])
	end
end

local gui = {
	createSet = createSet,
	drawLayers = drawLayers 
}

return gui