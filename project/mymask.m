function [I,corrthreshold] = mymask(inputimageset,numofimages)
% This function takes the test data set and makes a mask by adding all the
% the images together. 

%Read the image set.

I=0;
for i=1:numofimages
    intimg=cell2mat(inputimageset(1,i))/numofimages;
    I=I+intimg;
end

%I = I/numofimages;

for i=1:numofimages
    intimg=cell2mat(inputimageset(1,i));
    a(i)=corr2(intimg,I);
end

corrthreshold=min(a);

end

