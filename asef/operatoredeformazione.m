function B=operatoredeformazione(l,x)
B=zeros(4,12);
B(1,3)=funzioneforma(l,x,1,1);
B(1,9)=funzioneforma(l,x,2,1);
B(2,1)=-funzioneforma(l,x,3,2);
B(2,5)=-funzioneforma(l,x,5,2);
B(2,7)=-funzioneforma(l,x,4,2);
B(2,11)=-funzioneforma(l,x,6,2);
B(3,2)=-funzioneforma(l,x,3,2);
B(3,4)=funzioneforma(l,x,5,2);
B(3,8)=-funzioneforma(l,x,4,2);
B(3,10)=funzioneforma(l,x,6,2);
B(4,6)=funzioneforma(l,x,1,1);
B(4,12)=funzioneforma(l,x,2,1);
end