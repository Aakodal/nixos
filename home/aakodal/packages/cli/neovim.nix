{
  inputs,
  pkgs,
  ...
}: let 
  neovim = inputs.neovim-flake;
in {
  imports = [
    neovim.homeManagerModules.default
  ];

  programs.neovim-flake = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        enableEditorconfig = true;
        enableLuaLoader = true;
        preventJunkFiles = true;

        startPlugins = with pkgs.vimPlugins; [
          nvim-surround
        ];
        luaConfigRC.test = neovim.lib.nvim.dag.entryAnywhere ''
          require("nvim-surround").setup({})
        '';

        lsp = {
          lspkind.enable = true;
          lightbulb.enable = true;
          nvimCodeActionMenu.enable = true;
          lspSignature.enable = true;
        };

        debugger.nvim-dap.ui.enable = true;

        languages = {
          enableLSP = true;
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          html.enable = true;
          clang = {
            enable = true;
            lsp = {
              enable = true;
              server = "clangd";
            };
          };
          sql.enable = true;
          ts.enable = true;
          go.enable = true;
          zig.enable = true;
          python.enable = true;
          dart.enable = true;
          elixir.enable = true;
          svelte.enable = true;
          rust = {
            enable = true;
            crates.enable = true;
          };
        };

        visuals = {
          enable = true;
          nvimWebDevicons.enable = true;
          scrollBar.enable = true;
          smoothScroll.enable = true;
          cellularAutomaton.enable = true;
          fidget-nvim.enable = true;
          indentBlankline = {
            enable = true;
            fillChar = null;
            eolChar = null;
             showCurrContext = true;
          };
          cursorWordline = {
            enable = true;
            lineTimeout = 0;
          };
        };

        statusline.lualine = {
          enable = true;
          theme = "onelight";
        };

        autopairs.enable = true;

        autocomplete = {
          enable = true;
          type = "nvim-cmp";
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "latte";
          transparent = true;
        };

        filetree.nvimTree = {
          enable = true;
          openOnSetup = true;

          sort.sorter = "name";
          
          renderer = {
            rootFolderLabel = false;
            icons.show.git = true;
          };

          view.width = 25;
        };

        tabline.nvimBufferline.enable = true;

        treesitter.context.enable = true;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        telescope.enable = true;

        git = {
          enable = true;
          gitsigns.enable = true;
        };

        dashboard = {
          dashboard-nvim.enable = true;
          alpha.enable = true;
        };

        notify.nvim-notify.enable = true;

        projects.project-nvim = {
          enable = true;
          manualMode = false;
          detectionMethods = ["lsp" "pattern"];
          patterns = [
            ".git"
            ".hg"
            "Makefile"
            "package.json"
            "flake.nix"
            "index.*"
            ".anchor"
          ];
        };

        utility = {
          ccc.enable = true;
          icon-picker.enable = true;
          diffview-nvim.enable = true;
          motion = {
            hop.enable = true;
            leap.enable = true;
          };
        };

        notes = {
          mind-nvim.enable = true;
          todo-comments.enable = true;
        };

        ui = {
          noice.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = false;
          smartcolumn = {
            enable = true;
            columnAt.languages = {
              markdown = 80;
              nix = 150;
              ruby = 110;
              java = 120;
              go = [130];
            };
          };
        };

        session.nvim-session-manager = {
          enable = true;
          autoloadMode = "Disabled"; # misbehaves with dashboard
        };

        comments.comment-nvim.enable = true;

        presence.presence-nvim.enable = true;
      };
    };
  };
}
