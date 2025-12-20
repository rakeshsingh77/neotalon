local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then
	return
end

local has_luasnip, luasnip = pcall(require, "luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			if has_luasnip then
				luasnip.lsp_expand(args.body)
			end
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	-- Note: <A-.> and <A-,> (Alt) mappings may not work in all terminals; consider alternatives like <C-Space>.
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<A-.>"] = cmp.mapping.complete(),
		["<A-,>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif has_luasnip and luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif has_luasnip and luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "copilot", group_index = 1 },
		{ name = "nvim_lsp", group_index = 1 },
		{ name = "luasnip", group_index = 1 },
	}, {
		{ name = "buffer" },
		{ name = "path" },
		{ name = "codeium" },
	}),
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})
