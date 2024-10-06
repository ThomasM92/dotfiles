return {
-- ┌───────────────────────────────────────────────────────────┐
-- │      ┌────────┐                                           │
-- │      │ Multi  │                                ┌───────+  │
-- │      │ Select │    ┌───────┐                   │ Entry │  │
-- │      └─────┬──*    │ Entry │    ┌────────+     │ Maker │  │
-- │            │   ┌───│Manager│────│ Sorter │┐    └───┬───*  │
-- │            ▼   ▼   └───────*    └────────┘│        │      │
-- │            1────────┐                 2───┴──┐     │      │
-- │      ┌─────│ Picker │                 │Finder│◀────┘      │
-- │      ▼     └───┬────┘                 └──────*            │
-- │ ┌────────┐     │       3────────+         ▲               │
-- │ │Selected│     └───────│ Prompt │─────────┘               │
-- │ │ Entry  │             └───┬────┘                         │
-- │ └────────*             ┌───┴────┐  ┌────────┐  ┌────────┐ │
-- │     │  ▲    4─────────┐│ Prompt │  │(Attach)│  │Actions │ │
-- │     ▼  └──▶ │ Results ││ Buffer │◀─┤Mappings│◀─┤User Fn │ │
-- │5─────────┐  └─────────┘└────────┘  └────────┘  └────────┘ │
-- ││Previewer│                                                │
-- │└─────────┘                   telescope.nvim architecture  │
-- └───────────────────────────────────────────────────────────┘
	'Bekaboo/dropbar.nvim',
	-- optional, but required for fuzzy finder support
	dependencies = {
		'nvim-telescope/telescope-fzf-native.nvim',
	},
	config = function()
		vim.ui.select = require('dropbar.utils.menu').select
	end
}
