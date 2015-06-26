//Gibber.clear()
lpf = LPF()
lpf.cutoff = Slider()
hpf = HPF()
hpf.cutoff = Slider()
delay = Delay({wet:1, dry:0})
delay.time = Slider()
delay.feedback = Slider()
input = Input()
input.fx.add( delay, hpf, lpf )

inputFollow = Follow( input )
outputFollow = Follow( input.fx[2] )

meterColumn = Column()
cnvs = Canvas( meterColumn )

cnvs.draw = function() {
  cnvs.clear()
  
  var val = outputFollow.getValue(),
      inputVal = inputFollow.getValue(),
      canvasHeight = cnvs.height * .5,
      inputHeight = canvasHeight - (canvasHeight * inputVal),
      top = canvasHeight - (canvasHeight * val),
      height = canvasHeight - top
  
  cnvs.fillRect( 0, top, cnvs.width, height )
  cnvs.fill( 'white' )
  
  cnvs.fillRect(0, canvasHeight + inputHeight, cnvs.width, inputHeight )
  cnvs.fill( 'green' ) 
}