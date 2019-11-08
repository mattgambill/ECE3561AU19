library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
ENTITY tbdff_en IS
END tbdff_en;

ARCHITECTURE one OF tbdff_en IS
	COMPONENT dff_en
		port(d,clk,en : IN std_logic; q : OUT std_logic);
	END COMPONENT;

SIGNAL d,q,en   :   std_logic := '0';
SIGNAL s1 : std_logic_vector(3 downto 0);
signal i   : integer := 0;

SIGNAL clk : std_logic :='1';
BEGIN
	dff0 : dff_en PORT MAP(d,clk,en,q);


	clk <= NOT clk AFTER 10 ns;

PROCESS(clk)
BEGIN

IF (i<4) THEN
	s1  <= conv_std_logic_vector(i, s1'length);

	d <= s1(1);
	i <= i + 1;
ELSE
	i<=0;
	en <= NOT en;
END IF;

END PROCESS;

END one;
