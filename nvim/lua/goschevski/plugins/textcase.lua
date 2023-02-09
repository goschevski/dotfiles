local _textcase, textcase = pcall(require, 'textcase')
if not _textcase then
  return
end

textcase.setup()
