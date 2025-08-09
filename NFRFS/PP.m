function [W,index,obj] = PP(X,lambda1,lambda2,lambda3,p,c)
%"Unsupervised Feature Selection Algorithm Based on L2,p-norm Feature Reconstruction"
% min_W,H,S||X-XWH||^2,p+lambda1*Tr(W'X'L'XW) +lambda2 * (Tr(1WW')-Tr(WW'))-trace(W*W'))+ gamma*||S||^2
%-------------------------------------------------- Inputs -----------------------------------------------------
%      X: Data matrix in R^(n*d), where n and d are the number of samples and features, respectively.
%      lambda1,lambda2,lambda3,p: Regularization parameter.
%      k:   The number of selected features.
%      Niter: Maximum number of iterations.
%      H: the reconstruction coefficient matrix in R^(k*d)
%-------------------------------------------------- Outputs-------------------------------------------------------
%      W: Feature selection matrix .
%      index: the sort of features for selection.
%      obj: the vector of objective function values.
[n,d] = size(X);
k=200;
NITER=30;
W = rand(d,k);
D1=eye(n);
H=NSSRD_init_S(X',k);%Initialize matrix H
[~,L, ~] = Laplacian_CAN(X');
obj = zeros(NITER,1);
iter = 1;
while (iter <= NITER)
    % Update W   
    numW = X'*D1*X*H'+lambda2*W+lambda3*W;
    denW = X'*D1*X*W*H*H'+lambda1*X'*L*X*W+lambda2*ones(d,d)*W+lambda3*W*W'*W;
    fracW = numW./denW;
    W = W.*fracW;
    % Update H 
    numH = W'*X'*D1*X;
    denH = W'*X'*D1*X*W*H;
    fracH = numH./denH;
    H = H.*fracH;
    D1=diagp(X-X*W*H,p);
    % Update S 
    [S,L, gamma] = Laplacian_CAN(W'*X');
    obj(iter) = 0.5 * trace((X-X*W*H)'*D1*(X-X*W*H)) +0.5 *lambda1*trace(W'*X'*L*X*W) +0.5 *lambda2 * (trace(ones(d,d)*W*W')-trace(W*W'))+0.25 *lambda3 *trace((W'*W-eye(k))*(W'*W-eye(k))')+0.5* gamma*trace(S'*S) ;
    iter=iter+1;
 end
score=sum((W.*W),2);
[~,index]=sort(score,'descend');% Sort the norms of the rows of the feature matrix W in a descending order 
X_new=X (:,index);
end
