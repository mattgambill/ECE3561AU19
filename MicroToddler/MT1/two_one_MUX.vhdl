library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

ENTITY two_one_MUX IS
PORT(a : IN std_logic;
	b : IN std_logic;
	sel : IN std_logic;
	z : OUT std_logic);
END two_one_MUX;

ARCHITECTURE BEHAVIORAL OF two_one_MUX IS
BEGIN
z <= ((not(sel) and a) or  (sel and b));
END BEHAVIORAL;