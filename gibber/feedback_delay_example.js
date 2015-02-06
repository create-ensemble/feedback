//Gibber.clear()
l = LPF()
l.cutoff = Slider()
h = HPF()
h.cutoff = Slider()
d = Delay({wet:1, dry:0})
d.time = Slider()
d.feedback = Slider()
input = Input()
g = Group(input).fx.add(d, h, l)
follow = Follow( g.fx[2] )
inputFollow = Follow( input )

h = Column()
cnvs = Canvas( h )

cnvs.draw = function() {
  cnvs.clear()
  
  var val = follow.getValue(),
      inputVal = inputFollow.getValue(),
      canvasHeight = cnvs.height * .5,
      inputHeight = canvasHeight - (canvasHeight * inputVal),
      top = canvasHeight - (canvasHeight * val),
      height = canvasHeight - top
  
  cnvs.fillRect( 0, top, cnvs.width, height )
  cnvs.fill( 'white' )
  
  cnvs.fillRect(0, canvasHeight + inputHeight, cnvs.width, inputHeight )
  cnvs.fill( 'red' ) 
}