----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/21/2020 03:24:19 PM
-- Design Name: 
-- Module Name: design_laser_harp - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity design_laser_harp is
Port (sensor_signal: in std_logic_vector(6 downto 0);
clock: in std_logic;
selection: in std_logic;
turn_off: in std_logic;
seg_anode: out STD_LOGIC_VECTOR(3 downto 0);
seg_cathode: out STD_LOGIC_VECTOR(6 downto 0);
output_note: out std_logic;
output_LED: out std_logic_vector(6 downto 0);
horiz_sync,vertic_sync:OUT STD_LOGIC;
Red_out,Blue_out,Green_out: OUT STD_LOGIC_VECTOR(3 downto 0)
);

end design_laser_harp;

architecture Behavioral of design_laser_harp is
component seven_seg_driver is
Port (show_anode_0 : in STD_LOGIC_VECTOR (3 downto 0);
show_anode_1 : in STD_LOGIC_VECTOR (3 downto 0);
show_anode_2 : in STD_LOGIC_VECTOR (3 downto 0);
show_anode_3 : in STD_LOGIC_VECTOR (3 downto 0);
seven_seg_zero : out STD_LOGIC;
seven_seg_one : out STD_LOGIC;
seven_seg_two : out STD_LOGIC;
seven_seg_three : out STD_LOGIC;
seven_seg_four : out STD_LOGIC;
seven_seg_five : out STD_LOGIC;
seven_seg_six : out STD_LOGIC;
choose_show_zero : out STD_LOGIC;
choose_show_one : out STD_LOGIC;
choose_show_two : out STD_LOGIC;
choose_show_three : out STD_LOGIC;
clock : in STD_LOGIC);
end component seven_seg_driver;

component VGA_image_generator is
Port(clock: in STD_LOGIC;
VGA_input: in STD_LOGIC_VECTOR(6 downto 0);
color_Red: out STD_LOGIC_VECTOR(3 downto 0);
color_Green: out STD_LOGIC_VECTOR(3 downto 0);
color_Blue: out STD_LOGIC_VECTOR(3 downto 0);
H_S: out STD_LOGIC;
V_S: out STD_LOGIC
);
end component VGA_image_generator;

component clock_division_VGA
Port(clock : in std_logic;
reset : in std_logic;
clock_out_VGA : out std_logic );
end component;

signal zero: std_logic_vector(3 downto 0);
signal one: std_logic_vector(3 downto 0);
signal two: std_logic_vector(3 downto 0);
signal three: std_logic_vector(3 downto 0);
signal freq_count: integer := 0;
signal selected_note: std_logic := '1';
signal clk_for_VGA_display,reset:STD_LOGIC;
signal VGA_input: std_logic_vector(6 downto 0);

begin
seven_segment_display: seven_seg_driver port map(
show_anode_0 => zero,
show_anode_1 => one,
show_anode_2 => two,
show_anode_3 => three,
seven_seg_zero => seg_cathode(0),
seven_seg_one => seg_cathode(1),
seven_seg_two => seg_cathode(2),
seven_seg_three => seg_cathode(3),
seven_seg_four => seg_cathode(4),
seven_seg_five => seg_cathode(5),
seven_seg_six => seg_cathode(6),
choose_show_zero => seg_anode(0),
choose_show_one => seg_anode(1),
choose_show_two => seg_anode(2),
choose_show_three => seg_anode(3),
clock => clock);
 
process(clock) begin
if turn_off = '0' then --turns off the music when VGA_inputitch is on
if rising_edge(clock) then
case(sensor_signal) is
    
when "0000001" => --G
output_LED <= not sensor_signal;
freq_count <= freq_count + 1;
VGA_input <= "1000000";
if selection = '0' then
elsif freq_count = 127551 then --G4, freq = 392
selected_note <= not selected_note;
freq_count <= 0;
zero <= "0010";
one <= "1001";
two <= "0011";
end if;
if selection = '1' then
elsif freq_count = 63776 then --G5, freq = 784
selected_note <= not selected_note;
freq_count <= 0;
zero <= "0100";
one <= "1000";
two <= "0111";
end if;

when "0000010" => --F
output_LED <= not sensor_signal;
freq_count <= freq_count + 1;
VGA_input <= "0100000";
if selection = '0' then
elsif freq_count = 143172 then --F4, freq = 349
selected_note <= not selected_note;
freq_count <= 0;
zero <= "1001";
one <= "0100";
two <= "0011";
end if;
if selection = '1' then
elsif freq_count = 71586 then --F5, freq = 698
selected_note <= not selected_note;
freq_count <= 0;
zero <= "1000";
one <= "1001";
two <= "0110";
end if;

when "0000100" => --E
output_LED <= not sensor_signal;
freq_count <= freq_count + 1;
VGA_input <= "0010000";
if selection = '0' then
elsif freq_count = 151685 then --E4, freq = 329
selected_note <= not selected_note;
freq_count <= 0;
zero <="1001";
one <= "0010";
two <= "0011";
end if;
if selection = '1' then
elsif freq_count = 75844 then --E5, freq = 629
selected_note <= not selected_note;
freq_count <= 0;
zero <="1001";
one <= "0010";
two <= "0110";
end if;

when "0001000" => --D
output_LED <= not sensor_signal;
freq_count <= freq_count + 1;
VGA_input <= "0001000";
if selection = '0' then
elsif freq_count = 170265 then --D4, freq = 294
selected_note <= not selected_note;
freq_count <= 0;
zero <="0100";
one <= "1001";
two <= "0010";
end if;
if selection = '1' then
elsif freq_count = 85131 then --D5, freq = 587
selected_note <= not selected_note;
freq_count <= 0;
zero <="0111";
one <= "1000";
two <= "0101";
end if;

when "0010000" => --C
output_LED <= not sensor_signal;
freq_count <= freq_count + 1;
VGA_input <= "0000100";
if selection = '0' then
elsif freq_count = 191110 then --C4, freq = 262
selected_note <= not selected_note;
freq_count <= 0;
zero <="0010";
one <= "0110";
two <= "0010";
end if;
if selection = '1' then
elsif freq_count = 95557 then --C5, freq = 523
selected_note <= not selected_note;
freq_count <= 0;
zero <="0011";
one <= "0010";
two <= "0101";
end if;

when "0100000" => --B
output_LED <= not sensor_signal;
freq_count <= freq_count + 1;
VGA_input <= "0000010";
if selection = '0' then
elsif freq_count = 202478 then --B3, freq = 247
selected_note <= not selected_note;
freq_count <= 0;
zero <="0111";
one <= "0100";
two <= "0010";
end if;
if selection = '1' then
elsif freq_count = 101239 then --B4, freq = 494
selected_note <= not selected_note;
freq_count <= 0;
zero <="0100";
one <= "1001";
two <= "0100";
end if;

when "1000000" => --A
output_LED <= not sensor_signal;
freq_count <= freq_count + 1;
VGA_input <= "0000001";
if selection = '0' then
elsif freq_count = 227273 then --A3, freq = 220
selected_note <= not selected_note;
freq_count <= 0;
zero <="0000";
one <= "0010";
two <= "0010";
end if;
if selection = '1' then
elsif freq_count = 113636 then --A4, freq = 440
selected_note <= not selected_note;
freq_count <= 0;
zero <="0000";
one <="0100";
two <= "0100";
end if;

when others =>

end case;
end if;
end if;

output_note <= selected_note;
end process;
VGA_1: clock_division_VGA Port Map(clock,reset,clk_for_VGA_display);
VGA_2: VGA_image_generator Port Map(clk_for_VGA_display,VGA_input,Red_out,Green_out,Blue_out,horiz_sync,vertic_sync);
end Behavioral;