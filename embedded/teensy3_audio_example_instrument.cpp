#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>

AudioInputI2S adc;
AudioOutputI2S dac;

AudioAnalyzePeak peakInputLeft, peakInputRight, peakOutputLeft, peakOutputRight,
    peakDelayFilter, peakInputFeedback;

AudioMixer4 mixerInputFeedback, mixerDelay, mixerFilter, mixerOutputLeft,
    mixerOutputRight;

AudioEffectDelay effectDelay;
AudioFilterStateVariable effectFilter;

AudioConnection patchCordA(adc, 0, mixerInputFeedback, 0),
    patchCordB(adc, 0, peakInputLeft, 0),
    patchCordC(adc, 1, mixerInputFeedback, 1),
    patchCordD(adc, 1, peakInputRight, 0),
    patchCordE(effectDelay, 0, mixerDelay, 0),
    patchCordF(effectDelay, 1, mixerDelay, 1),
    patchCordG(effectDelay, 2, mixerDelay, 2),
    patchCordH(effectDelay, 3, mixerDelay, 3),
    patchCordI(effectFilter, 0, mixerFilter, 0),
    patchCordJ(effectFilter, 1, mixerFilter, 1),
    patchCordK(effectFilter, 2, mixerFilter, 2),
    patchCordL(mixerDelay, 0, effectFilter, 0),
    patchCordM(mixerFilter, 0, mixerInputFeedback, 2),
    patchCordN(mixerFilter, 0, mixerOutputLeft, 0),
    patchCordO(mixerFilter, 0, mixerOutputRight, 0),
    patchCordP(mixerFilter, peakDelayFilter),
    patchCordQ(mixerInputFeedback, effectDelay),
    patchCordR(mixerInputFeedback, peakInputFeedback),
    patchCordS(mixerOutputLeft, 0, dac, 0),
    patchCordT(mixerOutputLeft, peakOutputLeft),
    patchCordU(mixerOutputRight, 0, dac, 1),
    patchCordV(mixerOutputRight, peakOutputRight);

void setup() {}

void loop() {}

