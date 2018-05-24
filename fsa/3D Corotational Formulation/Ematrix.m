function E=Ematrix(node,element)


Rr=Rrmatrix(node,element);

E=blkdiag(Rr,Rr,Rr,Rr);


end