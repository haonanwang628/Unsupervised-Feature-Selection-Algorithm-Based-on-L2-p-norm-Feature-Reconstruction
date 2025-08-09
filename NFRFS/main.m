clear;
load('F:\code\data\Yale.mat');
% Obtain the feature matrix and labels
fea = X;
gnd = Y;
% Calculate the number of categories.
nClass = length(unique(gnd));

% Set the upper and lower bounds for feature selection.
x_down = 20;
x_up = 200;
range = x_down:20:x_up;
numy = length(range);
y_down = 0;
y_up = 1;

% Define the regularization parameter.
lambda1=10^(-3);
lambda2=10^(-6);
lambda3=10^(6);
p=1;
% Call the PP function for feature selection.
tic;
function [W,index,obj] = PP(X,lambda1,lambda2,lambda3,p,c);
toc;
% Plot the ACC curves for all features
tic;
rng('default');                                               
label1 = litekmeans(fea, nClass, 'Replicates', 10);
result = ClusteringMeasure(gnd, label1);
fprintf('All Fea ACC:%f\n', result(1));
plot(range, repmat(result(1), 1, numy), '-+k');
hold on;
xlabel('Number of selected features');
ylabel('ACC');
axis([x_down x_up y_down y_up]);
% Plot an ACC curve based on the PP selected feature
ACC = zeros(1, numy);
i = 1;
for d = range                         
    newfea12 = X(:,index(1:d));
    rng('default');                                           
    label12 = litekmeans(newfea12,nClass,'Replicates',10);
    result = ClusteringMeasure(Y,label12);
    ACC(i) = result(1);
    i = i+1;
end
fprintf('NFRFS ACC(average):%f\n', sum(ACC) / numy);
plot(range, ACC, '-o');
legend('All Fea', 'NFRFS', 'Location', 'best');
xlabel('Number of selected features');
ylabel('ACC');
axis([x_down x_up y_down y_up]);
toc;