function D=diagp(matrixp,p)
    
Di=sqrt(sum(matrixp.*matrixp,2)+eps);
d=p/2*(Di.^(p-2));
D=diag(d);
end