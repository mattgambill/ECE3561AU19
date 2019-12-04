LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY mux2_to_1x16 IS
   PORT (a,b : IN std_logic_vector(15 downto 0);
         sa,sb : IN std_logic;
         muxout : OUT std_logic_vector(15 downto 0));
END mux2_to_1x16;

ARCHITECTURE one OF mux2_to_1x16 IS
   SIGNAL vsel : std_logic_vector(15 downto 0);
BEGIN
   -- vsel <= s0 & s0 & s0 & s0 & s0 & s0 & s0 & s0 & s0 & s0 & s0 & s0 & s0 & s0 & s0 & s0;
   muxout <= a WHEN sa = '1' ELSE b WHEN sb = '1' ELSE "ZZZZZZZZZZZZZZZZ";
   --muxout <= (NOT vsel AND a) OR (vsel AND b);
END one;
