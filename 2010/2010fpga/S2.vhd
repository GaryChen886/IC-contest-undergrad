library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity S2 is Port ( 
clk : in  STD_LOGIC;
      	rst 	: in 	STD_LOGIC;
       	S2_done 	: out 	STD_LOGIC;
       	RB2_RW 	: out 	STD_LOGIC;
       	RB2_A 	: out 	STD_LOGIC_VECTOR (2 downto 0);
       	RB2_D 	: out 	STD_LOGIC_VECTOR (17 downto 0);
       	RB2_Q 	: in 	STD_LOGIC_VECTOR (17 downto 0);
       	sen 	: in 	STD_LOGIC;
       	sd 	: in 	STD_LOGIC);
end S2;

architecture S2_arc of S2 is

begin


end S2_arc;
