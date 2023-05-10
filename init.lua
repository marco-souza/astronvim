function is_deno_project()
  return vim.fs.find'deno.json' or vim.fs.find'deno.jsonc'
end

return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "tokyonight",

  -- Set tabs
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 300, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      "denols",
      "eslint",
      "pyright",
      "emmet_ls",
      "tsserver",
      "tailwindcss",
    },
    -- custom configs
    --
    -- ref: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    config = {
      -- for node (javascript/typescript)
      tsserver = function()
        return {
          root_dir = require'lspconfig.util'.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
          single_file_support = false,
        }
      end,

      -- for eslint
      eslint = function()
        return {
          root_dir = require'lspconfig.util'.root_pattern(".eslintrc.json", ".eslintrc.js", ".eslintrc", ".eslintrc.yml", ".eslintrc.yaml", ".eslintrc.cjs"),
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
        }
      end,

      -- for deno
      denols = function()
        return {
          root_dir = require'lspconfig.util'.root_pattern("deno.json", "deno.jsonc"),
          filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "json" },
          init_options = {
            lint = true,
            enable = true,
            unstable = true,
          },
        }
      end,
    },

    setup_handlers = {
      tsserver = function(_, opts)
        -- disable if deno
        if is_deno_project() then
          return
        end
        require("lspconfig").tsserver.setup { server = opts }
      end,

      eslint = function(_, opts)
        -- disable if deno
        if is_deno_project() then
          return
        end
        require("lspconfig").eslint.setup { server = opts }
      end,
    }
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
