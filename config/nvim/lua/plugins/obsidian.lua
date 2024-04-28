local function load_workspace_configurations()
	local home_directory = os.getenv("USERPROFILE")
	if not home_directory then
		error("Failed to retrieve home directory")
	end

	local file_path = home_directory .. "/workspaces_config.json"
	local file = io.open(file_path, "r")
	if not file then
		error("Failed to open workspace configuration file")
	end

	local content = file:read("*a")
	file:close()
	local workspace_config

	local _, _ = pcall(function()
		workspace_config= vim.fn.json_decode(content)
	end)

	return workspace_config
end

local function setup_obsidian()
	local workspace_config = load_workspace_configurations()
	require("obsidian").setup({
		workspaces = workspace_config.workspaces,
		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M:%S",
			substitutions = {},
		},
	})
end

return {
	"epwalsh/obsidian.nvim",
	commit = "0458e675d5ea59ba8df5375bf04f2a5a57720af8",
	config = setup_obsidian
}

