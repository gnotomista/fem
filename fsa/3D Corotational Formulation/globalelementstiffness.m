function Ke=globalelementstiffness(node,element)


MSM=materialstiffness(node,element);
GSM=geometricstiffness(node,element);

Ke=MSM+GSM;


end