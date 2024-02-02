A=imread('bridge.bmp'); J=mat2gray(A, [0 255]); M1=11;
M2=31;
M3=61;
J1 = mfilter(M1, J); imshow(J1);
w = -pi:0.01:pi;
H1 = 0;
for k = -(M1-1)/2:(M1-1)/2
H1 = H1 + 1/M1 * exp(-1j * w * k);
end
figure, plot(w, abs(H1)); xlabel('w'); ylabel('|H(e^j^w)|');
J2 = mfilter(M2, J); figure, imshow(J2);
H2 = 0;
for k = -(M2-1)/2:(M2-1)/2
H2 = H2 + 1/M2 * exp(-1j * w * k);
end
figure, plot(w, abs(H2)); xlabel('w'); ylabel('|H(e^j^w)|');
J3 = mfilter(M3, J); figure, imshow(J3);
H3 = 0;
for k = -(M3-1)/2:(M3-1)/2
H3 = H3 + 1/M3 * exp(-1j * w * k);
end
figure, plot(w, abs(H3)); xlabel('w'); ylabel('|H(e^j^w)|'); J_noise1 = J;
J_noise2 = J;
[size_n, size_m] = size(J); for n = 1:size_n
for m = 1:size_m
J_noise1(n, m) = J(n, m) + 0.1 J_noise2(n, m) = J(n, m) + 0.5
end end
figure, imshow(J_noise1);
figure, imshow(J_noise2);
figure, imshow(mfilter(M1, J_noise1)); figure, imshow(mfilter(M2, J_noise1)); figure, imshow(mfilter(M3, J_noise1)); figure, imshow(mfilter(M1, J_noise2)); figure, imshow(mfilter(M2, J_noise2)); figure, imshow(mfilter(M3, J_noise2)); function filteredMatrix = mfilter(M,J)
* (rand - 0.5);
* (rand - 0.5);
x= (M-1)/2;
[size_n, size_m] = size(J); filteredMatrix = zeros(size_n, size_m); for n=1:size_n
    for m=1:size_m
        sumleft=0;
sumright=0;
Powered by TCPDF (www.tcpdf.org)
            for i=0:x
                if(m-i>0)
sumleft = sumleft + J(n, m-i);
end end
            for j=1:x
                if(m+i<size_m)
sumright = sumright + J(n, m+j);
end end
sum = sumleft + sumright;
filteredMatrix(n,m) = sum / M;
end end
end
