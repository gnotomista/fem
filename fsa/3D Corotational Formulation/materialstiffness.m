function MSM=materialstiffness(node,element)


Kl=tangentstiffness(node,element);

B=Bmatrix(node,element);

MSM=B'*Kl*B;


end