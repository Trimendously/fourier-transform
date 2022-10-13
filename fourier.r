# My first r program so this code might be a bit convoluted but I will try and reetroactively fix as I go

#install.packages(c('seewave','tuneR','tidyverse','audio','plotly','fftw','cowplot'))

#The libraries needed for this program

suppressMessages({
library(seewave)
library(tuneR)
library(tidyverse)
library(audio)
library(plotly) # for adding some interactivity dust
library(fftw)
library(cowplot)
})

file <- "PinkPanther30.wav" # A sample audio file from https://www2.cs.uic.edu/~i101/SoundFiles/
data <- tuneR::readWave(file)
tuneR::normalize(data, unit = c("1"), center =FALSE, rescale = FALSE) # the interval chosen is [-1,1]


y <- data@left

Fs <- data@samp.rate


# Plotting the data
theme_set(theme_light())
graph <- ggplot(mapping = aes(x = seq_len(length(y)), y = y)) + geom_line(color = 'red') +
  labs(x = "Sample Number", y = "Amplitude", title = "Audio Waveform") + theme(plot.title = element_text(hjust = 0.5))

ggplotly(graph)

fourier = fft(y)

