window.AudioContext =
  window.AudioContext ||
  window.webkitAudioContext ||
  window.mozAudioContext ||
  window.msAudioContext
audioContext = new AudioContext()
body = document.getElementById 'microphone_visualizer'
canvas = document.getElementById 'micCanvas'
ctx = canvas.getContext '2d'
#width = canvas.width = window.innerWidth
#height = canvas.height = window.innerHeight
width = canvas.width = 1024
height = canvas.height = 768

analyser = audioContext.createAnalyser()
gainNode = audioContext.createGain()

filter = audioContext.createBiquadFilter()
filter.type = 1
filter.frequency.value = 440
gainNode.gain.value = 0

@init = () ->
  audioObject = { 'audio': true}
  errorBack = (e) ->
    console.log 'Web Audio error:' + e.code

  getStream = (stream) ->
    mediaStreamSource = audioContext.createMediaStreamSource(stream)

    mediaStreamSource.connect filter
    filter.connect analyser
    audioContext.connect gainNode
    gainNode.connect audioContext.destination
    analyser.connect audioContext.destination

  Loop = () ->
    ctx.clearRect(0, 0, width, height)
    ctx.fillStyle = '#ffffff'
    ctx.fillRect(0, 0, width, height)

    data = new Uint8Array(analyser.frequencyBinCount)
    analyser.getByteFrequencyData(data)

    sum = parseFloat(0)
    for i in [0..data.length]
      sum = sum + parseFloat(data[i]) unless isNaN(data[i])
    ave = sum / parseFloat(data.length-1)

    ctx.fillStyle = '#34bcdc'

    ctx.beginPath()
    ctx.arc(width/2, height/2, ave*5, 0, Math.PI*2, false)
    ctx.stroke()

    ctx.beginPath()
    ctx.arc(
      width/2, height/2, height/8, (Math.PI/180)*0, (Math.PI/180)*360, false
    )
    ctx.fill()

    for i in [0..data.length]
      # ctx.fillRect(i*10, 0 , 10, data[i]*2)
      ctx.fillRect(i*1, height , 1, -data[i]*2)
      # ctx.fillRect(i*10, height/2 , 10, data[i]*2)
      # ctx.fillRect(i*10, height/2 , 10, -data[i]*2)

    requestAnimationFrame(Loop)

  Loop()

  if navigator.webkitGetUserMedia
    navigator.webkitGetUserMedia(audioObject, getStream, errorBack)
  else
    console.log 'can\'t get microphone'
init()