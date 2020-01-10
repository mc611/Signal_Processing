close all
clear all

faceDatabase = imageSet('Pictures','recursive');
[training,test] = partition(faceDatabase,[0.7 0.3],'randomized');
% test2=test;
% test=training;
% training=test2;

%% Make all images into greyscale images for Training and Test sets. 

for i=1:training(1).Count
    intimg=read(training(1),i);
    adnantraining(1,i)={rgb2gray(intimg)};
end

for i=1:training(2).Count
    intimg=read(training(2),i);
    cheryltraining(1,i)={rgb2gray(intimg)};
end

for i=1:training(3).Count
    intimg=read(training(3),i);
    megantraining(1,i)={rgb2gray(intimg)};
end

for i=1:test(1).Count
    intimg=read(test(1),i);
    adnantest(1,i)={rgb2gray(intimg)};
end

for i=1:test(2).Count
    intimg=read(test(2),i);
    cheryltest(1,i)={rgb2gray(intimg)};
end

for i=1:test(3).Count
    intimg=read(test(3),i);
    megantest(1,i)={rgb2gray(intimg)};
end

%% Make Mask from each test set and Self-Correlate to get threshold

[adnanmask athresh]=mymask(adnantest,test(1).Count);
[cherylmask cthresh]=mymask(cheryltest,test(2).Count);
[meganmask mthresh]=mymask(megantest,test(3).Count);

allmasks={adnanmask,cherylmask,meganmask};
subplot(1,3,1)
imshow(adnanmask)
title('Adnan Mask')
subplot(1,3,2)
imshow(cherylmask)
title('Cheryl Mask')
subplot(1,3,3)
imshow(meganmask)
title('Megan Mask')
%% Correlate random images

queryImage=read(training(1),1);
adclmc={adnantraining{1,:},cheryltraining{1,:},megantraining{1,:}};

r=randi([1 length(adclmc)],1,5);
for i=1:length(r)
  queryimages(1,i)={cell2mat(adclmc(1,r(i)))};
  for j=1:3
      my_corrs(i,j)=corr2(cell2mat(queryimages(1,i)),cell2mat(allmasks(1,j)));
  end
end

[CorrNum,myLoc]=max(my_corrs,[],2); %Finds the HIGHest correlation. 

for i=1:length(r)
    if myLoc(i)==1 
%         && CorrNum(i)>athresh
        intimg=read(test(1),2);
        matchpic(1,i)={intimg};
    else
        if myLoc(i)==2 
%             && CorrNum(i)>=cthresh
        intimg=read(test(2),2);
        matchpic(1,i)={intimg};
        else
            if myLoc(i)==3 
%                 && CorrNum(i)>=mthresh
        intimg=read(test(3),2);
        matchpic(1,i)={intimg};
            else 
        matchpic(1,i)={zeros(2142,3872)};
            end
        end
    end  
end


subplot(5,2,1)
imshow(cell2mat(queryimages(1,1)))
title('Query Image')
subplot(5,2,3)
imshow(cell2mat(queryimages(1,2)))
subplot(5,2,5)
imshow(cell2mat(queryimages(1,3)))
subplot(5,2,7)
imshow(cell2mat(queryimages(1,4)))
subplot(5,2,9)
imshow(cell2mat(queryimages(1,5)))

subplot(5,2,2)
imshow(cell2mat(matchpic(1,1)))
title('Matched Person')
subplot(5,2,4)
imshow(cell2mat(matchpic(1,2)))
subplot(5,2,6)
imshow(cell2mat(matchpic(1,3)))
subplot(5,2,8)
imshow(cell2mat(matchpic(1,4)))
subplot(5,2,10)
imshow(cell2mat(matchpic(1,5)))

%% Trying to filter

% kernel1 = -1 * ones(3)/30;
% kernel1(2,2) = 8/30;

% kernel2 = [-1 -2 -1; -2 12 -2; -1 -2 -1]/50;
% h = ones(5,5)/2;
% 
% filteredImage=imfilter(cell2mat(cheryltraining(1,1)),h);
% filteredImage=imfilter(single(filteredImage),kernel2);
% % filteredImage=imfilter(single(cell2mat(cheryltraining(1,1))),kernel2);
% % filterImage=imfilter(filteredImage,h);
% imshow(filteredImage)