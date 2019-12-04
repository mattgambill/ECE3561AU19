LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY log16 IS
  PORT(a,b : IN std_logic_vector(15 downto 0);
       res : OUT std_logic_vector(15 downto 0);
       ltt : IN std_logic_vector(0 to 3));
END log16;

ARCHITECTURE one OF log16 IS

BEGIN
  res <= (NOT a AND NOT b AND 
          ltt(0)&ltt(0)&ltt(0)&ltt(0)&ltt(0)&ltt(0)&ltt(0)&ltt(0)&ltt(0)&ltt(0)&ltt(0)&ltt(0)&ltt(0)&ltt(0)&ltt(0)&ltt(0)) OR
         (NOT a AND     b AND 
          ltt(1)&ltt(1)&ltt(1)&ltt(1)&ltt(1)&ltt(1)&ltt(1)&ltt(1)&ltt(1)&ltt(1)&ltt(1)&ltt(1)&ltt(1)&ltt(1)&ltt(1)&ltt(1)) OR
         (    a AND NOT b AND
          ltt(2)&ltt(2)&ltt(2)&ltt(2)&ltt(2)&ltt(2)&ltt(2)&ltt(2)&ltt(2)&ltt(2)&ltt(2)&ltt(2)&ltt(2)&ltt(2)&ltt(2)&ltt(2)) OR
         (    a AND     b AND
          ltt(3)&ltt(3)&ltt(3)&ltt(3)&ltt(3)&ltt(3)&ltt(3)&ltt(3)&ltt(3)&ltt(3)&ltt(3)&ltt(3)&ltt(3)&ltt(3)&ltt(3)&ltt(3));
END one;