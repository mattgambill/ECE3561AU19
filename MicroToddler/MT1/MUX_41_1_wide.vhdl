library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

ENTITY MUX_41_1_wide IS
port(a,b,c,d,sel_0,sel_1 : IN std_logic; z : OUT std_logic);
END MUX_41_1_wide;

ARCHITECTURE BEHAVIORAL OF MUX_41_1_wide IS
	COMPONENT two_one_MUX
		PORT(a,b,sel: IN std_logic; z: OUT std_logic);
	END COMPONENT;
SIGNAL z0,z1 :  std_logic :='0';
Begin

mux0 : two_one_MUX PORT MAP(a,b,sel_0,z0);
mux1 : two_one_MUX PORT MAP(c,d,sel_0,z1);
mux2 : two_one_MUX PORT MAP(z0,z1,sel_1,z);
END BEHAVIORAL;