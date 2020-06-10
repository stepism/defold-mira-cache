local M = {}

M.data = {}

function M.clear()
	M.data = {}
end

function M.contains(key)
	return M.data[key] ~= nil
end

function M.set(key, value)
--	assert(M.contains(key) == false, "You can't set a duplicate key => " .. key)
	M.data[key] = value
end

function M.get(key)
--	assert(M.contains(key) == true, "The key does not exist =>" .. key)
	return M.data[key]
end

function M.get_once(key)
	local v = M.get(key)
	M.remove(key)
	return v;
end

function M.remove(key)
--	assert(M.contains(key) == true, "The key does not exist => " .. key)
	M.data[key] = nil
end

function M.dump()
	pprint(M.data)
end

return M