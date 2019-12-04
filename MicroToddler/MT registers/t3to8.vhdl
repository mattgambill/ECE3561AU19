LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY t3to8 IS
END t3to8;

ARCHITECTURE one OF t3to8 IS
  COMPONENT pri3to8 IS
    PORT (pri : IN std_logic_vector(2 downto 0);
          p0,p1,p2,p3,p4,p5,p6,p7 : OUT std_logic);
  END COMPONENT;
  FOR ALL : pri3to8 USE ENTITY WORK.pri3to8(one);
  SIGNAL pri : std_logic_vector(2 downto 0);
  SIGNAL p0,p1,p2,p3,p4,p5,p6,p7 : std_logic;
  

BEGIN
  U0 : pri3to8 PORT MAP (pri,p0,p1,p2,p3,p4,p5,p6,p7);

  PROCESS
  BEGIN 
    pri <= "000";
    WAIT FOR 10 ns;
    pri <= "001";
    WAIT FOR 10 ns;
    pri <= "010";
    WAIT FOR 10 ns;
    pri <= "011";
    WAIT FOR 10 ns;
    pri <= "100";
    WAIT FOR 10 ns;
    pri <= "101";
    WAIT FOR 10 ns;
    pri <= "110";
    WAIT FOR 10 ns;
    pri <= "111";
    WAIT FOR 10 ns;
    pri <= "000";
    WAIT FOR 10 ns;

  END PROCESS;

END one;