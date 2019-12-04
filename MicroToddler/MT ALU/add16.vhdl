LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY add16 IS
  PORT (a,b : IN std_logic_vector (15 downto 0);
        cin : IN std_logic;
        sum : OUT std_logic_vector (15 downto 0);
        cout : OUT std_logic);
END add16;

ARCHITECTURE one OF add16 IS
  SIGNAL carry : std_logic_vector (16 downto 0);
BEGIN
  sum <= a XOR b XOR carry(15 downto 0);
  carry(0) <= cin;
  carry(16 downto 1) <= (a and b) OR (a AND carry(15 downto 0)) OR
                             (b AND carry(15 downto 0));
  cout <= carry(16);
END one;