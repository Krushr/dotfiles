local dp1Workspaces = { "1", "2", "3", "4", "5" }
local dp2Workspaces = { "6", "7", "8", "9", "10" }

for _, workspace in ipairs(dp1Workspaces) do
	hl.workspace_rule({
		workspace = workspace,
		monitor = "DP-1",
		persistent = true,
		default = workspace == "1",
	})
end

for _, workspace in ipairs(dp2Workspaces) do
	hl.workspace_rule({
		workspace = workspace,
		monitor = "DP-2",
		persistent = true,
		default = workspace == "6",
	})
end
