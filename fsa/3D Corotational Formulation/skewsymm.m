function R=skewsymm(r)


R=zeros(3,3);

R(2,3)=-r(1);
R(1,3)=r(2);
R(1,2)=-r(3);
R(3,2)=-R(2,3);
R(3,1)=-R(1,3);
R(2,1)=-R(1,2);


end