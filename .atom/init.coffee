# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

# document.body.classList.add('an-old-hope-modify-ui')

atom.workspace.observeTextEditors (editor) ->
  if editor.getPath()?.match(/\.(variables|overrides)$/)
    editor.setGrammar(atom.grammars.grammarForScopeName('text.less'))
