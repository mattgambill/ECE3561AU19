LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY busdr_16_wide IS
	PORT (
		drive : IN STD_LOGIC; 
		data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		intbus : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
 
END busdr_16_wide;

ARCHITECTURE Behavioral OF busdr_16_wide IS

BEGIN
	intbus <= data WHEN (drive = '0') ELSE "ZZZZZZZZZZZZZZZZ";
END Behavioral;