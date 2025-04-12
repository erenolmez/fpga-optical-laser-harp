library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seven_seg_driver is
 Port(show_anode_0 : in STD_LOGIC_VECTOR (3 downto 0);
 show_anode_1 : in STD_LOGIC_VECTOR (3 downto 0);
 show_anode_2 : in STD_LOGIC_VECTOR (3 downto 0);
 show_anode_3: in STD_LOGIC_VECTOR (3 downto 0);
 seven_seg_zero : out STD_LOGIC;
 seven_seg_one : out STD_LOGIC;
 seven_seg_two : out STD_LOGIC;
 seven_seg_three: out STD_LOGIC;
 seven_seg_four : out STD_LOGIC;
 seven_seg_five : out STD_LOGIC;
 seven_seg_six : out STD_LOGIC;
 choose_show_zero : out STD_LOGIC;
 choose_show_one: out STD_LOGIC;
 choose_show_two : out STD_LOGIC;
 choose_show_three : out STD_LOGIC;
 clock : in STD_LOGIC);
end seven_seg_driver;

architecture Behavioral of seven_seg_driver is
component seven_seg_decode is
Port(no_at_segment : in STD_LOGIC_VECTOR (3 downto 0);
 segment : out STD_LOGIC_VECTOR(6 downto 0));
 end component seven_seg_decode;
 
 component clock_division_7segment is
 Port (clock : in STD_LOGIC;
 en : in STD_LOGIC;
 res : in STD_LOGIC;
 seg_clk : out STD_LOGIC_VECTOR (15 downto 0));
end component clock_division_7segment;

signal data_not_permanent: std_logic_vector(3 downto 0);
signal w_clk: std_logic_vector(15 downto 0);
signal low_paced_seg_clk: std_logic;
begin
uut0_decoder: seven_seg_decode port map(
no_at_segment => data_not_permanent,
segment(0) =>  seven_seg_zero,
segment(1) =>  seven_seg_one,
segment(2) =>  seven_seg_two,
segment(3) =>  seven_seg_three,
segment(4) =>  seven_seg_four,
segment(5) =>  seven_seg_five,
segment(6) =>  seven_seg_six);

uut1_clock: clock_division_7segment port map(
clock => clock,
en => '1',
res => '0',
seg_clk => w_clk);
low_paced_seg_clk <= w_clk(15);

process(low_paced_seg_clk)
variable determine_the_anode: std_logic_vector(1 downto 0);
begin

if low_paced_seg_clk'event and low_paced_seg_clk = '1' then
case (determine_the_anode) is
when "00" => data_not_permanent <= show_anode_0;
 choose_show_zero <= '0';
 choose_show_one <= '1';
 choose_show_two <= '1';
 choose_show_three <= '1';
 determine_the_anode := determine_the_anode+'1';
 
when "01" => data_not_permanent <= show_anode_1;
 choose_show_zero <= '1';
 choose_show_one <= '0';
 choose_show_two <= '1';
 choose_show_three <= '1';
 determine_the_anode := determine_the_anode+'1';
 
 when "10" => data_not_permanent <= show_anode_2;
 choose_show_zero <= '1';
 choose_show_one <= '1';
 choose_show_two <= '0';
 choose_show_three <= '1';
 determine_the_anode := determine_the_anode+'1';
 
 when others => data_not_permanent <= show_anode_3;
 choose_show_zero  <= '1';
 choose_show_one   <= '1';
 choose_show_two   <= '1';
 choose_show_three <= '0';
 determine_the_anode := determine_the_anode+'1';
 
 end case;
 end if;
 end process;
 end Behavioral;