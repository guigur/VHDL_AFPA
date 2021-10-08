----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:06:36 10/06/2021 
-- Design Name: 
-- Module Name:    SERIAL_TX - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all; --Magic library to add numbers

entity SERIAL_TX is
	port(
			RST, CLK, CE_BAUD	: in		STD_LOGIC;
			ASCII_CHAR			: in		STD_LOGIC_VECTOR(7 downto 0);
			TX						: out		STD_LOGIC
		);
end SERIAL_TX;

architecture Behavioral of SERIAL_TX is
SIGNAL counterVal : STD_LOGIC_VECTOR(3 downto 0);-- we need to count to 11 bits for a packet
SIGNAL counterPeriod : STD_LOGIC_VECTOR(9 downto 0); -- 868 times 10ns
SIGNAL shiftRegister : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL state : STD_LOGIC;
begin
	
--	PRO_LATCH : process(CLK)
--	begin
--		if (rising_edge(CLK)) THEN
--			if (CE_BAUD = '1') THEN
--				
--			end if;
--		end if;
--	end PRO_LATCH;
	
	PRO_PACKET_MAKER : process(CLK)
	begin
		if (rising_edge(CLK)) THEN
			if (counterPeriod = "0000000000") THEN
				if (counterVal = 0) THEN --start bit
					shiftRegister <= ASCII_CHAR;
					TX <= '1';
				elsif (counterVal > 0 and counterVal < 8) THEN --data bits
					TX <= shiftRegister(0);
					shiftRegister <= '0' & shiftRegister(7 downto 1); 
				elsif (counterVal > 8) THEN--stop bits
					TX <= '1';
				else
					state <= '0';
				end if;
			else
				TX <= '1';
			end if;
		end if;
	end process PRO_PACKET_MAKER;
	
	--Count to 868
	PRO_GEN_CLK : process (CLK)
	begin
		if falling_edge(CLK) THEN
			if (counterPeriod = "1101100100") THEN --868
				counterPeriod <= (others => '0'); --remise a 0
			else
				counterPeriod <= counterPeriod + 1;
			end if;
		end if;
	end process PRO_GEN_CLK;
	
	--Count to 11
	PRO_COUNT_BITS : process (CLK)
	begin
		if (rising_edge(CLK)) THEN
			if (counterPeriod = "0000000000") THEN
				if (counterVal = 11) THEN
					counterVal <= (others => '0');
				else
					counterVal <= counterVal + 1;
				end if;
			end if;
		end if;
	end process PRO_COUNT_BITS;


	PRO_START : process (CLK)
	begin
		if (rising_edge(CLK)) THEN
			if (CE_BAUD = '1') THEN
				state <= '1';
			end if;
		end if;
	end process PRO_START;
end Behavioral;

