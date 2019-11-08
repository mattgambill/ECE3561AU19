LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
ENTITY tbMUX21_4_BIT_BUS IS
END tbMUX21_4_BIT_BUS;

ARCHITECTURE one OF tbMUX21_4_BIT_BUS IS
	COMPONENT MUX21_4BIT_BUS
		PORT (
			input : IN std_logic_vector(3 DOWNTO 0);
			output : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL z : std_logic_vector(3 DOWNTO 0);
	SIGNAL s1, s2 : std_logic_vector(3 DOWNTO 0) := "0000";
	SIGNAL i : INTEGER := 0;

	SIGNAL clk : BIT := '1';
BEGIN
	mux1 : MUX21_4BIT_BUS
	PORT MAP(s2, z);
	clk <= NOT clk AFTER 10 ns;

	PROCESS (clk)
	BEGIN
		IF (i < 4) THEN
			s1 <= conv_std_logic_vector(i, s1'length);
			s2(0) <= s1(0);
			s2(1) <= s1(1);
			i <= i + 1;
		ELSE
			i <= 0;
			s2(2) <= NOT s2(2);
		END IF;

	END PROCESS;

END one;
