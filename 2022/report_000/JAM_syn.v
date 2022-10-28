/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Wed Mar 30 19:35:45 2022
/////////////////////////////////////////////////////////////


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  AND2X2 U2 ( .A(A[8]), .B(n3), .Y(n2) );
  XOR2XL U3 ( .A(A[8]), .B(n3), .Y(SUM[8]) );
  XOR2XL U4 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  XOR2XL U5 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR2X1 U6 ( .A(A[9]), .B(n2), .Y(SUM[9]) );
  AND2X2 U7 ( .A(A[7]), .B(carry[7]), .Y(n3) );
endmodule


module JAM_DW01_inc_0_DW01_inc_3 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  ADDHXL U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  XOR2X1 U1 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N203, N204, N205, N206, N207, N208, N209, N210, N211, N212, N213,
         N214, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n779, n780, n781, n782, next_sort, \p[0][2] , \p[0][1] ,
         \p[0][0] , \p[1][2] , \p[1][1] , \p[1][0] , \p[2][2] , \p[2][1] ,
         \p[2][0] , \p[3][2] , \p[3][1] , \p[3][0] , \p[4][2] , \p[4][1] ,
         \p[4][0] , \p[5][2] , \p[5][1] , \p[5][0] , \p[6][2] , \p[6][1] ,
         \p[6][0] , \p[7][2] , \p[7][1] , \p[7][0] , N280, N281, N282, N309,
         N310, N311, N326, N327, N328, N388, N390, N399, N400, N401, N523,
         N524, N525, N526, N527, N528, N529, N530, N531, N532, N588, N589,
         N651, N652, N653, N654, N655, N656, N657, N658, N659, N660, N661,
         N662, N663, N664, N665, N666, n35, n36, n37, n38, n41, n42, n43, n45,
         n47, n48, n49, n50, n54, n55, n56, n57, n58, n61, n62, n64, n66, n69,
         n71, n72, n73, n76, n77, n79, n82, n83, n84, n96, n97, n98, n99, n100,
         n101, n102, n104, n106, n108, n110, n112, n114, n117, n118, n119,
         n120, n121, n130, n131, n132, n133, n134, n143, n145, n146, n147,
         n150, n151, n152, n153, n155, n156, n157, n158, n160, n161, n162,
         n163, n164, n166, n170, n172, n173, n175, n176, n179, n180, n181,
         n183, n184, n185, n188, n189, n190, n191, n196, n198, n200, n201,
         n203, n204, n205, n206, n207, n208, n209, n211, n213, n215, n216,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n228, n230,
         n231, n233, n234, n235, n236, n237, n238, n239, n241, n243, n244,
         n246, n247, n248, n249, n250, n251, n252, n253, n255, n257, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n269, n273, n276,
         n279, n280, n284, n285, n286, n287, n288, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n364, n368, n369, n370, n371, n372, n373, n374, n375, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n528, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593,
         n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604,
         n605, n606, n607, n608, n609, n610, n611, n612, n613, n614, n615,
         n616, n617, n618, n619, n620, n621, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637,
         n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, n659,
         n660, n661, n662, n663, n664, n665, n666, n667, n668, n669, n670,
         n671, n672, n673, n674, n675, n676, n677, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n709, n710, n711, n712, n713, n714,
         n715, n716, n717, n718, n719, n720, n721, n722, n723, n724, n725,
         n726, n727, n728, n729, n730, n731, n732, n733, n734, n735, n736,
         n737, n738, n739, n740, n741, n742, n743, n744, n745, n746, n747,
         n748, n749, n750, n751, n752, n753, n754, n755, n756, n757, n758,
         n759, n760, n761, n762, n763, n764, n765;
  wire   [2:0] state_current;
  wire   [2:0] state_next;
  wire   [15:0] round;
  wire   [9:0] result;

  JAM_DW01_add_0 add_185 ( .A(result), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(1'b0), 
        .SUM({N532, N531, N530, N529, N528, N527, N526, N525, N524, N523}) );
  JAM_DW01_inc_0_DW01_inc_3 r469 ( .A(round), .SUM({N666, N665, N664, N663, 
        N662, N661, N660, N659, N658, N657, N656, N655, N654, N653, N652, N651}) );
  DFFSX1 \k_reg[2]  ( .D(n427), .CK(CLK), .SN(n556), .Q(N214), .QN(n374) );
  DFFSX1 \j_reg[2]  ( .D(n451), .CK(CLK), .SN(n556), .Q(N208), .QN(n368) );
  DFFSX1 \p_reg[7][2]  ( .D(n422), .CK(CLK), .SN(n555), .Q(\p[7][2] ), .QN(
        n733) );
  DFFSX1 \p_reg[7][1]  ( .D(n423), .CK(CLK), .SN(n555), .Q(\p[7][1] ), .QN(
        n734) );
  DFFSX1 \p_reg[7][0]  ( .D(n424), .CK(CLK), .SN(n555), .Q(\p[7][0] ), .QN(
        n735) );
  DFFSX1 \p_reg[5][0]  ( .D(n418), .CK(CLK), .SN(n555), .Q(\p[5][0] ), .QN(
        n750) );
  DFFSX1 \p_reg[1][0]  ( .D(n406), .CK(CLK), .SN(n555), .Q(\p[1][0] ), .QN(
        n738) );
  DFFSX1 \p_reg[3][0]  ( .D(n412), .CK(CLK), .SN(n555), .Q(\p[3][0] ), .QN(
        n744) );
  DFFSX1 \j_reg[1]  ( .D(n449), .CK(CLK), .SN(n553), .Q(N207), .QN(n369) );
  DFFSX1 \j_reg[0]  ( .D(n450), .CK(CLK), .SN(n556), .Q(N206), .QN(n370) );
  DFFSX1 \p_reg[4][2]  ( .D(n413), .CK(CLK), .SN(n555), .Q(\p[4][2] ), .QN(
        n745) );
  DFFSX1 \p_reg[5][2]  ( .D(n416), .CK(CLK), .SN(n555), .Q(\p[5][2] ), .QN(
        n748) );
  DFFSX1 \p_reg[2][1]  ( .D(n408), .CK(CLK), .SN(n555), .Q(\p[2][1] ), .QN(
        n740) );
  DFFSX1 \p_reg[6][2]  ( .D(n419), .CK(CLK), .SN(n555), .Q(\p[6][2] ), .QN(
        n751) );
  DFFSX1 \p_reg[6][1]  ( .D(n420), .CK(CLK), .SN(n555), .Q(\p[6][1] ), .QN(
        n752) );
  DFFSX1 \p_reg[3][1]  ( .D(n411), .CK(CLK), .SN(n555), .Q(\p[3][1] ), .QN(
        n743) );
  DFFRX1 \counter_reg[3]  ( .D(n345), .CK(CLK), .RN(n553), .Q(n528), .QN(n377)
         );
  DFFRX1 \min_reg[2]  ( .D(n446), .CK(CLK), .RN(n553), .Q(N211), .QN(n371) );
  DFFRX1 \min_reg[1]  ( .D(n447), .CK(CLK), .RN(n553), .Q(N210), .QN(n372) );
  DFFRX1 \min_reg[0]  ( .D(n448), .CK(CLK), .RN(n553), .Q(N209), .QN(n373) );
  DFFSX1 \k_reg[1]  ( .D(n425), .CK(CLK), .SN(n553), .Q(N213), .QN(n375) );
  DFFSX1 \MinCost_reg[0]  ( .D(n397), .CK(CLK), .SN(n556), .Q(n781), .QN(n332)
         );
  DFFSX1 \MinCost_reg[4]  ( .D(n393), .CK(CLK), .SN(n556), .Q(n777), .QN(n336)
         );
  DFFSX1 \MinCost_reg[8]  ( .D(n389), .CK(CLK), .SN(n556), .Q(n775), .QN(n340)
         );
  DFFSX1 \MinCost_reg[3]  ( .D(n394), .CK(CLK), .SN(n556), .Q(n778), .QN(n335)
         );
  DFFSX1 \MinCost_reg[1]  ( .D(n396), .CK(CLK), .SN(n555), .Q(n780), .QN(n333)
         );
  DFFSX1 \MinCost_reg[9]  ( .D(n388), .CK(CLK), .SN(n556), .QN(n341) );
  DFFSX1 \MinCost_reg[7]  ( .D(n390), .CK(CLK), .SN(n556), .QN(n339) );
  DFFSX1 \MinCost_reg[6]  ( .D(n391), .CK(CLK), .SN(n556), .QN(n338) );
  DFFSX1 \MinCost_reg[2]  ( .D(n395), .CK(CLK), .SN(n556), .Q(n779), .QN(n334)
         );
  DFFRX1 \MatchCount_reg[1]  ( .D(n386), .CK(CLK), .RN(n554), .QN(n382) );
  DFFRX1 \MatchCount_reg[2]  ( .D(n385), .CK(CLK), .RN(n554), .QN(n381) );
  DFFRX1 \J_reg[0]  ( .D(n444), .CK(CLK), .RN(n554), .Q(n773), .QN(n326) );
  DFFRX1 \J_reg[1]  ( .D(n443), .CK(CLK), .RN(n554), .Q(n772), .QN(n327) );
  DFFRX1 \MatchCount_reg[3]  ( .D(n384), .CK(CLK), .RN(n554), .Q(n774), .QN(
        n342) );
  DFFRX1 \J_reg[2]  ( .D(n442), .CK(CLK), .RN(n554), .Q(n771), .QN(n328) );
  DFFRX1 \W_reg[0]  ( .D(n400), .CK(CLK), .RN(n554), .Q(n770), .QN(n329) );
  DFFRX1 \W_reg[1]  ( .D(n399), .CK(CLK), .RN(n554), .Q(n769), .QN(n330) );
  DFFRX1 \W_reg[2]  ( .D(n398), .CK(CLK), .RN(n554), .Q(n768), .QN(n331) );
  DFFSX1 \MinCost_reg[5]  ( .D(n392), .CK(CLK), .SN(n556), .Q(n776), .QN(n337)
         );
  DFFRX1 \counter_reg[1]  ( .D(n344), .CK(CLK), .RN(n672), .Q(n759), .QN(n379)
         );
  DFFRX1 \counter_reg[0]  ( .D(n347), .CK(CLK), .RN(n672), .Q(n757), .QN(n380)
         );
  DFFSX1 \k_reg[0]  ( .D(n426), .CK(CLK), .SN(n672), .Q(N212), .QN(n630) );
  DFFRX1 \counter_reg[2]  ( .D(n346), .CK(CLK), .RN(n672), .Q(n758), .QN(n378)
         );
  DFFRX1 \state_current_reg[2]  ( .D(state_next[2]), .CK(CLK), .RN(n672), .Q(
        state_current[2]), .QN(n707) );
  DFFRX1 \state_current_reg[0]  ( .D(state_next[0]), .CK(CLK), .RN(n672), .Q(
        state_current[0]), .QN(n684) );
  DFFRX1 \state_current_reg[1]  ( .D(state_next[1]), .CK(CLK), .RN(n672), .Q(
        state_current[1]), .QN(n705) );
  DFFRX1 next_CAL_reg ( .D(n430), .CK(CLK), .RN(n672), .QN(n730) );
  DFFRX1 \round_reg[8]  ( .D(n355), .CK(CLK), .RN(n672), .Q(round[8]) );
  DFFRX1 \round_reg[7]  ( .D(n356), .CK(CLK), .RN(n672), .Q(round[7]) );
  DFFRX1 \round_reg[6]  ( .D(n357), .CK(CLK), .RN(n672), .Q(round[6]) );
  DFFRX1 \round_reg[5]  ( .D(n358), .CK(CLK), .RN(n672), .Q(round[5]) );
  DFFRX1 \round_reg[4]  ( .D(n359), .CK(CLK), .RN(n672), .Q(round[4]) );
  DFFRX1 \round_reg[3]  ( .D(n360), .CK(CLK), .RN(n672), .Q(round[3]) );
  DFFRX1 \round_reg[2]  ( .D(n361), .CK(CLK), .RN(n672), .Q(round[2]) );
  DFFRX1 \round_reg[1]  ( .D(n362), .CK(CLK), .RN(n672), .Q(round[1]) );
  DFFRX1 \round_reg[0]  ( .D(n364), .CK(CLK), .RN(n672), .Q(round[0]) );
  DFFRX1 \round_reg[9]  ( .D(n354), .CK(CLK), .RN(n672), .Q(round[9]) );
  DFFRX1 \round_reg[10]  ( .D(n353), .CK(CLK), .RN(n672), .Q(round[10]) );
  DFFRX1 \p_reg[0][1]  ( .D(n402), .CK(CLK), .RN(n672), .Q(\p[0][1] ), .QN(
        n755) );
  DFFRX1 \p_reg[0][0]  ( .D(n403), .CK(CLK), .RN(n672), .Q(\p[0][0] ), .QN(
        n756) );
  DFFRX1 \p_reg[0][2]  ( .D(n401), .CK(CLK), .RN(n672), .Q(\p[0][2] ), .QN(
        n754) );
  DFFRX1 \round_reg[11]  ( .D(n352), .CK(CLK), .RN(n672), .Q(round[11]) );
  DFFRX1 \round_reg[12]  ( .D(n351), .CK(CLK), .RN(n672), .Q(round[12]) );
  DFFRX1 next_sort_reg ( .D(n452), .CK(CLK), .RN(n672), .Q(next_sort), .QN(
        n719) );
  DFFRX1 \result_reg[0]  ( .D(n440), .CK(CLK), .RN(n672), .Q(result[0]), .QN(
        n761) );
  DFFRX1 \round_reg[13]  ( .D(n350), .CK(CLK), .RN(n672), .Q(round[13]) );
  DFFRX1 \p_reg[5][1]  ( .D(n417), .CK(CLK), .RN(n672), .Q(\p[5][1] ), .QN(
        n749) );
  DFFRX1 \p_reg[4][1]  ( .D(n414), .CK(CLK), .RN(n672), .Q(\p[4][1] ), .QN(
        n746) );
  DFFRX1 \p_reg[1][1]  ( .D(n405), .CK(CLK), .RN(n672), .Q(\p[1][1] ), .QN(
        n737) );
  DFFRX1 \p_reg[6][0]  ( .D(n421), .CK(CLK), .RN(n672), .Q(\p[6][0] ), .QN(
        n753) );
  DFFRX1 next_part_reg ( .D(n445), .CK(CLK), .RN(n672), .QN(n708) );
  DFFRX1 \p_reg[4][0]  ( .D(n415), .CK(CLK), .RN(n672), .Q(\p[4][0] ), .QN(
        n747) );
  DFFRX1 \p_reg[2][0]  ( .D(n409), .CK(CLK), .RN(n672), .Q(\p[2][0] ), .QN(
        n741) );
  DFFRX1 \round_reg[14]  ( .D(n349), .CK(CLK), .RN(n672), .Q(round[14]) );
  DFFRX1 \p_reg[3][2]  ( .D(n410), .CK(CLK), .RN(n672), .Q(\p[3][2] ), .QN(
        n742) );
  DFFRX1 \p_reg[2][2]  ( .D(n407), .CK(CLK), .RN(n672), .Q(\p[2][2] ), .QN(
        n739) );
  DFFRX1 \p_reg[1][2]  ( .D(n404), .CK(CLK), .RN(n672), .Q(\p[1][2] ), .QN(
        n736) );
  DFFRX1 \result_reg[1]  ( .D(n439), .CK(CLK), .RN(n672), .Q(result[1]), .QN(
        n670) );
  DFFRX1 \round_reg[15]  ( .D(n348), .CK(CLK), .RN(n672), .Q(round[15]) );
  DFFRX1 \result_reg[2]  ( .D(n438), .CK(CLK), .RN(n672), .Q(result[2]), .QN(
        n762) );
  DFFRX1 \result_reg[3]  ( .D(n437), .CK(CLK), .RN(n672), .Q(result[3]), .QN(
        n763) );
  DFFRX1 \result_reg[4]  ( .D(n436), .CK(CLK), .RN(n672), .Q(result[4]), .QN(
        n669) );
  DFFRX1 \result_reg[5]  ( .D(n435), .CK(CLK), .RN(n672), .Q(result[5]), .QN(
        n668) );
  DFFRX1 \result_reg[6]  ( .D(n434), .CK(CLK), .RN(n672), .Q(result[6]), .QN(
        n764) );
  DFFRX1 \result_reg[7]  ( .D(n433), .CK(CLK), .RN(n672), .Q(result[7]), .QN(
        n765) );
  DFFRX1 \result_reg[8]  ( .D(n432), .CK(CLK), .RN(n672), .Q(result[8]), .QN(
        n666) );
  DFFRX1 \result_reg[9]  ( .D(n441), .CK(CLK), .RN(n672), .Q(result[9]), .QN(
        n760) );
  DFFSX1 \MatchCount_reg[0]  ( .D(n387), .CK(CLK), .SN(n672), .QN(n383) );
  DFFSX4 \index_reg[1]  ( .D(n428), .CK(CLK), .SN(n672), .Q(N204), .QN(n573)
         );
  DFFSX2 \index_reg[2]  ( .D(n431), .CK(CLK), .SN(n672), .Q(N205), .QN(n575)
         );
  DFFSX2 \index_reg[0]  ( .D(n429), .CK(CLK), .SN(n672), .Q(N203), .QN(n574)
         );
  OAI221X1 U467 ( .A0(n732), .A1(n207), .B0(n162), .B1(n721), .C0(n208), .Y(
        n196) );
  OAI221X1 U468 ( .A0(n731), .A1(n207), .B0(n162), .B1(n723), .C0(n237), .Y(
        n226) );
  OAI211X1 U469 ( .A0(n162), .A1(n722), .B0(n222), .C0(n223), .Y(n211) );
  OAI211X1 U470 ( .A0(n162), .A1(n724), .B0(n250), .C0(n251), .Y(n239) );
  NOR2X2 U471 ( .A(n573), .B(N205), .Y(n641) );
  NOR2X2 U472 ( .A(n573), .B(N203), .Y(n570) );
  INVX12 U473 ( .A(n383), .Y(MatchCount[0]) );
  INVX12 U474 ( .A(RST), .Y(n672) );
  BUFX12 U475 ( .A(n776), .Y(MinCost[5]) );
  OAI32X1 U476 ( .A0(n548), .A1(N327), .A2(n324), .B0(N328), .B1(n729), .Y(
        n295) );
  OAI22X1 U477 ( .A0(n574), .A1(n636), .B0(N203), .B1(n635), .Y(N327) );
  BUFX12 U478 ( .A(n768), .Y(W[2]) );
  BUFX12 U479 ( .A(n769), .Y(W[1]) );
  BUFX12 U480 ( .A(n770), .Y(W[0]) );
  BUFX12 U481 ( .A(n771), .Y(J[2]) );
  BUFX12 U482 ( .A(n774), .Y(MatchCount[3]) );
  BUFX12 U483 ( .A(n772), .Y(J[1]) );
  BUFX12 U484 ( .A(n773), .Y(J[0]) );
  INVX16 U485 ( .A(n381), .Y(MatchCount[2]) );
  INVX16 U486 ( .A(n382), .Y(MatchCount[1]) );
  BUFX12 U487 ( .A(n779), .Y(MinCost[2]) );
  INVX12 U488 ( .A(n338), .Y(MinCost[6]) );
  INVX12 U489 ( .A(n339), .Y(MinCost[7]) );
  INVX12 U490 ( .A(n341), .Y(MinCost[9]) );
  OR2X1 U491 ( .A(n36), .B(n707), .Y(n782) );
  INVX16 U492 ( .A(n782), .Y(Valid) );
  INVX12 U493 ( .A(n333), .Y(MinCost[1]) );
  AO21XL U494 ( .A0(n670), .A1(n649), .B0(n780), .Y(n648) );
  INVX12 U495 ( .A(n335), .Y(MinCost[3]) );
  BUFX12 U496 ( .A(n775), .Y(MinCost[8]) );
  BUFX12 U497 ( .A(n777), .Y(MinCost[4]) );
  CLKBUFX3 U498 ( .A(n84), .Y(n552) );
  NOR2BXL U499 ( .AN(result[3]), .B(n778), .Y(n663) );
  NOR2XL U500 ( .A(n669), .B(n777), .Y(n662) );
  NOR2XL U501 ( .A(n668), .B(n776), .Y(n654) );
  OAI22XL U502 ( .A0(n382), .A1(n79), .B0(n677), .B1(MatchCount[1]), .Y(n386)
         );
  NOR3X1 U503 ( .A(n678), .B(n383), .C(n76), .Y(n73) );
  NOR2XL U504 ( .A(n666), .B(n775), .Y(n647) );
  OAI22X1 U505 ( .A0(result[9]), .A1(n341), .B0(n671), .B1(n659), .Y(N588) );
  AOI32XL U506 ( .A0(n658), .A1(n667), .A2(n657), .B0(n775), .B1(n666), .Y(
        n659) );
  INVX12 U507 ( .A(n332), .Y(MinCost[0]) );
  INVXL U508 ( .A(n82), .Y(n678) );
  NAND3BXL U509 ( .AN(N588), .B(n661), .C(n660), .Y(n664) );
  CLKINVX1 U510 ( .A(n550), .Y(n701) );
  OAI222X1 U511 ( .A0(n207), .A1(n265), .B0(n266), .B1(n701), .C0(n162), .C1(
        n725), .Y(n253) );
  OAI22X1 U512 ( .A0(n162), .A1(n163), .B0(n164), .B1(n701), .Y(n143) );
  NOR2X1 U513 ( .A(n37), .B(n684), .Y(n62) );
  OAI21X1 U514 ( .A0(n693), .A1(n265), .B0(n279), .Y(n267) );
  CLKINVX1 U515 ( .A(n260), .Y(n685) );
  NAND3X1 U516 ( .A(n759), .B(n758), .C(n757), .Y(n106) );
  NAND4XL U517 ( .A(n342), .B(n73), .C(MatchCount[1]), .D(MatchCount[2]), .Y(
        n72) );
  NAND2XL U518 ( .A(result[2]), .B(n334), .Y(n660) );
  NOR2BXL U519 ( .AN(result[0]), .B(n781), .Y(n644) );
  NAND2X1 U520 ( .A(N311), .B(n550), .Y(n161) );
  NAND2X1 U521 ( .A(N310), .B(n550), .Y(n156) );
  NAND2X1 U522 ( .A(N309), .B(n550), .Y(n151) );
  NOR2X2 U523 ( .A(n37), .B(state_current[0]), .Y(n260) );
  NAND2X1 U524 ( .A(n630), .B(n691), .Y(n207) );
  OAI21XL U525 ( .A0(n374), .A1(N205), .B0(n297), .Y(n290) );
  NOR2X1 U526 ( .A(n162), .B(n630), .Y(n224) );
  NOR2X1 U527 ( .A(n706), .B(state_current[0]), .Y(n50) );
  CLKINVX1 U528 ( .A(n371), .Y(n718) );
  CLKINVX1 U529 ( .A(n372), .Y(n717) );
  CLKINVX1 U530 ( .A(n373), .Y(n713) );
  CLKINVX1 U531 ( .A(n374), .Y(n732) );
  NAND3X1 U532 ( .A(n379), .B(n380), .C(n378), .Y(n45) );
  NOR2X1 U533 ( .A(n38), .B(state_current[2]), .Y(n43) );
  NAND3X1 U534 ( .A(n759), .B(n758), .C(n380), .Y(n112) );
  NAND3X1 U535 ( .A(n757), .B(n758), .C(n379), .Y(n104) );
  NAND3X1 U536 ( .A(n757), .B(n759), .C(n378), .Y(n102) );
  CLKINVX1 U537 ( .A(n153), .Y(n699) );
  CLKINVX1 U538 ( .A(n286), .Y(n681) );
  CLKINVX1 U539 ( .A(n147), .Y(n698) );
  CLKINVX1 U540 ( .A(n158), .Y(n700) );
  CLKINVX1 U541 ( .A(n305), .Y(n674) );
  OAI21X1 U542 ( .A0(n679), .A1(n76), .B0(n552), .Y(n82) );
  INVX3 U543 ( .A(n552), .Y(n680) );
  OAI31X1 U544 ( .A0(n295), .A1(n296), .A2(n683), .B0(n162), .Y(n286) );
  NOR2X1 U545 ( .A(n727), .B(n701), .Y(n153) );
  NOR2X2 U546 ( .A(n729), .B(n685), .Y(n173) );
  NOR2X1 U547 ( .A(n728), .B(n701), .Y(n147) );
  NOR2X1 U548 ( .A(n726), .B(n701), .Y(n158) );
  CLKINVX1 U549 ( .A(n253), .Y(n688) );
  CLKINVX1 U550 ( .A(n226), .Y(n689) );
  CLKINVX1 U551 ( .A(n196), .Y(n690) );
  CLKINVX1 U552 ( .A(n267), .Y(n692) );
  CLKINVX1 U553 ( .A(n162), .Y(n691) );
  AND2X2 U554 ( .A(n549), .B(n62), .Y(n301) );
  CLKINVX1 U555 ( .A(n143), .Y(n696) );
  NOR2X1 U556 ( .A(n106), .B(n675), .Y(n305) );
  INVX3 U557 ( .A(n96), .Y(n675) );
  CLKINVX1 U558 ( .A(n294), .Y(n683) );
  CLKINVX1 U559 ( .A(n170), .Y(n686) );
  INVX3 U560 ( .A(n551), .Y(n679) );
  CLKINVX1 U561 ( .A(n62), .Y(n676) );
  NOR2X1 U562 ( .A(n305), .B(n66), .Y(n308) );
  CLKINVX1 U563 ( .A(n146), .Y(n709) );
  CLKBUFX3 U564 ( .A(n553), .Y(n555) );
  CLKBUFX3 U565 ( .A(n553), .Y(n556) );
  CLKBUFX3 U566 ( .A(n553), .Y(n554) );
  NAND2BX1 U567 ( .AN(N588), .B(N589), .Y(n76) );
  NAND2XL U568 ( .A(N588), .B(n551), .Y(n84) );
  CLKINVX1 U569 ( .A(n73), .Y(n677) );
  OA21XL U570 ( .A0(n76), .A1(MatchCount[1]), .B0(n79), .Y(n77) );
  OAI2BB2XL U571 ( .B0(n764), .B1(n549), .A0N(N529), .A1N(n301), .Y(n434) );
  OAI2BB2XL U572 ( .B0(n762), .B1(n549), .A0N(N525), .A1N(n301), .Y(n438) );
  OAI2BB2XL U573 ( .B0(n763), .B1(n549), .A0N(N526), .A1N(n301), .Y(n437) );
  OAI2BB2XL U574 ( .B0(n668), .B1(n549), .A0N(N528), .A1N(n301), .Y(n435) );
  OAI2BB2XL U575 ( .B0(n669), .B1(n549), .A0N(N527), .A1N(n301), .Y(n436) );
  INVXL U576 ( .A(N327), .Y(n727) );
  INVX1 U577 ( .A(N328), .Y(n728) );
  NOR4BBX1 U578 ( .AN(n325), .BN(N390), .C(n324), .D(N326), .Y(n296) );
  NAND2XL U579 ( .A(N327), .B(n548), .Y(n325) );
  CLKINVX1 U580 ( .A(N388), .Y(n729) );
  INVXL U581 ( .A(N326), .Y(n726) );
  NOR2X1 U582 ( .A(n728), .B(N388), .Y(n324) );
  OAI2BB1X1 U583 ( .A0N(n312), .A1N(n43), .B0(n697), .Y(n310) );
  NAND2X1 U584 ( .A(n43), .B(n310), .Y(n311) );
  OAI211X1 U585 ( .A0(n681), .A1(n291), .B0(n697), .C0(n292), .Y(n431) );
  OA22X1 U586 ( .A0(n722), .A1(n685), .B0(n683), .B1(n163), .Y(n291) );
  OAI31XL U587 ( .A0(n287), .A1(n260), .A2(N204), .B0(N205), .Y(n292) );
  OAI22XL U588 ( .A0(n752), .A1(n253), .B0(n688), .B1(n261), .Y(n420) );
  AOI221XL U589 ( .A0(n252), .A1(n155), .B0(n180), .B1(n725), .C0(n262), .Y(
        n261) );
  OAI22XL U590 ( .A0(n699), .A1(n712), .B0(n259), .B1(n156), .Y(n262) );
  OAI22XL U591 ( .A0(n743), .A1(n211), .B0(n695), .B1(n218), .Y(n411) );
  AOI221XL U592 ( .A0(n209), .A1(n155), .B0(n180), .B1(n722), .C0(n219), .Y(
        n218) );
  OAI22XL U593 ( .A0(n216), .A1(n156), .B0(n699), .B1(n715), .Y(n219) );
  OAI22XL U594 ( .A0(n740), .A1(n196), .B0(n690), .B1(n203), .Y(n408) );
  AOI221XL U595 ( .A0(n190), .A1(n155), .B0(n180), .B1(n721), .C0(n204), .Y(
        n203) );
  OAI22XL U596 ( .A0(n201), .A1(n156), .B0(n699), .B1(n710), .Y(n204) );
  OAI22XL U597 ( .A0(n749), .A1(n239), .B0(n694), .B1(n246), .Y(n417) );
  AOI221XL U598 ( .A0(n238), .A1(n155), .B0(n180), .B1(n724), .C0(n247), .Y(
        n246) );
  OAI22XL U599 ( .A0(n244), .A1(n156), .B0(n699), .B1(n716), .Y(n247) );
  OAI22XL U600 ( .A0(n746), .A1(n226), .B0(n689), .B1(n233), .Y(n414) );
  AOI221XL U601 ( .A0(n225), .A1(n155), .B0(n180), .B1(n723), .C0(n234), .Y(
        n233) );
  OAI22XL U602 ( .A0(n231), .A1(n156), .B0(n699), .B1(n711), .Y(n234) );
  OAI22XL U603 ( .A0(n737), .A1(n170), .B0(n686), .B1(n179), .Y(n405) );
  AOI221XL U604 ( .A0(n155), .A1(n166), .B0(n180), .B1(n720), .C0(n181), .Y(
        n179) );
  OAI22XL U605 ( .A0(n176), .A1(n156), .B0(n699), .B1(n714), .Y(n181) );
  NOR2BX1 U606 ( .AN(n43), .B(n312), .Y(n315) );
  OAI21XL U607 ( .A0(n708), .A1(n310), .B0(n311), .Y(n445) );
  OAI2BB2XL U608 ( .B0(n670), .B1(n549), .A0N(N524), .A1N(n301), .Y(n439) );
  NOR2X2 U609 ( .A(n548), .B(n685), .Y(n180) );
  OAI22XL U610 ( .A0(n751), .A1(n253), .B0(n688), .B1(n255), .Y(n419) );
  AOI221XL U611 ( .A0(n252), .A1(n150), .B0(n173), .B1(n725), .C0(n257), .Y(
        n255) );
  OAI22XL U612 ( .A0(n698), .A1(n712), .B0(n259), .B1(n151), .Y(n257) );
  OAI22XL U613 ( .A0(n753), .A1(n253), .B0(n688), .B1(n263), .Y(n421) );
  AOI221XL U614 ( .A0(n252), .A1(n160), .B0(n184), .B1(n725), .C0(n264), .Y(
        n263) );
  OAI22XL U615 ( .A0(n700), .A1(n712), .B0(n259), .B1(n161), .Y(n264) );
  OAI22XL U616 ( .A0(n750), .A1(n239), .B0(n694), .B1(n248), .Y(n418) );
  AOI221XL U617 ( .A0(n238), .A1(n160), .B0(n184), .B1(n724), .C0(n249), .Y(
        n248) );
  OAI22XL U618 ( .A0(n244), .A1(n161), .B0(n700), .B1(n716), .Y(n249) );
  OAI22XL U619 ( .A0(n748), .A1(n239), .B0(n694), .B1(n241), .Y(n416) );
  AOI221XL U620 ( .A0(n238), .A1(n150), .B0(n173), .B1(n724), .C0(n243), .Y(
        n241) );
  OAI22XL U621 ( .A0(n244), .A1(n151), .B0(n698), .B1(n716), .Y(n243) );
  OAI22XL U622 ( .A0(n744), .A1(n211), .B0(n695), .B1(n220), .Y(n412) );
  AOI221XL U623 ( .A0(n209), .A1(n160), .B0(n184), .B1(n722), .C0(n221), .Y(
        n220) );
  OAI22XL U624 ( .A0(n216), .A1(n161), .B0(n700), .B1(n715), .Y(n221) );
  OAI22XL U625 ( .A0(n745), .A1(n226), .B0(n689), .B1(n228), .Y(n413) );
  AOI221XL U626 ( .A0(n225), .A1(n150), .B0(n173), .B1(n723), .C0(n230), .Y(
        n228) );
  OAI22XL U627 ( .A0(n231), .A1(n151), .B0(n698), .B1(n711), .Y(n230) );
  OAI22XL U628 ( .A0(n742), .A1(n211), .B0(n695), .B1(n213), .Y(n410) );
  AOI221XL U629 ( .A0(n209), .A1(n150), .B0(n173), .B1(n722), .C0(n215), .Y(
        n213) );
  OAI22XL U630 ( .A0(n216), .A1(n151), .B0(n698), .B1(n715), .Y(n215) );
  OAI22XL U631 ( .A0(n747), .A1(n226), .B0(n689), .B1(n235), .Y(n415) );
  AOI221XL U632 ( .A0(n225), .A1(n160), .B0(n184), .B1(n723), .C0(n236), .Y(
        n235) );
  OAI22XL U633 ( .A0(n231), .A1(n161), .B0(n700), .B1(n711), .Y(n236) );
  OAI22XL U634 ( .A0(n741), .A1(n196), .B0(n690), .B1(n205), .Y(n409) );
  AOI221XL U635 ( .A0(n190), .A1(n160), .B0(n184), .B1(n721), .C0(n206), .Y(
        n205) );
  OAI22XL U636 ( .A0(n201), .A1(n161), .B0(n700), .B1(n710), .Y(n206) );
  OAI22XL U637 ( .A0(n739), .A1(n196), .B0(n690), .B1(n198), .Y(n407) );
  AOI221XL U638 ( .A0(n190), .A1(n150), .B0(n173), .B1(n721), .C0(n200), .Y(
        n198) );
  OAI22XL U639 ( .A0(n201), .A1(n151), .B0(n698), .B1(n710), .Y(n200) );
  OAI22XL U640 ( .A0(n736), .A1(n170), .B0(n686), .B1(n172), .Y(n404) );
  AOI221XL U641 ( .A0(n166), .A1(n150), .B0(n173), .B1(n720), .C0(n175), .Y(
        n172) );
  OAI22XL U642 ( .A0(n176), .A1(n151), .B0(n698), .B1(n714), .Y(n175) );
  OAI22XL U643 ( .A0(n734), .A1(n267), .B0(n692), .B1(n273), .Y(n423) );
  NOR2X1 U644 ( .A(n180), .B(n153), .Y(n273) );
  OAI22XL U645 ( .A0(n756), .A1(n143), .B0(n696), .B1(n157), .Y(n403) );
  AOI221XL U646 ( .A0(n158), .A1(n146), .B0(n702), .B1(n709), .C0(n160), .Y(
        n157) );
  CLKINVX1 U647 ( .A(n161), .Y(n702) );
  OAI22XL U648 ( .A0(n755), .A1(n143), .B0(n696), .B1(n152), .Y(n402) );
  AOI221XL U649 ( .A0(n153), .A1(n146), .B0(n703), .B1(n709), .C0(n155), .Y(
        n152) );
  CLKINVX1 U650 ( .A(n156), .Y(n703) );
  OAI22XL U651 ( .A0(n754), .A1(n143), .B0(n696), .B1(n145), .Y(n401) );
  AOI221XL U652 ( .A0(n146), .A1(n147), .B0(n704), .B1(n709), .C0(n150), .Y(
        n145) );
  CLKINVX1 U653 ( .A(n151), .Y(n704) );
  OAI22XL U654 ( .A0(n738), .A1(n170), .B0(n686), .B1(n183), .Y(n406) );
  AOI221XL U655 ( .A0(n160), .A1(n166), .B0(n184), .B1(n720), .C0(n185), .Y(
        n183) );
  OAI22XL U656 ( .A0(n176), .A1(n161), .B0(n700), .B1(n714), .Y(n185) );
  OAI2BB2XL U657 ( .B0(n719), .B1(n321), .A0N(n321), .A1N(n294), .Y(n452) );
  NAND2X1 U658 ( .A(n322), .B(n697), .Y(n321) );
  OAI21XL U659 ( .A0(n296), .A1(n295), .B0(n323), .Y(n322) );
  OAI22XL U660 ( .A0(n733), .A1(n267), .B0(n692), .B1(n269), .Y(n422) );
  NOR2X1 U661 ( .A(n173), .B(n147), .Y(n269) );
  OAI22XL U662 ( .A0(n735), .A1(n267), .B0(n692), .B1(n276), .Y(n424) );
  NOR2X1 U663 ( .A(n184), .B(n158), .Y(n276) );
  AOI31X1 U664 ( .A0(N204), .A1(N205), .A2(N203), .B0(n259), .Y(n266) );
  OAI21XL U665 ( .A0(n231), .A1(n238), .B0(n550), .Y(n237) );
  OAI21XL U666 ( .A0(n201), .A1(n209), .B0(n550), .Y(n208) );
  NAND4X1 U667 ( .A(n550), .B(n713), .C(n717), .D(n718), .Y(n279) );
  CLKINVX1 U668 ( .A(n224), .Y(n693) );
  CLKINVX1 U669 ( .A(n239), .Y(n694) );
  CLKINVX1 U670 ( .A(n211), .Y(n695) );
  NAND2X2 U671 ( .A(n260), .B(n290), .Y(n162) );
  AND2X2 U672 ( .A(N390), .B(n260), .Y(n184) );
  CLKINVX1 U673 ( .A(n252), .Y(n725) );
  CLKINVX1 U674 ( .A(n225), .Y(n723) );
  CLKINVX1 U675 ( .A(n190), .Y(n721) );
  CLKINVX1 U676 ( .A(n238), .Y(n724) );
  NOR2X2 U677 ( .A(n528), .B(n676), .Y(n96) );
  NOR2X1 U678 ( .A(n146), .B(n166), .Y(n164) );
  NOR3X2 U679 ( .A(n717), .B(n713), .C(n718), .Y(n146) );
  OAI2BB1X1 U680 ( .A0N(n691), .A1N(n188), .B0(n189), .Y(n170) );
  OAI21XL U681 ( .A0(n176), .A1(n190), .B0(n550), .Y(n189) );
  OAI21XL U682 ( .A0(n732), .A1(n731), .B0(n720), .Y(n188) );
  NOR2X1 U683 ( .A(n706), .B(n684), .Y(n294) );
  CLKINVX1 U684 ( .A(n209), .Y(n722) );
  OAI22XL U685 ( .A0(n50), .A1(n730), .B0(n685), .B1(n290), .Y(n430) );
  NAND2X1 U686 ( .A(n731), .B(n732), .Y(n265) );
  CLKINVX1 U687 ( .A(n166), .Y(n720) );
  CLKINVX1 U688 ( .A(n244), .Y(n716) );
  CLKINVX1 U689 ( .A(n231), .Y(n711) );
  CLKINVX1 U690 ( .A(n216), .Y(n715) );
  CLKINVX1 U691 ( .A(n201), .Y(n710) );
  CLKINVX1 U692 ( .A(n176), .Y(n714) );
  CLKINVX1 U693 ( .A(n259), .Y(n712) );
  NOR2X1 U694 ( .A(n102), .B(n675), .Y(n66) );
  INVX3 U695 ( .A(n50), .Y(n697) );
  CLKINVX1 U696 ( .A(n323), .Y(n706) );
  CLKBUFX3 U697 ( .A(n69), .Y(n551) );
  NOR2X1 U698 ( .A(n38), .B(n707), .Y(n69) );
  CLKBUFX3 U699 ( .A(n300), .Y(n549) );
  OAI21XL U700 ( .A0(n302), .A1(n676), .B0(n697), .Y(n300) );
  XNOR2X1 U701 ( .A(n45), .B(n528), .Y(n302) );
  AO21X1 U702 ( .A0(n64), .A1(n758), .B0(n66), .Y(n346) );
  OAI21XL U703 ( .A0(n759), .A1(n528), .B0(n61), .Y(n64) );
  OAI22XL U704 ( .A0(n102), .A1(n744), .B0(n104), .B1(n750), .Y(n134) );
  OAI22XL U705 ( .A0(n102), .A1(n743), .B0(n104), .B1(n749), .Y(n121) );
  OAI22XL U706 ( .A0(n102), .A1(n742), .B0(n104), .B1(n748), .Y(n101) );
  OAI22XL U707 ( .A0(n106), .A1(n735), .B0(n108), .B1(n738), .Y(n133) );
  OAI22XL U708 ( .A0(n106), .A1(n734), .B0(n108), .B1(n737), .Y(n120) );
  OAI22XL U709 ( .A0(n106), .A1(n733), .B0(n108), .B1(n736), .Y(n100) );
  OAI211X1 U710 ( .A0(n707), .A1(n35), .B0(n36), .C0(n37), .Y(state_next[2])
         );
  OA21XL U711 ( .A0(n757), .A1(n528), .B0(n62), .Y(n61) );
  CLKBUFX3 U712 ( .A(n672), .Y(n553) );
  CLKINVX1 U713 ( .A(n661), .Y(n671) );
  CLKINVX1 U714 ( .A(n647), .Y(n667) );
  OAI32X1 U715 ( .A0(MatchCount[2]), .A1(n382), .A2(n677), .B0(n381), .B1(n77), 
        .Y(n385) );
  OAI22XL U716 ( .A0(n383), .A1(n82), .B0(n678), .B1(n83), .Y(n387) );
  NOR2XL U717 ( .A(N588), .B(n383), .Y(n83) );
  OAI21XL U718 ( .A0(n342), .A1(n71), .B0(n72), .Y(n384) );
  OA21XL U719 ( .A0(n76), .A1(MatchCount[2]), .B0(n77), .Y(n71) );
  OA21XL U720 ( .A0(n76), .A1(MatchCount[0]), .B0(n82), .Y(n79) );
  NAND2X1 U721 ( .A(state_current[1]), .B(state_current[0]), .Y(n36) );
  OAI22XL U722 ( .A0(n332), .A1(n680), .B0(n552), .B1(n761), .Y(n397) );
  OAI22XL U723 ( .A0(n339), .A1(n680), .B0(n552), .B1(n765), .Y(n390) );
  OAI22XL U724 ( .A0(n340), .A1(n680), .B0(n552), .B1(n666), .Y(n389) );
  OAI22XL U725 ( .A0(n333), .A1(n680), .B0(n552), .B1(n670), .Y(n396) );
  OAI22XL U726 ( .A0(n334), .A1(n680), .B0(n552), .B1(n762), .Y(n395) );
  OAI22XL U727 ( .A0(n338), .A1(n680), .B0(n552), .B1(n764), .Y(n391) );
  OAI22XL U728 ( .A0(n335), .A1(n680), .B0(n552), .B1(n763), .Y(n394) );
  OAI22XL U729 ( .A0(n336), .A1(n680), .B0(n552), .B1(n669), .Y(n393) );
  OAI22XL U730 ( .A0(n337), .A1(n680), .B0(n552), .B1(n668), .Y(n392) );
  OAI22XL U731 ( .A0(n341), .A1(n680), .B0(n552), .B1(n760), .Y(n388) );
  OAI2BB2XL U732 ( .B0(n765), .B1(n549), .A0N(N530), .A1N(n301), .Y(n433) );
  OAI2BB2XL U733 ( .B0(n666), .B1(n549), .A0N(N531), .A1N(n301), .Y(n432) );
  OAI2BB2XL U734 ( .B0(n760), .B1(n549), .A0N(N532), .A1N(n301), .Y(n441) );
  OAI211X1 U735 ( .A0(N281), .A1(n727), .B0(n726), .C0(N282), .Y(n320) );
  OAI211X1 U736 ( .A0(n573), .A1(n682), .B0(n284), .C0(n697), .Y(n428) );
  NAND3X1 U737 ( .A(n285), .B(n286), .C(n573), .Y(n284) );
  CLKINVX1 U738 ( .A(n287), .Y(n682) );
  OAI22XL U739 ( .A0(n683), .A1(N203), .B0(n574), .B1(n685), .Y(n285) );
  OAI211X1 U740 ( .A0(n370), .A1(n315), .B0(n314), .C0(n697), .Y(n450) );
  NAND2X1 U741 ( .A(n293), .B(n286), .Y(n287) );
  OAI22XL U742 ( .A0(n574), .A1(n294), .B0(n260), .B1(N203), .Y(n293) );
  OAI22XL U743 ( .A0(n371), .A1(n310), .B0(n368), .B1(n311), .Y(n446) );
  OAI22XL U744 ( .A0(n372), .A1(n310), .B0(n369), .B1(n311), .Y(n447) );
  OAI22XL U745 ( .A0(n373), .A1(n310), .B0(n370), .B1(n311), .Y(n448) );
  NAND2X1 U746 ( .A(n370), .B(n315), .Y(n314) );
  OAI2BB1XL U747 ( .A0N(n728), .A1N(N280), .B0(n318), .Y(n312) );
  OAI21XL U748 ( .A0(N280), .A1(n728), .B0(n319), .Y(n318) );
  OAI2BB1X1 U749 ( .A0N(n727), .A1N(N281), .B0(n320), .Y(n319) );
  OAI2BB2XL U750 ( .B0(n761), .B1(n549), .A0N(N523), .A1N(n301), .Y(n440) );
  NAND2X1 U751 ( .A(n288), .B(n697), .Y(n429) );
  XNOR2X1 U752 ( .A(n574), .B(n681), .Y(n288) );
  NAND2X1 U753 ( .A(n313), .B(n697), .Y(n449) );
  XNOR2X1 U754 ( .A(n369), .B(n314), .Y(n313) );
  NAND2X1 U755 ( .A(n316), .B(n697), .Y(n451) );
  XNOR2X1 U756 ( .A(n368), .B(n317), .Y(n316) );
  NAND2BX1 U757 ( .AN(n314), .B(n369), .Y(n317) );
  OAI221XL U758 ( .A0(next_sort), .A1(n706), .B0(n47), .B1(n707), .C0(n48), 
        .Y(state_next[0]) );
  OA22X1 U759 ( .A0(n35), .A1(n705), .B0(n54), .B1(n684), .Y(n47) );
  AOI211XL U760 ( .A0(n49), .A1(n684), .B0(Valid), .C0(n50), .Y(n48) );
  NOR2X1 U761 ( .A(n377), .B(n45), .Y(n54) );
  OA22X1 U762 ( .A0(n575), .A1(n564), .B0(N205), .B1(n563), .Y(n548) );
  CLKINVX1 U763 ( .A(N206), .Y(n592) );
  OAI21XL U764 ( .A0(n244), .A1(n252), .B0(n550), .Y(n250) );
  NAND3X1 U765 ( .A(n375), .B(n732), .C(n224), .Y(n251) );
  OAI21XL U766 ( .A0(n216), .A1(n225), .B0(n550), .Y(n222) );
  NAND3X1 U767 ( .A(n374), .B(n731), .C(n224), .Y(n223) );
  AND2X2 U768 ( .A(N401), .B(n260), .Y(n160) );
  AND2X2 U769 ( .A(N400), .B(n260), .Y(n155) );
  NOR3X2 U770 ( .A(n574), .B(n575), .C(N204), .Y(n238) );
  NOR3X2 U771 ( .A(N204), .B(n575), .C(N203), .Y(n225) );
  NOR3X2 U772 ( .A(n573), .B(n575), .C(N203), .Y(n252) );
  NOR3X2 U773 ( .A(N205), .B(n573), .C(N203), .Y(n190) );
  OAI221XL U774 ( .A0(n35), .A1(n38), .B0(n683), .B1(n719), .C0(n41), .Y(
        state_next[1]) );
  NOR3XL U775 ( .A(n42), .B(Valid), .C(n43), .Y(n41) );
  NOR4X1 U776 ( .A(n377), .B(n707), .C(n684), .D(n45), .Y(n42) );
  OAI22XL U777 ( .A0(n298), .A1(n299), .B0(n575), .B1(n732), .Y(n297) );
  NOR2X1 U778 ( .A(n375), .B(N204), .Y(n299) );
  AOI211X1 U779 ( .A0(n375), .A1(N204), .B0(N203), .C0(n630), .Y(n298) );
  NAND2X1 U780 ( .A(state_current[2]), .B(n705), .Y(n37) );
  AND2X2 U781 ( .A(N399), .B(n260), .Y(n150) );
  CLKINVX1 U782 ( .A(N213), .Y(n629) );
  CLKINVX1 U783 ( .A(N210), .Y(n610) );
  CLKINVX1 U784 ( .A(N209), .Y(n611) );
  AO22X1 U785 ( .A0(N666), .A1(n551), .B0(round[15]), .B1(n679), .Y(n348) );
  AO22X1 U786 ( .A0(N665), .A1(n551), .B0(round[14]), .B1(n679), .Y(n349) );
  NOR3X2 U787 ( .A(n373), .B(n371), .C(n717), .Y(n244) );
  NOR3X2 U788 ( .A(n713), .B(n371), .C(n717), .Y(n231) );
  NOR3X2 U789 ( .A(n373), .B(n372), .C(n718), .Y(n216) );
  NOR3X2 U790 ( .A(n713), .B(n372), .C(n718), .Y(n201) );
  NOR3X2 U791 ( .A(n717), .B(n373), .C(n718), .Y(n176) );
  NOR3X2 U792 ( .A(n372), .B(n371), .C(n713), .Y(n259) );
  NOR3X2 U793 ( .A(N204), .B(n574), .C(N205), .Y(n166) );
  NOR3X2 U794 ( .A(n574), .B(n573), .C(N205), .Y(n209) );
  OAI32X1 U795 ( .A0(n675), .A1(n380), .A2(n759), .B0(n379), .B1(n61), .Y(n344) );
  OAI211X1 U796 ( .A0(n630), .A1(n691), .B0(n207), .C0(n697), .Y(n426) );
  NAND2X1 U797 ( .A(state_current[1]), .B(n684), .Y(n38) );
  OAI211X1 U798 ( .A0(n326), .A1(n96), .B0(n309), .C0(n308), .Y(n444) );
  AO21X1 U799 ( .A0(n108), .A1(n104), .B0(n675), .Y(n309) );
  OAI211X1 U800 ( .A0(n327), .A1(n96), .B0(n307), .C0(n308), .Y(n443) );
  AO21X1 U801 ( .A0(n112), .A1(n110), .B0(n675), .Y(n307) );
  OAI22XL U802 ( .A0(n380), .A1(n62), .B0(n757), .B1(n675), .Y(n347) );
  CLKINVX1 U803 ( .A(n375), .Y(n731) );
  OAI22XL U804 ( .A0(n329), .A1(n96), .B0(n130), .B1(n675), .Y(n400) );
  NOR4X1 U805 ( .A(n131), .B(n132), .C(n133), .D(n134), .Y(n130) );
  OAI22XL U806 ( .A0(n110), .A1(n741), .B0(n112), .B1(n753), .Y(n132) );
  OAI22XL U807 ( .A0(n114), .A1(n747), .B0(n45), .B1(n756), .Y(n131) );
  OAI22XL U808 ( .A0(n330), .A1(n96), .B0(n117), .B1(n675), .Y(n399) );
  NOR4X1 U809 ( .A(n118), .B(n119), .C(n120), .D(n121), .Y(n117) );
  OAI22XL U810 ( .A0(n110), .A1(n740), .B0(n112), .B1(n752), .Y(n119) );
  OAI22XL U811 ( .A0(n114), .A1(n746), .B0(n45), .B1(n755), .Y(n118) );
  OAI22XL U812 ( .A0(n331), .A1(n96), .B0(n97), .B1(n675), .Y(n398) );
  NOR4X1 U813 ( .A(n98), .B(n99), .C(n100), .D(n101), .Y(n97) );
  OAI22XL U814 ( .A0(n110), .A1(n739), .B0(n112), .B1(n751), .Y(n99) );
  OAI22XL U815 ( .A0(n114), .A1(n745), .B0(n45), .B1(n754), .Y(n98) );
  NOR2X1 U816 ( .A(state_current[2]), .B(state_current[1]), .Y(n323) );
  OAI21XL U817 ( .A0(n377), .A1(n62), .B0(n674), .Y(n345) );
  CLKINVX1 U818 ( .A(N211), .Y(n609) );
  OAI211X1 U819 ( .A0(n374), .A1(n687), .B0(n697), .C0(n265), .Y(n427) );
  CLKINVX1 U820 ( .A(n207), .Y(n687) );
  CLKBUFX3 U821 ( .A(n191), .Y(n550) );
  NOR2X1 U822 ( .A(n36), .B(state_current[2]), .Y(n191) );
  OAI211X1 U823 ( .A0(n328), .A1(n96), .B0(n673), .C0(n674), .Y(n442) );
  CLKINVX1 U824 ( .A(n306), .Y(n673) );
  AOI31X1 U825 ( .A0(n114), .A1(n104), .A2(n112), .B0(n675), .Y(n306) );
  NAND2X1 U826 ( .A(n280), .B(n697), .Y(n425) );
  XNOR2X1 U827 ( .A(n375), .B(n207), .Y(n280) );
  AO22X1 U828 ( .A0(N664), .A1(n551), .B0(round[13]), .B1(n679), .Y(n350) );
  AO22X1 U829 ( .A0(N658), .A1(n551), .B0(round[7]), .B1(n679), .Y(n356) );
  AO22X1 U830 ( .A0(N660), .A1(n551), .B0(round[9]), .B1(n679), .Y(n354) );
  AO22X1 U831 ( .A0(N663), .A1(n551), .B0(round[12]), .B1(n679), .Y(n351) );
  AO22X1 U832 ( .A0(N662), .A1(n551), .B0(round[11]), .B1(n679), .Y(n352) );
  AO22X1 U833 ( .A0(N661), .A1(n551), .B0(round[10]), .B1(n679), .Y(n353) );
  AO22X1 U834 ( .A0(N659), .A1(n551), .B0(round[8]), .B1(n679), .Y(n355) );
  NAND3X1 U835 ( .A(n380), .B(n758), .C(n379), .Y(n114) );
  NAND3X1 U836 ( .A(n380), .B(n759), .C(n378), .Y(n110) );
  NAND3X1 U837 ( .A(n379), .B(n757), .C(n378), .Y(n108) );
  NOR4X1 U838 ( .A(round[9]), .B(round[7]), .C(round[14]), .D(round[13]), .Y(
        n58) );
  NAND4BX1 U839 ( .AN(n55), .B(n56), .C(n57), .D(n58), .Y(n35) );
  AND4X1 U840 ( .A(round[4]), .B(round[5]), .C(round[6]), .D(round[8]), .Y(n56) );
  AND4X1 U841 ( .A(round[15]), .B(round[1]), .C(round[2]), .D(round[3]), .Y(
        n57) );
  NAND4BX1 U842 ( .AN(round[0]), .B(round[10]), .C(round[11]), .D(round[12]), 
        .Y(n55) );
  OAI22XL U843 ( .A0(state_current[1]), .A1(n730), .B0(state_current[2]), .B1(
        n708), .Y(n49) );
  NAND3X1 U844 ( .A(n575), .B(n573), .C(n574), .Y(n163) );
  CLKINVX1 U845 ( .A(N214), .Y(n628) );
  AO22X1 U846 ( .A0(N651), .A1(n551), .B0(round[0]), .B1(n679), .Y(n364) );
  AO22X1 U847 ( .A0(N654), .A1(n551), .B0(round[3]), .B1(n679), .Y(n360) );
  AO22X1 U848 ( .A0(N657), .A1(n551), .B0(round[6]), .B1(n679), .Y(n357) );
  AO22X1 U849 ( .A0(N653), .A1(n551), .B0(round[2]), .B1(n679), .Y(n361) );
  AO22X1 U850 ( .A0(N656), .A1(n551), .B0(round[5]), .B1(n679), .Y(n358) );
  AO22X1 U851 ( .A0(N652), .A1(n551), .B0(round[1]), .B1(n679), .Y(n362) );
  AO22X1 U852 ( .A0(N655), .A1(n551), .B0(round[4]), .B1(n679), .Y(n359) );
  NOR2X1 U853 ( .A(n573), .B(n574), .Y(n569) );
  NOR2X1 U854 ( .A(n574), .B(N204), .Y(n567) );
  NOR2X1 U855 ( .A(N203), .B(N204), .Y(n566) );
  AO22X1 U856 ( .A0(\p[5][0] ), .A1(n567), .B0(\p[4][0] ), .B1(n566), .Y(n557)
         );
  AOI221XL U857 ( .A0(\p[6][0] ), .A1(n570), .B0(\p[7][0] ), .B1(n569), .C0(
        n557), .Y(n560) );
  AO22X1 U858 ( .A0(\p[1][0] ), .A1(n567), .B0(\p[0][0] ), .B1(n566), .Y(n558)
         );
  AOI221XL U859 ( .A0(\p[2][0] ), .A1(n570), .B0(\p[3][0] ), .B1(n569), .C0(
        n558), .Y(n559) );
  OAI22XL U860 ( .A0(n575), .A1(n560), .B0(N205), .B1(n559), .Y(N390) );
  AO22X1 U861 ( .A0(\p[5][1] ), .A1(n567), .B0(\p[4][1] ), .B1(n566), .Y(n561)
         );
  AOI221XL U862 ( .A0(\p[6][1] ), .A1(n570), .B0(\p[7][1] ), .B1(n569), .C0(
        n561), .Y(n564) );
  AO22X1 U863 ( .A0(\p[1][1] ), .A1(n567), .B0(\p[0][1] ), .B1(n566), .Y(n562)
         );
  AOI221XL U864 ( .A0(\p[2][1] ), .A1(n570), .B0(\p[3][1] ), .B1(n569), .C0(
        n562), .Y(n563) );
  AO22X1 U865 ( .A0(\p[5][2] ), .A1(n567), .B0(\p[4][2] ), .B1(n566), .Y(n565)
         );
  AOI221XL U866 ( .A0(\p[6][2] ), .A1(n570), .B0(\p[7][2] ), .B1(n569), .C0(
        n565), .Y(n572) );
  AO22X1 U867 ( .A0(\p[1][2] ), .A1(n567), .B0(\p[0][2] ), .B1(n566), .Y(n568)
         );
  AOI221XL U868 ( .A0(\p[2][2] ), .A1(n570), .B0(\p[3][2] ), .B1(n569), .C0(
        n568), .Y(n571) );
  OAI22XL U869 ( .A0(n572), .A1(n575), .B0(N205), .B1(n571), .Y(N388) );
  NOR2X1 U870 ( .A(n369), .B(N206), .Y(n589) );
  NOR2X1 U871 ( .A(n369), .B(n592), .Y(n588) );
  NOR2X1 U872 ( .A(n592), .B(N207), .Y(n586) );
  NOR2X1 U873 ( .A(N206), .B(N207), .Y(n585) );
  AO22X1 U874 ( .A0(\p[5][0] ), .A1(n586), .B0(\p[4][0] ), .B1(n585), .Y(n576)
         );
  AOI221XL U875 ( .A0(\p[6][0] ), .A1(n589), .B0(\p[7][0] ), .B1(n588), .C0(
        n576), .Y(n579) );
  AO22X1 U876 ( .A0(\p[1][0] ), .A1(n586), .B0(\p[0][0] ), .B1(n585), .Y(n577)
         );
  AOI221XL U877 ( .A0(\p[2][0] ), .A1(n589), .B0(\p[3][0] ), .B1(n588), .C0(
        n577), .Y(n578) );
  OAI22XL U878 ( .A0(n368), .A1(n579), .B0(N208), .B1(n578), .Y(N282) );
  AO22X1 U879 ( .A0(\p[5][1] ), .A1(n586), .B0(\p[4][1] ), .B1(n585), .Y(n580)
         );
  AOI221XL U880 ( .A0(\p[6][1] ), .A1(n589), .B0(\p[7][1] ), .B1(n588), .C0(
        n580), .Y(n583) );
  AO22X1 U881 ( .A0(\p[1][1] ), .A1(n586), .B0(\p[0][1] ), .B1(n585), .Y(n581)
         );
  AOI221XL U882 ( .A0(\p[2][1] ), .A1(n589), .B0(\p[3][1] ), .B1(n588), .C0(
        n581), .Y(n582) );
  OAI22XL U883 ( .A0(n368), .A1(n583), .B0(N208), .B1(n582), .Y(N281) );
  AO22X1 U884 ( .A0(\p[5][2] ), .A1(n586), .B0(\p[4][2] ), .B1(n585), .Y(n584)
         );
  AOI221XL U885 ( .A0(\p[6][2] ), .A1(n589), .B0(\p[7][2] ), .B1(n588), .C0(
        n584), .Y(n591) );
  AO22X1 U886 ( .A0(\p[1][2] ), .A1(n586), .B0(\p[0][2] ), .B1(n585), .Y(n587)
         );
  AOI221XL U887 ( .A0(\p[2][2] ), .A1(n589), .B0(\p[3][2] ), .B1(n588), .C0(
        n587), .Y(n590) );
  OAI22XL U888 ( .A0(n591), .A1(n368), .B0(N208), .B1(n590), .Y(N280) );
  NOR2X1 U889 ( .A(n610), .B(N209), .Y(n606) );
  NOR2X1 U890 ( .A(n610), .B(n611), .Y(n605) );
  NOR2X1 U891 ( .A(n611), .B(N210), .Y(n603) );
  NOR2X1 U892 ( .A(N209), .B(N210), .Y(n602) );
  AO22X1 U893 ( .A0(\p[5][0] ), .A1(n603), .B0(\p[4][0] ), .B1(n602), .Y(n593)
         );
  AOI221XL U894 ( .A0(\p[6][0] ), .A1(n606), .B0(\p[7][0] ), .B1(n605), .C0(
        n593), .Y(n596) );
  AO22X1 U895 ( .A0(\p[1][0] ), .A1(n603), .B0(\p[0][0] ), .B1(n602), .Y(n594)
         );
  AOI221XL U896 ( .A0(\p[2][0] ), .A1(n606), .B0(\p[3][0] ), .B1(n605), .C0(
        n594), .Y(n595) );
  OAI22XL U897 ( .A0(n609), .A1(n596), .B0(N211), .B1(n595), .Y(N311) );
  AO22X1 U898 ( .A0(\p[5][1] ), .A1(n603), .B0(\p[4][1] ), .B1(n602), .Y(n597)
         );
  AOI221XL U899 ( .A0(\p[6][1] ), .A1(n606), .B0(\p[7][1] ), .B1(n605), .C0(
        n597), .Y(n600) );
  AO22X1 U900 ( .A0(\p[1][1] ), .A1(n603), .B0(\p[0][1] ), .B1(n602), .Y(n598)
         );
  AOI221XL U901 ( .A0(\p[2][1] ), .A1(n606), .B0(\p[3][1] ), .B1(n605), .C0(
        n598), .Y(n599) );
  OAI22XL U902 ( .A0(n609), .A1(n600), .B0(N211), .B1(n599), .Y(N310) );
  AO22X1 U903 ( .A0(\p[5][2] ), .A1(n603), .B0(\p[4][2] ), .B1(n602), .Y(n601)
         );
  AOI221XL U904 ( .A0(\p[6][2] ), .A1(n606), .B0(\p[7][2] ), .B1(n605), .C0(
        n601), .Y(n608) );
  AO22X1 U905 ( .A0(\p[1][2] ), .A1(n603), .B0(\p[0][2] ), .B1(n602), .Y(n604)
         );
  AOI221XL U906 ( .A0(\p[2][2] ), .A1(n606), .B0(\p[3][2] ), .B1(n605), .C0(
        n604), .Y(n607) );
  OAI22XL U907 ( .A0(n608), .A1(n609), .B0(N211), .B1(n607), .Y(N309) );
  NOR2X1 U908 ( .A(n629), .B(N212), .Y(n625) );
  NOR2X1 U909 ( .A(n629), .B(n630), .Y(n624) );
  NOR2X1 U910 ( .A(n630), .B(N213), .Y(n622) );
  NOR2X1 U911 ( .A(N212), .B(N213), .Y(n621) );
  AO22X1 U912 ( .A0(\p[5][0] ), .A1(n622), .B0(\p[4][0] ), .B1(n621), .Y(n612)
         );
  AOI221XL U913 ( .A0(\p[6][0] ), .A1(n625), .B0(\p[7][0] ), .B1(n624), .C0(
        n612), .Y(n615) );
  AO22X1 U914 ( .A0(\p[1][0] ), .A1(n622), .B0(\p[0][0] ), .B1(n621), .Y(n613)
         );
  AOI221XL U915 ( .A0(\p[2][0] ), .A1(n625), .B0(\p[3][0] ), .B1(n624), .C0(
        n613), .Y(n614) );
  OAI22XL U916 ( .A0(n628), .A1(n615), .B0(N214), .B1(n614), .Y(N401) );
  AO22X1 U917 ( .A0(\p[5][1] ), .A1(n622), .B0(\p[4][1] ), .B1(n621), .Y(n616)
         );
  AOI221XL U918 ( .A0(\p[6][1] ), .A1(n625), .B0(\p[7][1] ), .B1(n624), .C0(
        n616), .Y(n619) );
  AO22X1 U919 ( .A0(\p[1][1] ), .A1(n622), .B0(\p[0][1] ), .B1(n621), .Y(n617)
         );
  AOI221XL U920 ( .A0(\p[2][1] ), .A1(n625), .B0(\p[3][1] ), .B1(n624), .C0(
        n617), .Y(n618) );
  OAI22XL U921 ( .A0(n628), .A1(n619), .B0(N214), .B1(n618), .Y(N400) );
  AO22X1 U922 ( .A0(\p[5][2] ), .A1(n622), .B0(\p[4][2] ), .B1(n621), .Y(n620)
         );
  AOI221XL U923 ( .A0(\p[6][2] ), .A1(n625), .B0(\p[7][2] ), .B1(n624), .C0(
        n620), .Y(n627) );
  AO22X1 U924 ( .A0(\p[1][2] ), .A1(n622), .B0(\p[0][2] ), .B1(n621), .Y(n623)
         );
  AOI221XL U925 ( .A0(\p[2][2] ), .A1(n625), .B0(\p[3][2] ), .B1(n624), .C0(
        n623), .Y(n626) );
  OAI22XL U926 ( .A0(n627), .A1(n628), .B0(N214), .B1(n626), .Y(N399) );
  NOR2X1 U927 ( .A(n573), .B(n575), .Y(n640) );
  NOR2X1 U928 ( .A(n575), .B(N204), .Y(n638) );
  NOR2X1 U929 ( .A(N205), .B(N204), .Y(n637) );
  AO22X1 U930 ( .A0(\p[4][0] ), .A1(n638), .B0(\p[0][0] ), .B1(n637), .Y(n631)
         );
  AOI221XL U931 ( .A0(\p[2][0] ), .A1(n641), .B0(\p[6][0] ), .B1(n640), .C0(
        n631), .Y(n633) );
  AOI222XL U932 ( .A0(\p[3][0] ), .A1(n573), .B0(\p[1][0] ), .B1(n641), .C0(
        \p[5][0] ), .C1(n640), .Y(n632) );
  OAI22XL U933 ( .A0(n574), .A1(n633), .B0(N203), .B1(n632), .Y(N326) );
  AO22X1 U934 ( .A0(\p[4][1] ), .A1(n638), .B0(\p[0][1] ), .B1(n637), .Y(n634)
         );
  AOI221XL U935 ( .A0(\p[2][1] ), .A1(n641), .B0(\p[6][1] ), .B1(n640), .C0(
        n634), .Y(n636) );
  AOI222XL U936 ( .A0(\p[3][1] ), .A1(n573), .B0(\p[1][1] ), .B1(n641), .C0(
        \p[5][1] ), .C1(n640), .Y(n635) );
  AO22X1 U937 ( .A0(\p[4][2] ), .A1(n638), .B0(\p[0][2] ), .B1(n637), .Y(n639)
         );
  AOI221XL U938 ( .A0(\p[2][2] ), .A1(n641), .B0(\p[6][2] ), .B1(n640), .C0(
        n639), .Y(n643) );
  AOI222XL U939 ( .A0(\p[3][2] ), .A1(n573), .B0(\p[1][2] ), .B1(n641), .C0(
        \p[5][2] ), .C1(n640), .Y(n642) );
  OAI22XL U940 ( .A0(n643), .A1(n574), .B0(N203), .B1(n642), .Y(N328) );
  OAI22XL U941 ( .A0(result[1]), .A1(n644), .B0(n644), .B1(n333), .Y(n646) );
  NAND2X1 U942 ( .A(result[7]), .B(n339), .Y(n658) );
  NAND2X1 U943 ( .A(result[6]), .B(n338), .Y(n653) );
  NOR3BXL U944 ( .AN(n653), .B(n647), .C(n654), .Y(n645) );
  NAND3X1 U945 ( .A(n646), .B(n658), .C(n645), .Y(n665) );
  NAND2X1 U946 ( .A(result[9]), .B(n341), .Y(n661) );
  NOR2X1 U947 ( .A(n663), .B(n662), .Y(n652) );
  NOR2BX1 U948 ( .AN(n781), .B(result[0]), .Y(n649) );
  OAI211X1 U949 ( .A0(n649), .A1(n670), .B0(n648), .C0(n660), .Y(n650) );
  OAI221XL U950 ( .A0(result[2]), .A1(n334), .B0(result[3]), .B1(n335), .C0(
        n650), .Y(n651) );
  AOI222XL U951 ( .A0(n776), .A1(n668), .B0(n777), .B1(n669), .C0(n652), .C1(
        n651), .Y(n656) );
  NAND2BX1 U952 ( .AN(n654), .B(n653), .Y(n655) );
  OAI222XL U953 ( .A0(n656), .A1(n655), .B0(result[6]), .B1(n338), .C0(
        result[7]), .C1(n339), .Y(n657) );
  NOR4X1 U954 ( .A(n665), .B(n664), .C(n663), .D(n662), .Y(N589) );
endmodule

