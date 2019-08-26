----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:50 05/02/2019 
-- Design Name: 
-- Module Name:    sscb - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sscb is
    Port ( reset : in  STD_LOGIC;
			  left: in STD_LOGIC;
			  right: in STD_LOGIC;
           clk : in  STD_LOGIC;
           vs : out  STD_LOGIC;
           hs : out  STD_LOGIC;
			  SSEG_AN: out std_logic_vector(3 downto 0);
			  SSEG_CA : out std_logic_vector (7 downto 0);
			  red: out STD_LOGIC_VECTOR (2 downto 0);
			  green: out STD_LOGIC_VECTOR (2 downto 0);
			  blue: out STD_LOGIC_VECTOR (1 downto 0)
			  );
end sscb;

architecture Behavioral of sscb is
signal slow_clk, e1, e2, en: STD_LOGIC;
signal h_count, v_count: integer;
signal scorebinary: STD_LOGIC_VECTOR (5 downto 0);
signal outa1,outa2,outa3 : std_logic_vector(3 downto 0);
signal cnca1,cnca2,cnca3 : std_logic_vector(3 downto 0);
signal highdigit  : std_logic_vector(3 downto 0);
signal lowdigit  : std_logic_vector(3 downto 0);
signal low_dig: std_logic_vector (7 downto 0);
signal high_dig: std_logic_vector (7 downto 0);
signal sign: std_logic_vector (7 downto 0);

begin
a1: entity work.freqdivider PORT MAP(clk,reset,slow_clk);
a2: entity work.vsync PORT MAP(reset,slow_clk,e1,v_count,vs);
a3: entity work.hsync PORT MAP(reset,slow_clk,e2,h_count,hs);
en <= e1 and e2;
a4: entity work.color PORT MAP(reset,left,right,slow_clk,en,h_count,v_count,scorebinary,red,green,blue);
cnca1 <= "0"& scorebinary(5 downto 3);
cnca2 <= outa1(2 downto 0)&scorebinary(2);
cnca3 <= outa2(2 downto 0)&scorebinary(1);
a5: entity work.converter PORT MAP(cnca1,outa1);
highdigit(3 downto 2)  <= "0" & outa1(3); 
a6: entity work.converter PORT MAP (cnca2,outa2);
highdigit(1) <= outa2(3);
a7: entity work.converter PORT MAP (cnca3,outa3);
highdigit(0) <= outa3(3);
lowdigit <= outa3(2 downto 0) & scorebinary(0);
a8: entity work.seveNUR PORT MAP(lowdigit, highdigit, '0', sign, low_dig, high_dig);
a9: entity work.nexys3_sseg_driver PORT MAP(clk, low_dig, high_dig, sign, "11111111", SSEG_CA, SSEG_AN);

end Behavioral;