% data16m.m (16 Machine System Data)
% This is a 16-machine system with 86 transmission lines and
% 68 buses. Data are extracted from the GE final report
% entitled "Singular Perturbations, Coherency and
% Aggregation of Dynamic Systems," pp.6-42, July 1981.
% detailed generator models
% dc exciters on generators 1 to 9
% constant current active loads

% Bus data format
% bus: 
% col1 number
% col2 voltage magnitude(pu)
% col3 voltage angle(degree)
% col4 p_gen(pu)
% col5 q_gen(pu),
% col6 p_load(pu)
% col7 q_load(pu)
% col8 G shunt(pu)
% col9 B shunt(pu)
% col10 bus_type
%       bus_type - 1, swing bus
%                - 2, generator bus (PV bus)
%                - 3, load bus (PQ bus)
% col11 q_gen_max(pu)
% col12 q_gen_min(pu)


bus = [...
    1.0000    1.0450         0    2.5044    1.1550         0         0         0         0    1.0000         0         0
    2.0000    0.9800    3.5503    5.4500    1.8429         0         0         0         0    2.0000  999.0000 -999.0000
    3.0000    0.9830    5.5803    6.5000    1.9876         0         0         0         0    2.0000  999.0000 -999.0000
    4.0000    0.9970    6.6336    6.3200    1.0709         0         0         0         0    2.0000  999.0000 -999.0000
    5.0000    1.0110    5.1551    5.0520    1.6234         0         0         0         0    2.0000  999.0000 -999.0000
    6.0000    1.0500    9.4769    7.0000    2.1975         0         0         0         0    2.0000  999.0000 -999.0000
    7.0000    1.0630   11.7056    5.6000    0.9851         0         0         0         0    2.0000  999.0000 -999.0000
    8.0000    1.0300    5.5959    5.4000    0.0031         0         0         0         0    2.0000  999.0000 -999.0000
    9.0000    1.0250    9.9302    8.0000    0.0492         0         0         0         0    2.0000  999.0000 -999.0000
   10.0000    1.0100    5.0408    5.0000    0.0606         0         0         0         0    2.0000  999.0000 -999.0000
   11.0000    1.0000    7.4828   10.0000   -0.1726         0         0         0         0    2.0000  999.0000 -999.0000
   12.0000    1.0156   -6.0042   13.5000    2.4920         0         0         0         0    2.0000  999.0000 -999.0000
   13.0000    1.0110  -10.8676   35.9100    8.7547         0         0         0         0    2.0000  999.0000 -999.0000
   14.0000    1.0000   35.1608   17.8500    0.6217         0         0         0         0    2.0000  999.0000 -999.0000
   15.0000    1.0000   28.9208   10.0000    0.6719         0         0         0         0    2.0000  999.0000 -999.0000
   16.0000    1.0000   34.6654   40.0000    4.6005         0         0         0         0    2.0000  999.0000 -999.0000
   17.0000    1.0591   -4.2475         0         0    2.5270    1.1856         0         0    3.0000         0         0
   18.0000    1.0516   -2.4233         0         0   -0.0000    0.0000         0         0    3.0000         0         0
   19.0000    1.0327   -5.4265         0         0    3.2200    0.0200         0         0    3.0000         0         0
   20.0000    1.0059   -6.5455         0         0    5.0000    1.8400         0         0    3.0000         0         0
   21.0000    1.0072   -5.6066         0         0   -0.0000    0.0000         0         0    3.0000         0         0
   22.0000    1.0093   -4.9253         0         0   -0.0000    0.0000         0         0    3.0000         0         0
   23.0000    0.9995   -7.1964         0         0    2.3400    0.8400         0         0    3.0000         0         0
   24.0000    0.9990   -7.7388         0         0    5.2200    1.7700         0         0    3.0000         0         0
   25.0000    1.0391   -8.2850         0         0    1.0400    1.2500         0         0    3.0000         0         0
   26.0000    1.0184   -2.4066         0         0   -0.0000    0.0000         0         0    3.0000         0         0
   27.0000    1.0141   -3.2638         0         0   -0.0000    0.0000         0         0    3.0000         0         0
   28.0000    1.0553   -3.2401         0         0    0.0900    0.8800         0         0    3.0000         0         0
   29.0000    1.0157   -3.0745         0         0    0.0000    0.0000         0         0    3.0000         0         0
   30.0000    1.0134   -4.6215         0         0   -0.0000    0.0000         0         0    3.0000         0         0
   31.0000    1.0171   -4.7167         0         0    3.2000    1.5300         0         0    3.0000         0         0
   32.0000    1.0334   -3.1799         0         0    3.2900    0.3200         0         0    3.0000         0         0
   33.0000    1.0365   -4.2733         0         0    0.0000    0.0000         0         0    3.0000         0         0
   34.0000    1.0338   -5.1386         0         0    1.5800    0.3000         0         0    3.0000         0         0
   35.0000    1.0501    1.4150         0         0   -0.0000    0.0000         0         0    3.0000         0         0
   36.0000    0.9904   -0.0177         0         0    6.8000    1.0300         0         0    3.0000         0         0
   37.0000    1.0325   -0.5451         0         0    2.7400    1.1500         0         0    3.0000         0         0
   38.0000    1.0501    4.1377         0         0   -0.0000    0.0000         0         0    3.0000         0         0
   39.0000    1.0450    3.8497         0         0    2.4800    0.8500         0         0    3.0000         0         0
   40.0000    1.0386   -3.0067         0         0    3.0900   -0.9200         0         0    3.0000         0         0
   41.0000    1.0598   -1.1596         0         0    2.2400    0.4700         0         0    3.0000         0         0
   42.0000    1.0561   -2.6593         0         0    1.3900    0.1700         0         0    3.0000         0         0
   43.0000    1.0434   -4.5442         0         0    2.8100    0.7600         0         0    3.0000         0         0
   44.0000    1.0520    0.4748         0         0    2.0600    0.2800         0         0    3.0000         0         0
   45.0000    1.0509    3.1120         0         0    2.8400    0.2700         0         0    3.0000         0         0
   46.0000    1.0536   -4.7947         0         0    0.0000    0.0000         0         0    3.0000         0         0
   47.0000    1.0573   -2.2328         0         0    0.0000    0.0000         0         0    3.0000         0         0
   48.0000    1.0511    0.0923         0         0    0.0000    0.0000         0         0    3.0000         0         0
   49.0000    1.0562   -3.3917         0         0    1.1200    0.0000         0         0    3.0000         0         0
   50.0000    1.0652   -8.3281         0         0   -0.0000    0.0000         0         0    3.0000         0         0
   51.0000    1.0139   -8.3324         0         0   -0.0000   -0.0000         0         0    3.0000         0         0
   52.0000    1.0423  -11.7133         0         0    1.0200   -0.1946         0         0    3.0000         0         0
   53.0000    1.0290  -17.6715         0         0   60.0000    3.0000         0         0    3.0000         0         0
   54.0000    1.0558   -2.1864         0         0   -0.0000    0.0000         0         0    3.0000         0         0
   55.0000    1.0056  -19.3084         0         0    2.6700    0.1260         0         0    3.0000         0         0
   56.0000    1.0677    4.3536         0         0    0.6563    0.2353         0         0    3.0000         0         0
   57.0000    0.9994   33.6257         0         0   10.0000    2.5000         0         0    3.0000         0         0
   58.0000    0.9991   28.0606         0         0   11.5000    2.5000         0         0    3.0000         0         0
   59.0000    1.0147  -18.4729         0         0    0.0000   -0.0000         0         0    3.0000         0         0
   60.0000    1.0140  -18.5030         0         0    2.6755    0.0484         0         0    3.0000         0         0
   61.0000    1.0178   -8.3403         0         0    2.0800    0.2100         0         0    3.0000         0         0
   62.0000    1.0324   -1.2174         0         0    1.5070    0.2850         0         0    3.0000         0         0
   63.0000    1.0738   -3.4999         0         0    2.0312    0.3259         0         0    3.0000         0         0
   64.0000    1.0765   -1.5836         0         0    2.4120    0.0220         0         0    3.0000         0         0
   65.0000    1.0117    2.0177         0         0    1.6400    0.2900         0         0    3.0000         0         0
   66.0000    1.0119    8.4665         0         0    1.0000   -1.4700         0         0    3.0000         0         0
   67.0000    1.0221   -4.3426         0         0    3.3700   -1.2200         0         0    3.0000         0         0
   68.0000    0.9935   27.7278         0         0   24.7000    1.2300         0         0    3.0000         0         0
   ];

% Line data format
% line: from bus, to bus, resistance(pu), reactance(pu),
%       line charging(pu), tap ratio, phase shift(deg)

line = [...
   17.0000   18.0000    0.0035    0.0411    0.6987         0         0
   17.0000   46.0000    0.0008    0.0074    0.4800         0         0
   18.0000   19.0000    0.0013    0.0151    0.2572         0         0
   18.0000   41.0000    0.0070    0.0086    0.1460         0         0
   18.0000    1.0000         0    0.0181         0    1.0250         0
   19.0000   20.0000    0.0013    0.0213    0.2214         0         0
   19.0000   34.0000    0.0011    0.0133    0.2138         0         0
   20.0000   21.0000    0.0008    0.0128    0.1342         0         0
   20.0000   30.0000    0.0008    0.0129    0.1382         0         0
   21.0000   22.0000    0.0002    0.0026    0.0434         0         0
   21.0000   24.0000    0.0008    0.0112    0.1476         0         0
   22.0000   23.0000    0.0006    0.0092    0.1130         0         0
   22.0000   27.0000    0.0007    0.0082    0.1389         0         0
   22.0000    2.0000         0    0.0250         0    1.0700         0
   23.0000   24.0000    0.0004    0.0046    0.0780         0         0
   24.0000   25.0000    0.0023    0.0363    0.3804         0         0
   25.0000   46.0000    0.0019    0.0183    0.2900         0         0
   26.0000   27.0000    0.0004    0.0043    0.0729         0         0
   26.0000   29.0000    0.0004    0.0043    0.0729         0         0
   26.0000    3.0000         0    0.0200         0    1.0700         0
   28.0000   27.0000    0.0016    0.0435         0    1.0600         0
   28.0000   29.0000    0.0016    0.0435         0    1.0600         0
   29.0000   30.0000    0.0009    0.0101    0.1723         0         0
   30.0000   31.0000    0.0018    0.0217    0.3660         0         0
   31.0000   32.0000    0.0009    0.0094    0.1710         0         0
   32.0000   33.0000    0.0007    0.0089    0.1342         0         0
   32.0000   35.0000    0.0016    0.0195    0.3040         0         0
   32.0000   37.0000    0.0008    0.0135    0.2548         0         0
   32.0000   40.0000    0.0003    0.0059    0.0680         0         0
   33.0000   34.0000    0.0007    0.0082    0.1319         0         0
   33.0000   43.0000    0.0013    0.0173    0.3216         0         0
   35.0000   36.0000    0.0007    0.0138         0    1.0600         0
   35.0000    4.0000    0.0007    0.0142         0    1.0700         0
   36.0000    5.0000    0.0009    0.0180         0    1.0090         0
   37.0000   38.0000    0.0008    0.0140    0.2565         0         0
   38.0000   39.0000    0.0006    0.0096    0.1846         0         0
   38.0000    6.0000         0    0.0143         0    1.0250         0
   39.0000   40.0000    0.0022    0.0350    0.3610         0         0
   39.0000    7.0000    0.0005    0.0272         0         0         0
   41.0000   42.0000    0.0032    0.0323    0.5310         0         0
   41.0000    8.0000    0.0006    0.0232         0    1.0250         0
   42.0000   43.0000    0.0014    0.0147    0.2396         0         0
   42.0000   44.0000    0.0043    0.0474    0.7802         0         0
   42.0000   45.0000    0.0057    0.0625    1.0290         0         0
   44.0000   45.0000    0.0014    0.0151    0.2490         0         0
   45.0000    9.0000    0.0008    0.0156         0    1.0250         0
   25.0000   46.0000    0.0019    0.0183    0.2900         0         0
   25.0000   52.0000    0.0022    0.0196    0.3400         0         0
   25.0000   52.0000    0.0022    0.0196    0.3400         0         0
   52.0000   53.0000    0.0005    0.0045    0.3200         0         0
   50.0000   52.0000    0.0033    0.0111    1.4500         0         0
   51.0000   50.0000    0.0001    0.0074         0    0.9460         0
   49.0000   50.0000    0.0011    0.0157    0.2020         0         0
   48.0000   49.0000    0.0008    0.0099    0.1680         0         0
   46.0000   47.0000    0.0013    0.0187    0.3330         0         0
   46.0000   48.0000    0.0024    0.0288    0.4880         0         0
   17.0000   47.0000    0.0016    0.0163    0.2500         0         0
   47.0000   54.0000    0.0011    0.0147    0.2470         0         0
   49.0000   54.0000    0.0036    0.0444    0.6930         0         0
   54.0000   62.0000    0.0022    0.0284    0.4300         0         0
   62.0000   65.0000    0.0018    0.0274    0.2700         0         0
   17.0000   63.0000    0.0013    0.0188    1.3100         0         0
   63.0000   64.0000    0.0025    0.0268    0.4000         0         0
   63.0000   64.0000    0.0025    0.0268    0.4000         0         0
   64.0000   56.0000    0.0020    0.0220    1.2800         0         0
   51.0000   61.0000    0.0007    0.0175    1.3900         0         0
   53.0000   59.0000    0.0005    0.0276         0         0         0
   59.0000   60.0000    0.0001    0.0011         0         0         0
   60.0000   61.0000    0.0025    0.0730         0         0         0
   55.0000   60.0000         0    0.0411         0         0         0
   55.0000   61.0000         0    0.0839         0         0         0
   61.0000   67.0000    0.0004    0.0105    0.7200         0         0
   66.0000   68.0000    0.0012    0.0288    2.0600         0         0
   66.0000   67.0000    0.0009    0.0221    1.6200         0         0
   65.0000   68.0000    0.0076    0.1141    1.1600         0         0
   68.0000   58.0000    0.0040    0.0600    2.2500         0         0
   58.0000   57.0000    0.0040    0.0600    2.2500         0         0
   57.0000   56.0000    0.0060    0.0840    3.1500         0         0
   47.0000   10.0000         0    0.0260         0    1.0400         0
   48.0000   11.0000         0    0.0130         0    1.0400         0
   52.0000   12.0000         0    0.0075         0    1.0400         0
   53.0000   13.0000         0    0.0033         0    1.0400         0
   57.0000   14.0000         0    0.0015         0    1.0000         0
   58.0000   15.0000         0    0.0015         0    1.0000         0
   68.0000   16.0000         0    0.0030         0    1.0000         0
   17.0000   43.0000    0.0320    0.3200    0.4100    1.0000         0
   ];

% Machine data format
%       1. machine number,
%       2. bus number,
%       3. base mva,
%       4. leakage reactance x_l(pu),
%       5. resistance r_a(pu),
%       6. d-axis sychronous reactance x_d(pu),
%       7. d-axis transient reactance x'_d(pu),
%       8. d-axis subtransient reactance x"_d(pu),
%       9. d-axis open-circuit time constant T'_do(sec),
%      10. d-axis open-circuit subtransient time constant
%                T"_do(sec),
%      11. q-axis sychronous reactance x_q(pu),
%      12. q-axis transient reactance x'_q(pu),
%      13. q-axis subtransient reactance x"_q(pu),
%      14. q-axis open-circuit time constant T'_qo(sec),
%      15. q-axis open circuit subtransient time constant
%                T"_qo(sec),
%      16. inertia constant H(sec),
%      17. damping coefficient d_o(pu),
%      18. dampling coefficient d_1(pu),
%      19. bus number
%

 mac_con = [...
1	1	100	0	0	0.1	    0.031	0	10.2	0	0.069	0.028	0	1.5 	0	42  	35	0	1	0	0
2	2	100	0	0	0.295	0.0697	0	6.56	0	0.282	0.06	0	1.5 	0	30.2	35	0	2	0	0
3	3	100	0	0	0.2495	0.0531	0	5.7	    0	0.237   0.05	0	1.5 	0	35.8	35	0	3	0	0
4	4	100	0	0	0.262	0.0436	0	5.69	0	0.258	0.04	0	1.5 	0	28.6	35	0	4	0	0
5	5	100	0	0	0.33	0.066	0	5.4	    0	0.31	0.06	0	0.44	0	26  	35	0	5	0	0
6	6	100	0	0	0.254	0.05	0	7.3	    0	0.241	0.045	0	0.4 	0	34.8	35	0	6	0	0
7	7	100	0	0	0.295	0.049	0	5.66	0	0.292	0.045	0	1.5 	0	26.4	35	0	7	0	0
8	8	100	0	0	0.29	0.057	0	6.7	    0	0.28	0.05	0	0.41	0	24.3	35	0	8	0	0
9	9	100	0	0	0.2106	0.057	0	4.79	0	0.205	0.05	0	1.96	0	34.5	120	0	9	0	0
10	10	100	0	0	0.169	0.0457	0	9.37	0	0.115	0.045	0	1.5 	0	31  	35	0	10	0	0
11	11	100	0	0	0.128	0.018	0	4.1  	0	0.123	0.015	0	1.5 	0	28.2	35	0	11	0	0
12	12	100	0	0	0.101	0.031	0	7.4 	0	0.095	0.028	0	1.5 	0	92.3	35	0	12	0	0
13	13	100	0	0	0.0148	0.00275	0	5.9 	0	0.0143	0.0025	0	1.5 	0	496  	70	0	13	0	0
14	14	100	0	0	0.018	0.00285	0	4.1 	0	0.0173	0.0025	0	1.5 	0	300 	35	0	14	0	0
15	15	100	0	0	0.018	0.00285	0	4.1 	0	0.0173	0.0025	0	1.5 	0	300 	35	0	15	0	0
16	16	100	0	0	0.0178	0.00355	0	7.8 	0	0.0167	0.003	0	1.5 	0	450 	70	0	16	0	0];
% mac_con(:,7) = mac_con(:,12);   

exc_con = [...
0	1	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	2	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	3	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	4	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	5	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	6	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	7	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	8	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	9	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	10	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	11	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	12	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	13	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	14	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	15	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0;
0	16	0	50	0.02	0	0	0	0   0	0	0	0	0	0	0	0];
exc_con(:,8) = 50.0;
exc_con(:,9) = -50.0;
% exc_con(:,4) = 25.0;
% exc_con(:,5) = 0.075;


% %%
% %Wind Turbine
% % non-conforming load
% % col 1 bus number
% % col 2 fraction const active power load
% % col 3 fraction const reactive power load
% % col 4 fraction const active current load
% % col 5 fraction const reactive current load
% % svc bus needs to be a non-conforming bus
%  ld_cp = 0.25; % wecc
%  load_con = [2 ld_cp ld_cp ld_cp ld_cp]; 
% 
% % ############################### Add SVC ########################
% % col 1 svc number
% % col 2 bus number
% % col 3 svc base MVA
% % col 4 maximum susceptance Bcvmax(pu)
% % col 5 minimum susceptance Bcvmin(pu)
% % col 6 regulator gain
% % col 7 regulator time constant (s)
% % col 8 filter numerator time constant
% % col 9 filter denominator time constant
% % fraction of SVC on the bus
% 
% %  svc_con = [ 1 17 200 1 -1 33.3 0.05 0.2 0.2 1 ]; 
% 
% % ################## Add WTG ###########################
% % load_con = [load_con; 101, 0, 0 ,0 ,0;];
% % load_con = [11, 0, 0 ,0 ,0;];
% 
% 
% % Wind Power Plant data format
% % machine:  1. wtg number 
% %           2. bus number 
% %           3. Wind Turbine Technology (either type 3 = 3 or type 4 =4)
% %           4. base mva of the wtg
% %           5. Pset_mode - to determinde which mode has Pset either Pset=Plf or Pset=1pu 
% %                        0 - Pset = Plf  
% %                        1 - Pset = 1 
% %           6. Pwmax  - Table4.3 GE Report
% %           7. Pwmin  - Table4.3 GE Report
% %           8. Qmax  - Table4.3 GE Report
% %           9. Qmin  - Table4.3 GE Report
% %           10. KL -  - line 230 asyst5_init ** for a WT of size < 2.0
% %           11. Kp - power coefficient - line 280 asyst5_init
% %           12. nmass - To determine either two-mass or one mass model
% %                        1 - One mass model  
% %                        2 - Two mass model 
% %           13. Dtg - line 213 asyst5_init
% %           14. H - line 209 asyst5_init
% %           15. Hg - line 211 asyst5_init
% %           16. Ktg - line 212 asyst5_init
% %           17. Wbase  - line 214 asyst5_init
% %           18. Kip - line 198 asyst5_init
% %           19. Kpp - line 197 asyst5_init
% %           20. Kic - line 202 asyst5_init
% %           21. Kpc - line 201 asyst5_init
% %           22. Kitrq - line 200 asyst5_init
% %           23. Kptrq - line 199 asyst5_init
% %           24. Tp - line 195 asyst5_init
% %           25. Tpc - line 196 asyst5_init
% %           26. Theta_max - line 203 asyst5_init
% %           27. Theta_min - line 204 asyst5_init
% %           28. Thrate_max  - line 205 asyst5_init
% %           29. Thrate_min  - line 205 asyst5_init
% %           30. Pordratemax  - line 208 asyst5_init
% %           31. Pordratemin  - line 208 asyst5_init
% %           32. wfflg  - Table 4.8 pag 4.18 GE Report
% %           33. Lpp - line 164 asyst5_init (from Xpp line 61) - (TYPE 3 ONLY)
% %           34. Kpllp - line 166 asyst5_init ** increased to 60
% %           35. Tddel - Time delay for input signals in the Generator/Converter model
% %           36. lvplflg - Turn on and off LVPL
% %           37. rrpwr - Table4.13 GE Report
% %           38. brkpt - Table4.13 GE Report
% %           39. zerox - Table4.13 GE Report
% %           40. KQi - line 170 asyst5_init
% %           41. KVi - line 171 asyst5_init
% %           42. Ipmax - Table 4.5 pag 4.10 (TYPE 3 ONLY)
% %           43. Vmaxc - line 173 asyst5_init
% %           44. Vminc - line 174 asyst5_init
% %           45. XIQmax - line 178 asyst5_init (Used as in Simulink Model NOT GE Report)
% %           46. XIQmin - line 177 asyst5_init (Used as in Simulink Model NOT GE Report)
% %           47. EBST - Table 5.2 pag 5.5 (TYPE 4 ONLY)
% %           48. Kdbr - Table 5.2 pag 5.5 (TYPE 4 ONLY)
% %           49. Iphl - Table 5.2 pag 5.5 (TYPE 4 ONLY)
% %           50. Iqhl - Table 5.2 pag 5.5 (TYPE 4 ONLY)
% %           51. pqflag - Table 5.2 pag 5.5 (TYPE 4 ONLY)
% %           52. Varflag  - -
% %                        -1 - Qref  
% %                         0 - Power Factor Regulator 
% %                         1 - Wind Control Emulator
% %           53. Vregbus  - In case wind control Emulator is used this is
% %                          the bus selected to be regulated
% %           54. Tr  - Table4.3 GE Report
% %           55. Tv  - Table4.3 GE Report
% %           56. Kpv  - Table4.3 GE Report
% %           57. Kiv  - Table4.3 GE Report
% %           58. Tc  - Table4.3 GE Report
% %           59. fN  - Table4.3 GE Report
% %           60. Tlpd  - Table4.3 GE Report
% %           61. Kqd  - Table4.3 GE Report
% %           62. Vermn  - Table4.3 GE Report
% %           63. Vermx  - Table4.3 GE Report
% %           64. Vfrz  - Table4.3 GE Report
% %           65. Tpwr  - Table4.3 GE Report
% %           66. Wref Function** which trackinf function to use: if 1 P<0.46 if 2 P<0.75
% %           67. windINERTIAflag  - -
% %                        0 - disabled  
% %                        1 - Enabled 
% %           68. Kwi   - Table4.13 GE Report
% %           69. dbwi  - Table4.13 GE Report
% %           70. Tlpwi - Table4.13 GE Report
% %           71. Twowi - Table4.13 GE Report
% %           72. Urlwi - Table4.13 GE Report
% %           73. Drlwi - Table4.13 GE Report
% %           74. Pmxwi - Table4.13 GE Report
% %           75. Pmnwi - Table4.13 GE Report
% 
% %           76. ... and onwards - space to input limitations (maybe)
% 
% %          1        2     3     4     5       6      7       8      9       10 
% wtg_con = [...
%            1      2   3     200/0.8   0       1.12   0.10    1.0  -1.0  56.6...
%            0.00159  2     1.5   4.33  0.62    1.11   125.66  25     150     30 ...
%            3.0      0.6   3.0   0.3   0.05    27     0       10     -10     0.45...
%            -0.45    0     0.80  60    0.01    0      10      0.90   0.5     0.1...
%            40       1.1   1.1   0.9   0.4     -0.5   nan     nan    nan     nan...
%            nan      -1    1     0.02  0.05    18     5       0.15   1.0     5.0...
%            0.0      -0.1  0.1   0.7   0.05    1      0       10     0.0025  1.0...
%            5.5      0.1   -1    0.1   0.0     ];
% 
% %          x1       x2    x3    x4    x5       x6     x7    x8     x9      2x0
% 
% wtg_con([43 44 45 46]) = [1.5   0.5   0.8   -0.9];
% wtg_con(4)=200/0.8;
% % Wind profile
% % 1. wtg number for wind profile
% % 2. modvw - could be either:
% %            -1 = sinusoidal. Goes back to origin.
% %            -2 = ramp disturbance
% % 3. vwini - initial wind velocity
% % 4. tini - initial time of wind profile
% % 5. tgini - time when the wind disturbance starts
% % 6. vgamp - amplitude of disturbance
% % 7. tgdur - time duration of the wind disturbance
% % 8. tsdur - time during which wind stays still (before second disturbance)
% % 9. vgamp2 - amplitude of second disturbance
% % 10. tgdur2 - time duration of the second wind disturbance
% % 11. tfin - final time of wind profile
% % 12. tstep - time step of the generated wind profile
% vwr08 = 10.276;
% %         1   2     3     4    5   6    7    8    9    10    11   12
% 
% % tfin = 202;
% tfin =20;
% tao = 1/100;
% vw_wtg = [1 -1    13    0    3   0    5    nan  nan  nan   tfin  tao];
% 
% %Switching file defines the simulation control
% % row 1 col1  simulation start time (s) (cols 2 to 6 zeros)
% %       col7  initial time step (s)
% % row 2 col1  fault application time (s)
% %       col2  bus number at which fault is applied
% %       col3  bus number defining far end of faulted line
% %       col4  zero sequence impedance in pu on system base
% %       col5  negative sequence impedance in pu on system base
% %       col6  type of fault  - 0 three phase
% %                            - 1 line to ground
% %                            - 2 line-to-line to ground
% %                            - 3 line-to-line
% %                            - 4 loss of line with no fault
% %                            - 5 loss of load at bus
% %                            - 6 no action
% %       col7  time step for fault period (s)
% % row 3 col1  near end fault clearing time (s) (cols 2 to 6 zeros)
% %       col7  time step for second part of fault (s)
% % row 4 col1  far end fault clearing time (s) (cols 2 to 6 zeros)
% %       col7  time step for fault cleared simulation (s)
% % row 5 col1  time to change step length (s)
% %       col7  time step (s)
% %
% %
% %
% % row n col1 finishing time (s)  (n indicates that intermediate rows may be inserted)
% 
% tao = 1/100;                   
% sw_con = [...
%    0    0    0    0    0    0    tao;%sets intitial time step
%   1   2   22   0    0    4    tao; %apply three phase fault at bus 1, on line 1-2
%   1.15 0    0    0    0    0    tao; %clear fault at bus 
%   1.2 0    0    0    0    0     tao; %clear remote end
% %    4+5*tao 0    0    0    0    0    tao; % increase time step 
% %    4+6*tao   0    0    0    0    0    tao; % increase time step
% tfin    0    0    0    0    0    0]; % end simulation
% % 202    0    0    0    0    0    0]; % end simulation



sw_con = [...
   0     0    0    0    0    0    0.01;%sets intitial time step
   1.0  17    18    0    0    0    0.01; %no fault at bus 1, on line 1-2
   5.2 0    0    0    0    0    0.01; %clear fault at bus 
   5.5 0    0    0    0    0    0.01; %clear remote end
   6.0  0    0    0    0    0    0.01; % increase time step 
   10  0    0    0    0    0    0]; % end simulation

v9=[53 68];
bus(v9,10)=2*ones(2,1);
bus(v9,4)=2.0*ones(2,1);

% bus(191:195,1:10)=[191 1.013366509 -23.72823131	2.0	0	0	0	0	0	2;
%     192 1.013366509 -6.53561691818363	2.0	0	0	0	0	0	2;
%     193 1.013366509 -7.21256873579706	2.0	0	0	0	0	0	2;
%     194 1.042536 -14.99625	2.0	0	0	0	0	0	2;
%     195 1,-3.554188	2.0	0	0	0	0	0	2];


v10=[1:16 53 68];
bus(v10,11:12)=[999*ones(18,1) -999*ones(18,1)];

%% line matrix

% line(266:270,1:7)=[...
%     125,191,0,.0259000000000000,0,1.0,0;
%     172,192,0,.0259000000000000,0,1.0,0;
%     177,193,0,.0259000000000000,0,1.0,0;
%     184,194,0,.0259000000000000,0,1.0,0;
%     161,195,0,.0259000000000000,0,1.0,0];



%%
Efdi=0.33; % assumed.
S_Efdi=0.0039*exp(1.555*Efdi);

%% Exciters
% col1 type
% col2 machine number
% col3 Tr
% col4 Ka
% col5 Ta
% col6 Tb
% col7 Tc
% col8 Vrmax
% col9 Vrmin
% col10 Ke
% col11 Te
% col12 E1, assumed Efd=0.33
% col13 Se(E1), S_Efd(Efd)=0.0039*exp(1.555*Efd)
% col14 E2
% col15 Se(E2)
% col16 Kf
% col17 Tf
% cols 18 to 20 required for exc_st3 only

exc_con1=[...
1 1   0   20 0.2  0   0 20 0  1.0 0.314 Efdi S_Efdi 0 0 0.063 0.35 zeros(1,3)];
% 1 2   0   20 0.2  0   0 20 0  1.0 0.314 Efdi S_Efdi 0 0 0.063 0.35 zeros(1,3);
% 1 3   0   20 0.2  0   0 20 0  1.0 0.314 Efdi S_Efdi 0 0 0.063 0.35 zeros(1,3)];

exc_con2=[0  1 0  100.000    0.050 0 0   20.000   -20.000];

for m=1:16
    exc_con(m,1:20)=exc_con1;  
end

exc_con(:,2)=1:16;
exc_con(:,8:9)=[3.5*ones(16,1) -2.5*ones(16,1)];
exc_con(:,4)=75; exc_con(:,5)=0.015;

% mac_con(6,:)=mac_con(5,:);

% v6=[1 2 19];
% 
% mac_con(6,v6)=[6 6 6];

% exc_con=[];
%% Wind farms and Wind

%% ################## Add WTG ###########################

% % % load_con_nw=zeros(lv2,5);
% % % load_con_nw(:,1)=v2;

load_con = [53, 0, 0 ,0 ,0;68, 0, 0 ,0 ,0];%192, 0, 0 ,0 ,0;181, 0, 0 ,0 ,0;193, 0, 0 ,0 ,0;194, 0, 0 ,0 ,0;...
    %195, 0, 0 ,0 ,0];

wtg_con1 = [...
    1      53   3   200   0       1.12   0.10    1  -1  56.6...
    0.00159  2     1.5   4.33  0.62    1.11   125.66  25     150     30 ...
    3.0      0.6   3.0   0.3   0.05    27     0       10     -10     0.45...
    -0.45    0     0.80  60    0.01    0      10      0.90   0.5     0.1...
    40       1.1   1.1   0.9   0.4     -0.5   nan     nan    nan     nan...
    nan      -1    1     0.02  0.05    18     5       0.15   1.0     5.0...
    0.0      -0.1  0.1   0.7   0.05    1      0       10     0.0025  1.0...
    5.5      0.1   -1    0.1   0.0     ];
%          x1       x2    x3    x4    x5       x6     x7    x8     x9      2x0

wtg_con1([8 9]) = [20.0 -20.0];
wtg_con1([43 44 45 46]) = [1.5   0.5   0.8   -0.9];
wtg_con1([6 7]) = [5.0 .0];

% v3=Dfig.con(:,3);
% wtg_con_nw=zeros(33,75);

vwr08 = 10.276;

tao = 1/60;
tini=0;%1+3*tao;
tfin = 20;

vw_wtg1 = [1 -1    8    tini    3   0    5    nan  nan  nan   tfin   tao];

 for m=1:2
     wtg_con(m,:)=wtg_con1;
     vw_wtg(m,:)=vw_wtg1;
 end

vw_wtg(:,1)=1:2; 
 
wtg_con(:,1)=1:2;%33;
wtg_con(:,2)=[53 68];
% wtg_con_nw(:,4)=v3;

%% final matrices
% % % bus=bus_nw;
% % % line=line_nw;
% % % load_con=load_con_nw;
% % % wtg_con=wtg_con_nw;
% % % vw_wtg=vw_wtg_nw;
%%



% tfin=10;
% tao = 1/60;

%Switching file defines the simulation control
% row 1 col1  simulation start time (s) (cols 2 to 6 zeros)
%       col7  initial time step (s)
% row 2 col1  fault application time (s)
%       col2  bus number at which fault is applied
%       col3  bus number defining far end of faulted line
%       col4  zero sequence impedance in pu on system base
%       col5  negative sequence impedance in pu on system base
%       col6  type of fault  - 0 three phase
%                            - 1 line to ground
%                            - 2 line-to-line to ground
%                            - 3 line-to-line
%                            - 4 loss of line with no fault
%                            - 5 loss of load at bus
%                            - 6 no action
%       col7  time step for fault period (s)
% row 3 col1  near end fault clearing time (s) (cols 2 to 6 zeros)
%       col7  time step for second part of fault (s)
% row 4 col1  far end fault clearing time (s) (cols 2 to 6 zeros)
%       col7  time step for fault cleared simulation (s)
% row 5 col1  time to change step length (s)
%       col7  time step (s)

