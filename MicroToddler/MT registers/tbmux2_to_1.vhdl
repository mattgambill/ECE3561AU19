LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY tbmux_2to_2 IS
END tbmux_2to_2;

ARCHITECTURE one OF tbmux_2to_2 IS
-- declare and ccnfigure unit
COMPONENT mux2_to_1 IS
   PORT (a,b : IN std_logic;
         s0 : IN std_logic;
         muxout : OUT std_logic);
END COMPONENT;
FOR all: mux2_to_1 USE ENTITY work.mux2_to_1(one);

SIGNAL d0,d1,sel,muxtbout :std_logic;

BEGIN
--instantiate
m1 : mux2_to_1 PORT MAP(d0,d1,sel,muxtbout);

PROCESS
BEGIN 
  d0 <= '0';  d1<= '0';  sel <= '0';
  WAIT FOR 10 ns;
  d0 <= '0';  d1<= '0';  sel <= '1';
  WAIT FOR 10 ns;
  d0 <= '1';  d1<= '0';  sel <= '0';
  WAIT FOR 10 ns;
  d0 <= '1';  d1<= '0';  sel <= '1';
  WAIT FOR 10 ns;
  d0 <= '0';  d1<= '1';  sel <= '0';
  WAIT FOR 10 ns;
  d0 <= '0';  d1<= '1';  sel <= '1';
  WAIT FOR 10 ns;
  d0 <= '0';  d1<= '0';  sel <= '0';
  WAIT FOR 10 ns;
  d0 <= '0';  d1<= '0';  sel <= '1';
  WAIT FOR 10 ns;

END PROCESS;

END one;