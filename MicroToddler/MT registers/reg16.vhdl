LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY reg16 IS
   PORT (din  : IN  std_logic_vector(15 downto 0);
         dout : OUT std_logic_vector(15 downto 0);
         load : IN std_logic);
END reg16;

ARCHITECTURE one OF reg16 IS

BEGIN
   PROCESS(load)
   BEGIN
      IF load = '1' and load'event THEN
         dout <= din;
      END IF;
      --WAIT ON load;
   END PROCESS;
END one;