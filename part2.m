A=imread('bridge.bmp'); J=mat2gray(A, [0 255]); J_filtered = differencerfilter(J); imshow(J_filtered);
w = -pi:0.01:pi;
% coefficients are 1 for k = 0, -1 for k = 1
H = 1 - exp(-1j * w);
figure, plot(w, abs(H));
xlabel('w');
ylabel('|H(e^j^w)|');
function filteredMatrix = differencerfilter(J)
[size_n, size_m] = size(J); filteredMatrix = zeros(size_n, size_m); for n=1:size_n
        for m=1:size_m
            if (m == 1)
filteredMatrix(n, m) = J(n, m);
else
filteredMatrix(n, m) = J(n, m) - J(n, m-1);
end end
end end
