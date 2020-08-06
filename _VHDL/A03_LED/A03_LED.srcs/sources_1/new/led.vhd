
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led is
    Port ( 
           BTNL : In STD_LOGIC;
           BTNR : IN STD_LOGIC;
           LD0 : OUT STD_LOGIC;
           LD1 : OUT STD_LOGIC;
           LD2 : OUT STD_LOGIC;
           LD3 : OUT STD_LOGIC;
           LD4 : OUT STD_LOGIC;
           LD5 : OUT STD_LOGIC;
           LD6 : OUT STD_LOGIC;
           LD7 : OUT STD_LOGIC
           );
end led;

architecture Behavioral of led is

begin

LD0 <= BTNR;
LD1 <= BTNR;
LD2 <= BTNR;
LD3 <= BTNR;
LD4 <= BTNL;
LD5 <= BTNL;
LD6 <= BTNL;
LD7 <= BTNL;

end Behavioral;
