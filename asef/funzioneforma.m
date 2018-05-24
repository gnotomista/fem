function f=funzioneforma(l,x,n,d)
switch n
    case 1
        switch d
            case 0
                f=-x/l+1/2;
            case 1
                f=-1/l;
        end
    case 2
        switch d
            case 0
                f=x/l+1/2;
            case 1
                f=1/l;
        end
    case 3
        switch d
            case 0
                f=2*x^3/l^3-3*x/(2*l)+1/2;
            case 1
                f=6*x^2/l^3-3/(2*l);
            case 2
                f=12*x/l^3;
        end
    case 4
        switch d
            case 0
                f=-2*x^3/l^3+3*x/(2*l)+1/2;
            case 1
                f=-6*x^2/l^3+3/(2*l);
            case 2
                f=-12*x/l^3;
        end
    case 5
        switch d
            case 0
                f=x^3/l^2-x^2/(2*l)-x/4+l/8;
            case 1
                f=3*x^2/l^2-x/l-1/4;
            case 2
                f=6*x/l^2-1/l;
        end
    case 6
        switch d
            case 0
                f=x^3/l^2+x^2/(2*l)-x/4-l/8;
            case 1
                f=3*x^2/l^2+x/l-1/4;
            case 2
                f=6*x/l^2+1/l;
        end
end
end