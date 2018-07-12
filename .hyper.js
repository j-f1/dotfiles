// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 12,

    // font family with optional fallbacks
    fontFamily: 'Fira Code, Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BEAM',

    // set to true for blinking cursor
    cursorBlink: true,

    padding: -1,

    // custom css to embed in the main window
    css: `
      /* .unicode-node { display: inline !important; } */
      .footer_footer .item_dirty:before { background-color: currentColor; }
      .footer_footer .item_dirty { color: #c18401; }
    `,
    /* x-screen x-row { font-variant-ligatures: initial; } */

    modifierKeys: { cmdIsMeta: false, altIsMeta: true },

    // enableVibrancy: true,

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    // make sure to use a full path if the binary name doesn't work
    // (e.g `C:\\Windows\\System32\\bash.exe` instead of just `bash.exe`)
    // if you're using powershell, make sure to remove the `--login` below
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {
      HYPER_PASTE_SEPARATOR: '; and '
    },

    // set to false for no bell
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    showHamburgerMenu: true,

    // for advanced config flags please refer to https://hyper.is/#cfg

    hypercwd: {
      initialWorkingDirectory: '~/Documents/Jed_Folder/github-clones'
    }
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: ["hyperterm-paste", // "hyperterm-alternatescroll",
  "hyperterm-tabs", "hyper-sync-settings", // "hyperlinks",
  "hyper-one-light", // "hyper-statusline",
  "~/Documents/Jed_Folder/github-clones/Forks/hyper-statusline", "hypercwd", // "hyper-native",
  "hyper-final-say", "hyper-search"],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
