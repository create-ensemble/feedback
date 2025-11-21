# feedback

## The Idea

In a typical musical ensemble, each musician makes their own independent sound, and the full music is the sum (mix) of all musician's outputs.

Here we explore a radically interdependent alternative, where each "instrument" has an audio *input* (what the instrument "hears") as well as an audio output (what the instrument "says"), and we make sound by connecting the instruments to each other in different ways, with audio signals flowing through multiple musicians' instruments.


If each instrument belongs to a separate musician, then the basic setup is:

1. A central matrix mixer manages all the connections among instruments.
2. Each musician/instrument receives their individual *hear* signal from their output of the matrix mixer and into their instrument.
3. Each musician/instrument produces their individual *say* signal from the output of their instrument and into their input of the matrix mixer.
4. Each musician/instrument decides for themselves, moment by moment, whether and how to incorporate a modified/processed version of their *hear* signal into their *say* signal, as well as what additional sounds to include in their *say* signal.
5. The instrument could be as simple as just a gain knob (making *say* be just a scaled version of *hear*), or arbitrarily complex processing, synthesis, etc.  In principle an instrument could ignore its *hear* signal, but that takes away the interdependence and fun.
6. The matrix mixer can dynamically change the network topologies (the signal routing among the instruments), including chains, loops, etc.  With N instruments there are 2^(N*N) possible topologies.

Also each instrument can be a quasi-autonomous software agent, in which case one performer can control multiple instruments simultaneously.

Please see our 2015 NIME paper for more details: <https://dl.acm.org/doi/10.5555/2993778.2993816>



## History

[This][] is a collection of technology (software mostly) that was
generated as a byproduct of the development of a series improvised
musical performance pieces titled "feedback" by the [CREATE
Ensemble][] at UCSB and subsequently iterated by Matt Wright, Karl Yerkes,
Christopher Jette, and others.

In this piece, each player performs with an instrument
that processes an input signal which is a mix of other players output
signals such that feedback is inevitable and central to the
performance.

## Installation / Dependencies

The Max patches depend on some "externals" not distributed with Max:

1. Max's third party (but maintained by a Cycling 74 employee) `shell`
external lets you execute command-line commands from Max:
<https://cycling74.com/forums/shell>

2. Miller Puckette's venerable `fiddle~` external does pitch estimation;
currently maintained by Volker Böhm: <https://vboehm.net/downloads>

3. `OSC-route` from the `CNMAT Externals` package (available via Max's
built-in Package Manager).


## Usage

**Plug all of the players into the matrix mixer** such as by having
analog "hear" and "say" signals to a central multichannel digital
audio interface (or something more complicated such as jacktrip)

**Use one of the Max/MSP "Top Level" patches** (such as any `.maxpat`
inside `maxmsp/top-level-patches+history`) to implement the matrix mixer
with changeable topologies along with many other features.

### Matrix Mixer Code Starting Points

This repo includes several "top level" patches meant to be starting points for customized versions of the matrix mixer at the heart of this method.

`New-mainpatch-example.00-graph-visual.maxpat` is just the visualization of various connection topologies.


`New-mainpatch-example.01-simplest.maxpat` shows a simple Max architecture.

1. The top is `receive~` of the *hear* signals
2. These go into the instruments, represented by a `bpatcher` of `choose-12-instruments`, allowing you to choose whether each instrument will use "real" I/O (with *hear* corresponding to a matrix output and *say* corresponding to a matrix input) or options to bypass the instrument (e.g., because that musician is missing at this practice).
3. Each instrument's *say* output goes to an independent loudspeaker (the `dac~ 1 2 3 4 5 6 7 8 9 10 11 12` on the left)
4. Each instrument's *say* output also goes to the corresponding matrix input (an inlet to `mymatrix~`)



`New-mainpatch-example.02-mmsay+osc.maxpat` shows a more flexible and complicated approach based on the `mymatrix-say~` abstraction.

1. The top is the outputs of `mymatrix-say~`, namely the mixture of everything each instrument says.  (This could include additional sounds created in other patches and connected via `send~ say1` through `send~ say12`
2. These *say* signals go into the independent loudspeakers (the `dac~ 1 2 3 4 5 6 7 8 9 10 11 12` on the left)
3. These *say* signals also go into the matrix mixer (`mymatrix~`)
4. `choose-12-instruments` again represents/abstracts the individual instruments
5. The outputs of the the instruments are the *say* signals (`send12~ say`)

New-mainpatch-example.03-maxinsts.maxpat




## DONE

- This repo and this write-up
- Example instruments in Max/MSP, Puredata, and Arduino
- Matrix mixer to replace hardware/analog mixer and facilitate visualizations


## Instrument Design and Typical Characteristics

As the nature of the piece has evolved so has the description of the typical
(or desirable) instrument. Each instrument in the piece is a node in a digraph
of audio signals (and potentially metadata streams), so in order to allow
feedback, each instrument must provide a few basic affordances and each digraph
(there may be more than one) must contain at least one cycle--One way to ensure
this is to make the "out degree" of each node 1 where an out-vertex means
"listens to" or "processes" (Alternatively, you could make the "in degree" 1
where an in-vertex means "sends audio to"). Next, each node must provide some
sort of attenuation/amplification and some perceptually substantial delay.
Ideally (optionally), an instrument (or the system) shows the player the input
level and the output level of her node, but the input spectrum and the output
spectrum may be more useful visual feeback.

For the piece to remain viable, some characteristics are necessary for the
system and some characteristics are necessary for each individual node
(instrument). For instance, when the topology is a simple, single ring, at
least one instrument needs to exhibit a long delay (perceptually substantial)
so that the feedback system does not suffer from unwieldy "ringing". More
generally, any instrument that is participant in a ring (aka digraph cycle)
should exhibit a long delay. For this reason, ideally each instrument has
controllable delay time.

Each instrument may exhibit internal feedback and each instrument creator is
encouraged to internal feedback.

The system may be thought of as a [Feedback Delay Network][].

## (Possible) Scholarly References

http://www.mtg.upf.edu/files/publications/9b7c65-NIME2005-Jorda.pdf  
http://www.chadmckinneyaudio.com/WP-Content/resources/papers/Visualizing2013.pdf  

## Topics / Keywords

- [Second-order Cybernetics][]  
- [Directed graph][]  
- [Stability theory][]  
- [Attractors][]  
- [Feedback Delay Network][]  

[This]: https://github.com/create-ensemble/feedback
[CREATE Ensemble]: https://github.com/create-ensemble
[Second-order Cybernetics]: http://en.wikipedia.org/wiki/Second-order_cybernetics
[Directed graph]: http://en.wikipedia.org/wiki/Directed_graph
[Stability theory]: http://en.wikipedia.org/wiki/Stability_theory
[Attractors]: http://en.wikipedia.org/wiki/Attractor
[Feedback Delay Network]: https://ccrma.stanford.edu/~jos/cfdn/Feedback_Delay_Networks.html
