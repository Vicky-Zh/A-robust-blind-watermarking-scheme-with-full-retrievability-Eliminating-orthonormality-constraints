function averageImageAttacked = averageFilter(watermarked_image)
h = fspecial('average',[2 2]);
averageImageAttacked = imfilter(watermarked_image,h,'replicate');
end