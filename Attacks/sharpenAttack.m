function SharpenAttacked = sharpenAttack(watermarked_image)
SharpenAttacked = imsharpen(watermarked_image,'Amount',0.1);
end