function P=baricentrasezione(P)
G=statico(P)/area(P);
P(:,1)=P(:,1)-ones(size(P,1),1)*G(1);
P(:,2)=P(:,2)-ones(size(P,1),1)*G(2);
end