function P=Pmatrix(node,element)


G=Gmatrix(node,element);
I=eye(3);
o=zeros(3);

P=[o I o o;o o o I]-[G';G'];


end