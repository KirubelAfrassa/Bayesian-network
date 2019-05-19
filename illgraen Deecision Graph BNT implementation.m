% illgraen Deecision Graph
% Non-automated impelementation
% Sättele, Martina & Bründl, Michael & Straub, Daniel. (2015). Quantifying the effectiveness of early warning systems for natural hazards. Natural Hazards and Earth System Sciences Discussions.
% @Kirubel Afrassa, 2019

names = {'batterie1','batterie2','batterie3','geophone1','geophone3','logger1','modem1','redLight1','solarPanel1','solarPanel2','audibleSignal1','audibleSignal2','audibleSignal3','batterie4','callReceiver1','callReceiver2','callReceiver3','callReceiver4','callTransmitter','eventIndicated1','eventIndicated2','eventIndicated3','eventIndicated4','eventIndicated5','geophone2','hazardEvent','logger2','mobileNetwork','modem2','modem3','powerNetwork','radar1','radar2','redLight2','redLight3','signalGeophone1','signalGeophone2','signalGeophone3','signalRadar1','signalRadar2','solarPanel3','solarPanel4','warningg','warningIssued1','warningIssued2','warningReleased1','warningReleased2','warningReleased3','warningTransmitted'};
N = length(names);

dagc = {'batterie1', 'warningIssued2';
    'batterie2', 'warningReleased1';
    'batterie3', 'warningReleased2';
    'geophone1', 'eventIndicated1';
    'geophone3', 'eventIndicated3'
    'logger1', 'warningIssued1';
    'modem1', 'warningIssued1';
    'redLight1', 'warningReleased2';
    'solarPanel1', 'batterie1';
    'solarPanel2', 'batterie4'
    'audibleSignal1', 'warningReleased1';
    'audibleSignal2', 'warningReleased2';
    'audibleSignal3', 'warningReleased3';
    'batterie4', 'warningIssued1';
    'callReceiver1', 'warningReleased1';
    'callReceiver2', 'warningReleased3';
    'callReceiver3', 'warningReleased2';
    'callReceiver4', 'warningTransmitted';
    'callTransmitter', 'warningTransmitted';
    'eventIndicated1', 'warningIssued1';
    'eventIndicated2', 'warningIssued2';
    'eventIndicated3', 'warningIssued2';
    'eventIndicated4', 'warningIssued2';
    'eventIndicated5', 'warningIssued2';
    'geophone2', 'eventIndicated2';
    'hazardEvent', 'signalGeophone1';
    'hazardEvent', 'signalGeophone2';
    'hazardEvent', 'signalGeophone3';
    'hazardEvent', 'signalRadar1';
    'hazardEvent', 'signalRadar2';
    'logger2', 'warningIssued2';
    'mobileNetwork', 'warningTransmitted';
    'modem2', 'warningIssued2';%'warningTransmitted';
    'modem3', 'warningTransmitted';%'warningIssued2';
    'powerNetwork', 'warningReleased3';
    'powerNetwork', 'warningTransmitted';
    'radar1', 'eventIndicated4';
    'radar2', 'eventIndicated5';
    'redLight2', 'warningReleased1';
    'redLight3', 'warningReleased3';
    'signalGeophone1', 'eventIndicated1';
    'signalGeophone2', 'eventIndicated2';
    'signalGeophone3', 'eventIndicated3';
    'signalRadar1', 'eventIndicated4';
    'signalRadar2', 'eventIndicated5';
    'solarPanel3', 'batterie2';
    'solarPanel4', 'batterie3';
    %'warning', 
    'warningIssued1', 'warningTransmitted';
    'warningIssued2', 'warningTransmitted';
    'warningReleased1', 'warningg';
    'warningReleased2', 'warningg';
    'warningReleased3', 'warningg';
    'warningTransmitted','warningReleased1';
    'warningTransmitted','warningReleased2';
    'warningTransmitted','warningReleased3';
    };

%adjecency matrix
[dag, names] = mk_adj_mat(dagc, names, 1)

node_sizes =  [2 2 2 2 2 2 2 2 2 2 2 2 2 2 10 2 10 2 10 10 10 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2];
bnet = mk_bnet(dag, node_sizes, 'names', names, 'discrete', 1:N);

G = bnet.dag;
draw_graph(G);
bnet.CPD = cell(1,49);

bnet.CPD{35} = tabular_CPD(bnet, 35 ,'CPT',[0.999276027 0.99 0.000723973 0.01000000000000001]);
bnet.CPD{4} = tabular_CPD(bnet, 4 ,'CPT',[0.999276027 0.99 0.000723973 0.01000000000000001]);
bnet.CPD{2} = tabular_CPD(bnet, 2 ,'CPT',[0.999276027 0.99 0.000723973 0.01000000000000001]);
bnet.CPD{42} = tabular_CPD(bnet, 42 ,'CPT',[0.999522603 0.000477397]);
bnet.CPD{39} = tabular_CPD(bnet, 39 ,'CPT',[0.999522603 0.000477397]);
bnet.CPD{38} = tabular_CPD(bnet, 38 ,'CPT',[0.999534779 0.000465221]);
bnet.CPD{37} = tabular_CPD(bnet, 37 ,'CPT',[0.999528082 0.000471918]);
bnet.CPD{36} = tabular_CPD(bnet, 36 ,'CPT',[0.999413014 0.000586986]);
bnet.CPD{34} = tabular_CPD(bnet, 34 ,'CPT',[0.999495205 0.000504795]);
bnet.CPD{32} = tabular_CPD(bnet, 32 ,'CPT',[0.999495205 0.000504795]);
bnet.CPD{31} = tabular_CPD(bnet, 31 ,'CPT',[0.999413014 0.000586986]);
bnet.CPD{30} = tabular_CPD(bnet, 30 ,'CPT',[0.999413014 0.000586986]);
bnet.CPD{29} = tabular_CPD(bnet, 29 ,'CPT',[0.999413014 0.000586986]);
bnet.CPD{33} = tabular_CPD(bnet, 33 ,'CPT',[0.999276027 0.99 0.000723973 0.01000000000000001]);
bnet.CPD{28} = tabular_CPD(bnet, 28 ,'CPT',[0.999489117 0.000510883]);
bnet.CPD{27} = tabular_CPD(bnet, 27 ,'CPT',[0.999495205 0.000504795]);
bnet.CPD{26} = tabular_CPD(bnet, 26 ,'CPT',[0.999495205 0.000504795]);
bnet.CPD{25} = tabular_CPD(bnet, 25 ,'CPT',[0.999495205 0.000504795]);
bnet.CPD{24} = tabular_CPD(bnet, 24 ,'CPT',[0.999495205 0.000504795]);

eventIndicated1 = [0	1	1	1	1	1	1	1	1	1	0	0	0	0	0	0	0	0	0	0;
1	0	0	0	0	0	0	0	0	0	1	1	1	1	1	1	1	1	1	1;];

k = 1; 
[rows columns] = size(eventIndicated1);

geophone1 = 2;
signalGeophone1 = 10;
cpt = zeros(1,40);
for i=1:rows
        signalGeophone1Col = 0;
        for l=1:signalGeophone1
            for m = 1:geophone1  
                c(m) = (((m-1)*10)+1)+signalGeophone1Col;  %10 is the differece between geophone1's current and next elements' index number
                cpt(k) = eventIndicated1(i,c(m)); k = k + 1; 
            end  
            signalGeophone1Col = signalGeophone1Col + 1;     %1 is the differece between PlainsFcst's current and next elements' index number
        end
end

%eventIndicated1-5 have the samp cpt as their cpd
bnet.CPD{43} = tabular_CPD(bnet, 43 ,'CPT',cpt);
bnet.CPD{43} = mk_named_CPT({'geophone1','signalGeophone1','eventIndicated1'},names, dag, bnet.CPD{43});

bnet.CPD{23} = tabular_CPD(bnet, 23 ,'CPT',cpt);
bnet.CPD{23} = mk_named_CPT({'geophone2','signalGeophone2','eventIndicated2'},names, dag, bnet.CPD{23});

bnet.CPD{40} = tabular_CPD(bnet, 40 ,'CPT',cpt);
bnet.CPD{40} = mk_named_CPT({'geophone3','signalGeophone3','eventIndicated3'},names, dag, bnet.CPD{40});

bnet.CPD{18} = tabular_CPD(bnet, 18 ,'CPT',cpt);
bnet.CPD{18} = mk_named_CPT({'radar1','signalRadar1','eventIndicated4'},names, dag, bnet.CPD{18});

bnet.CPD{16} = tabular_CPD(bnet, 16 ,'CPT',cpt);
bnet.CPD{16} = mk_named_CPT({'radar2','signalRadar2','eventIndicated5'},names, dag, bnet.CPD{16});

bnet.CPD{22} = tabular_CPD(bnet, 22 ,'CPT',[0.999522603 0.000477397]);
bnet.CPD{14} = tabular_CPD(bnet, 14 ,'CPT',[0.95 0.05]);
bnet.CPD{13} = tabular_CPD(bnet, 13 ,'CPT',[0.999534779 0.000465221]);
bnet.CPD{12} = tabular_CPD(bnet, 12 ,'CPT',[0.999972 0.000028]);
bnet.CPD{11} = tabular_CPD(bnet, 11 ,'CPT',[0.999528082 0.000471918]);
bnet.CPD{10} = tabular_CPD(bnet, 10 ,'CPT',[0.999528082 0.000471918]);
bnet.CPD{9} = tabular_CPD(bnet, 9 ,'CPT',[0.9998899999999999 0.00011]);
bnet.CPD{8} = tabular_CPD(bnet, 8 ,'CPT',[0.999504338 0.000495662]);
bnet.CPD{7} = tabular_CPD(bnet, 7 ,'CPT',[0.999504338 0.000495662]);
bnet.CPD{6} = tabular_CPD(bnet, 6 ,'CPT',[0.999413014 0.000586986]);
bnet.CPD{5} = tabular_CPD(bnet, 5 ,'CPT',[0.999413014 0.000586986]);

bnet.CPD{21} = tabular_CPD(bnet, 21 ,'CPT',[0.9855	0.0002 0.0143	0.0076 0.0002	0.0186 0	0.0463 0	0.0474 0	0.0447 0	0.0413 0	0.3505 0	0.2252 0	0.2182000000000001]);
bnet.CPD{20} = tabular_CPD(bnet, 20 ,'CPT',[0.8332000000000001	0.0767 0.0512	0.1071 0.0295	0.0663 0.0305	0.0772 0.0163	0.0492 0.0102	0.0362 0.0069	0.0286 0.0208	0.1789 0.00129999999999996	0.1075 0.0001	0.2723]);
bnet.CPD{19} = tabular_CPD(bnet, 19 ,'CPT',[0.7252999999999999	0 0.07190000000000001	0.0001 0.0405	0.0005 0.0433	0.002 0.025	0.0029 0.0168	0.0035 0.0123	0.004 0.0519	0.0722 0.0109	0.125 0.0021	0.7897999999999999]);
bnet.CPD{17} = tabular_CPD(bnet, 17 ,'CPT',[0.8592	0 0.0553	0.0011 0.0453	0.0134 0.0184	0.0319 0.008999999999999999	0.0463 0.0049	0.0546 0.0068	0.2772 0.0011	0.4543 0	0.0853 0	0.03590000000000003]);
bnet.CPD{15} = tabular_CPD(bnet, 15 ,'CPT',[0.8194	0.1959 0.0507	0.1158 0.0489	0.1382 0.0248	0.0851 0.015	0.0596 0.009900000000000001	0.0448 0.0207	0.1255 0.009900000000000001	0.1385 0.0005999999999999999	0.0384 0.0001	0.0582]);

bnet.CPD{3} = tabular_CPD(bnet, 3 ,'CPT',[0.999495205 0.000504795]);
bnet.CPD{1} = tabular_CPD(bnet, 1 ,'CPT',[0.999495205 0.000504795]);

warning = [1	0.67	0.67	0.33	0.67	0.33	0.33	0;
0	0.33	0.33	0.6699999999999999	0.33	0.6699999999999999	0.6699999999999999	1;];

k = 1; 
[rows columns] = size(warning);

warningReleased1 = 2; %num of attributes
warningReleased2 = 2;  %num of attributes
warningReleased3 = 2;  %num of attributes
cpt1 = zeros(1,16);
for i=1:rows
    warningReleased3Col = 0;
    for j=1:warningReleased3
        warningReleased2Col = 0;
        for l=1:warningReleased2
            for m = 1:warningReleased1  
                c(m) = (((m-1)*4)+1)+warningReleased2Col+warningReleased3Col;  %4 is the differece between warningReleased1's current and next elements' index number
                cpt1(k) = warning(i,c(m)); k = k + 1; 
            end  
            warningReleased2Col = warningReleased2Col + 2;     %3 is the differece between warningReleased2's current and next elements' index number
        end
        warningReleased3Col = warningReleased3Col + 1;   %1 is the differece between warningReleased3's current and next elements' index number
    end
end

bnet.CPD{49} = tabular_CPD(bnet, 49 ,'CPT',cpt1);
bnet.CPD{49} = mk_named_CPT({'warningReleased1','warningReleased2','warningReleased3','warningg'},names, dag, bnet.CPD{49});


warningIssued1 = [1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0;
0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1;];


k = 1; 
[rows columns] = size(warningIssued1);
eventIndicated1 = 2; %num of attributes
logger1 = 2;  %num of attributes
modem1 = 2;  %num of attributes
batterie4 = 2; %num of attributes
cpt2 = zeros(1,32);
for i=1:rows
    batterie4Col = 0;
    for s=1:batterie4
       modem1Col = 0;
       for j=1:modem1
         logger1Col = 0;
         for l=1:logger1
              for m = 1:eventIndicated1  
                c(m) = (((m-1)*8)+1)+logger1Col+modem1Col+batterie4Col;  %8(2*2*2) is the differece between eventIndicated1's current and next elements' index number
                cpt2(k) = warningIssued1(i,c(m)); k = k + 1; 
              end  
              logger1Col = logger1Col + 4;     %4 is the differece between logger1's current and next elements' index number
         end
         modem1Col = modem1Col + 2;   %4 is the differece between modem1's current and next elements' index number
       end
       batterie4Col = batterie4Col + 1;  %2 is the differece between batterie4's current and next elements' index number
    end
end

bnet.CPD{44} = tabular_CPD(bnet, 44 ,'CPT',cpt2);
bnet.CPD{44} = mk_named_CPT({'eventIndicated1','logger1','modem1','batterie4','warningIssued1'},names, dag, bnet.CPD{44});

warningIssued2 = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0;
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1;];

k = 1; 
[rows columns] = size(warningIssued2);
logger2 = 2; %num of attributes
batterie1 = 2;  %num of attributes
modem2 = 2;  %num of attributes
eventIndicated2 = 2; %num of attributes
eventIndicated3 = 2;
eventIndicated4 = 2;
eventIndicated5 = 2;
cpt3 = zeros(1,256);
for i=1:rows
    eventIndicated5Col = 0;
    for s=1:eventIndicated5
       eventIndicated4Col = 0;
       for j=1:eventIndicated4
         eventIndicated3Col = 0;
         for l=1:eventIndicated3
             eventIndicated2Col = 0;
             for x = 1: eventIndicated2
                 modem2Col = 0;     
                 for y = 1:modem2
                          batterie1Col = 0;  
                          for z = 1:batterie1
                             for m = 1:logger2  
                                 c(m) = (((m-1)*64)+1)+batterie1Col+modem2Col+eventIndicated2Col+eventIndicated3Col+eventIndicated4Col+eventIndicated5Col;  %64(2^6) is the differece between eventIndicated1's current and next elements' index number
                                 cpt3(k) = warningIssued2(i,c(m)); k = k + 1; 
                             end  
                             batterie1Col = batterie1Col + 32;     %32 is the differece between logger1's current and next elements' index number
                          end
                          modem2Col = modem2Col + 16;   %16 is the differece between modem1's current and next elements' index number
                 end
                 eventIndicated2Col = eventIndicated2Col + 8;  %8 is the differece between batterie4's current and next elements' index number
             end
          eventIndicated3Col = eventIndicated3Col + 4;
         end
         eventIndicated4Col = eventIndicated4Col + 2;
       end
       eventIndicated5Col = eventIndicated5Col + 1;
    end
end

bnet.CPD{41} = tabular_CPD(bnet, 41 ,'CPT',cpt3);
bnet.CPD{41} = mk_named_CPT({'logger2','batterie1','modem2','eventIndicated2','eventIndicated3','eventIndicated4','eventIndicated5','warningIssued2'},names, dag, bnet.CPD{41});

warningReleased1 = [1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0;
0	0	0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1;];


k = 1; 
[rows columns] = size(warningReleased1);
warningTransmitted = 2; %num of attributes
batterie2 = 2;  %num of attributes
callReceiver2 = 2;  %num of attributes
redLight2 = 2; %num of attributes
audibleSignal1 = 2;
cpt = zeros(1,64);
for i=1:rows
    audibleSignal1Col = 0;
    for t=1:audibleSignal1   
        redLight2Col = 0;
        for s=1:redLight2
          callReceiver2Col = 0;
          for j=1:callReceiver2
             batterie2Col = 0;
             for l=1:batterie2
                 for m = 1:warningTransmitted 
                     c(m) = (((m-1)*16)+1)+batterie2Col+callReceiver2Col+redLight2Col+audibleSignal1Col;  %16(2^4) is the differece between warningTransmitted's current and next elements' index number
                     cpt4(k) = warningReleased1(i,c(m)); k = k + 1; 
                 end  
                 batterie2Col = batterie2Col + 8;     %8 is the differece between batterie2's current and next elements' index number
             end
             callReceiver2Col = callReceiver2Col + 4;   %4 is the differece between callReceiver2's current and next elements' index number
          end
          redLight2Col = redLight2Col + 2;  %2 is the differece between redLight2's current and next elements' index number
        end
        audibleSignal1Col = audibleSignal1Col + 1; %1 is the differece between audibleSignal1's current and next elements' index number
    end
end

bnet.CPD{48} = tabular_CPD(bnet, 48 ,'CPT',cpt4);
bnet.CPD{48} = mk_named_CPT({'warningTransmitted','batterie2','callReceiver1','redLight2','audibleSignal1','warningReleased1'},names, dag, bnet.CPD{48});


%warningRelease2 has similar cpt as warningRelease1 therefore, using the
%same cpt array for its cpd
bnet.CPD{47} = tabular_CPD(bnet, 47 ,'CPT',cpt4);
bnet.CPD{47} = mk_named_CPT({'warningTransmitted','batterie3','callReceiver3','redLight1','audibleSignal2','warningReleased2'},names, dag, bnet.CPD{47});


warningReleased3 = [1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0;
0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1;];

k = 1; 
[rows columns] = size(warningReleased3);
warningTransmitted = 2; %num of attributes
callReceiver4 = 2;  %num of attributes
redLight3 = 2; %num of attributes
audibleSignal3 = 2;
powerNetwork = 2;
cpt5 = zeros(1,64);
for i=1:rows
  powerNetworkCol = 0;  
  for u=1:powerNetwork  
    audibleSignal3Col = 0;
    for t=1:audibleSignal3   
        redLight3Col = 0;
        for s=1:redLight3
          callReceiver4Col = 0;
          for j=1:callReceiver4
                 for m = 1:warningTransmitted 
                     c(m) = (((m-1)*16)+1)+callReceiver4Col+redLight3Col+audibleSignal3Col+powerNetworkCol;  %16(2^4) is the differece between warningTransmitted's current and next elements' index number
                     cpt5(k) = warningReleased3(i,c(m)); k = k + 1; 
                 end
                 callReceiver4Col = callReceiver4Col + 8;    %8 is the differece between callReceiver4's current and next elements' index number
           end
           redLight3Col = redLight3Col + 4;     %4 is the differece between redLight3's current and next elements' index number
        end
        audibleSignal3Col = audibleSignal3Col + 2;    %2 is the differece between audibleSignal3's current and next elements' index number
    end
    powerNetworkCol = powerNetworkCol + 1;     %1 is the differece between powerNetwork's current and next elements' index number
  end
end

bnet.CPD{46} = tabular_CPD(bnet, 46 ,'CPT',cpt5);
bnet.CPD{46} = mk_named_CPT({'warningTransmitted','callReceiver2','redLight3','audibleSignal3','powerNetwork','warningReleased3'},names, dag, bnet.CPD{46});


warningTransmitted = [1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0;
0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1;];

k = 1; 
[rows columns] = size(warningTransmitted);
warningIssued1 = 2; %num of attributes
warningIssued2 = 2;  %num of attributes
modem3 = 2;  %num of attributes
callReceiver1 = 2; %num of attributes
callTransmitter = 2;
powerNetwork = 2;
mobileNetwork = 2;
cpt6 = zeros(1,256);
for i=1:rows
    mobileNetworkCol = 0;
    for s=1:mobileNetwork
       powerNetworkCol = 0;
       for j=1:powerNetwork
         callTransmitterCol = 0;
         for l=1:callTransmitter
             callReceiver1Col = 0;
             for x = 1: callReceiver1
                 modem3Col = 0;     
                 for y = 1:modem3
                          warningIssued2Col = 0;  
                          for z = 1:warningIssued2
                             for m = 1:warningIssued1  
                                 c(m) = (((m-1)*64)+1)+warningIssued2Col+modem3Col+callReceiver1Col+callTransmitterCol+powerNetworkCol+mobileNetworkCol;  %64(2^6) is the differece between eventIndicated1's current and next elements' index number
                                 cpt6(k) = warningTransmitted(i,c(m)); k = k + 1; 
                             end  
                             warningIssued2Col = warningIssued2Col + 32;     %32 is the differece between logger1's current and next elements' index number
                          end
                          modem3Col = modem3Col + 16;   %16 is the differece between modem1's current and next elements' index number
                 end
                 callReceiver1Col = callReceiver1Col + 8;  %8 is the differece between batterie4's current and next elements' index number
             end
          callTransmitterCol = callTransmitterCol + 4;
         end
         powerNetworkCol = powerNetworkCol + 2;
       end
       mobileNetworkCol = mobileNetworkCol + 1;
    end
end

bnet.CPD{45} = tabular_CPD(bnet, 45 ,'CPT',cpt6);
bnet.CPD{45} = mk_named_CPT({'warningIssued1','warningIssued2','modem3','callReceiver4','callTransmitter','powerNetwork','mobileNetwork','warningTransmitted'},names, dag, bnet.CPD{45});



% engine{1} = enumerative_inf_engine(bnet);
engine{2} = var_elim_inf_engine(bnet);
engine{3} = jtree_inf_engine(bnet);
engine{4} = pearl_inf_engine(bnet, 'max_iter', 25); %default max_iter 2*N, default protocol- 'parallel' which suites loopy graphs
engine{5} = likelihood_weighting_inf_engine(bnet, 'nsamples', 1000);
engine{6} = gibbs_sampling_inf_engine(bnet, 'T', 1000); %default number of samples is 1000

evidence = cell(1,N);

evidence{4} = 2; %BATTERIE2
evidence{13} = 2;%logger2
evidence{14} = 2;%HAZARD

%p(Warning = yes | logger2 = 2, hazard = 2, batterie2 = 2)
tic;[engine{3}, loglike3] = enter_evidence(engine{3}, evidence); toc
jtree = marginal_nodes(engine{3}, 49);

total = 0;
for i=1:5
    tic;[engine{5}, loglike3] = enter_evidence(engine{5}, evidence); toc
    likelihood = marginal_nodes(engine{5}, 49);
    total = total + likelihood.T;
end
    averageTocLikelihood = total/5

total = 0;   
for i=1:5
    tic;[engine{6}, loglike3] = enter_evidence(engine{6}, evidence); toc
    gibbs = marginal_nodes(engine{6}, 49);
    total = total + gibbs.T;
end
    averageTocGibbs = total/5
% var_eli = var_eli.T
jtree = jtree.T
% pearl = pearl.T
likelihood = likelihood.T 
gibbs = gibbs.T 
