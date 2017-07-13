gazooyLength= ->
  size = 142
  gazooy =
    text:      document.getElementById 'gazooyContent'
    remaining: document.getElementById 'charsAvailable'
    button:    document.getElementById 'submit'

  gazooy.text.oninput = (evt) ->
    remaining = size - gazooy.text.value.length
    gazooy.remaining.textContent = remaining
    if remaining < 0
      gazooy.button.disabled = true
    else
      gazooy.button.disabled = false

window.onload = gazooyLength