function g = GaosiGrad2(I,sigmma)

% %生成二维高斯卷积核，sigma=0.5
 G=fspecial('gaussian',15,sigmma);
 II=conv2(I,G,'same');
 [Ix,Iy]=gradient(II);
 f = Ix.^2 + Iy.^2;
 g = 1./(1+f);

end