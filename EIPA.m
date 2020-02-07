nx = 50;
ny = 50;

eig1 = zeros(nx,ny);
eig2 = zeros(nx,ny);
eig3 = zeros(nx,ny);
eig4 = zeros(nx,ny);
eig5 = zeros(nx,ny);
eig6 = zeros(nx,ny);
eig7 = zeros(nx,ny);
eig8 = zeros(nx,ny);
eig9 = zeros(nx,ny);

G = sparse(nx*ny, nx*ny);
B = zeros(nx*ny,1);
space = zeros(nx,ny);

for i = 1:nx
    for j = 1:ny 
  
        n = (j) + (i-1)*ny;
        nxm = (j) + (i-2)*ny;
        nxp = (j) + (i)*ny;
        nym = (j-1) + (i-1)*ny;
        nyp = (j+1) + (i-1)*ny;
        G(n,n) = 1;
        
        if (i == 1)
            space(i,j) = 0; 
            B(n,1) = 0;
        elseif (i == nx)
            space(i,j) = 0; 
            B(n,1) = 0;
        elseif (j == 1)
             space(i,j) = 0; 
            B(n,1) = 0;
        elseif (j == ny)
             space(i,j) = 0; 
            B(n,1) = 0;
        elseif (i > 20 && i < 30 && j > 20 && j < 30)
            B(n,1) = 0;
            G(n,n) = -2;
            G(n,nxp) = 1;
            G(n,nxm) = 1;
            G(n,nyp) = 1;
            G(n,nym) = 1;
        else 
            B(n,1) = 0;
            G(n,n) = -4;
            G(n,nxp) = 1;
            G(n,nxm) = 1;
            G(n,nyp) = 1;
            G(n,nym) = 1;
        end
    end
end

spy(G)

[E,D] = eigs(G,9,'SM');
surf(E)


for ii = 1:nx 
    for jj = 1:ny
        n = (jj) + (ii-1)*ny;
        eig1(ii,jj) = E(n,1);
        eig2(ii,jj) = E(n,2);
        eig3(ii,jj) = E(n,3);
        eig4(ii,jj) = E(n,4);
        eig5(ii,jj) = E(n,5);
        eig6(ii,jj) = E(n,6);
        eig7(ii,jj) = E(n,7);
        eig8(ii,jj) = E(n,8);
        eig9(ii,jj) = E(n,9);
    end
end

figure(1)
subplot(3,3,1)
surf(eig1);

figure(1)
subplot(3,3,2)
surf(eig2);

figure(1)
subplot(3,3,3)
surf(eig4);

figure(1)
subplot(3,3,4)
surf(eig4);

figure(1)
subplot(3,3,5)
surf(eig5);

figure(1)
subplot(3,3,6)
surf(eig6);

figure(1)
subplot(3,3,7)
surf(eig7);

figure(1)
subplot(3,3,8)
surf(eig8);

figure(1)
subplot(3,3,9)
surf(eig9);

