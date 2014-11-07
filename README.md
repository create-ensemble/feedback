# feedback

[This repo][] is a collection of technology (software mostly) that was/is
generated as a byproduct of the development of an improvised musical
performance piece currently titled "feedback" by the [CREATE Ensemble][]. In
this piece, each player performs with an instrument that processes an input
signal which is a mix of other players output signals such that feedback is
inevitable. So far, the topology of the signal digraph is a single ring--Each
player processes the input of her immediate right (or left) neighbor. However,
many different topologies are possible (and possibly interesting) and the one
goal of the piece is to explore changing digraph topologies during the
performance.

## DONE

- This repo and this write-up
- Example instruments in Max/MSP, Puredata, and Arduino
- Matrix mixer to replace hardware/analog mixer and facilitate visualizations

## TODO

- Test matrix mixer in rehersal/performance
- Implement internal multitap delay feedback example instrument
- Implement embedded instrument (Raspberry Pi, Teensy3, iPad)
- Create visualization of piece, including graph topolgy, spectrums, levels,
  waveforms, delay time, internal feedback parameters, etc
- Explore new topologies and topology transitions in rehersal and performance
- Research methods for assessing stability and predicting attractors

## Instrument Design and Typical Characteristics

As the nature of the piece has evolved so has the description of the typical
(or desirable) instrument. Each instrument in the piece is a node in a digraph,
so in order to allow feedback, each instrument must provide a few basic
affordances and each digraph must contain at least one cycle. Each node must
provide some sort of attenuation/amplification and some perceptually
substantial delay. Ideally (optionally), an instrument (or the system) shows
the player the input level and the output level of her node, but the input
spectrum and the output spectrum may be more useful visual feeback.

Necessary characteristics of the system versus necessary characteristics of the
individual instrument or node....

Optional, but helpful or pleasing
  Input / Output visualization (level and/or spectrum)
  Controllable delay

Rad, but unnecessary
  Internal feedback

## 

http://www.mtg.upf.edu/files/publications/9b7c65-NIME2005-Jorda.pdf

## Topics / Keywords

- [Second-order Cybernetics][]  
- [Directed graph][]  
- [Stability theory][]  
- [Attractors][]

[CREATE Ensemble]: https://github.com/create-ensemble
[This repo]: https://github.com/create-ensemble/feedback
[Second-order Cybernetics]: http://en.wikipedia.org/wiki/Second-order_cybernetics
[Directed graph]: http://en.wikipedia.org/wiki/Directed_graph
[Stability theory]: http://en.wikipedia.org/wiki/Stability_theory
[Attractors]: http://en.wikipedia.org/wiki/Attractor
