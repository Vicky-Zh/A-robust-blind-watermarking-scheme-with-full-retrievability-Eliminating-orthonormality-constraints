function SaltPepperNoiseImageAttacked = noiseSaltPepper(watermarked_image)
SaltPepperNoiseImageAttacked = imnoise(watermarked_image,'salt & pepper',0.02);
end