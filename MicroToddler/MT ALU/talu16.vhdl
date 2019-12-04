LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY talu16 IS
END talu16;

ARCHITECTURE one OF talu16 IS
COMPONENT alu IS
  PORT (a,b : IN std_logic_vector(15 downto 0);
        cin,arlo : IN std_logic;
        cout : OUT std_logic;
        ltt : IN std_logic_vector(0 to 3);
        res : OUT std_logic_vector(15 downto 0));
END COMPONENT;
FOR ALL: alu USE ENTITY work.alu(one);

SIGNAL a,b,res : std_logic_vector(15 downto 0);
SIGNAL cin,arlo,cout : std_logic;
SIGNAL ltt : std_logic_vector(0 to 3);



BEGIN
dut0 : alu PORT MAP (a,b,cin,arlo,cout,ltt,res);

PROCESS
BEGIN
  a <= "0000000000000000"; b <= "1111111111111111";
  cin <= '0'; arlo <= '1'; ltt <= "0111";
  WAIT FOR 10 ns;
  cin <= '1';
  WAIT FOR 10 ns;
  a <= "0000111100001111"; b <= "0000000011111111";
  WAIT FOR 10 ns;
  arlo <= '0';
  WAIT FOR 10 ns;
  a <= "1111111100001111"; b <= "0000000011111111";
  WAIT FOR 10 ns;
  arlo <= '1'; ltt <= "0001";
  a <= "0000111100001111"; b <= "0000000011111111";
  WAIT FOR 10 ns;
  arlo <= '1'; ltt <= "0110";
  a <= "0000111100001111"; b <= "0000000011111111";


  WAIT;
END PROCESS;


END one;