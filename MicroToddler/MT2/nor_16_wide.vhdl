library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

Entity nor_16_wide IS
port(input : IN std_logic_vector(15 downto 0); z : OUT std_logic);
End nor_16_wide;


ARCHITECTURE BEHAVIORAL OF nor_16_wide IS
BEGIN
	z <= not(input(0) or input(1) or input(2) or input(3) or input(4) or input(5) or input(6) or input(7) or input(8) or input(9) or input(10) or input(11) or input(12) or input(13) or input(14) or input(15));
END BEHAVIORAL;
