function GlowPassFilterImageAttacked = GlowpassFilter(watermarked_image,sigma)
h = fspecial('gaussian',[3 3],sigma);
GlowPassFilterImageAttacked = imfilter(watermarked_image,h,'replicate');
end
