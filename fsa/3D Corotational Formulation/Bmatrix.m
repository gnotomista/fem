function B=Bmatrix(node,element)


r=rvector(node,element);
P=Pmatrix(node,element);
E=Ematrix(node,element);

B=[r;P*E'];


end