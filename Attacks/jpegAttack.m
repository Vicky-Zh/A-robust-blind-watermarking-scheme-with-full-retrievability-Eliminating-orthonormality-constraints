function jpegImageAttacked = jpegAttack(watermarked_image,qualityFactor)
imwrite(watermarked_image,'jpegImageAttacked.jpg','jpg','quality',qualityFactor);
jpegImageAttacked = imread('jpegImageAttacked.jpg');
jpegImageAttacked = double(jpegImageAttacked);
end
