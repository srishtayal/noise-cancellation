clc; clear; close all;

% Audio recording settings
Fs = 44100;
nBits = 16;
nChannels = 1; 
recTime = 5; 

% Record clean speech
recObject = audiorecorder(Fs, nBits, nChannels);
disp('Recording clean speech...');
recordblocking(recObject, recTime);
disp('Recording complete.');

% Retrieve audio data
audioInput = getaudiodata(recObject);

% Simulate additive noise
noise = 0.2 * randn(size(audioInput)); 
noisySignal = audioInput + noise; 

% Adaptive LMS Filtering
mu = 0.01; 
nTaps = 32; 

lmsFilter = dsp.LMSFilter(nTaps, 'StepSize', mu);
[cleanedSignal, err] = lmsFilter(noise, noisySignal);

% Time vector for plotting
t = (0:length(audioInput)-1) / Fs;

% Plot all signals in one figure
figure;
subplot(3,1,1);
plot(t, audioInput, 'b');
title('Original Audio Signal');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(3,1,2);
plot(t, noisySignal, 'r');
title('Noisy Audio Signal');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(3,1,3);
plot(t, err, 'g');
title('Filtered Audio Signal (Noise Removed)');
xlabel('Time (s)'); ylabel('Amplitude');

% Play cleaned audio
disp('Playing cleaned audio...');
player = audioplayer(err, Fs);
play(player);

% Save the cleaned audio
audiowrite('cleaned_speech.wav', err, Fs);

disp('Noise removal complete.');
