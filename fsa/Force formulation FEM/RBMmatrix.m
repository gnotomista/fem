function T=RBMmatrix(L)


% il vettore degli spostamenti senza RBM è:
% [dx,rx,ry1,rz1,ry2,rz2]'=T*[dx1,dy1,dz1,rx1,ry1,rz1,dx2,dy2,dz2,rx2,ry2,rz2]';

T=[-1 0 0 0 0 0 1 0 0 0 0 0;
    0 0 0 -1 0 0 0 0 0 1 0 0;
    0 0 -1/L 0 1 0 0 0 1/L 0 0 0;
    0 1/L 0 0 0 1 0 -1/L 0 0 0 0;
    0 0 -1/L 0 0 0 0 0 1/L 0 1 0;
    0 1/L 0 0 0 0 0 -1/L 0 0 0 1];


end