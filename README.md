# Adaptive Noise Cancellation using LMS Filter 🎵🔊  

## Overview  
This MATLAB script implements **Adaptive Noise Cancellation** using the **Least Mean Squares (LMS) filter**. It records clean speech, adds simulated noise, and then applies LMS filtering to remove the noise.  

## Features  
- **Records clean audio** (5 seconds)  
- **Adds simulated noise** to the signal  
- **Applies LMS adaptive filtering** to remove noise  
- **Plots the original, noisy, and cleaned signals**  
- **Plays and saves the cleaned audio** (`cleaned_speech.wav`)  

## Requirements  
- MATLAB with Signal Processing Toolbox  

## Usage  
1. Run the script in MATLAB.  
2. Speak during the 5-second recording window.  
3. The script will process the audio, display plots, and play the cleaned speech.  
4. The cleaned speech is saved as `cleaned_speech.wav`.  

## Output  
- **Graphical representation** of the original, noisy, and cleaned signals.  
- **Filtered audio playback** after noise removal.  
