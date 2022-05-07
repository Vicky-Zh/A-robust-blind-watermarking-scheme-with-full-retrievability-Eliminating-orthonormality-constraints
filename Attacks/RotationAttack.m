function RotationAttacked = RotationAttack(watermarked_image)
A2 = imrotate(watermarked_image/255,45, 'bilinear','crop');
RotationAttacked = imrotate(A2,-45, 'bilinear','crop')*255;
end