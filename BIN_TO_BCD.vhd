----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:00 09/29/2021 
-- Design Name: 
-- Module Name:    BIN_TO_BCD - Behavioral 
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


entity BIN_TO_BCD is
	port( 
			BIN : in  STD_LOGIC_VECTOR(11 downto 0);
			BCD : out  STD_LOGIC_VECTOR(15 downto 0)
		);
end BIN_TO_BCD;

architecture Behavioral of BIN_TO_BCD is
	component ADD3 is
		port(
				data_in	: in	STD_LOGIC_VECTOR(3 downto 0);
				data_out	: out	STD_LOGIC_VECTOR(3 downto 0)
		);
	end component;
	SIGNAL tmp_bin : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL out1 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out2 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out3 : STD_LOGIC_VECTOR(3 downto 0);

begin
	--BCD(15 downto 4) <= x"000";
	tmp_bin <= "00100010"; --34
	
	add3_1: ADD3
			port map(data_in=>tmp_bin(6 downto 3), data_out=>out1);
			
	add3_2: ADD3
			port map(data_in=>out1(2 downto 0)&tmp_bin(2), data_out=>out2);
			
	add3_3: ADD3
			port map(data_in=>out2(2 downto 0)&tmp_bin(1), data_out=>out3);
	BCD<= "00000000" & '0' & out1(3) & out2(3) & out3 & tmp_bin(0);
end Behavioral;

