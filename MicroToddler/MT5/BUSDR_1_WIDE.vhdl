LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY busdr IS
	PORT (
		drive : IN STD_LOGIC; 
		data : IN STD_LOGIC;
		intbus : OUT STD_LOGIC
	);
 
END busdr;

ARCHITECTURE Behavioral OF busdr IS

BEGIN
	intbus <= data WHEN (drive = '0') ELSE 'Z';
END Behavioral;