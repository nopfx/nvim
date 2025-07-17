return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.startify'

    dashboard.section.header.val = {
        [[                                                              ]],
        [[  _______                     _____     ___          ___      ]],
        [[  \      \   ____ ______    _/ ____\   /  / ___  ___ \  \     ]],
        [[  /   |   \ /  _ \\____ \   \   __\   /  /  \  \/  /  \  \    ]],
        [[ /    |    (  <_> )  |_> >   |  |    (  (    >    <    )  )   ]],
        [[ \____|__  /\____/|   __/ /\ |__|     \  \  /__/\_ \  /  /    ]],
        [[        \/       |__|    \/           \__\       \/ /__/      ]],
        [[ Nop.f(x)                                                     ]],
        [[                                                              ]],
    }

    alpha.setup(dashboard.opts)
  end,
}
