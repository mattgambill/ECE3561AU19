LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY BUSDR_1_WIDE IS
	PORT (
		drive : IN STD_LOGIC;
		data : IN STD_LOGIC;
		intbus : OUT STD_LOGIC
	);

END BUSDR_1_WIDE;

ARCHITECTURE Behavioral OF BUSDR_1_WIDE IS

BEGIN
	intbus <= data WHEN (drive = '1') ELSE 'Z';
END Behavioral;
