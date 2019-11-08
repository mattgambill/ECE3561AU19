library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
ENTITY tbBUSDR_1_WIDE IS
END tbBUSDR_1_WIDE;

ARCHITECTURE one OF tbBUSDR_1_WIDE IS
	COMPONENT BUSDR_1_WIDE
	PORT (
		drive : IN STD_LOGIC;
		data : IN STD_LOGIC;
		intbus : OUT STD_LOGIC
	);
	END COMPONENT;

SIGNAL en,data_i,data_o   :   std_logic := '0';
SIGNAL s1 : std_logic_vector(3 downto 0);
signal i   : integer := 0;

SIGNAL clk : std_logic :='1';
BEGIN
	busdr0 : BUSDR_1_WIDE PORT MAP(en,data_i,data_o);


	clk <= NOT clk AFTER 10 ns;

PROCESS(clk)
BEGIN

IF (i<4) THEN
	s1  <= conv_std_logic_vector(i, s1'length);

	data_i <= s1(1);
	i <= i + 1;
ELSE
	i<=0;
	en <= NOT en;
END IF;

END PROCESS;

END one;
