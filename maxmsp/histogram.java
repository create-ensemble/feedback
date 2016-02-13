// Has nothing to do with histograms.   Sums the amplitudes (who not energy?) of all magnitude
// Make a list of floats out of an FFT input signal.
//
// This code makes some big assumptions:
// - The sample rate is 48000
// - The MaxMSP IO vector size is 512
// - The input is the output of an [fft~ 512 512 0] object
//

import com.cycling74.max.*;
import com.cycling74.msp.*;

public class histogram extends MSPPerformer {
  float sampleRate = 48000.0f;
  int fftSize = 512;

  float[] magnitude;
  int[] index;

  static final String[] INLET_ASSIST = new String[] {
    "An input signal assumed to be the output of an [fft~ 512 512 0]"
  };

  static final String[] OUTLET_ASSIST = new String[] {
    "An exact copy of input signal",
    "A list of floats representing the magnitudes of each band"
  };

  int find_index(float frequency, float[] split_list) {
      // index (zero-origin) of the first frequency in split_list greater than the given frequency.
    if (frequency >= split_list[split_list.length - 1])
      return split_list.length;

    for (int i = 0; i < split_list.length; i++)
      if (frequency < split_list[i])
        return i;

    post("could not find index for frequency = " + frequency);
    return -1;
  }

 public histogram(float gain) {
	post("Hello, world4");

        declareInlets(new int[]{SIGNAL});
 
   // XXX eventually remove the output signal, if possible
   declareOutlets(new int[]{DataTypes.ALL});

    // MW: Why not remove the SIGNAL outlet here?
   // declareOutlets(new int[]{SIGNAL, DataTypes.ALL});

    // declareOutlets(new int[]{DataTypes.ALL});

    //declareOutlets(new int[]{SIGNAL, DataTypes.ALL, DataTypes.ALL, DataTypes.ALL});
    createInfoOutlet(false);  // XXX

    setInletAssist(INLET_ASSIST);
    setOutletAssist(OUTLET_ASSIST);


    // MW: Why these numbers?   7Hz seems pretty useless; why not 20Hz to separate infrasound from audible bass?
    float[] split_list = {7,    100,  200,   300,  400,  510,  630,
                             770,  920,  1080,  1270, 1480, 1720, 2000,
                             2320, 2700, 3150,  3700, 4400, 5300, 6400,
                             7700, 9500, 12000, 15500};

    magnitude = new float[split_list.length + 1]; // Will be our output

    index = new int[fftSize]; // Which output index each input FFT bin should contribute to

    // Initialize index
    for (int i = 0; i < fftSize/2; i++) {
      // The frequency of the lower edge of this FFT bin:
      float frequency = i * sampleRate / (fftSize);
      index[i] = find_index(frequency, split_list);
      // post("i" + i + ": freq " + frequency + " -> index " + index[i]);
    }
  }

 public void dspsetup(MSPSignal[] in, MSPSignal[] out) {}

 public void perform(MSPSignal[] in, MSPSignal[] out) {
    // we can test this assumption, at least
    assert in[0].vec.length == 512;

	//post("pp");

    float[] _in = in[0].vec;
  //  float[] _out = out[0].vec;

//	post("1");
    // XXX eventually remove the output signal, if possible
   //for (int i = 0; i < in.length; i++) _out[i] = 0.f;

//	post("2");

    for (int i = 0; i < magnitude.length; i++)
      magnitude[i] = -0.1f;

///	post("3");

    int imax = -1;
    //for (int i = 0; i < magnitude.length; i++)
    for (int i = 0; i < fftSize / 2; i++) {
      imax = i;
      if (_in[i] > magnitude[index[i]]) {
        magnitude[index[i]] = _in[i];
      }
    }

//	post("4:" + imax);

    outlet(0, magnitude);
    //outlet(2, index);
    //outlet(3, _in);

//	post("5");

  }
}





