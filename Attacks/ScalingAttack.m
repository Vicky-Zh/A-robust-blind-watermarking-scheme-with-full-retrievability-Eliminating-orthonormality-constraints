function ScalingAttacked = ScalingAttack(watermarked_image)
A2 = imresize(watermarked_image/255, 2);
ScalingAttacked = imresize(A2,0.5)*255;
end