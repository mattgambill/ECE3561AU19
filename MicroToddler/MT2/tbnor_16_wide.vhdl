LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
ENTITY tbnor_16_wide IS
END ENTITY;

ARCHITECTURE one OF tbnor_16_wide IS

	COMPONENT nor_16_wide
		PORT (
			input : IN std_logic_vector(15 DOWNTO 0);
			z     : OUT std_logic);
	END COMPONENT;

	SIGNAL s1 : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
	SIGNAL z : std_logic := '0';

BEGIN
  ng16_0  : nor_16_wide PORT MAP(s1,z);
  process
  begin
    FOR i IN 0 TO 15 LOOP
      s1(i) <= '1';
      WAIT for 10 ns;
      s1 <= "0000000000000000";
      WAIT for 10 ns;
    END LOOP;
  end process;

END ARCHITECTURE;
