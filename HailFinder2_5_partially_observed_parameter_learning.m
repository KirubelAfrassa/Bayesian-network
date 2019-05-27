names = {'10_7muVerMo','234StarFcst','AMCINInScen','AMDewptCalPl','AMInsWliScen','AMInstabMt','AreaMeso_ALS','AreaMoDryAir','Boundaries','CapChange','CapInScen','CldShadeConv','CldShadeOth','CombClouds','CombMoisture','CombVerMo','CompPlFcst','CurPropConv','Date','Dewpoints','IRCloudCover','InsChange','InsInMt','InsSclInScen','Llfr12ZDENSd','LLIW','LatestCIN','LoLevMoistAd','LowLLapse','MeanRH','MidLLapse','MorningBound','MorningCIN','MountainFcst','MvmtFeatures','OutflowFrMt','PlainsFcst','QGVertMotion','R5Fcst','RHRatio','RaoContMoist','SatContMoist','ScenRel3_4','ScenRelAMCIN','ScenRelAMIns','Scenario','ScnRelPlFcst','SfcWndShfDis','SubjVertMo','SynForcng','TempDis','VISCloudCov','WindAloft','WindFieldMt','WindFieldPln','WndHodograph'};
N = length(names);

dagc = {'10_7muVerMo', 'CombVerMo';  
    '234StarFcst','R5Fcst';
    'AMCINInScen', 'CapInScen';
    'AMDewptCalPl', 'AMInsWliScen';
    'AMInsWliScen', 'InsSclInScen';
    'AMInstabMt', 'InsInMt';
    'AreaMeso_ALS','AreaMoDryAir';
    'AreaMeso_ALS','CldShadeOth';
    'AreaMeso_ALS','CompPlFcst';
    'AreaMoDryAir','CldShadeOth';
    'Boundaries','CompPlFcst';
    'CapChange','CapInScen';
    'CapInScen','PlainsFcst';
    'CldShadeConv','CompPlFcst';
    'CldShadeOth','CompPlFcst';
    'CldShadeOth','InsInMt';
    'CombClouds','CldShadeOth';
    'CombMoisture','AreaMoDryAir';
    'CombVerMo','AreaMeso_ALS';
    'CompPlFcst','CapChange';
    'CompPlFcst','InsChange';
    'CurPropConv','PlainsFcst';
    'Date','Scenario';
%    'Dewpoints',
    'IRCloudCover','CombClouds';
    'InsChange','InsSclInScen';
    'InsInMt','CldShadeConv';
    'InsInMt','MountainFcst';
    'InsInMt','OutflowFrMt';
    'InsSclInScen','PlainsFcst';
    'Llfr12ZDENSd','AMInsWliScen';
    'LLIW','CurPropConv';
    'LatestCIN','CurPropConv';
    'LoLevMoistAd','InsChange';
 %   'LowLLapse',
 %   'MeanRH',
 %   'MidLLapse',
    'MorningBound','Boundaries';
    'MorningCIN', 'AMCINInScen';
    'MountainFcst', 'R5Fcst';
 %   'MvmtFeatures',
    'OutflowFrMt','Boundaries';
    'PlainsFcst','234StarFcst';
    'QGVertMotion','CombVerMo';
 %   'R5Fcst',
 %   'RHRatio', 
    'RaoContMoist','CombMoisture';
    'SatContMoist','CombMoisture';
    'ScenRel3_4','234StarFcst';
    'ScenRelAMCIN','AMCINInScen';
    'ScenRelAMIns','AMInsWliScen';
    'Scenario','Dewpoints';
    'Scenario','LowLLapse';
    'Scenario','MeanRH';
    'Scenario','MidLLapse';
    'Scenario','MvmtFeatures';
    'Scenario','RHRatio';
    'Scenario','ScenRel3_4';
    'Scenario','ScenRelAMCIN';
    'Scenario','ScenRelAMIns';
    'Scenario','ScnRelPlFcst';
    'Scenario','SfcWndShfDis';
    'Scenario','SynForcng';
    'Scenario','TempDis';
    'Scenario','WindAloft';
    'Scenario','WindFieldMt';
    'Scenario','WindFieldPln';
    'ScnRelPlFcst','PlainsFcst';
%    'SfcWndShfDis',
    'SubjVertMo','CombVerMo';
%    'SynForcng',
%    'TempDis',
    'VISCloudCov','CombClouds';
%    'WindAloft',
%    'WindFieldMt',
%    'WindFieldPln',
    'WndHodograph','Boundaries';
    'WndHodograph','CldShadeConv';
    'WndHodograph','OutflowFrMt';};

%adjecency matrix
[dag, names] = mk_adj_mat(dagc, names, 1)

node_sizes = [4 3 4 4 4 4 4 4 3 4 4 4 4 4 3 3 6 11 6 2 4 4 5 7 11 6 2 3 5 3 4 3 3 4 7 3 3 3 4 4 4 4 3 3 3 3 3 3 3 3 3 3 3 3 3 3];

bnet = mk_bnet(dag, node_sizes, 'names', names, 'discrete', 1:N);
G = bnet.dag;
draw_graph(G);

bnet.CPD{1} = tabular_CPD(bnet, 1 ,'CPT',[0.3 0.25 0.25 0.2]);
bnet.CPD{2} = tabular_CPD(bnet, 2 ,'CPT', [0.1 0.5 0.4]);
bnet.CPD{3} = tabular_CPD(bnet, 3 ,'CPT', [0.15 0.15 0.5 0.2]);
bnet.CPD{4} = tabular_CPD(bnet, 4 ,'CPT', [0.15 0.2 0.4 0.25]);
bnet.CPD{5} = tabular_CPD(bnet, 5 ,'CPT', [0.15 0.2 0.4 0.25]); 

bnet.CPD{6} = tabular_CPD(bnet, 6 ,'CPT', [0.9 0.55 0.25 0.25 0.6 0.15 0.1 0.25 0.3 0.05 0 0.25 0.25 0.1 0 0.2 0.1 0.4 0.3 0.25 0.35 0.6 0.35 0.25 0.5 0.4 0.15 0.25 0.35 0.3 0.1 0.25 0 0.05 0.35 0.25 0.05 0.2 0.5 0.25 0.2 0.45 0.7 0.25 0.25 0.3 0.4 0.25 0 0 0.1 0.25 0 0.05 0.05 0.25 0 0.1 0.15 0.25 0.15 0.3 0.5 0.25]);
bnet.CPD{6} = mk_named_CPT({'SatContMoist','RaoContMoist','CombMoisture'}, names, dag, bnet.CPD{6});

bnet.CPD{7} = tabular_CPD(bnet, 7 ,'CPT', [0.15 0.15 0.5 0.2]);
bnet.CPD{8} = tabular_CPD(bnet, 8 ,'CPT', [0.15 0.57 0.2 0.08]);
bnet.CPD{9} = tabular_CPD(bnet, 9 ,'CPT', [0.5 0.35 0.15]);
bnet.CPD{10} = tabular_CPD(bnet, 10 ,'CPT', [0.12 0.28 0.3 0.3]);
bnet.CPD{11} = tabular_CPD(bnet, 11 ,'CPT', [0.4 0.4 0.15 0.05]);
bnet.CPD{12} = tabular_CPD(bnet, 12 ,'CPT',  [0.12 0.32 0.38 0.18]);
%bnet.CPD{13} = tabular_CPD(bnet, 13 ,'CPT', [0.7 0.9 0.95]);

None = [0.7	0.1	0.01	0;
0.28	0.5	0.14	0.02;
0.02	0.3	0.35	0.18;
0	0.1	0.5	0.8;];


PartInhibit =[0.9	0.65	0.25	0.01;
0.09	0.25	0.35	0.15;
0.01	0.09	0.3	0.33;
0	0.01	0.1	0.51;];

Stifling = [0.95	0.75	0.4	0.2;
0.05	0.23	0.4	0.3;
0	0.02	0.18	0.35;
0	0	0.02	0.15;];

TotalInhibit = [1	0.95	0.75	0.5;
0	0.05	0.2	0.35;
0	0	0.05	0.1;
0	0	0	0.05;];

k = 1;
cpt = zeros(1,16*4);
for i=1:4
    for j=1:4
        cpt(k) = None(i,j);  k = k+1;
        cpt(k) = PartInhibit(i,j); k = k+1;
        cpt(k) = Stifling(i,j); k = k+1;
        cpt(k) = TotalInhibit(i,j); k = k+1;
    end
end

bnet.CPD{13} = tabular_CPD(bnet, 13 ,'CPT', cpt);
bnet.CPD{13} = mk_named_CPT({'LatestCIN','LLIW','CurPropConv'},names, dag, bnet.CPD{13});

bnet.CPD{14} = tabular_CPD(bnet, 14 ,'CPT',[0.1 0.52  0.3 0.08]);
bnet.CPD{15} = tabular_CPD(bnet, 15 ,'CPT',[0.15 0.45 0.4]);



Cloudy = [0.95	0.85	0.8;
0.04	0.13	0.1;
0.01	0.02	0.1;];
PC  = [0.45	0.1	0.05;
0.52	0.8	0.45;
0.03	0.1	0.5;];
Clear = [0.1	0.02	0;
0.4	0.28	0.02;
0.5	0.7	0.98;];

k = 1;
cpt = zeros(1,9*3);
for i=1:3
    for j=1:3
        cpt(k) = Cloudy(i,j);  k = k+1;
        cpt(k) = PC(i,j); k = k+1;
        cpt(k) = Clear(i,j); k = k+1;
    end
end

bnet.CPD{16} = tabular_CPD(bnet, 16 ,'CPT',cpt);
bnet.CPD{16} = mk_named_CPT({'VISCloudCov','IRCloudCover','CombClouds'},names, dag, bnet.CPD{16});

bnet.CPD{17} = tabular_CPD(bnet, 17 ,'CPT',[0.254098 0.131148 0.106557 0.213115 0.07377 0.221312]);

may_jun = [0.1;0.16;0.1;0.08;0.08;0.01;0.08;0.1;0.09;0.03;0.17;];
jun_jul = [0.05;0.16;0.09;0.09;0.12;0.02;0.13;0.06;0.07000000000000001;0.11;0.1;];
jul_jul = [0.04;0.13;0.1;0.08;0.15;0.03;0.14;0.04;0.06;0.15;0.08;];
jul_aug =  [0.04;0.13;0.09;0.07000000000000001;0.2;0.08;0.06;0.05;0.07000000000000001;0.13;0.08;];
aug_aug = [0.04;0.11;0.1;0.07000000000000001;0.17;0.05;0.1;0.05;0.07000000000000001;0.14;0.1;];
aug_sep = [0.05;0.11;0.1;0.08;0.11;0.02;0.11;0.06;0.08;0.11;0.17;];

k = 1;
cpt = zeros(1,11*6);
j = 1;
    for i=1:11
        cpt(k) = may_jun(i,j);  k = k+1;
        cpt(k) = jun_jul(i,j); k = k+1;
        cpt(k) = jul_jul(i,j); k = k+1;
        cpt(k) = jul_aug(i,j); k = k+1;
        cpt(k) = aug_aug(i,j); k = k+1;
        cpt(k) = aug_sep(i,j); k = k+1;
    end

bnet.CPD{18} = tabular_CPD(bnet, 18 ,'CPT',cpt);
bnet.CPD{18} = mk_named_CPT({'Date','Scenario'},names, dag, bnet.CPD{18});

WindFieldPln = [0.05	0.08	0.1	0.1	0.43	0.6	0.25	0.04	0.2	0.6	0.1;
0.6	0.6	0	0.15	0.1	0.07000000000000001	0.01	0.02	0.3	0.08	0.05;
0.02	0.02	0.75	0.2	0.15	0.01	0.3	0.04	0.05	0.07000000000000001	0.1;
0.1	0.1	0	0.05	0.06	0.12	0.01	0.8	0.37	0.03	0.05;
0.23	0.2	0	0.3	0.06	0.2	0.03	0.1	0.07000000000000001	0.2	0.2;
0	0	0.15	0.2	0.2	0	0.4	0	0.01	0.02	0.5;];

k = 1;
cpt = zeros(1,11*6);
for i=1:6
    for j=1:11
        cpt(k) = WindFieldPln(i,j);  k = k+1;
    end
end

bnet.CPD{19} = tabular_CPD(bnet, 19 ,'CPT',cpt);
bnet.CPD{19} = mk_named_CPT({'Scenario','WindFieldPln'},names, dag, bnet.CPD{19});    

WindFieldMt = [0.8	0.35	0.75	0.7	0.65	0.15	0.7	0.3	0.5	0.01	0.7;
0.2	0.65	0.25	0.3	0.35	0.85	0.3	0.7	0.5	0.99	0.3;];
    
k = 1;
cpt = zeros(1,11*2);
for i=1:2
    for j=1:11
        cpt(k) = WindFieldMt(i,j);  k = k+1;
    end
end

bnet.CPD{20} = tabular_CPD(bnet, 20 ,'CPT',cpt);
bnet.CPD{20} = mk_named_CPT({'Scenario','WindFieldMt'},names, dag, bnet.CPD{20});

WindAloft = [0	0.2	0.05	0.03	0.07000000000000001	0.5	0.25	0.2	0.2	0.96	0.03;
0.95	0.3	0.09	0.32	0.66	0	0.3	0.14	0.41	0	0.08;
0.01	0.2	0.59	0.42	0.02	0	0.25	0.43	0.1	0	0.33;
0.04	0.3	0.27	0.23	0.25	0.5	0.2	0.23	0.29	0.04	0.5600000000000001;];

k = 1;
cpt = zeros(1,11*4);
for i=1:4
    for j=1:11
        cpt(k) = WindAloft(i,j);  k = k+1;
    end
end

bnet.CPD{21} = tabular_CPD(bnet, 21 ,'CPT',cpt);
bnet.CPD{21} = mk_named_CPT({'Scenario','WindAloft'},names, dag, bnet.CPD{21});

TempDis = [0.13	0.15	0.12	0.1	0.04	0.05	0.03	0.05	0.8	0.1	0.2;
0.15	0.15	0.1	0.15	0.04	0.12	0.03	0.4	0.19	0.05	0.3;
0.1	0.25	0.35	0.4	0.82	0.75	0.84	0.5	0	0.4	0.3;
0.62	0.45	0.43	0.35	0.1	0.08	0.1	0.05	0.01	0.45	0.2;];

k = 1;
cpt = zeros(1,11*4);
for i=1:4
    for j=1:11
        cpt(k) = TempDis(i,j);  k = k+1;
    end
end

bnet.CPD{22} = tabular_CPD(bnet, 22 ,'CPT',cpt);
bnet.CPD{22} = mk_named_CPT({'Scenario','TempDis'},names, dag, bnet.CPD{22});

SynForcng = [0.35	0.06	0.1	0.35	0.15	0.15	0.15	0.25	0.25	0.01	0.2;
0.25	0.1	0.27	0.2	0.15	0.1	0.1	0.25	0.2	0.05	0.2;
0	0.06	0.4	0.1	0.1	0.05	0.1	0.25	0.15	0.01	0.35;
0.35	0.3	0.08	0.25	0.15	0.15	0.25	0.15	0.2	0.05	0.15;
0.05	0.48	0.15	0.1	0.45	0.55	0.4	0.1	0.2	0.88	0.1;];

k = 1;
cpt = zeros(1,11*5);
for i=1:5
    for j=1:11
        cpt(k) = SynForcng(i,j);  k = k+1;
    end
end

bnet.CPD{23} = tabular_CPD(bnet, 23 ,'CPT',cpt);
bnet.CPD{23} = mk_named_CPT({'Scenario','SynForcng'},names, dag, bnet.CPD{23});

SfcWndShfDis = [0.65	0.65	0	0.12	0.06	0.1	0.02	0.01	0.02	0.06	0.05;
0.05	0.05	0.65	0.02	0.14	0.1	0.05	0.1	0.1	0.08	0.13;
0.1	0.1	0.2	0.02	0.04	0.1	0.05	0.15	0.5	0.04	0.05;
0.08	0.1	0.02	0.02	0.04	0.02	0	0.4	0.3	0.02	0.39;
0.04	0.02	0.06	0.45	0.25	0	0.35	0	0.01	0.6	0.13;
0.07000000000000001	0.07000000000000001	0.05	0.27	0.4	0.5600000000000001	0.33	0.23	0.02	0.14	0.15;
0.01	0.01	0.02	0.1	0.07000000000000001	0.12	0.2	0.11	0.05	0.06	0.1;];

k = 1;
cpt = zeros(1,11*7);
for i=1:7
    for j=1:11
        cpt(k) = SfcWndShfDis(i,j);  k = k+1;
    end
end

bnet.CPD{24} = tabular_CPD(bnet, 24 ,'CPT',cpt);
bnet.CPD{24} = mk_named_CPT({'Scenario','SfcWndShfDis'},names, dag, bnet.CPD{24});

ScnRelPlFcst = [1	0	0	0	0	0	0	0	0	0	0;
0	1	0	0	0	0	0	0	0	0	0;
0	0	1	0	0	0	0	0	0	0	0;
0	0	0	1	0	0	0	0	0	0	0;
0	0	0	0	1	0	0	0	0	0	0;
0	0	0	0	0	1	0	0	0	0	0;
0	0	0	0	0	0	1	0	0	0	0;
0	0	0	0	0	0	0	1	0	0	0;
0	0	0	0	0	0	0	0	1	0	0;
0	0	0	0	0	0	0	0	0	1	0;
0	0	0	0	0	0	0	0	0	0	1;];

k = 1;
cpt = zeros(1,11*11);
for i=1:11
    for j=1:11
        cpt(k) = ScnRelPlFcst(i,j);  k = k+1;
    end
end

bnet.CPD{25} = tabular_CPD(bnet, 25 ,'CPT',cpt);
bnet.CPD{25} = mk_named_CPT({'Scenario','ScnRelPlFcst'},names, dag, bnet.CPD{25});

ScenRelAMIns = [1	1	0	0	0	0	0	0	1	0	0;
0	0	1	1	1	0	0	0	0	1	0;
0	0	0	0	0	1	0	0	0	0	0;
0	0	0	0	0	0	1	0	0	0	0;
0	0	0	0	0	0	0	1	0	0	0;
0	0	0	0	0	0	0	0	0	0	1;];

k = 1;
cpt = zeros(1,11*6);
for i=1:6
    for j=1:11
        cpt(k) = ScenRelAMIns(i,j);  k = k+1;
    end
end

bnet.CPD{26} = tabular_CPD(bnet, 26 ,'CPT',cpt);
bnet.CPD{26} = mk_named_CPT({'Scenario','ScenRelAMIns'},names, dag, bnet.CPD{26});

ScenRelAMCIN = [1	1	0	0	0	0	0	0	0	0	0;
0	0	1	1	1	1	1	1	1	1	1;];

k = 1;
cpt = zeros(1,11*2);
for i=1:2
    for j=1:11
        cpt(k) = ScenRelAMCIN(i,j);  k = k+1;
    end
end

bnet.CPD{27} = tabular_CPD(bnet, 27 ,'CPT',cpt);
bnet.CPD{27} = mk_named_CPT({'Scenario','ScenRelAMCIN'},names, dag, bnet.CPD{27});

AB = [1	0.6	0.25	0;
0	0.37	0.45	0.1;
0	0.03	0.3	0.9;];

CThruK = [0.75	0.3	0.01	0;
0.25	0.6	0.4	0.03;
0	0.1	0.59	0.97;];

k = 1;
cpt = zeros(1,12*2);
for i=1:3
    for j=1:4
        cpt(k) = AB(i,j);  k = k+1;
        cpt(k) = CThruK(i,j); k = k+1;
    end
end

bnet.CPD{28} = tabular_CPD(bnet, 28 ,'CPT',cpt);
bnet.CPD{28} = mk_named_CPT({'ScenRelAMCIN','MorningCIN','AMCINInScen'},names, dag, bnet.CPD{28});

ScenRel3_4 = [1	0	1	0	1	1	0	0	0	0	1;
0	1	0	0	0	0	0	0	0	0	0;
0	0	0	1	0	0	0	0	0	0	0;
0	0	0	0	0	0	1	0	0	1	0;
0	0	0	0	0	0	0	1	1	0	0;];

k = 1;
cpt = zeros(1,11*5);
for i=1:5
    for j=1:11
        cpt(k) = ScenRel3_4(i,j);  k = k+1;
    end
end

bnet.CPD{29} = tabular_CPD(bnet, 29 ,'CPT',cpt);
bnet.CPD{29} = mk_named_CPT({'Scenario','ScenRel3_4'},names, dag, bnet.CPD{29});

RHRatio = [0.05	0.1	0.4	0.2	0.8	0	0.6	0	0.1	0.4	0.15;
0.5	0.5	0.15	0.45	0.05	0	0	0.7	0.7	0.4	0.45;
0.45	0.4	0.45	0.35	0.15	1	0.4	0.3	0.2	0.2	0.4;];

k = 1;
cpt = zeros(1,11*3);
for i=1:3
    for j=1:11
        cpt(k) = RHRatio(i,j);  k = k+1;
    end
end

bnet.CPD{30} = tabular_CPD(bnet, 30 ,'CPT',cpt);
bnet.CPD{30} = mk_named_CPT({'Scenario','RHRatio'},names, dag, bnet.CPD{30});


MvmtFeatures = [0.25	0.05	0.1	0.18	0.02	0.05	0.1	0	0.2	0.04	0.5;
0.55	0.1	0.3	0.38	0.02	0.07000000000000001	0.25	0.6	0.1	0	0.35;
0.2	0.1	0.3	0.34	0.26	0.05	0.15	0.1	0.2	0.04	0.09;
0	0.75	0.3	0.1	0.7	0.83	0.5	0.3	0.5	0.92	0.06;];

k = 1;
cpt = zeros(1,11*4);
for i=1:4
    for j=1:11
        cpt(k) = MvmtFeatures(i,j);  k = k+1;
    end
end

bnet.CPD{31} = tabular_CPD(bnet, 31 ,'CPT',cpt);
bnet.CPD{31} = mk_named_CPT({'Scenario','MvmtFeatures'},names, dag, bnet.CPD{31});

MidLLapse = [0.25	0.25	0.4	0.43	0.02	0	0.84	0.25	0.41	0.23	0.16;
0.55	0.5	0.38	0.37	0.38	0.1	0.16	0.31	0.29	0.42	0.28;
0.2	0.25	0.22	0.2	0.6	0.9	0	0.44	0.3	0.35	0.5600000000000001;];

k = 1;
cpt = zeros(1,11*3);
for i=1:3
    for j=1:11
        cpt(k) = MidLLapse(i,j);  k = k+1;
    end
end

bnet.CPD{32} = tabular_CPD(bnet, 32 ,'CPT',cpt);
bnet.CPD{32} = mk_named_CPT({'Scenario','MidLLapse'},names, dag, bnet.CPD{32});

MeanRH = [0.33	0.4	0.05	0.1	0.05	1	0	0.4	0.2	0.05	0.2;
0.5	0.4	0.45	0.5	0.65	0	0.07000000000000001	0.55	0.45	0.55	0.4;
0.17	0.2	0.5	0.4	0.3	0	0.93	0.05	0.35	0.4	0.4;];

k = 1;
cpt = zeros(1,11*3);
for i=1:3
    for j=1:11
        cpt(k) = MeanRH(i,j);  k = k+1;
    end
end

bnet.CPD{33} = tabular_CPD(bnet, 33 ,'CPT',cpt);
bnet.CPD{33} = mk_named_CPT({'Scenario','MeanRH'},names, dag, bnet.CPD{33});

LowLLapse = [0.04	0.07000000000000001	0.35	0.4	0.45	0.01	0.78	0	0.22	0.13	0.09;
0.25	0.31	0.47	0.4	0.35	0.35	0.19	0.02	0.4	0.4	0.4;
0.35	0.31	0.14	0.13	0.15	0.45	0.03	0.33	0.3	0.35	0.33;
0.36	0.31	0.04	0.07000000000000001	0.05	0.19	0	0.65	0.08	0.12	0.18;];

k = 1;
cpt = zeros(1,11*4);
for i=1:4
    for j=1:11
        cpt(k) = LowLLapse(i,j);  k = k+1;
    end
end

bnet.CPD{34} = tabular_CPD(bnet, 34 ,'CPT',cpt);
bnet.CPD{34} = mk_named_CPT({'Scenario','LowLLapse'},names, dag, bnet.CPD{34});

Dewpoints = [0.04	0.05	0.4	0.13	0.15	0	0.5	0	0	0.1	0.1;
0.05	0.07000000000000001	0.25	0.22	0.2	0	0.27	0.02	0.02	0.45	0.1;
0.15	0.15	0	0.18	0.2	0	0.15	0.1	0.7	0.1	0.1;
0.05	0.1	0.15	0.07000000000000001	0.18	0	0.02	0.05	0	0.05	0.2;
0.19	0.3	0.05	0.34	0.11	0	0.02	0.5	0.2	0.26	0.05;
0.3	0.27	0.02	0.03	0.11	0.98	0	0.2	0.04	0.02	0.1;
0.22	0.06	0.13	0.03	0.05	0.02	0.04	0.13	0.04	0.02	0.35;];

k = 1;
cpt = zeros(1,11*7);
for i=1:7
    for j=1:11
        cpt(k) = Dewpoints(i,j);  k = k+1;
    end
end

bnet.CPD{35} = tabular_CPD(bnet, 35 ,'CPT',cpt);
bnet.CPD{35} = mk_named_CPT({'Scenario','Dewpoints'},names, dag, bnet.CPD{35});

bnet.CPD{36} = tabular_CPD(bnet, 36 ,'CPT',[0.333333 0.333333 0.333334]);
bnet.CPD{37} = tabular_CPD(bnet, 37 ,'CPT',[0.3 0.25 0.45]);

% ABI = {[0.6	0.85	0.95],	[0.3	0.5	0.75],	[0.06	0.2	0.5],	[0.01	0.05	0.35];
% [0.3	0.13	0.04]	[0.3	0.3	0.2]	[0.21	0.4	0.4]	[0.04	0.2	0.35];
% [0.1	0.02	0.01]	[0.4	0.2	0.05]	[0.73	0.4	0.1]	[0.95	0.75	0.3]};
% CDEJ = {[0.4	0.7	0.9]	[0.15	0.25	0.6]	[0.03	0.2	0.45]	[0.01	0.05	0.25];
% [0.3	0.2	0.08]	[0.3	0.5	0.3]	[0.17	0.3	0.4]	[0.04	0.18	0.4];
% [0.3	0.1	0.02]	[0.55	0.25	0.1]	[0.8	0.5	0.15]	[0.95	0.77	0.35]};
% F = {[0.35	0.55	0.85]	[0.07000000000000001	0.2	0.5]	[0	0.05	0.25]	[0	0	0.04];
% [0.35	0.4	0.13]	[0.38	0.6	0.43]	[0.05	0.35	0.5]	[0.02	0.05	0.16];
% [0.3	0.05	0.02]	[0.55	0.2	0.07000000000000001]	[0.95	0.6	0.25]	[0.98	0.95	0.8]};
% G = {[0.3	0.5	0.75]	[0.15	0.2	0.15]	[0.07000000000000001	0.13	0.1]	[0.02	0.04	0.07000000000000001];
% [0.4	0.3	0.2]	[0.35	0.6	0.7]	[0.23	0.47	0.75]	[0.18	0.26	0.3];
% [0.3	0.2	0.05]	[0.5	0.2	0.15]	[0.7	0.4	0.15]	[0.8	0.7	0.63]};
% H = {[0.35	0.4	0.58]	[0.1	0.15	0.4]	[0.02	0.05	0.15]	[0.01	0.03	0.08];
% [0.45	0.5	0.4]	[0.25	0.45	0.45]	[0.18	0.25	0.35]	[0.09	0.17	0.32];
% [0.2	0.1	0.02]	[0.65	0.4	0.15]	[0.8	0.7	0.5]	[0.9	0.8	0.6]};
% K = {[0.3	0.4	0.5]	[0.1	0.25	0.3]	[0.05	0.1	0.15]	[0.02	0.04	0.1];
% [0.55	0.5	0.43]	[0.35	0.5	0.5]	[0.22	0.35	0.35]	[0.1	0.16	0.25];
% [0.15	0.1	0.07000000000000001]	[0.55	0.25	0.2]	[0.73	0.55	0.5]	[0.88	0.8	0.65]}; 
% 
% q = 1;
% cpt = zeros(1,36*6);
% p=1;
% for i=1:3
%      for j=1:3 % each element of a cell
%             for l=1:4 %each cell at a row
%                   tmp = ABI(i,l); 
%                   tmp = cell2mat(tmp);
%                   cpt(q) = tmp(p,j);   q = q + 1;
%         
%                   tmp = CDEJ(i,l); 
%                   tmp = cell2mat(tmp);
%                   cpt(q) = tmp(p,j);   q = q + 1;
%         
%                   tmp = F(i,l); 
%                   tmp = cell2mat(tmp);
%                   cpt(q) = tmp(p,j);   q = q + 1;
%                   
%                   tmp = G(i,l); 
%                   tmp = cell2mat(tmp);
%                   cpt(q) = tmp(p,j);   q = q + 1;
%         
%                   tmp = H(i,l); 
%                   tmp = cell2mat(tmp);
%                   cpt(q) = tmp(p,j);   q = q + 1;
%         
%                   tmp = K(i,l); 
%                   tmp = cell2mat(tmp);
%                   cpt(q) = tmp(p,j);   q = q + 1;
%              end
%      end
% end 
% 
% 
% bnet.CPD{38} = tabular_CPD(bnet, 38 ,'CPT',cpt);
% bnet.CPD{38} = mk_named_CPT({'ScenRelAMIns','Llfr12ZDENSd','AMDewptCalPl','AMInsWliScen'},names, dag, bnet.CPD{38});


AMInsWliScen = [0.6	0.85	0.95	0.3	0.5	0.75	0.06	0.2	0.5	0.01	0.05	0.35	0.4	0.7	0.9	0.15	0.25	0.6	0.03	0.2	0.45	0.01	0.05	0.25	0.35	0.55	0.85	0.07000000000000001	0.2	0.5	0	0.05	0.25	0	0	0.04	0.3	0.5	0.75	0.15	0.2	0.15	0.07000000000000001	0.13	0.1	0.02	0.04	0.07000000000000001	0.35	0.4	0.58	0.1	0.15	0.4	0.02	0.05	0.15	0.01	0.03	0.08	0.3	0.4	0.5	0.1	0.25	0.3	0.05	0.1	0.15	0.02	0.04	0.1;
0.3	0.13	0.04	0.3	0.3	0.2	0.21	0.4	0.4	0.04	0.2	0.35	0.3	0.2	0.08	0.3	0.5	0.3	0.17	0.3	0.4	0.04	0.18	0.4	0.35	0.4	0.13	0.38	0.6	0.43	0.05	0.35	0.5	0.02	0.05	0.16	0.4	0.3	0.2	0.35	0.6	0.7	0.23	0.47	0.75	0.18	0.26	0.3	0.45	0.5	0.4	0.25	0.45	0.45	0.18	0.25	0.35	0.09	0.17	0.32	0.55	0.5	0.43	0.35	0.5	0.5	0.22	0.35	0.35	0.1	0.16	0.25;
0.1	0.02	0.01	0.4	0.2	0.05	0.73	0.4	0.1	0.95	0.75	0.3	0.3	0.1	0.02	0.55	0.25	0.1	0.8	0.5	0.15	0.95	0.77	0.35	0.3	0.05	0.02	0.55	0.2	0.07000000000000001	0.95	0.6	0.25	0.98	0.95	0.8	0.3	0.2	0.05	0.5	0.2	0.15	0.7	0.4	0.15	0.8	0.7	0.63	0.2	0.1	0.02	0.65	0.4	0.15	0.8	0.7	0.5	0.9	0.8	0.6	0.15	0.1	0.07000000000000001	0.55	0.25	0.2	0.73	0.55	0.5	0.88	0.8	0.65];

k = 1; 
[rows columns] = size(AMInsWliScen);

scenRel = 6; %num of attributes
lifr = 4;  %num of attributes
amDew = 3;  %num of attributes
for i=1:rows
    amDewCol = 0;
    for j=1:amDew
        lifrCol = 0;
        for l=1:lifr
            for m = 1:scenRel  
                c(m) = (((m-1)*12)+1)+lifrCol+amDewCol;  %12 is the differece between Scen's current and next elements' index number
                cpt(k) = AMInsWliScen(i,c(m)); k = k + 1; 
            end  
            lifrCol = lifrCol + 3;     %3 is the differece between lifrCol's current and next elements' index number
        end
        amDewCol = amDewCol + 1;   %1 is the differece between amDew's current and next elements' index number
    end
end

bnet.CPD{38} = tabular_CPD(bnet, 38 ,'CPT',cpt);
bnet.CPD{38} = mk_named_CPT({'AMDewptCalPl','Llfr12ZDENSd','ScenRelAMIns','AMInsWliScen'},names, dag, bnet.CPD{38});






bnet.CPD{39} = tabular_CPD(bnet, 39 ,'CPT',[0.25 0.25 0.25 0.25]);

strong = {[1	0.9	0.7	0.2],	[0.9	0.7	0.15	0.1],	[0.7	0.15	0.2	0.1],	[0.2	0.1	0.1	0.1];
[0	0.1	0.2	0.5],	[0.1	0.3	0.7	0.35],	[0.2	0.7	0.6	0.2],	[0.5	0.35	0.2	0.1];
[0	0	0.1	0.2],	[0	0	0.15	0.45],	[0.1	0.15	0.2	0.6],	[0.2	0.45	0.6	0.2];
[0	0	0	0.1],	[0	0	0	0.1],	[0	0	0	0.1],	[0.1	0.1	0.1	0.6]};

weak = {[0.9	0.7	0.15	0.1],	[0.7	0	0	0],	[0.15	0	0	0],	[0.1	0	0	0];
[0.1	0.3	0.7	0.35],	[0.3	1	0.7	0.2],	[0.7	0.7	0.3	0.15],	[0.35	0.2	0.15	0.1];
[0	0	0.15	0.45],	[0	0	0.3	0.7],	[0.15	0.3	0.7	0.5],	[0.45	0.7	0.5	0.2];
[0	0	0	0.1],	[0	0	0	0.1],	[0	0	0	0.35],	[0.1	0.1	0.35	0.7]};

neutral = {[0.7	0.15	0.2	0.1],	[0.15	0	0	0],	[0.2	0	0	0],	[0.1	0	0	0];
[0.2	0.7	0.6	0.2],	[0.7	0.7	0.3	0.15],	[0.6	0.3	0	0],	[0.2	0.15	0	0];
[0.1	0.15	0.2	0.6],	[0.15	0.3	0.7	0.5],	[0.2	0.7	1	0.7],	[0.6	0.5	0.7	0.3];
[0	0	0	0.1],	[0	0	0	0.35],	[0	0	0	0.3],	[0.1	0.35	0.3	0.7]};

down = {[0.2	0.1	0.1	0.1],[0.1	0	0	0],	[0.1	0	0	0],	[0.1	0	0	0];
[0.5	0.35	0.2	0.1],	[0.35	0.2	0.15	0.1],	[0.2	0.15	0	0],	[0.1	0.1	0	0];
[0.2	0.45	0.6	0.2], [0.45	0.7	0.5	0.2],	[0.6	0.5	0.7	0.3],	[0.2	0.2	0.3	0];
[0.1	0.1	0.1	0.6],	[0.1	0.1	0.35	0.7],	[0.1	0.35	0.3	0.7],	[0.6	0.7	0.7	1]};

q = 1;
cpt = zeros(1,64*4);
p=1; %each cell element only has 1 row
for i=1:4 %each row of the whole cell
     for j=1:4 % each element of a cell
            for l=1:4 %each cell at a row
                  tmp = strong(i,l); 
                  tmp = cell2mat(tmp);
                  cpt(q) = tmp(p,j);   q = q + 1;
        
                  tmp = weak(i,l); 
                  tmp = cell2mat(tmp);
                  cpt(q) = tmp(p,j);   q = q + 1;
        
                  tmp = neutral(i,l); 
                  tmp = cell2mat(tmp);
                  cpt(q) = tmp(p,j);   q = q + 1;
                  
                  tmp = down(i,l); 
                  tmp = cell2mat(tmp);
                  cpt(q) = tmp(p,j);   q = q + 1;
       
             end
     end
end 

bnet.CPD{40} = tabular_CPD(bnet, 40 ,'CPT',cpt);
bnet.CPD{40} = mk_named_CPT({'10_7muVerMo','SubjVertMo','QGVertMotion','CombVerMo'},names, dag, bnet.CPD{40});

AreaMeso_ALS = [1	0	0	0;
                0	1	0	0;
                0	0	1	0;
                0	0	0	1];
  
q = 1;
cpt = zeros(1,4*4);
for i=1:4
    for j=1:4
        cpt(q) = AreaMeso_ALS(i,j);  q = q+1;
    end
end

bnet.CPD{41} = tabular_CPD(bnet, 41 ,'CPT',cpt);
bnet.CPD{41} = mk_named_CPT({'CombVerMo','AreaMeso_ALS'},names, dag, bnet.CPD{41});

strongUP = [0.99	0.7	0.2	0;
0.01	0.29	0.55	0.25;
0	0.01	0.24	0.55;
0	0	0.01	0.2];
weakUP = [0.8	0.35	0.01	0;
0.2	0.55	0.39	0.02;
0	0.1	0.55	0.43;
0	0	0.05	0.55];
NeutralUP = [0.7	0.2	0.01	0;
0.29	0.6	0.09	0;
0.01	0.2	0.8	0.3;
0	0	0.1	0.7];
DownUP = [0.2	0.05	0	0;
0.74	0.4	0.05	0;
0.06	0.45	0.5	0.01;
0	0.1	0.45	0.99];

q = 1;
cpt = zeros(1,16*4);
for i=1:4
    for j=1:4
        cpt(q) = strongUP(i,j);  q = q+1;
        cpt(q) = weakUP(i,j); q = q+1;
        cpt(q) = NeutralUP(i,j); q = q+1;
        cpt(q) = DownUP(i,j); q = q+1;
    end
end

bnet.CPD{42} = tabular_CPD(bnet, 42 ,'CPT',cpt);
bnet.CPD{42} = mk_named_CPT({'AreaMeso_ALS','CombMoisture','AreaMoDryAir'},names, dag, bnet.CPD{42});


veryWet = {[1	0.85	0.25],	[0.95	0.4	0.05],	[0.93	0.2	0.01],	[0.74	0	0];
[0	0.15	0.35],	[0.05	0.55	0.45]	,[0.07000000000000001	0.78	0.29],	[0.25	0.5	0.1];
[0	0	0.4],	[0	0.05	0.5],	[0	0.02	0.7],	[0.01	0.5	0.9]};

wet = {[0.92	0.7	0.15],	[0.9	0.25	0.01],	[0.8	0.01	0],	[0.65	0	0];
[0.08	0.29	0.4],	[0.09	0.6	0.3],	[0.2	0.89	0.1],	[0.34	0.4	0.02];
[0	0.01	0.45],	[0.01	0.15	0.6899999999999999],	[0	0.1	0.9],	[0.01	0.6	0.98]};

neutral = {[0.88	0.4	0.1],	[0.85	0.15	0],	[0.8	0.03	0],	[0.5	0.01	0];
[0.12	0.5	0.4],	[0.15	0.75	0.2],	[0.18	0.85	0.05],	[0.48	0.74	0.01];
[0	0.1	0.5],	[0	0.1	0.8],	[0.02	0.12	0.95],	[0.02	0.25	0.99]};

dry = {[0.85	0.55	0.1],	[0.6	0.01	0],	[0.78	0.01	0],	[0.42	0.05	0];
[0.14	0.43	0.25],	[0.39	0.9	0.15],	[0.2	0.74	0.04],	[0.55	0.65	0];
[0.01	0.02	0.65],	[0.01	0.09	0.85], [0.02	0.25	0.96],	[0.03	0.3	1]};
    

q = 1;
cpt = zeros(1,36*4);
p=1; %each array only has 1 row
for i=1:3 %each row of the whole cell
     for j=1:3 % each element of a cell
            for l=1:4 %num of cell at a row
                  tmp = veryWet(i,l); 
                  tmp = cell2mat(tmp);
                  cpt(q) = tmp(p,j);   q = q + 1;
        
                  tmp = wet(i,l); 
                  tmp = cell2mat(tmp);
                  cpt(q) = tmp(p,j);   q = q + 1;
        
                  tmp = neutral(i,l); 
                  tmp = cell2mat(tmp);
                  cpt(q) = tmp(p,j);   q = q + 1;
                  
                  tmp = dry(i,l); 
                  tmp = cell2mat(tmp);
                  cpt(q) = tmp(p,j);   q = q + 1;
       
             end
     end
end 

bnet.CPD{43} = tabular_CPD(bnet, 43 ,'CPT',cpt);
bnet.CPD{43} = mk_named_CPT({'AreaMoDryAir','AreaMeso_ALS','CombClouds','CldShadeOth'},names, dag, bnet.CPD{43});


cloudy = [0.9	0.01	0;
0.1	0.4	0.05;
0	0.59	0.95];
pc = [0.6	0	0;
0.39	0.4	0;
0.01	0.6	1];
clear = [0.5	0	0;
0.35	0.15	0;
0.15	0.85	1];

k = 1;
cpt = zeros(1,9*3);
for i=1:3
    for j=1:3
        cpt(k) = cloudy(i,j);  k = k+1;
        cpt(k) = pc(i,j); k = k+1;
        cpt(k) = clear(i,j); k = k+1;
    end
end

bnet.CPD{44} = tabular_CPD(bnet, 44 ,'CPT',cpt);
bnet.CPD{44} = mk_named_CPT({'CldShadeOth','AMInstabMt','InsInMt'},names, dag, bnet.CPD{44});

none = [1	1	1	1;
0	0	0	0;
0	0	0	0 ];
weak = [0.5	0.15	0.35	0.8;
0.4	0.4	0.6	0.19;
0.1	0.45	0.05	0.01];
strong = [0.05	0.01	0.1	0.6;
0.45	0.15	0.25	0.3;
0.5	0.84	0.65	0.1];

k = 1;
cpt = zeros(1,12*3);
for i=1:3
    for j=1:4
        cpt(k) = none(i,j);  k = k+1;
        cpt(k) = weak(i,j); k = k+1;
        cpt(k) = strong(i,j); k = k+1;
    end
end

bnet.CPD{45} = tabular_CPD(bnet, 45 ,'CPT',cpt);
bnet.CPD{45} = mk_named_CPT({'InsInMt','WndHodograph','OutflowFrMt'},names, dag, bnet.CPD{45});


none = {[0.5	0.3	0.1], [0.75	0.45	0.25],	[0.8	0.35	0.25],	[0.7	0.25	0.05];
[0.48	0.5	0.25],	[0.22	0.45	0.4], [0.18	0.5	0.35]	,[0.28	0.6	0.35];
[0.02	0.2	0.65],	[0.03	0.1	0.35],	[0.02	0.15	0.4],	[0.02	0.15	0.6]};

weak = {[0.3	0.1	0.05],	[0.15	0.1	0.05]	,[0.15	0.05	0.05]	,[0.4	0.2	0.05];
[0.63	0.5	0.2],	[0.7	0.75	0.5],	[0.7	0.8	0.45],	[0.55	0.65	0.3];
[0.07000000000000001	0.4	0.75],	[0.15	0.15	0.45],	[0.15	0.15	0.5],	[0.05	0.15	0.65]};

strong = {[0	0	0],	[0	0	0],	[0	0	0]	,[0.02	0.01	0.01];
[0.55	0.4	0.15],	[0.5	0.4	0.2],	[0.7	0.5	0.2],	[0.73	0.5	0.2];
[0.45	0.6	0.85],	[0.5	0.6	0.8	], [0.3	0.5	0.8],	[0.25	0.49	0.79]};

q = 1;
cpt = zeros(1,36*3);
p=1; %each array only has 1 row
for i=1:3 %each row of the whole cell
     for j=1:3 % each element of a cell
            for l=1:4 %num of cell in a row
                  tmp = none(i,l); 
                  tmp = cell2mat(tmp);
                  cpt(q) = tmp(p,j);   q = q + 1;
        
                  tmp = weak(i,l); 
                  tmp = cell2mat(tmp);
                  cpt(q) = tmp(p,j);   q = q + 1;
        
                  tmp = strong(i,l); 
                  tmp = cell2mat(tmp);
                  cpt(q) = tmp(p,j);   q = q + 1;
             end
     end
end 

bnet.CPD{46} = tabular_CPD(bnet, 46 ,'CPT',cpt);
bnet.CPD{46} = mk_named_CPT({'OutflowFrMt','WndHodograph','MorningBound','Boundaries'},names, dag, bnet.CPD{46});
bnet.CPD{47} = tabular_CPD(bnet, 47 ,'CPT',[1	0.48	0.2 0	0.5	0.5 0	0.02	0.3]);

none = [1	1	1	1;
0	0	0	0;
0	0	0	0];
weak = [0.3	0.2	0.5	0.8;
0.6	0.7	0.46	0.19;
0.1	0.1	0.04	0.01];
strong = [0	0	0.1	0.5;
0.3	0.2	0.5	0.38;
0.7	0.8	0.4	0.12];

k = 1;
cpt = zeros(1,12*3);
for i=1:3
    for j=1:4
        cpt(k) = none(i,j);  k = k+1;
        cpt(k) = weak(i,j); k = k+1;
        cpt(k) = strong(i,j); k = k+1;
    end
end

bnet.CPD{48} = tabular_CPD(bnet, 48 ,'CPT',cpt);
bnet.CPD{48} = mk_named_CPT({'InsInMt','WndHodograph','CldShadeConv'},names, dag, bnet.CPD{48});


CompPlFcst = [0.4	0.1	0.05	0.6	0.4	0.2	0.6	0.45	0.25	0.7	0.65	0.6	0.4	0.25	0.15	0.65	0.45	0.25	0.65	0.5	0.3	0.75	0.7	0.65	0.45	0.4	0.35	0.7	0.55	0.4	0.7	0.6	0.55	0.85	0.8	0.75	0.35	0.05	0.03	0.5	0.3	0.15	0.55	0.4	0.2	0.6	0.6	0.55	0.35	0.1	0.05	0.55	0.35	0.2	0.6	0.45	0.25	0.65	0.65	0.6	0.4	0.25	0.2	0.65	0.45	0.3	0.65	0.55	0.5	0.78	0.75	0.7	0.3	0.01	0.01	0.35	0.15	0.1	0.45	0.3	0.15	0.5	0.48	0.45	0.3	0.05	0.04	0.4	0.2	0.12	0.5	0.35	0.2	0.55	0.55	0.5	0.3	0.15	0.13	0.5	0.35	0.2	0.55	0.45	0.4	0.7	0.65	0.6;
0.35	0.35	0.3	0.25	0.3	0.5	0.35	0.4	0.45	0.27	0.3	0.35	0.35	0.3	0.35	0.25	0.3	0.5	0.3	0.4	0.45	0.23	0.26	0.32	0.3	0.3	0.3	0.22	0.3	0.45	0.27	0.3	0.33	0.14	0.17	0.23	0.35	0.35	0.25	0.25	0.35	0.45	0.3	0.4	0.4	0.35	0.3	0.33	0.35	0.35	0.3	0.25	0.35	0.5	0.3	0.4	0.5	0.3	0.3	0.35	0.35	0.4	0.4	0.25	0.35	0.5	0.3	0.3	0.3	0.18	0.2	0.25	0.3	0.25	0.2	0.25	0.4	0.35	0.3	0.4	0.4	0.35	0.32	0.35	0.3	0.6	0.27	0.25	0.4	0.43	0.3	0.4	0.45	0.35	0.3	0.4	0.35	0.35	0.35	0.25	0.35	0.45	0.35	0.35	0.35	0.24	0.28	0.3;
0.25	0.55	0.65	0.15	0.3	0.3	0.05	0.15	0.3	0.03	0.05	0.05	0.25	0.45	0.5	0.1	0.25	0.25	0.05	0.1	0.25	0.02	0.04	0.03	0.25	0.3	0.35	0.08	0.15	0.15	0.03	0.1	0.12	0.01	0.03	0.02	0.3	0.6	0.72	0.25	0.35	0.4	0.15	0.2	0.4	0.05	0.1	0.12	0.3	0.55	0.65	0.2	0.3	0.3	0.1	0.15	0.25	0.05	0.05	0.05	0.25	0.35	0.4	0.1	0.2	0.2	0.05	0.15	0.2	0.04	0.05	0.05	0.4	0.74	0.79	0.4	0.45	0.55	0.25	0.3	0.45	0.15	0.2	0.2	0.4	0.35	0.6899999999999999	0.35	0.4	0.45	0.2	0.25	0.35	0.1	0.15	0.1	0.35	0.5	0.52	0.25	0.3	0.35	0.1	0.2	0.25	0.06	0.07000000000000001	0.1];

k = 1; 
[rows columns] = size(CompPlFcst);
Boundaries = 3; %num of attributes
CldShadeConv = 3;  %num of attributes
AreaMeso_ALS = 4;  %num of attributes
CldShadeOth = 3; %num of attributes
cpt1= zeros(1,108);
for i=1:rows
    CldShadeOthCol = 0;
    for s=1:CldShadeOth
       AreaMesoCol = 0;
       for j=1:AreaMeso_ALS
         CldShadeConvCol = 0;
         for l=1:CldShadeConv
              for m = 1:Boundaries  
                c(m) = (((m-1)*36)+1)+CldShadeConvCol+AreaMesoCol+CldShadeOthCol;  %36(3*4*3) is the differece between Boundaries's current and next elements' index number
                cpt1(k) = CompPlFcst(i,c(m)); k = k + 1; 
              end  
              CldShadeConvCol = CldShadeConvCol + 12;     %12 is the differece between CldShadeConv's current and next elements' index number
         end
         AreaMesoCol = AreaMesoCol + 3;   %3 is the differece between AreaMeso's current and next elements' index number
       end
       CldShadeOthCol = CldShadeOthCol + 1;  %1 is the differece between CldShadeOth's current and next elements' index number
    end
end

bnet.CPD{49} = tabular_CPD(bnet, 49 ,'CPT',cpt1);
bnet.CPD{49} = mk_named_CPT({'CldShadeOth','AreaMeso_ALS','CldShadeConv','Boundaries','CompPlFcst'},names, dag, bnet.CPD{49});



InsChange = [0	0	0.05	0.05	0.1	0.25	0.15	0.2	0.35	0.5	0.8	0.9;
0.05	0.12	0.15	0.15	0.4	0.5	0.5	0.6	0.5	0.4	0.16	0.09;
0.95	0.88 0.8	0.8	0.5	0.25	0.35	0.2	0.15	0.1	0.04	0.01];


k = 1; 
[rows columns] = size(InsChange);

LoLevMoistAd = 4; %num of attributes
CompPlFcst = 3;
for i=1:rows
        CompPlFcstCol = 0;
        for l=1:CompPlFcst
            for m = 1:LoLevMoistAd  
                c(m) = (((m-1)*3)+1)+CompPlFcstCol;  %3 is the differece between LoLevMoistAd's current and next elements' index number
                cpt2(k) = InsChange(i,c(m)); k = k + 1; 
            end  
            CompPlFcstCol = CompPlFcstCol + 1;     %1 is the differece between CompPlFcst's current and next elements' index number
        end
end

bnet.CPD{50} = tabular_CPD(bnet, 50 ,'CPT',cpt2);
bnet.CPD{50} = mk_named_CPT({'CompPlFcst','LoLevMoistAd','InsChange'},names, dag, bnet.CPD{50});


InsSclInScen = [1	0.9	0.4	0.6	0.15	0	0.25	0	0;
0	0.1	0.35	0.4	0.7	0.4	0.35	0.1	0;
0	0	0.25	0	0.15	0.6	0.4	0.9	1];
k = 1; 
[rows columns] = size(InsSclInScen);

AMInsWliScen = 3; %num of attributes
InsChange = 3;
for i=1:rows
        InsChangeCol = 0;
        for l=1:InsChange
            for m = 1:AMInsWliScen  
                c(m) = (((m-1)*3)+1)+InsChangeCol;  %3 is the differece between AMInsWliScen's current and next elements' index number
                cpt3(k) = InsSclInScen(i,c(m)); k = k + 1; 
            end  
            InsChangeCol = InsChangeCol + 1;     %1 is the differece between InsChange's current and next elements' index number
        end
end
bnet.CPD{51} = tabular_CPD(bnet, 51 ,'CPT',cpt3);
bnet.CPD{51} = mk_named_CPT({'InsChange','AMInsWliScen','InsSclInScen'},names, dag, bnet.CPD{51});

bnet.CPD{52} = tabular_CPD(bnet, 52 ,'CPT',[0	0	1 0	1	0 1	0	0]);


CapInScen = [1	0.98	0.35	0.75	0.03	0	0.3	0	0;
0	0.02	0.35	0.25	0.9399999999999999	0.25	0.35	0.02	0;
0	0	0.3	0	0.03	0.75	0.35	0.98	1];

k = 1; 
[rows columns] = size(CapInScen);

AMCINInScen = 3; %num of attributes
CapChange = 3;
for i=1:rows
        CapChangeCol = 0;
        for l=1:CapChange
            for m = 1:AMCINInScen  
                c(m) = (((m-1)*3)+1)+CapChangeCol;  %3 is the differece between AMCINInScen's current and next elements' index number
                cpt4(k) = CapInScen(i,c(m)); k = k + 1; 
            end  
            CapChangeCol = CapChangeCol + 1;     %1 is the differece between CapChange's current and next elements' index number
        end
end

bnet.CPD{53} = tabular_CPD(bnet, 53 ,'CPT',cpt4);
bnet.CPD{53} = mk_named_CPT({'CapChange','AMCINInScen','CapInScen'},names, dag, bnet.CPD{53});

PlainsFcst = [0.75	0.75	0.9	0.9	0.88	0.92	0.85	1	0.9	0.9	0.95	0.75	0.65	0.9	0.91	0.85	0.9	0.84	0.99	0.88	0.92	0.96	0.75	0.75	0.95	0.93	0.92	0.87	0.9	0.98	0.92	0.95	0.97	0.5	0.6	0.8	0.85	0.85	0.88	0.8	0.92	0.8	0.75	0.9	0.35	0.55	0.82	0.82	0.75	0.88	0.75	0.9	0.7	0.8	0.9	0.5	0.6	0.85	0.85	0.75	0.85	0.75	0.9399999999999999	0.65	0.83	0.93	0.35	0.45	0.8	0.72	0.78	0.86	0.65	0.85	0.65	0.72	0.85	0.25	0.45	0.65	0.55	0.55	0.8100000000000001	0.6	0.8	0.6	0.75	0.88	0.4	0.45	0.75	0.65	0.52	0.82	0.65	0.85	0.5	0.77	0.9	0.7	0.6	0.82	0.85	0.82	0.85	0.8	0.97	0.88	0.86	0.88	0.65	0.58	0.8	0.85	0.8	0.83	0.77	0.93	0.85	0.85	0.9	0.6	0.65	0.9	0.85	0.82	0.8	0.8	0.91	0.85	0.9	0.93	0.3	0.55	0.7	0.75	0.62	0.85	0.75	0.82	0.6	0.68	0.82	0.28	0.48	0.7	0.7	0.6	0.82	0.63	0.8	0.5	0.7	0.8	0.4	0.5	0.72	0.65	0.55	0.78	0.55	0.85	0.45	0.73	0.85	0.3	0.4	0.65	0.6	0.6	0.83	0.45	0.7	0.55	0.6	0.72	0.22	0.35	0.45	0.45	0.48	0.72	0.43	0.68	0.35	0.6	0.74	0.27	0.35	0.55	0.45	0.42	0.74	0.45	0.77	0.3	0.68	0.75	0.5	0.45	0.75	0.75	0.72	0.78	0.66	0.88	0.7	0.78	0.8	0.45	0.45	0.7	0.72	0.7	0.75	0.62	0.85	0.75	0.76	0.8	0.35	0.45	0.75	0.7	0.6	0.72	0.6	0.8	0.75	0.75	0.88	0.2	0.4	0.7	0.65	0.5	0.74	0.6	0.67	0.35	0.6	0.75	0.23	0.38	0.58	0.55	0.53	0.73	0.35	0.65	0.3	0.6	0.68	0.3	0.35	0.55	0.5	0.4	0.7	0.35	0.6	0.35	0.62	0.7	0.25	0.3	0.45	0.5	0.4	0.72	0.25	0.57	0.25	0.48	0.6	0.19	0.25	0.35	0.35	0.35	0.65	0.22	0.45	0.25	0.48	0.58	0.15	0.25	0.4	0.3	0.25	0.6	0.18	0.47	0.25	0.5	0.5	0.4	0.35	0.6	0.6	0.55	0.6899999999999999	0.54	0.75	0.55	0.7	0.7	0.35	0.35	0.55	0.55	0.5	0.65	0.38	0.7	0.65	0.67	0.7	0.2	0.3	0.55	0.5	0.45	0.6	0.28	0.65	0.63	0.62	0.8	0.16	0.3	0.45	0.52	0.35	0.65	0.48	0.58	0.25	0.5	0.65	0.18	0.3	0.45	0.45	0.35	0.62	0.2	0.52	0.23	0.47	0.55	0.23	0.25	0.4	0.4	0.3	0.57	0.15	0.5	0.25	0.5	0.55	0.18	0.2	0.3	0.4	0.25	0.63	0.15	0.4	0.2	0.3	0.5	0.15	0.18	0.25	0.25	0.25	0.58	0.13	0.3	0.22	0.35	0.5	0.1	0.2	0.2	0.23	0.15	0.5	0.1	0.28	0.2	0.3	0.38;
0.2	0.2	0.08	0.06	0.1	0.08	0.13	0	0.08	0.08	0.04	0.2	0.3	0.08	0.05	0.13	0.1	0.12	0.01	0.1	0.06	0.03	0.2	0.2	0.04	0.04	0.06	0.13	0.06	0.02	0.06	0.04	0.02	0.3	0.3	0.14	0.09	0.1	0.11	0.17	0.06	0.12	0.22	0.08	0.3	0.3	0.13	0.1	0.18	0.11	0.2	0.07000000000000001	0.2	0.15	0.08	0.2	0.25	0.1	0.07000000000000001	0.15	0.14	0.2	0.05	0.22	0.1	0.06	0.2	0.35	0.1	0.14	0.15	0.12	0.25	0.1	0.2	0.2	0.1	0.15	0.35	0.2	0.2	0.25	0.17	0.28	0.13	0.2	0.15	0.08	0.08	0.25	0.1	0.15	0.25	0.16	0.27	0.09	0.2	0.1	0.07000000000000001	0.25	0.33	0.13	0.1	0.15	0.14	0.17	0.02	0.1	0.1	0.1	0.25	0.32	0.15	0.1	0.16	0.16	0.17	0.06	0.12	0.1	0.08	0.3	0.28	0.08	0.1	0.13	0.19	0.13	0.08	0.12	0.08	0.06	0.4	0.34	0.2	0.15	0.28	0.14	0.2	0.14	0.25	0.22	0.15	0.37	0.35	0.2	0.17	0.29	0.16	0.3	0.15	0.3	0.2	0.16	0.28	0.25	0.18	0.2	0.3	0.2	0.35	0.12	0.3	0.15	0.12	0.25	0.36	0.2	0.2	0.28	0.14	0.4	0.18	0.25	0.25	0.2	0.17	0.37	0.3	0.25	0.29	0.25	0.4	0.2	0.3	0.2	0.16	0.1	0.3	0.22	0.25	0.3	0.22	0.4	0.13	0.25	0.15	0.15	0.4	0.42	0.18	0.15	0.22	0.21	0.27	0.1	0.22	0.16	0.16	0.35	0.35	0.2	0.17	0.22	0.24	0.3	0.12	0.15	0.17	0.16	0.4	0.4	0.19	0.2	0.3	0.27	0.3	0.16	0.17	0.2	0.1	0.45	0.4	0.2	0.22	0.34	0.24	0.3	0.24	0.4	0.25	0.2	0.4	0.35	0.25	0.25	0.32	0.25	0.53	0.24	0.4	0.24	0.24	0.34	0.35	0.25	0.27	0.38	0.28	0.5	0.25	0.35	0.22	0.22	0.28	0.38	0.3	0.25	0.35	0.24	0.57	0.28	0.35	0.26	0.26	0.18	0.4	0.3	0.3	0.35	0.3	0.58	0.35	0.34	0.26	0.25	0.16	0.3	0.3	0.3	0.4	0.34	0.62	0.3	0.3	0.22	0.27	0.45	0.45	0.27	0.22	0.32	0.29	0.36	0.2	0.3	0.22	0.25	0.4	0.4	0.3	0.27	0.35	0.33	0.5	0.24	0.2	0.23	0.25	0.45	0.45	0.3	0.3	0.38	0.38	0.57	0.28	0.25	0.28	0.17	0.47	0.45	0.32	0.26	0.45	0.32	0.39	0.3	0.45	0.28	0.27	0.45	0.35	0.3	0.3	0.43	0.35	0.65	0.33	0.42	0.3	0.3	0.4	0.4	0.3	0.3	0.45	0.4	0.65	0.33	0.36	0.28	0.3	0.3	0.4	0.3	0.3	0.48	0.32	0.63	0.38	0.37	0.35	0.32	0.2	0.4	0.35	0.35	0.42	0.36	0.62	0.45	0.35	0.32	0.3	0.2	0.3	0.4	0.3	0.45	0.42	0.65	0.4	0.32	0.28	0.32;
0.05	0.05	0.02	0.04	0.02	0	0.02	0	0.02	0.02	0.01	0.05	0.05	0.02	0.04	0.02	0	0.04	0	0.02	0.02	0.01	0.05	0.05	0.01	0.03	0.02	0	0.04	0	0.02	0.01	0.01	0.2	0.1	0.06	0.06	0.05	0.01	0.03	0.02	0.08	0.03	0.02	0.35	0.15	0.05	0.08	0.07000000000000001	0.01	0.05	0.03	0.1	0.05	0.02	0.3	0.15	0.05	0.08	0.1	0.01	0.05	0.01	0.13	0.07000000000000001	0.01	0.45	0.2	0.1	0.14	0.07000000000000001	0.02	0.1	0.05	0.15	0.08	0.05	0.6	0.2	0.15	0.25	0.2	0.02	0.12	0.07000000000000001	0.2	0.1	0.04	0.52	0.3	0.15	0.2	0.23	0.02	0.08	0.06	0.3	0.13	0.03	0.05	0.07000000000000001	0.05	0.05	0.03	0.01	0.03	0.01	0.02	0.04	0.02	0.1	0.1	0.05	0.05	0.04	0.01	0.06	0.01	0.03	0.05	0.02	0.1	0.07000000000000001	0.02	0.05	0.05	0.01	0.07000000000000001	0.01	0.03	0.02	0.01	0.3	0.11	0.1	0.1	0.1	0.01	0.05	0.04	0.15	0.1	0.03	0.35	0.17	0.1	0.13	0.11	0.02	0.07000000000000001	0.05	0.2	0.1	0.04	0.32	0.25	0.1	0.15	0.15	0.02	0.1	0.03	0.25	0.12	0.03	0.45	0.24	0.15	0.2	0.12	0.03	0.15	0.12	0.2	0.15	0.08	0.61	0.28	0.25	0.3	0.23	0.03	0.17	0.12	0.35	0.2	0.1	0.63	0.35	0.23	0.3	0.28	0.04	0.15	0.1	0.45	0.17	0.1	0.1	0.13	0.07000000000000001	0.1	0.06	0.01	0.07000000000000001	0.02	0.08	0.06	0.04	0.2	0.2	0.1	0.11	0.08	0.01	0.08	0.03	0.1	0.07000000000000001	0.04	0.25	0.15	0.06	0.1	0.1	0.01	0.1	0.04	0.08	0.05	0.02	0.35	0.2	0.1	0.13	0.16	0.02	0.1	0.09	0.25	0.15	0.05	0.37	0.27	0.17	0.2	0.15	0.02	0.12	0.11	0.3	0.16	0.08	0.36	0.3	0.2	0.23	0.22	0.02	0.15	0.15	0.3	0.16	0.08	0.47	0.32	0.25	0.25	0.25	0.04	0.18	0.15	0.4	0.26	0.14	0.63	0.35	0.35	0.35	0.3	0.05	0.2	0.2	0.41	0.26	0.17	0.6899999999999999	0.45	0.3	0.4	0.35	0.06	0.2	0.23	0.45	0.28	0.23	0.15	0.2	0.13	0.18	0.13	0.02	0.1	0.05	0.15	0.08	0.05	0.25	0.25	0.15	0.18	0.15	0.02	0.12	0.06	0.15	0.1	0.05	0.35	0.25	0.15	0.2	0.17	0.02	0.15	0.07000000000000001	0.12	0.1	0.03	0.37	0.25	0.23	0.22	0.2	0.03	0.13	0.12	0.3	0.22	0.08	0.37	0.35	0.25	0.25	0.22	0.03	0.15	0.15	0.35	0.23	0.15	0.37	0.35	0.3	0.3	0.25	0.03	0.2	0.17	0.39	0.22	0.15	0.52	0.4	0.4	0.3	0.27	0.05	0.22	0.22	0.43	0.35	0.18	0.65	0.42	0.4	0.4	0.33	0.06	0.25	0.25	0.43	0.33	0.2	0.7	0.5	0.4	0.47	0.4	0.08	0.25	0.32	0.48	0.42	0.3];

k = 1; 
[rows columns] = size(PlainsFcst);
CurPropConv = 4; %num of attributes
InsSclInScen = 3;  %num of attributes
CapInScen = 3;  %num of attributes
ScnRelPlFcst = 11; %num of attributes
cpt5= zeros(1,1188);
for i=1:rows
    ScnRelPlFcstCol = 0;
    for s=1:ScnRelPlFcst
       CapInScenCol = 0;
       for j=1:CapInScen
         InsSclInScenCol = 0;
         for l=1:InsSclInScen
              for m = 1:CurPropConv  
                c(m) = (((m-1)*99)+1)+InsSclInScenCol+CapInScenCol+ScnRelPlFcstCol;  %99(11*3*3) is the differece between Boundaries's current and next elements' index number
                cpt5(k) = PlainsFcst(i,c(m)); k = k + 1; 
              end  
              InsSclInScenCol = InsSclInScenCol + 33;     %33 is the differece between InsSclInScen's current and next elements' index number
         end
         CapInScenCol = CapInScenCol + 11;   %11 is the differece between CapInScen's current and next elements' index number
       end
       ScnRelPlFcstCol = ScnRelPlFcstCol + 1;  %1 is the differece between ScnRelPlFcst's current and next elements' index number
    end
end

bnet.CPD{54} = tabular_CPD(bnet, 54 ,'CPT',cpt5);
bnet.CPD{54} = mk_named_CPT({'ScnRelPlFcst','CapInScen','InsSclInScen','CurPropConv','PlainsFcst'},names, dag, bnet.CPD{54});

StarFcst = [0.9399999999999999	0.06	0.01	0.98	0.04	0	0.92	0.01	0	0.92	0.03	0.01	0.99	0.09	0.03;
0.05	0.89	0.05	0.02	0.9399999999999999	0.03	0.06	0.89	0.01	0.06	0.92	0.04	0.01	0.9	0.12;
0.01	0.05	0.9399999999999999	0	0.02	0.97	0.02	0.1	0.99	0.02	0.05	0.95	0	0.01	0.85];

k = 1; 
[rows columns] = size(StarFcst);

ScenRel3_4 = 5; %num of attributes
PlainsFcst = 3;
for i=1:rows
        PlainsFcstCol = 0;
        for l=1:PlainsFcst
            for m = 1:ScenRel3_4  
                c(m) = (((m-1)*3)+1)+PlainsFcstCol;  %3 is the differece between ScenRel3_4's current and next elements' index number
                cpt6(k) = StarFcst(i,c(m)); k = k + 1; 
            end  
            PlainsFcstCol = PlainsFcstCol + 1;     %1 is the differece between PlainsFcst's current and next elements' index number
        end
end

bnet.CPD{55} = tabular_CPD(bnet, 55 ,'CPT',cpt6);
bnet.CPD{55} = mk_named_CPT({'PlainsFcst','ScenRel3_4','234StarFcst'},names, dag, bnet.CPD{55});

R5Fcst =[1	0	0	0	0	0	0	0	0;
0	1	0	1	1	0	0	0	0;
0	0	1	0	0	1	1	1	1];

k = 1; 
[rows columns] = size(R5Fcst);

MountainFcst = 3; %num of attributes
StarFcst = 3;
for i=1:rows
        StarFcstCol = 0;
        for l=1:StarFcst
            for m = 1:MountainFcst  
                c(m) = (((m-1)*3)+1)+StarFcstCol;  %3 is the differece between MountainFcst's current and next elements' index number
                cpt7(k) = R5Fcst(i,c(m)); k = k + 1; 
            end  
            StarFcstCol = StarFcstCol + 1;     %1 is the differece between StarFcst's current and next elements' index number
        end
end
bnet.CPD{56} = tabular_CPD(bnet, 56 ,'CPT',cpt7);
bnet.CPD{56} = mk_named_CPT({'234StarFcst','MountainFcst','R5Fcst'},names, dag, bnet.CPD{56});


% create a network with random parameters. 
bnet2 = mk_bnet(dag, node_sizes);
seed = 0;
rand('state', seed);
bnet2.CPD{1} = tabular_CPD(bnet2, 1);
bnet2.CPD{2} = tabular_CPD(bnet2, 2);
bnet2.CPD{3} = tabular_CPD(bnet2, 3);
bnet2.CPD{4} = tabular_CPD(bnet2, 4);
bnet2.CPD{5} = tabular_CPD(bnet2, 5);
bnet2.CPD{6} = tabular_CPD(bnet2, 6);
bnet2.CPD{7} = tabular_CPD(bnet2, 7);
bnet2.CPD{8} = tabular_CPD(bnet2, 8);
bnet2.CPD{9} = tabular_CPD(bnet2, 9);
bnet2.CPD{10} = tabular_CPD(bnet2, 10);
bnet2.CPD{11} = tabular_CPD(bnet2, 11);
bnet2.CPD{12} = tabular_CPD(bnet2, 12);
bnet2.CPD{13} = tabular_CPD(bnet2, 13);
bnet2.CPD{14} = tabular_CPD(bnet2, 14);
bnet2.CPD{15} = tabular_CPD(bnet2, 15);
bnet2.CPD{16} = tabular_CPD(bnet2, 16);
bnet2.CPD{17} = tabular_CPD(bnet2, 17);
bnet2.CPD{18} = tabular_CPD(bnet2, 18);
bnet2.CPD{19} = tabular_CPD(bnet2, 19);
bnet2.CPD{20} = tabular_CPD(bnet2, 20);
bnet2.CPD{21} = tabular_CPD(bnet2, 21);
bnet2.CPD{22} = tabular_CPD(bnet2, 22);
bnet2.CPD{23} = tabular_CPD(bnet2, 23);
bnet2.CPD{24} = tabular_CPD(bnet2, 24);
bnet2.CPD{25} = tabular_CPD(bnet2, 25);
bnet2.CPD{26} = tabular_CPD(bnet2, 26);
bnet2.CPD{27} = tabular_CPD(bnet2, 27);
bnet2.CPD{28} = tabular_CPD(bnet2, 28);
bnet2.CPD{29} = tabular_CPD(bnet2, 29);
bnet2.CPD{30} = tabular_CPD(bnet2, 30);
bnet2.CPD{31} = tabular_CPD(bnet2, 31);
bnet2.CPD{32} = tabular_CPD(bnet2, 32);
bnet2.CPD{33} = tabular_CPD(bnet2, 33);
bnet2.CPD{34} = tabular_CPD(bnet2, 34);
bnet2.CPD{35} = tabular_CPD(bnet2, 35);
bnet2.CPD{36} = tabular_CPD(bnet2, 36);
bnet2.CPD{37} = tabular_CPD(bnet2, 37);
bnet2.CPD{38} = tabular_CPD(bnet2, 38);
bnet2.CPD{39} = tabular_CPD(bnet2, 39);
bnet2.CPD{40} = tabular_CPD(bnet2, 40);
bnet2.CPD{41} = tabular_CPD(bnet2, 41);
bnet2.CPD{42} = tabular_CPD(bnet2, 42);
bnet2.CPD{43} = tabular_CPD(bnet2, 43);
bnet2.CPD{44} = tabular_CPD(bnet2, 44);
bnet2.CPD{45} = tabular_CPD(bnet2, 45);
bnet2.CPD{46} = tabular_CPD(bnet2, 46);
bnet2.CPD{47} = tabular_CPD(bnet2, 47);
bnet2.CPD{48} = tabular_CPD(bnet2, 48);
bnet2.CPD{49} = tabular_CPD(bnet2, 49);
bnet2.CPD{50} = tabular_CPD(bnet2, 50);
bnet2.CPD{51} = tabular_CPD(bnet2, 51);
bnet2.CPD{52} = tabular_CPD(bnet2, 52);
bnet2.CPD{53} = tabular_CPD(bnet2, 53);
bnet2.CPD{54} = tabular_CPD(bnet2, 54);
bnet2.CPD{55} = tabular_CPD(bnet2, 55);
bnet2.CPD{56} = tabular_CPD(bnet2, 56);

%creating training data using forward sampling (the above network is used as a source of data)
nsamples = 500;
samples = cell(N, nsamples);
for i=1:nsamples
  samples(:,i) = sample_bnet(bnet);
end

%randomly hide half the values
samples2 = samples;
hide = rand(N, nsamples) > 0.5;
[I,J]=find(hide);
for k=1:length(I)
  samples2{I(k), J(k)} = [];
end


engine2 = jtree_inf_engine(bnet);
max_iter = 10;

%Expectation maximazation algorithm
tic;[bnet4, LLtrace] = learn_params_em(engine2, samples2, max_iter);toc

%the log-likelihood at iteration i
plot(LLtrace, 'x-')

CPT3 = cell(1,N);
for i=1:N
  s=struct(bnet4.CPD{i});  % violate object privacy
  CPT3{i}=s.CPT;
end

%showing node 20's learnt parameters
dispcpt(CPT3{20})