local M = {}

function M.new()
	local instance = {}

	instance.data = {}

	function instance.clear()
		instance.data = {}
	end
		
	function instance.contains(key)
		return instance.data[key] ~= nil
	end
		
	function instance.set(key, value)
		assert(instance.contains(key) == false, "You can't set a duplicate key => " .. key)
		instance.data[key] = value
	end
	
	function instance.get(key)
		assert(instance.contains(key) == true, "The key does not exist =>" .. key)
		return instance.data[key]
	end

	function instance.get_once(key)
		local v = instance.get(key)
		instance.remove(key)
		return v;
	end

	function instance.remove(key)
		assert(instance.contains(key) == true, "The key does not exist => " .. key)
		instance.data[key] = nil
	end

	function instance.dump()
		pprint(instance.data)
	end

	
	return instance
end

return M