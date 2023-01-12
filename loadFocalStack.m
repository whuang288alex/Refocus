function [rgb_stack, gray_stack] = loadFocalStack(focal_stack_dir)
    imagefiles = dir('./stack/*.jpg'); 
    n = length(imagefiles);
    rgb_stack = zeros(679, 860, 75);
    gray_stack = zeros(679,860, 25);
    
    for i = 1: n
        img_name = imagefiles(i).name;
        img = imread("stack/" + img_name);
        rgb_stack(:,:,3*i-2) = img(:,:,1);
        rgb_stack(:,:,3*i-1) = img(:,:,2);
        rgb_stack(:,:,3*i) = img(:,:,3);
        gray_stack(:,:,i) = rgb2gray(img);
    end
end
