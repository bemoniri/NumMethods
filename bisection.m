function [f] = bisection(f, a, b, Nmax, error)
i=1;
BisectA=f(a);
while i <= Nmax
    p=a+(b-a)/2;
    BisectP=f(p);
    if BisectP == 0 || (b-a)/2 < error   
        f = p;
        break
    end
    i=i+1;
    if BisectA*BisectP > 0
        a=p;
        BisectA = BisectP;
    else
        b=p;
    end
end