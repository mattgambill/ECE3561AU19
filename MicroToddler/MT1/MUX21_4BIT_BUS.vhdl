library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
-- input is 4 bits, input(0) =  a,input(1) = b, input(2) = sel
ENTITY MUX21_4BIT_BUS IS
PORT(input : IN std_logic_vector(3 downto 0); output  : OUT std_logic_vector(3 downto 0) );
END MUX21_4BIT_BUS;

ARCHITECTURE BEHAVIORAL OF MUX21_4BIT_BUS IS
BEGIN
output(0) <= ((not(input(2)) and input(0)) or  (input(2) and input(1)));
END BEHAVIORAL;
