library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

Entity dff_en_16_wide IS
port(clk : IN std_logic; d,en : IN std_logic_vector(15 downto 0); q : OUT std_logic_vector(15 downto 0));
End dff_en_16_wide;

ARCHITECTURE BEHAVIORAL OF dff_en_16_wide IS
BEGIN
Process
BEGIN
Wait UNTIL clk='1' AND clk'event;
for i in 15 downto 0 loop
IF en(i)='1' THEN
q(i)<=d(i);
END IF;
end loop;
END PROCESS;
END BEHAVIORAL;
