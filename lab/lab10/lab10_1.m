
%% 1234

I = imread('lena.jpg');
I = I(:,:,1);

subplot(221)
imshow(I)
title('N*N image')


fd = fft2(I);
subplot(222)
imshow(fd)
title('2D fft')


subplot(223)
imshow(fftshift(fd))
title('fftshifted 2D fft')


subplot(224)
imshow( abs(fftshift(fd))/1e4 )
title('magnititude of fftshifted 2D fft')

%% 56789

filter = zeros(1960,1960);

for i=1:1960
    for j=1:1960
        if (i-980)^2+(j-980)^2<98^2
            filter(i,j)=1;
        end
    end
end


subplot(221)
imshow(filter)
title('N*N filter')


a = filter.*fftshift(fd);
subplot(222)
imshow(abs(a)/1e2)
title('dot times the fftshifted 2D fft')
    

a_shift = fftshift(a/1e2);
b = ifft2(a_shift);
subplot(223)
imshow(b)
title('2D ifft low pass filter')

subplot(224)
imshow(abs(b))
title('magnititute of ifft 2D')

%% 10

filter2 = ones(1960,1960);

for i=1:1960
    for j=1:1960
        if (i-980)^2+(j-980)^2<98^2
            filter2(i,j)=0;
        end
    end
end

subplot(221)
imshow(filter2)
title('N*N filter')


c = filter2.*fftshift(fd);
subplot(222)
imshow(abs(c)/1e2)
title('dot times the fftshifted 2D fft')
    

c_shift = fftshift(c/1e1);
d = ifft2(c_shift);
subplot(223)
imshow(d)
title('2D ifft high pass filter')

subplot(224)
imshow(abs(d))
title('magnititute of ifft 2D')

%% 11

filter3 = ones(1960,1960);

for i=1:1960
    for j=1:1960
        if (i-980)^2+(j-980)^2<100^2 
            filter3(i,j)=0;
            elseif (i-980)^2+(j-980)^2>500^2
            filter3(i,j)=0;
        end
    end
end

subplot(221)
imshow(filter3)
title('N*N filter')


e = filter3.*fftshift(fd);
subplot(222)
imshow(abs(e)/1e2)
title('dot times the fftshifted 2D fft')
    

e_shift = fftshift(e/1e1);
f = ifft2(e_shift);
subplot(223)
imshow(f)
title('2D ifft band pass filter')

subplot(224)
imshow(abs(f))
title('magnititute of ifft 2D')

%% extra credit

I1 = imread('image1.jpg');
I2 = imread('image2.jpg');
I2 = I2(:,:,1);

fd1 =  fftshift(fft2(I1)) ;
fd2 =  fftshift(fft2(I2));

mag1 = abs(fd1)/1e4;
ang1 = angle(fd1);

mag2 = abs(fd2)/1e4;
ang2 = angle(fd2);

array = [I1 mag1 ang1; I2 mag2 ang2];

x = mag1.*exp(1j*ang2);
y = mag2.*exp(1j*ang1);

subplot(231)
imshow(I1)
title('lena')

subplot(232)
imshow(mag1)
title('lena mag')

subplot(233)
imshow(ang1)
title('lena phase')

subplot(234)
imshow(I2)
title('cameraman')

subplot(235)
imshow(mag2)
title('cameraman mag')

subplot(236)
imshow(ang2)
title('cameraman phase')




% subplot(211)
% imshow(abs(ifft2(x)),[])
% title('lena mag & cameraman phase')
% 
% subplot(212)
% imshow(abs(ifft2(y)),[])
% title('camera mag & lena phase')




