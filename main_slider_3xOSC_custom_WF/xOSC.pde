float midiToFreq(int midiNote) {
  float exp = (midiNote - 69) / 12.0f;
  float freq = pow(2, exp) * 440.0f;
  return freq;
}


class Instrument {
  Oscil[] oscillators;
  ADSR[] envelopes;
  int currentWaveformIndex;
  Waveform[] waveforms = {Waves.SINE, Waves.SAW, Waves.TRIANGLE};
  
  Instrument(int numOscillators) {
    oscillators = new Oscil[numOscillators];
    envelopes = new ADSR[numOscillators];
    for (int i = 0; i < numOscillators; i++) {
      oscillators[i] = new Oscil(0, 0.5f, Waves.SINE);
      envelopes[i] = new ADSR();
      oscillators[i].patch(envelopes[i]);
      envelopes[i].patch(out);
    }
    currentWaveformIndex = 0;
  }
  
  void noteOn(int channel, int pitch, int velocity) {
    float freq = midiToFreq(pitch);
    int index = pitch % oscillators.length;
    oscillators[index].setFrequency(freq);
    oscillators[index].setAmplitude(velocity / 127.0f);
    envelopes[index].setParameters(slider[0].read_setting(), slider[1].read_setting(), slider[2].read_setting(), slider[3].read_setting(), slider[4].read_setting(), slider[5].read_setting(), slider[6].read_setting());
    envelopes[index].noteOn();
  }
  
  void noteOff(int channel, int pitch, int velocity) {
    int index = pitch % oscillators.length;
    envelopes[index].noteOff();
  }
  
  void toggleWaveform() {
    currentWaveformIndex = (currentWaveformIndex + 1) % waveforms.length;
    for (Oscil o : oscillators) {
      o.setWaveform(waveforms[currentWaveformIndex]);
    }
  }
}
