
clc,clear;
addpath('F:\code\NFRFS\data');
datasets = {'Yale','lung','COIL20','warpPIE10P','warpAR10P','ORL','JAFFE','ATT40','TOX-171','Isolet','binalpha','lung_small','PCMAC',' RELATHE'};
for i = 1:length(datasets)
    dataset = datasets{i};
    load(dataset);
    x_down = 20;
     x_up = 200;
range = x_down:20:x_up;
numy = length(range);
 fea = X;
 gnd = Y;
nKmeans = 20;
maxIter=100;
rand('twister',5489);
[nSmp,mFea] = size(fea);
nClass = length(unique(gnd));
label = litekmeans(fea,nClass,'Replicates',20);
MIhat = MutualInfo(gnd,label);
% MIhat = NMI_sqrt_lei(gnd,label)
disp(['Clustering using all the ',num2str(size(fea,2)),' features. Clustering MIhat: ',num2str(MIhat)]);
lambda1 = [10^-6, 10^-4,10^-2,1,10^2,10^4,10^6];
lambda2 = [10^-6, 10^-4,10^-2,1,10^2,10^4,10^6];
lambda3 = [10^-6, 10^-4,10^-2,1,10^2,10^4,10^6];
lambda4 = [0.01,0.05,0.1,0.5,1];
c = nClass;

%create a folder named by the name of dataset
mkdir(dataset);
[nSmp,nFea] = size(fea);
FeaNumCandi = [20,40,60,80,100,120,140,160,180,200];
bestNMI_max = zeros(length(FeaNumCandi),1);
bestNMI_sqrt = zeros(length(FeaNumCandi),1);
bestACC = zeros(length(FeaNumCandi),1);
bestsNMI_max = zeros(length(FeaNumCandi),1);
bestsNMI_sqrt = zeros(length(FeaNumCandi),1);
bestsACC = zeros(length(FeaNumCandi),1);

%print the setup information
disp(['Dataset: ',dataset]);
disp(['class_num=',num2str(nClass),',','num_kmeans=',num2str(nKmeans)]);
t_start = clock;
%Clustering using selected features
for al = lambda1
    for be = lambda2
         for gam = lambda3
           for lam = lambda4
            disp(['al=', num2str(al), ',', 'be=', num2str(be), ',', 'gam=', num2str(gam), ',', 'lam=', num2str(lam)]);
            result_path = strcat(dataset,'\','al=', num2str(al),',', 'be=', num2str(be), ',', 'gam=', num2str(gam), ',', 'lam=', num2str(lam),'_result.mat');
            mtrResult = [];
            [W,X_new,obj] = PP(X,al,be,gam,lam,c);
            orderFeature_path = strcat(dataset,'\','feaIdx_','al=', num2str(al), ',', 'be=', num2str(be), ',', 'gam=', num2str(gam), ',', 'lam=', num2str(lam),'.mat');
%             orderFeature_path = strcat(dataset,'\','feaIdx_','al=', num2str(al), ',', 'be=', num2str(be), ',', 'gam=', num2str(gam),'.mat');
%             save(orderFeature_path,'W');
            
            for feaIdx = 1:length(FeaNumCandi)
                feaNum = FeaNumCandi(feaIdx);
                newfea =X_new(:,1:feaNum);
                rng('default');
                arrNMI_max = zeros(nKmeans,1);
                arrNMI_sqrt = zeros(nKmeans,1);
                arrACC = zeros(nKmeans,1);
                for j = 1:nKmeans
                    label = litekmeans(newfea,nClass,'Replicates',20);
                    arrNMI_max(j) = NMI_max_lei(gnd,label);
                    arrNMI_sqrt(j) = NMI_sqrt_lei(gnd,label);
                    arrACC(j) = ACC_Lei(gnd,label);
                end
                mNMI_max = mean(arrNMI_max);
                sNMI_max = std(arrNMI_max);
                mNMI_sqrt = mean(arrNMI_sqrt);
                sNMI_sqrt = std(arrNMI_sqrt);
                mACC = mean(arrACC);
                sACC = std(arrACC);
                if mNMI_sqrt>bestNMI_sqrt(feaIdx)
                    bestNMI_sqrt(feaIdx) = mNMI_sqrt;
                    bestsNMI_sqrt(feaIdx) = sNMI_sqrt;
                end
                if mACC > bestACC(feaIdx)
                    bestACC(feaIdx) = mACC;
                    bestsACC(feaIdx) = sACC;
                end
                if mNMI_max > bestNMI_max(feaIdx)
                    bestNMI_max(feaIdx) = mNMI_max;
                    bestsNMI_max(feaIdx) = sNMI_max;                                       
                end
                mtrResult = [mtrResult,[feaNum,mNMI_max,sNMI_max,mNMI_sqrt,sNMI_sqrt,mACC,sACC, al, be, gam, lam]'];
            end
             save(result_path,'mtrResult');
            
           end
         end
    end
end
    
    
t_end = clock;
disp(['exe time: ',num2str(etime(t_end,t_start))]);

%save the best results among all the parameters
result_path = strcat(dataset,'\','best','_result_',dataset,'_PP','.mat');
save(result_path,'FeaNumCandi','bestNMI_sqrt','bestsNMI_sqrt','bestACC','bestsACC','bestNMI_max','bestsNMI_max');
disp(['Dataset ', num2str(dataset), ' completed.']);
end 
