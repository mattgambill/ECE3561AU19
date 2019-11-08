library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
ENTITY tbdff_en_16_wide IS
END tbdff_en_16_wide;

ARCHITECTURE one OF tbdff_en_16_wide IS
	COMPONENT dff_en_16_wide
	port(clk : IN std_logic; d,en : IN std_logic_vector(15 downto 0); q : OUT std_logic_vector(15 downto 0));
	END COMPONENT;

SIGNAL d,q,en   :   std_logic_vector(15 downto 0) := "0000000000000000";
SIGNAL s1 : std_logic_vector(3 downto 0);
signal i   : integer := 0;

SIGNAL clk : std_logic :='1';
BEGIN
	dff0 : dff_en_16_wide PORT MAP(clk, d,en,q);


	clk <= NOT clk AFTER 10 ns;

PROCESS(clk)
BEGIN

IF (i<4) THEN
	s1  <= conv_std_logic_vector(i, s1'length);


	i <= i + 1;
ELSE
	i<=0;
	en <= NOT en;
END IF;
for i in 15 downto 0 loop
	d(i) <= s1(1);
end loop;
END PROCESS;

END one;
