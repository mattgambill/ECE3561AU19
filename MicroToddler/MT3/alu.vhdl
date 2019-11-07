library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity addSub IS
port(A,B,operation :  IN std_logic_vector(15 downto 0); sum : OUT std_logic_vector(15 downto 0)); 
end addSub;

ARCHITECTURE rtl of addSub IS
SIGNAL Cvec std_logic_vector(15 downto 0);
BEGIN

END rtl;
