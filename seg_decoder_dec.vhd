----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:49:15 09/15/2021 
-- Design Name: 
-- Module Name:    seg_decoder_dec - Behavioral 
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

entity SEG_DECODER_DEC is
		port (
				val	: in std_logic_vector(15 downto 0);
				dis	: in std_logic_vector(1 downto 0);
				seg	: out std_logic_vector(7 downto 0); --Array of the 7 digits
				an		: out std_logic_vector(3 downto 0) --Array of the 4 anodes
		);
end SEG_DECODER_DEC;

architecture Behavioral of SEG_DECODER_DEC is
SIGNAL val_digit: STD_LOGIC_VECTOR(3 DOWNTO 0);
begin

		an <= "1110" when (dis= "00") else
				"1101" when (dis= "01") else
				"1011" when (dis= "10") else
				"0111" when (dis= "11") else
				"1111";
				
		val_digit <= val(3 DOWNTO 0) when (dis= "00") else
						 val(7 DOWNTO 4) when (dis= "01") else
						 val(11 DOWNTO 8) when (dis= "10") else
						 val(15 DOWNTO 12) when (dis= "11") else
						 x"0";
		 
-- 	DP g f e d c b a

		seg <= 	"11000000" when (val_digit= x"0") else -- 0
					"11111001" when (val_digit= x"1") else -- 1
					"10100100" when (val_digit= x"2") else -- 2
					"10110000" when (val_digit= x"3") else -- 3
					"10011001" when (val_digit= x"4") else -- 4
					"10010010" when (val_digit= x"5") else -- 5
					"10000010" when (val_digit= x"6") else -- 6
					"11111000" when (val_digit= x"7") else -- 7
					"10000000" when (val_digit= x"8") else -- 8
					"10010000" when (val_digit= x"9") else -- 9
					x"FF";
end Behavioral;

