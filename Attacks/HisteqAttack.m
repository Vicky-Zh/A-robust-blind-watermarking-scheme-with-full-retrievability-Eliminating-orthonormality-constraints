function HisteqAttacked = HisteqAttack(watermarked_image)
HisteqAttacked = histeq(watermarked_image/255,128);
end