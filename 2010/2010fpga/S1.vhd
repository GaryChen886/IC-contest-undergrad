library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity S1 is Port ( 
        clk    	: in  	STD_LOGIC;
	rst 	: in  	STD_LOGIC;
     	RB1_RW 	: out 	STD_LOGIC;
     	RB1_A 	: out 	STD_LOGIC_VECTOR (4 downto 0);
      	RB1_D 	: out 	STD_LOGIC_VECTOR (7 downto 0);
      	RB1_Q 	: in  	STD_LOGIC_VECTOR (7 downto 0);
      	sen 	: out 	STD_LOGIC;
      	sd 		: out 	STD_LOGIC);
end S1;

architecture S1_arc of S1 is

begin


end S1_arc;
