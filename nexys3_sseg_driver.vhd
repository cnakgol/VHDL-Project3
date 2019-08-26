library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nexys3_sseg_driver is
    port( 
		MY_CLK 	: in  STD_LOGIC;
		DIGIT0  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT1  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT2  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT3  : in  STD_LOGIC_VECTOR (7 downto 0);
		SSEG_CA : out STD_LOGIC_VECTOR (7 downto 0);
		SSEG_AN : out STD_LOGIC_VECTOR (3 downto 0)
	);
end nexys3_sseg_driver;

architecture Behavioral of nexys3_sseg_driver is

	signal refrclk	: STD_LOGIC := '0';
	signal ch_sel	: integer range 0 to 3 := 0;
	signal counter	: integer range 0 to 124999 := 0;

begin

FREQ_DIV: process (MY_CLK) begin
	if rising_edge(MY_CLK) then
		if (counter = 124999) then -- 400Hz Clock, each SSEG will be refreshed with a freq 100Hz 
			refrclk <= not refrclk;
			counter <= 0;
		else
			counter <= counter + 1;
		end if;
	end if;
end process;
    
process(refrclk) begin
	if rising_edge(refrclk) then
		if (ch_sel = 3) then
			ch_sel <= 0;
		else
			ch_sel <= ch_sel + 1;
		end if;
	end if;
end process;
	
with ch_sel select
	SSEG_AN <= 
		"0111" when 0,
		"1011" when 1,
		"1101" when 2,
		"1110" when 3;

with ch_sel select
	SSEG_CA <= 
		DIGIT0 when 0,
		DIGIT1 when 1,
		DIGIT2 when 2,
		DIGIT3 when 3;

end Behavioral;

