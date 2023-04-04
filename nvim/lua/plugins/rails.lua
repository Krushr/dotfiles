return {
	"tpope/vim-rails",
	config = function()
		vim.g.rails_projections = {
			["app/controllers/*.rb"] = {
				test = {
					"spec/controllers/{}_spec.rb",
					"spec/requests/{plural}_spec.rb",
				},
			},
			["app/lib/*.rb"] = {
				test = "spec/lib/{}_spec.rb",
			},
			["app/models/*.rb"] = {
				related = {
					"app/models/{}.sql",
					"app/models/{}.sql.erb",
				},
			},
			["app/models/*.sql"] = {
				related = "app/models/{}.rb",
			},
			["app/models/*.sql.erb"] = {
				related = "app/models/{}.rb",
			},
			["app/sql/*.rb"] = {
				related = {
					"app/sql/{}.sql",
					"app/sql/{}.sql.erb",
				},
			},
			["app/sql/*.sql"] = {
				related = "app/sql/{}.rb",
			},
			["app/sql/*.sql.erb"] = {
				related = "app/sql/{}.rb",
			},
			["config/initializers/*.rb"] = {
				test = "spec/initializers/{}_spec.rb",
			},
			["spec/initializers/*_spec.rb"] = {
				alternate = "config/initializers/{}.rb",
			},
		}
	end,
}
