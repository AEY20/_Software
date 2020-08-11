library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sayac is
    Port ( 
               CLK     : in STD_LOGIC;
               RESET   : in STD_LOGIC;
               SELECT_b: in STD_LOGIC;
               OUTPUT  : out STD_LOGIC_VECTOR (3 downto 0));
    end SAYAC;

architecture Behavioral of sayac is
     Signal Counter: std_logic_vector(26 downto 0):=(others=>'0');
begin
     process(CLK,RESET)
     begin
          if RESET= '1' then
                 counter<=(others=>'0');
          elsif CLK= '1' and CLK'event then
                 counter<=counter+ '1';
          end if;
     end process;
      --seçim kýsmý
     OUTPUT <= counter(26 downto 23) when  SELECT_b ='1'  else
                            counter(24 downto 21);

end Behavioral;