function refocusApp(rgb_stack, depth_map)
    
    img = zeros(679, 860,3);
    img(:,:,1) = rgb_stack(:,:,1);
    img(:,:,2) = rgb_stack(:,:,2);
    img(:,:,3) = rgb_stack(:,:,3);
    imshow(uint8(img));

    while true
        [x, y] = ginput(1);
        if x >= 860 || x <= 0 || y <= 0 || y >= 679
            break
        end
        
        idx = depth_map(ceil(y), ceil(x));
        img(:,:,1) = rgb_stack(:,:,idx*3-2);
        img(:,:,2) = rgb_stack(:,:,idx*3-1);
        img(:,:,3) = rgb_stack(:,:,idx*3);
        imshow(uint8(img));
    end
    close

    
