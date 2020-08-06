library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led_yakma is
  Port (
        in_clk : in std_logic;
        in_rst : in std_logic;
        out_clk_1hz : out std_logic;
        out_clk_1_2hz : out std_logic;
        out_clk_1_4hz : out std_logic;
        out_clk_1_8hz : out std_logic;
        out_clk_1_16hz : out std_logic;
        out_clk_1_nhz : out std_logic
         );
end led_yakma;

architecture Behavioral of led_yakma is
    
    component saat_frekans_bolucu
    generic(
            n : integer :=16
            );
    port (
            in_clk : in std_logic;
            in_rst : in std_logic;
            out_clk_2 : out std_logic;
            out_clk_4 : out std_logic;
            out_clk_8 : out std_logic;
            out_clk_16 : out std_logic;
            out_clk_n : out std_logic
            );
end component;

    signal r_clk_1hz_d : std_logic := '0';
    signal r_clk_1hz : std_logic_vector(3 downto 0) := (others => '0');
    signal r_clk_1_2hz : std_logic := '0';
    signal r_clk_1_4hz : std_logic := '0';
    signal r_clk_1_8hz : std_logic := '0';
    signal r_clk_1_16hz : std_logic := '0';
    signal r_clk_1_nhz : std_logic := '0';

begin

    out_clk_1hz <= r_clk_1hz(3);
    out_clk_1_2hz <= r_clk_1_2hz;
    out_clk_1_4hz <= r_clk_1_4hz;
    out_clk_1_8hz <= r_clk_1_8hz;
    out_clk_1_16hz <= r_clk_1_16hz;
    out_clk_1_nhz <= r_clk_1_nhz;
    
    saat_frekans_bolucu1_map : saat_frekans_bolucu
    generic map( n => 100000000 )
    port map (
            in_clk => in_clk,
            in_rst => in_rst,
            out_clk_2 => open,
            out_clk_4 => open,
            out_clk_8 => open,
            out_clk_16 => open,
            out_clk_n => r_clk_1hz_d
            );
            
    process(in_clk, in_rst)
    begin
        if in_rst = '1' then
          r_clk_1hz <= (others => '0');
        elsif rising_edge(in_clk) then
          r_clk_1hz <= r_clk_1hz(2 downto 0) & r_clk_1hz_d;
        end if;
    end process;
    
    saat_frekans_bolucu2_map : saat_frekans_bolucu
    generic map( n => 32 )
    port map(
            in_clk => r_clk_1hz(3),
            in_rst => in_rst,
            out_clk_2 => r_clk_1_2hz,
            out_clk_4 => r_clk_1_4hz,
            out_clk_8 => r_clk_1_8hz,
            out_clk_16 => r_clk_1_16hz,
            out_clk_n => r_clk_1_nhz
            );
          

end Behavioral;
