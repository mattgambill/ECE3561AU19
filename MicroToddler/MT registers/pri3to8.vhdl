LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY pri3to8 IS
  PORT (pri : IN std_logic_vector(2 downto 0);
        p0,p1,p2,p3,p4,p5,p6,p7 : OUT std_logic);
END pri3to8;

ARCHITECTURE one OF pri3to8 IS
BEGIN
   p0 <= NOT pri(2) AND NOT pri(1) and NOT pri(0);
   p1 <= NOT pri(2) AND NOT pri(1) and     pri(0);
   p2 <= NOT pri(2) AND     pri(1) and NOT pri(0);
   p3 <= NOT pri(2) AND     pri(1) and     pri(0);
   p4 <=     pri(2) AND NOT pri(1) and NOT pri(0);
   p5 <=     pri(2) AND NOT pri(1) and     pri(0);
   p6 <=     pri(2) AND     pri(1) and NOT pri(0);
   p7 <=     pri(2) AND     pri(1) and     pri(0);

END one;
        