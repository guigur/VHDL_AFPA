----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:23 09/14/2021 
-- Design Name: 
-- Module Name:    seg_decoder - Behavioral 
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

entity SEG_DECODER is
		port (
				sw		: in std_logic_vector(7 downto 0);
				seg	: out std_logic_vector(7 downto 0); --Array of the 7 digits
				an		: out std_logic_vector(3 downto 0) --Array of the 4 anodes
		);
end SEG_DECODER;

architecture Behavioral of SEG_DECODER is
begin

		an <= "1110";
--		when (sw = x"01") else "1010";
-- 	DP g f e d c b a

		seg <= 	"11000001" when (sw = x"FF") else -- 0
					"11111001" when (sw = x"FE") else -- 1
					"10100100" when (sw = x"FD") else -- 2
					"10110000" when (sw = x"FC") else -- 3
					"10011001" when (sw = x"FB") else -- 4
					"10010010" when (sw = x"FA") else -- 5
					"10000010" when (sw = x"F9") else -- 6
					"11111000" when (sw = x"F8") else -- 7
					"10000000" when (sw = x"F7") else -- 8
					"10010000" when (sw = x"F6") else -- 9
					x"FF";
end Behavioral;

