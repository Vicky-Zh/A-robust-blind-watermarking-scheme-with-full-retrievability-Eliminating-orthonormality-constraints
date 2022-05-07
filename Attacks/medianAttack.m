function medianImageAttacked = medianAttack(watermarked_image)
medianImageAttacked = medfilt2(watermarked_image,[3 3]);
end