library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
ENTITY tbBUSDR_16_WIDE IS
END tbBUSDR_16_WIDE;

ARCHITECTURE one OF tbBUSDR_16_WIDE IS
	COMPONENT BUSDR_16_WIDE
	PORT (
		drive : IN STD_LOGIC;
		data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		intbus : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
	END COMPONENT;

SIGNAL data_i,data_o   :   std_logic_vector(15 downto 0) := "0000000000000000";
SIGNAL s1 : std_logic_vector(3 downto 0);
signal i   : integer := 0;
SIGNAL en : std_logic :='0';
SIGNAL clk : std_logic :='1';

BEGIN
	busdr0 : BUSDR_16_WIDE PORT MAP(en,data_i,data_o);


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
	data_i(i) <= s1(1);
end loop;
END PROCESS;
END one;
