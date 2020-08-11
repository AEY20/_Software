library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity simple_counter is
       Port ( 
                  clk    : in  STD_LOGIC;
                  start  : in  STD_LOGIC;
                  output : out  STD_LOGIC_VECTOR (7 downto 0));
end simple_counter;

architecture Behavioral of simple_counter is
      signal counter:STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
begin
      process(clk,start)
      begin
          if start = '1' then
                if rising_edge(clk) then
                       counter<=counter +1;
                end if;
          else
               counter<=(others=>'0');
          end if;
      end process;
     output <= counter;
end Behavioral;