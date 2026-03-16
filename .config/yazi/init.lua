Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

function Linemode:filesize_dircount()
	local file = self._file

	if file.cha.is_dir then
		-- 如果是目录，计算子项目数量
		local count = 0
		local handle = io.popen('ls -A "' .. file.url .. '" 2>/dev/null | wc -l')
		if handle then
			count = tonumber(handle:read("*a")) or 0
			handle:close()
		end
		return string.format("%d", count)
	else
		local size = file:size()
		return size and ya.readable_size(size) or "-"
	end
end

require("full-border"):setup()
require("git"):setup({
	-- Order of status signs showing in the linemode
	order = 1500,
})
require("zoxide"):setup({
	update_db = true,
})
