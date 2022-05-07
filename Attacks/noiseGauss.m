function GaussNoiseImageAttacked = noiseGauss(watermarked_image)
GaussNoiseImageAttacked = imnoise(watermarked_image, 'gaussian', 0, 0.1);
end